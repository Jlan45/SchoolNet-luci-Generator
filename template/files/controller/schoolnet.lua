module("luci.controller.schoolnet", package.seeall)

function index()
    entry({"admin", "services", "schoolnet"}, cbi("schoolnet"), _("{{config.name}}"), 1)
end