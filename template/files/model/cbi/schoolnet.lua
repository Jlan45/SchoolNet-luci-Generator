require("luci.sys")


m = Map("schoolnet", translate("校园网自动登录"), translate("Auto login in to SchoolNetwork Powered by J1an"))

s = m:section(TypedSection, "server","用户配置")
s.addremove = false
s.anonymous = true

enable = s:option(Flag, "enable", translate("Enable"))

{% for inputvalue  in config.options.value %}
{{inputvalue}} = s:option(Value, "{{inputvalue}}", translate("{{config.translate[inputvalue] if config.translate[inputvalue] else inputvalue}}"))
{% endfor %}

{% for secretvalue  in config.options.secret %}
{{secretvalue}} = s:option(Value, "{{secretvalue}}", translate("{{config.translate[secretvalue] if config.translate[secretvalue] else secretvalue}}"))
{{secretvalue}}.password = true
{% endfor %}

{% for boolenvalue  in config.options.bool %}
{{boolenvalue}} = s:option(Flag, "{{boolenvalue}}", translate("{{config.translate[boolenvalue] if config.translate[boolenvalue] else boolenvalue}}"))
{% endfor %}

{% for listkey,listvalue  in config.options.choice.items() %}
{{listkey}} = s:option(ListValue, "{{listkey}}", translate("{{config.translate[listkey] if config.translate[listkey] else listkey}}"))
{% for value in listvalue %}
{{listkey}}:value("{{value}}", translate("{{config.translate[value] if config.translate[value] else value}}"))
{% endfor %}
{% endfor %}

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