#include <dirent.h>
#include <errno.h>
#include <string.h> 
#include <lua.hpp> 

static int l_dir (lua_State *L) 
{
  DIR *dir;
  struct dirent *entry;
  int i;
  const char *path = luaL_checkstring(L, 1);
  
  dir = opendir(path);
  if (dir == NULL)  // jeśli błąd
  {
    lua_pushnil(L); // wstawiamy NIL
    lua_pushstring(L, strerror(errno)); // i komunikat błędu
    return 2; // a więc zwracamy dwa rezultaty
  }
  
  lua_newtable(L);
  i = 1;
  while ((entry = readdir(dir)) != NULL) // dla każdego wpisu
  {
    lua_pushnumber(L, i++); // kładziemy na stos klucz (numer porządkowy)
    lua_pushstring(L, entry->d_name); // i wartość
    lua_settable(L, -3); // table[i] = entry name
  }
  closedir(dir);
  return 1; // na szczycie stosu jest tablica
}


int main (void) 
{
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);             
  
  lua_pushcfunction(L, l_dir);
  lua_setglobal(L, "dir");
  
  if (luaL_loadstring(L, "for i, e in ipairs(dir('/lib')) do print(i, e) end") || lua_pcall(L, 0, 0, 0))
    {fprintf(stderr, "%s\n", lua_tostring(L, -1)); lua_pop(L, 1); }
  if (luaL_loadstring(L, "for _, e in ipairs(dir('/home/lua')) do print(e) end") || lua_pcall(L, 0, 0, 0))
    {fprintf(stderr, "LUA ERROR: %s\n", lua_tostring(L, -1)); lua_pop(L, 1); }
  if (luaL_loadstring(L, "print (dir('/home/lua'))") || lua_pcall(L, 0, 0, 0))
    {fprintf(stderr, "LUA ERROR: %s\n", lua_tostring(L, -1)); lua_pop(L, 1); }

  lua_close(L);
  printf("Lua state closed.\n");
  
  return 0;
}
