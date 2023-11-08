module("luci.controller.schoolnet", package.seeall)

function index()
    entry({"admin", "services", "schoolnet"}, cbi("schoolnet"), _("CUMTLogin"), 1)
end