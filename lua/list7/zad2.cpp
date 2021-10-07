#include <stdio.h>
#include <string.h>
#include <iostream>

extern "C"{
    #include <lua.h>
    #include <lualib.h>
    #include <lauxlib.h>
}
void stackDump(lua_State* L) {
	for (int i = 1, rev_i = lua_gettop(L); i <= lua_gettop(L); i++, rev_i--) {
		auto type_name = lua_typename(L, lua_type(L, i));
		auto t = lua_type(L, i);
		if (t == LUA_TSTRING){
			auto value = lua_tostring(L, i);
			std::cout << value << " ";
		}
		else if (t == LUA_TBOOLEAN){
			auto value = lua_toboolean(L, i);
			std::cout << value << " ";
		}
		else if  (t == LUA_TNUMBER){
			auto value  = lua_tonumber(L, i);
			std::cout << value << " ";
		}
		else if  (t == LUA_TFUNCTION){
			auto value  = lua_tocfunction(L, i);
			std::cout << value << " ";
		}
		else if  (t == LUA_TTABLE){
			auto value  = "TABLE";
			std::cout << value << " ";
		}
		else if  (t == LUA_TNIL){
			auto value  = "NIL";
			std::cout << value << " ";
		}
		else {
			auto value = "???";
			std::cout << value << " ";
		}
		std::cout << type_name << " " << i << " " << rev_i << std::endl;
	}
	std::cout << std::endl;
}
int main (void) {
	lua_State *L = luaL_newstate();

	lua_pushboolean(L, 1);
	lua_pushnumber(L, 10);
	lua_pushnil(L);
	lua_pushstring(L, "hello");
	stackDump(L); // true 10 nil ’hello’ 
	lua_pushvalue(L, -4); stackDump(L); // true 10 nil ’hello’ true 
	lua_replace(L, 3);    stackDump(L); // true 10 true ’hello’ 
	lua_settop(L, 6);     stackDump(L); // true 10 true ’hello’ nil nil 
	lua_rotate(L, 3, 1);  stackDump(L); // true 10 nil true 'hello' nil 
	lua_remove(L, -3);    stackDump(L); // true 10 nil 'hello' nil 
	lua_settop(L, -5);    stackDump(L); // true 

	lua_close(L);

	return 0;
}
