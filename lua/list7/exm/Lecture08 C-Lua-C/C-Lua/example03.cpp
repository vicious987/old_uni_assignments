#include <stdio.h>
#include <string.h>
#include <cstdlib>
#include <stdarg.h>
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

static void stackDump (lua_State *L) 
{
  int i;
  int top = lua_gettop(L);
  for (i = 1; i <= top; i++) // odwiedzamy elementy od dołu
  {
    int t = lua_type(L, i);
    switch (t) 
    {
    case LUA_TSTRING: // napis
      printf("’%s’", lua_tostring(L, i));
      break;
    case LUA_TBOOLEAN: // wartość logiczna
      printf(lua_toboolean(L, i) ? "true" : "false");
      break;
    case LUA_TNUMBER: // liczby
      //printf("%g", lua_tonumber(L, i)); // jeśli nie chcemy rozróżniać int/float (Lua < 5.3)
      if (lua_isinteger(L, i)) // integer
        printf("%lld", lua_tointeger(L, i));
      else // float
        printf("%g", lua_tonumber(L, i));
      break;
    default: // pozostałe
      printf("%s", lua_typename(L, t)); // drukuje nazwę typu
      break;
    }
    printf(" "); // separator
  }
  printf("\n");
}

void call_va (lua_State *L, const char *func, const char *sig, ...) 
{ 
  va_list vl;
  int narg, nres; // liczba argumentów i wyników 
  va_start(vl, sig);
  lua_getglobal(L, func); // pobieramy funkcję
  for (narg = 0; *sig; narg++) // dla każdego argumentu
  {
    luaL_checkstack(L, 1, "too many arguments");  // sprawdzamy miejsce na stosie
    switch (*sig++) 
    {
      case 'd': // double 
        lua_pushnumber(L, va_arg(vl, double));
        break;
      case 'i': // int 
        lua_pushinteger(L, va_arg(vl, int));
        break;
      case 's': // string 
        lua_pushstring(L, va_arg(vl, char *));
        break;
      case '>': // koniec 
        goto endargs; // ;-)
      default:
        error(L, "invalid option (%c)", *(sig - 1));
    } 
  }
  endargs:  
  //stackDump(L);
  
  nres = strlen(sig); // liczba rezultatów których się spodziewamy

  if (lua_pcall(L, narg, nres, 0) != LUA_OK) // wywołujemy funkcję
    error(L, "error calling ’%s’: %s", func, lua_tostring(L, -1));
  //stackDump(L);
  
  
  nres = -nres; // przesuwamy się do pierwszego rezultatu (za >)
  while (*sig)  // dla każdego rezultatu
  {
    switch (*sig++) 
    {
      case 'd': // double 
      {
        int isnum;
        double n = lua_tonumberx(L, nres, &isnum);
        if (!isnum) error(L, "wrong result type");
        *va_arg(vl, double *) = n;
        break;
      }
      case 'i': // int 
      {
        int isnum;
        int n = lua_tointegerx(L, nres, &isnum);
        if (!isnum) error(L, "wrong result type");
        *va_arg(vl, int *) = n;
        break;
      }
      case 's': // string 
      {
        const char *s = lua_tostring(L, nres);
        if (s == NULL) error(L, "wrong result type");
        *va_arg(vl, const char **) = s;
        break;
      }
      default:
        error(L, "invalid option (%c)", *(sig - 1));
    }
    nres++;
  }
  //stackDump(L);
  
  va_end(vl);
}



int main (void) 
{
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);    
  if (luaL_loadfile(L, "example03.lua")  || lua_pcall(L, 0, 0, 0))
    error(L, "cannot load config file: %s\n", lua_tostring(L, -1));

  double z;
  call_va(L, "f", "dd>d", 0.8, 2.0, &z);
  lua_pop(L, 1);
  printf( "f(0.8, 2.0) = %f\n", z);

  const char *s;
  call_va(L, "g", ">s", &s);
  printf( "g() = %s\n", s);  // najpierw wykorzystujemy napis
  lua_pop(L, 1);             // dopiero potem potem usuwamy go ze stosu !

  int a=3, b=5;
  call_va(L, "h", "ii>ii", a, b, &a, &b);
  lua_pop(L, 2);            // W przypadku innych typów nie musimy się tym przejmować
  printf( "h(3, 5) = %d, %d\n", a, b);
  
  lua_close(L);
  return 0;
}