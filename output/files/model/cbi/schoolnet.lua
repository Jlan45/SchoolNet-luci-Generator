require("luci.sys")


m = Map("schoolnet", translate("校园网自动登录"), translate("Auto login in to SchoolNetwork Powered by J1an"))

s = m:section(TypedSection, "server","用户配置")
s.addremove = false
s.anonymous = true

enable = s:option(Flag, "enable", translate("Enable"))


username = s:option(Value, "username", translate("用户名"))

testtime = s:option(Value, "testtime", translate("测试时间"))

domain = s:option(Value, "domain", translate("域名"))



password = s:option(Value, "password", translate("密码"))
password.password = true





nettype = s:option(ListValue, "nettype", translate("运营商"))

nettype:value("", translate(""))

nettype:value("@cmcc", translate("@cmcc"))

nettype:value("@unicom", translate("@unicom"))

nettype:value("@telecom", translate("@telecom"))


testfunc = s:option(ListValue, "testfunc", translate("测试方式"))

testfunc:value("ping", translate("ping"))

testfunc:value("http", translate("http"))



domain = s:option(Value, "domain", translate("测试主机"))
testtime = s:option(Value, "testtime", translate("测试时间"))
testfunc = s:option(ListValue, "testfunc", translate("测试方法"))
testfunc:value("ping", translate("ping"))
testfunc:value("curl", translate("curl"))

local apply = luci.http.formvalue("cbi.apply")
if apply then
    io.popen("/etc/init.d/schoolnet restart > /dev/null &")
end

return m