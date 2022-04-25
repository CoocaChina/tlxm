
function 晴天_友情提示(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."【晴天提示】".."#eFF0000".."%-88s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function 晴天_取背包物品数量(物品列表,是否绑定)
	if 是否绑定 ==0 or 是否绑定 == nil then
		tbangding =10
	elseif  是否绑定 ==1 then
		tbangding = 0
	elseif  是否绑定 ==2 then
		tbangding = 1
	end
	local tem = LUA_取返回值(string.format([[
		tem = 0
		for i= 0, 200 do
			tbangding =tostring("%s")
			ttname = "%s"
			local theAction=EnumAction(i,"packageitem")
			local GetName=theAction:GetName()
			
			local Status=GetItemBindStatus(i);
			if GetName~=nil and GetName ~="" then
				if string.find(ttname,GetName ,1,true) then
					if string.find(tbangding,tostring(Status)) then
						local szItemNum =theAction:GetNum();
						tem=tem+szItemNum
					end	
				end
			end
		end	
		return tem
			]],tbangding,物品列表))
	屏幕提示(是否绑定)
	屏幕提示(tem)
	return tonumber(tem)		
end
		
		
function 取背包大于60级龙纹位置(物品列表,是否绑定)
	if 是否绑定 ==0 or 是否绑定 == nil then
		tbangding =10
	elseif  是否绑定 ==1 then
		tbangding = 0
	elseif  是否绑定 ==2 then
		tbangding = 1
	end
	local tem = LUA_取返回值(string.format([[
		tem = 0
		for i= 0, 200 do
			tbangding =tostring("%s")
			ttname = "%s"
			local theAction=EnumAction(i,"packageitem")
			local GetName=theAction:GetName()
			
			local Status=GetItemBindStatus(i);
			
			if GetName~=nil and GetName ~="" then
				if string.find(ttname,GetName ,1,true) then
					if string.find(tbangding,tostring(Status)) then
						local main_lv = PlayerPackage:GetBagLWData(i, "LEVEL")
						if main_lv >59 then
							return i
						end
					end	
				end
			end
		end	
		return 1
			]],tbangding,物品列表))
			return tonumber(tem)
end

function 晴天_古境上架龙纹(价格,龙纹位置)

		跨图寻路("金陵",433,381);延时(500)
		对话NPC("商弘继");延时(500)
		NPC二级对话("金陵寄售行",1);延时(500)
		延时 (500)


		-- 上架_物品
		LUA_Call(string.format([[ 
		TAuction:PacketSend_SellItem(1,tonumber(%d) , tonumber(%d) ,1) 
			]],龙纹位置,价格), "s",1)
end
function 龙纹上架()
	取出物品("龙纹")
	for i = 0,100 do
	local tem = LUA_取返回值(string.format([[
		tem = 0
		for i= 0, 200 do
			tbangding =tostring("%s")
			ttname = "%s"
			local theAction=EnumAction(i,"packageitem")
			local GetName=theAction:GetName()
			
			local Status=GetItemBindStatus(i);
			
			if GetName~=nil and GetName ~="" then
				if string.find(ttname,GetName ,1,true) then
					if string.find(tbangding,tostring(Status)) then
						local main_lv = PlayerPackage:GetBagLWData(i, "LEVEL")
						if main_lv >59 then
							return i
						end
					end	
				end
			end
		end	
		return 1
			]],1,"龙纹"))
	if tem ~= 1 then
	attrstr = LUA_取返回值(string.format([[
		local aaa = %s
		local theAction = EnumAction(aaa, "packageitem")
		local num = theAction:GetEquipAttrCount()
		local str = ""
		for i = 0, num-1 do
			local tempstr = theAction:EnumEquipExtAttr(i)
			PushDebugMessage("tempstr="..tempstr.."/str="..str)
			if string.find(tempstr, "#{") then
			local left = string.find(tempstr, "#{")
			local left2 = string.find(tempstr, "}")
			strTemp = GetDictionaryString(string.sub(tempstr, left+2, left2-1))	
				end 
			str = str..strTemp.."|"
		end
		return str
	]], tonumber(i)))
	条数 = 0
	for i=1,#不要属性 do
		if string.find(attrstr,不要属性[i]) then
			条数=条数+1
		end
	end
	晴天_友情提示("龙纹属性:"..attrstr)
	晴天_友情提示("不要属性条数:"..条数)
	延时(3000)
	极品 = 0
	if tonumber(条数) <= 1 and string.find(attrstr,"血上限") and string.find(attrstr,"冰攻击") and string.find(attrstr,"火攻击") and string.find(attrstr,"玄攻击") and string.find(attrstr,"毒攻击") and string.find(attrstr,"体力") then
		晴天_古境上架龙纹(2000,i)
	end
	if tonumber(条数) <= 0  then
		for i = 1,#极品龙纹 do
			if string.find(attrstr,极品龙纹[i]) then
				极品=极品+1
			end
		end
		晴天_友情提示("极品属性条数:"..极品)
		if tonumber(极品) == 6 then
			if string.find(attrstr,"命中") then
				晴天_古境上架龙纹(25555,i)
			elseif string.find(attrstr,"会心防御") then
				晴天_古境上架龙纹(19999,i)
			elseif string.find(attrstr,"闪避") then
				晴天_古境上架龙纹(17777,i)
			elseif string.find(attrstr,"身法") then
				晴天_古境上架龙纹(16666,i)
			elseif string.find(attrstr,"会心") then
				晴天_古境上架龙纹(15555,i)
			else 
				晴天_古境上架龙纹(13333,i)
			end
		elseif tonumber(极品) == 5 then
			if string.find(attrstr,"体力") then
				晴天_古境上架龙纹(3555,i)
			else
				晴天_古境上架龙纹(1888,i)
			end
		elseif tonumber(极品) == 4 then
			if string.find(attrstr,"体力") then
				晴天_古境上架龙纹(1222,i)
			else
				晴天_古境上架龙纹(666,i)
			end
		elseif tonumber(极品) == 3 then
			if string.find(attrstr,"体力") then
				晴天_古境上架龙纹(444,i)
			else
				晴天_古境上架龙纹(333,i)
			end
		else
			屏幕提示("垃圾龙纹")
		end
	end		
	end
	end
end

不要属性=
{ 
"内功攻击",
"外功攻击",
"灵气",
"力量",
"内功防御",
"外功防御",
"定力",
"气上限",
}
极品龙纹=
{
"血上限",
"冰攻击",
"火攻击",
"毒攻击",
"玄攻击",
"体力",
}



龙纹上架()