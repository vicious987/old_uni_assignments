#include <stdio.h>
#include <string.h>
#include <cstdlib>
//#include <string>
//#include <iostream>
#include <lua.hpp> 

#define MAX_COLOR 255

using namespace std;

void error (lua_State *L, const char *fmt, ...) 
{
  va_list argp;
  va_start(argp, fmt);
  vfprintf(stderr, fmt, argp);
  va_end(argp);
  lua_close(L);
  exit(1);
}

int getcolorfield(lua_State *L, const char *key) 
{
  int result;
  if (lua_getfield(L, -1, key) != LUA_TNUMBER)
    error(L, "invalid color component '%s'", key);
  result = (int)(lua_tonumber(L, -1) * MAX_COLOR);
  lua_pop(L, 1); 
  return result;
}

struct ColorTable {
  char *name;
  unsigned char red, green, blue;
} colortable[] = {
  {"WHITE", MAX_COLOR, MAX_COLOR, MAX_COLOR},
  {"RED",   MAX_COLOR, 0, 0},
  {"GREEN", 0, MAX_COLOR, 0},
  {"BLUE",  0, 0, MAX_COLOR},
  {NULL, 0, 0, 0}
};

void setcolorfield (lua_State *L, const char *index, int value) 
{
  lua_pushnumber(L, (double)value/MAX_COLOR);
  lua_setfield(L, -2, index);
}

void setcolor (lua_State *L,struct ColorTable *ct) 
{
  lua_createtable(L, 0, 3);
  setcolorfield(L, "red", ct->red); 
  setcolorfield(L, "green", ct->green); 
  setcolorfield(L, "blue", ct->blue); 
  lua_setglobal(L, ct->name);
}


int main (void) 
{
  int red, green, blue;
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);    
  
  // Rejestrujemy nasze predefiniowane kolory
  int i = 0;
  while (colortable[i].name != NULL)
    setcolor(L, &colortable[i++]);
  
  if (luaL_loadfile(L, "example01.lua")  || lua_pcall(L, 0, 0, 0))
    error(L, "cannot load config file: %s\n", lua_tostring(L, -1));

  // Wczytujemy kolor bezpośrednio jako tablicę
  lua_getglobal(L, "mycolor");
  if (!lua_istable(L, -1)) 
    error(L, "'mycolor' is not a table");
  red = getcolorfield(L, "red");
  green = getcolorfield(L, "green");
  blue = getcolorfield(L, "blue");
  printf( "mycolor: <%d,%d,%d>\n", red, green, blue);

  // Wczytujemy kolor korzystający z naszych definicji
  lua_getglobal(L, "definedcolor");
  if (!lua_istable(L, -1)) 
    error(L, "'definedcolor' is not a table");
  red = getcolorfield(L, "red");
  green = getcolorfield(L, "green");
  blue = getcolorfield(L, "blue");
  printf( "definedcolor: <%d,%d,%d>\n", red, green, blue);
  
  // Wczytujemy kolor opisany jako napis wskazujący na naszą definicję
  lua_getglobal(L, "stringcolor");
  if (lua_isstring(L, -1)) 
  { 
    const char *colorname = lua_tostring(L, -1); 
    int i; 
    for (i = 0; colortable[i].name != NULL; i++) 
    {
      if (strcmp(colorname, colortable[i].name) == 0) 
        break;
    }
    if (colortable[i].name == NULL) 
      error(L, "invalid color name (%s)", colorname);
    else 
    {
      red = colortable[i].red;
      green = colortable[i].green;
      blue = colortable[i].blue;
    }
  } 
  else if (lua_istable(L, -1)) 
  {
    red = getcolorfield(L, "red");
    green = getcolorfield(L, "green");
    blue = getcolorfield(L, "blue");
  } 
  else 
    error(L, "invalid value for 'stringcolor'");
  printf( "stringcolor: <%d,%d,%d>\n", red, green, blue);
  
  lua_close(L);
  return 0;
}