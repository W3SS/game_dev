--
local skynet = require "skynet.manager"
local interactive = require "base.interactive"
local net = require "base.net"
local global = require "global"
local share = require "base.share"
local texthandle = require "base.texthandle"
local hook = require "base.hook"
local logiccmd = import(service_path("logiccmd.init"))
local netcmd = import(service_path("netcmd.init"))
local world = import(service_path("world"))
local connection = import(service_path("connection"))
local itemmgr = import(service_path("item.itemmgr"))

skynet.start(function()
    interactive.dispatch_logic(logiccmd)
    net.dispatch_net(netcmd)
    texthandle.init()

    global.oConnMgr = connection:NewConnectionMgr()
    global.oWorldMgr = world.NewWorldMgr()
    global.oItemMgr = itemmgr.NewItemMgr()

    skynet.register(".world")

    interactive.send(".dictator", "common", "RegisterService", {
        addr = "."..MY_ADDR,
        inst = skynet.self(),
    })

    hook.set_logic_func(function()
        global.oWorldMgr:DoPlayerPropChange()
    end)
    skynet.error("world service booted")
end)
