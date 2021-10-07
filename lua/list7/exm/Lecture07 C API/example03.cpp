#include <stdio.h>
#include <string.h>
#include <cstdlib>
#include <string>
#include <iostream>
#include <lua.hpp> 

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

// zwracamy wartość typu int zapisaną w globalnej zmiennej varname
int getglobalint (lua_State *L, const char *varname)
{
  int isnum, result;
  
  lua_getglobal(L, varname); // wstawiamy zmienną globalną varname na stos
  result = (int)lua_tointegerx(L, -1, &isnum); // odczytujemy ze stosu jej wartość
  
  if (!isnum) // sprawdzamy czy się poprawnie wczytała
    error(L, "'%s' should be a number\n", varname);
    
  lua_pop(L, 1); // usuwamy wczytaną wartość ze stosu
  return result;
}


void load_cfg (lua_State *L, const char *fname, int *w, int *h) 
{
  if (luaL_loadfile(L, fname)  || lua_pcall(L, 0, 0, 0))
    error(L, "cannot load config file: %s\n", lua_tostring(L, -1));

  *w = getglobalint(L, "width");
  *h = getglobalint(L, "height");
}


int main (void) 
{
  int width;
  int height;
  lua_State *L = luaL_newstate();
  
  load_cfg(L, "example03.lua", &width, &height);
  cout << "> config file loaded" << endl;
  cout << "width: " << width << ", height: " << height << endl;
  
  cout << "> try different one" << endl;
  load_cfg(L, "nofile.cfg", &width, &height);
  
  cout << "> we are already done" << endl;
  lua_close(L);

  return 0;
}