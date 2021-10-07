#include <lua.hpp>
#include <cstdlib>


inline void lua_swap(lua_State *L, int i, int j) {
    lua_pushvalue(L, i);
    lua_pushvalue(L, j);
    lua_replace(L, i);
    lua_replace(L, j);
}

inline void lua_tab_swap(lua_State *L, int idx, int i, int j) {
    lua_geti(L, idx, i);
    lua_geti(L, idx, j);
    lua_seti(L, idx, i);
    lua_seti(L, idx, j);
}

inline int lua_tab_size(lua_State *L, int idx) {
    lua_len(L, idx);
    int r = (int) lua_tointeger (L, -1);
    lua_pop(L, 1);
	return r;
}


static int summation (lua_State *L) {
	double res = 0;
	for(int i = 1; i <= lua_gettop(L); i++)
		res += luaL_checknumber(L, i);
	lua_pushnumber(L, res);
	return 1;
}

static int reduce (lua_State *L) {
	int tab_size = lua_tab_size(L, 2);
    int i = 1;

    if (lua_gettop(L) == 2) {
        lua_geti(L, 2, i);
        i++;
    }

	for(; i <= tab_size; i++){
        lua_pushvalue(L, 1);
        lua_insert(L, -2);
        lua_geti(L, 2, i);
        if (lua_pcall(L, 2, 1, 0) != LUA_OK ) {
			lua_error(L);
        }
    }
    return 1;
}

bool lua_checkpopbool (lua_State *L){
    if (!lua_isboolean (L, -1)) {
		fprintf(stderr, "Value returned by filter function is expected to be bool\n");
		lua_close(L);
		exit(1);
    }
    int r = lua_toboolean (L, -1);
    lua_pop(L, 1); 
    return r;
}

static int filter (lua_State *L) {
	int tab_size = lua_tab_size(L, 2);
    lua_newtable(L);

    for(int i = 1, j = 1;i <= tab_size; i++) {
        lua_pushvalue(L, 1);
        lua_geti(L, 2, i);
        if (lua_pcall(L, 1, 1, 0) != LUA_OK )
			lua_error(L);

        if (lua_checkpopbool(L)) {
            lua_geti(L, 2, i);
            lua_seti(L, 3, j);
            j++;
        }
    }
    return 1;
}

static int reverse (lua_State *L) {
	int tab_size = lua_tab_size(L, 1);
    for (int i = 1, j = tab_size; i <= tab_size / 2; i++, j--)
        lua_tab_swap(L, 1, i, j);
    return 1;
}

static int merge(lua_State *L) {
	int tab_count = lua_gettop(L);
	for(int i = 2; i <= tab_count; ++i){
		lua_pushnil(L);
		while(lua_next(L, i) != 0){
			lua_pushvalue(L, -2);
			lua_pushvalue(L, -2);
			lua_pushvalue(L, -2);
			lua_gettable(L, 1);
			if(lua_type(L, -1) == LUA_TNIL) {
				lua_pop(L, 1);
				lua_settable(L, 1);
			} else 
				lua_pop(L, 1);
			lua_pop(L, 1);
		}
	}
	lua_settop(L, 1);
	return 1;
}


static const struct luaL_Reg mylib [] = {
    {"summation", summation},
    {"reduce", reduce},
    {"filter", filter},
    {"reverse", reverse},
	{"merge", merge},
    {NULL, NULL}
};


extern "C" int luaopen_zad(lua_State *L) {
    luaL_newlib(L, mylib);
    return 1;
}
