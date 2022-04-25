
LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_OnShown();")
延时(1000)
LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_ShowXbwInfo();")
延时(1000)
LUA_Call("setmetatable(_G, {__index = BW_Match_Stage_Env});BW_Match_StageFrame_GetAward();")
延时(1000)