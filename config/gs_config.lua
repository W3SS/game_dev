root = "./"
thread = 8
logger = "log/gs.log"
harbor = 0
start = "gs_launcher"
bootstrap = "snlua bootstrap"	-- The service for bootstrap

------------------路径配置------------------------------
luaservice = root.."service/?.lua;"..root.."service/?/main.lua;"..root.."skynet/service/?.lua;"..root.."skynet/service/?/main.lua"
lua_path = root.."lualib/?.lua;"..root.."skynet/lualib/?.lua"
lua_cpath = root.."skynet/luaclib/?.so"
cpath = root.."skynet/cservice/?.so"
lualoader = root.."skynet/lualib/loader.lua"
luapreload = root.."lualib/base/preload.lua"
------------------路径配置-------------------------------
