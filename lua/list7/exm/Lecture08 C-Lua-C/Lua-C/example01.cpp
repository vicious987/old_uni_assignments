#include <math.h>
#include <lua.hpp> 


static int l_sin (lua_State *L) 
{
  double d = lua_tonumber(L, 1);
  lua_pushnumber(L, sin(d));
  return 1;
}

static int l_idiv (lua_State *L) 
{
  int n1 = lua_tointeger(L, 1); 
  int n2 = lua_tointeger(L, 2); 
  int q = n1 / n2; int r = n1 % n2;
  lua_pushinteger(L, q); 
  lua_pushinteger(L, r);
  return 2;
}

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

int main (void) 
{
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);               
  
  lua_pushcfunction(L, l_sin);
  lua_setglobal(L, "mysin");
  lua_pushcfunction(L, l_idiv);
  lua_setglobal(L, "idiv");
  
  if (luaL_loadstring(L, "print (mysin(3.14))") || lua_pcall(L, 0, 0, 0))
    {fprintf(stderr, "%s\n", lua_tostring(L, -1)); lua_pop(L, 1); }
  if (luaL_loadstring(L, "print (idiv(11,3))") || lua_pcall(L, 0, 0, 0))
    {fprintf(stderr, "%s\n", lua_tostring(L, -1)); lua_pop(L, 1); }
    
  lua_pushcfunction(L, l_sin2);
  lua_setglobal(L, "mysin2");
  lua_pushcfunction(L, l_idiv2);
  lua_setglobal(L, "idiv2");
  
  if (luaL_loadstring(L, "print (mysin2('x'))") || lua_pcall(L, 0, 0, 0))
    {fprintf(stderr, "%s\n", lua_tostring(L, -1)); lua_pop(L, 1); }
  if (luaL_loadstring(L, "print (idiv2(11,0))") || lua_pcall(L, 0, 0, 0))
    {fprintf(stderr, "%s\n", lua_tostring(L, -1)); lua_pop(L, 1); }
  
  lua_close(L);
  printf("Lua state closed.\n");
  
  return 0;
}
