import json
import os

import yaml
from jinja2 import *
config=yaml.safe_load(open("schoolnet.yaml").read())
init= Template(open("template/files/init.d/schoolnet").read())
controller= Template(open("template/files/controller/schoolnet.lua").read())
cbi= Template(open("template/files/model/cbi/schoolnet.lua").read())
sbin= Template(open("template/files/sbin/schoolnet").read())
makefile= Template(open("template/Makefile").read())
if not dir("output"):
    os.mkdir("output")
with open(f"output/files/init.d/schoolnet","w") as f:
    f.write(init.render(config=config))
with open(f"output/files/controller/schoolnet.lua","w") as f:
    f.write(controller.render(config=config))
with open(f"output/files/model/cbi/schoolnet.lua","w") as f:
    f.write(cbi.render(config=config))
with open(f"output/files/sbin/schoolnet","w") as f:
    f.write(sbin.render(config=config))
with open(f"output/Makefile","w") as f:
    f.write(makefile.render(config=config))
