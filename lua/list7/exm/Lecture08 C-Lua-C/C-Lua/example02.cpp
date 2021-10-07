#include <stdio.h>
#include <string.h>
#include <cstdlib>
//#include <string>
//#include <iostream>
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

// Uruchamiamy zdefiniowaną w Lua funkcję 'f'
double f (lua_State *L, double x, double y) 
{
  int isnum;
  double z;
  // wkładamy na stos funkcję i jej argumenty
  lua_getglobal(L, "f"); // funkcja
  lua_pushnumber(L, x);  // pierwszy argument 
  lua_pushnumber(L, y);  // drugi argument 
  
  // wywołujemy funkcję (2 argumenty, 1 rezultat)
  if (lua_pcall(L, 2, 1, 0) != LUA_OK) 
    error(L, "error running function 'f': %s", lua_tostring(L, -1));

  // ściągamy wynik ze stosu
  z = lua_tonumberx(L, -1, &isnum);
  if (!isnum) 
    error(L, "function 'f' must return a number");
  lua_pop(L, 1); // balansujemy stos zrzucając wynik
  return z;
}


int main (void) 
{
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);    
  if (luaL_loadfile(L, "example02.lua")  || lua_pcall(L, 0, 0, 0))
    error(L, "cannot load config file: %s\n", lua_tostring(L, -1));
    
  printf( "f(2, 2) = %f\n", f(L, 2, 2));
  printf( "f(2, 0.8) = %f\n", f(L, 2, 0.8));
  printf( "f(0.8, 2) = %f\n", f(L, 0.8, 2));
  
  lua_close(L);
  return 0;
}