#include <math.h>
#include <lua.hpp> 

static int l_sin2 (lua_State *L) 
{
  double d = luaL_checknumber(L, 1);
  lua_pushnumber(L, sin(d));
  return 1;
}

static int l_idiv2 (lua_State *L) 
{
  int n1 = luaL_checkinteger(L, 1); 
  int n2 = luaL_checkinteger(L, 2); 
  if(n2 == 0) return luaL_error(L, "division by zero");
  int q = n1 / n2; int r = n1 % n2;
  lua_pushinteger(L, q); 
  lua_pushinteger(L, r);
  return 2;
}


static const struct luaL_Reg mylib [] = 
 {
  {"mysin", l_sin2},
  {"idiv", l_idiv2},
  {NULL, NULL}  // sentinel
};

extern "C" int luaopen_exampleThree(lua_State *L)  // wystawienie na zewnątrz (z extern C)
{
  luaL_newlib(L, mylib);
  return 1;
}
