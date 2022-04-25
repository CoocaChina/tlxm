
function 晴天_写角色配置项(AAA, BBB, CCC)
    local 名字= 获取人物信息(12)
    local 路径=string.format("C:\\天龙小蜜\\角色配置\\%s.ini",名字)
    屏幕提示(名字..":写角色配置项|"..AAA.."|"..BBB.."|"..CCC)
    延时(100)
	if string.find(晴天_获取角色配置项(AAA, BBB),CCC) ~=1 then
		写配置项(路径,AAA,BBB,CCC)
	end
    延时(100)
end
function 晴天_获取角色配置项(AAA, BBB)
    local 名字= 获取人物信息(12)
    local 路径=string.format("C:\\天龙小蜜\\角色配置\\%s.ini",名字)
    屏幕提示(名字..":读角色配置项|"..AAA.."|"..BBB)
    延时(100)
	shuju=读配置项(路径,AAA,BBB)
	延时(100)
    return shuju
    
end
function 枪王_友情提示(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."【风中QQ2820783511】".."#eFF0000".."%-88s"
		DebugListBox_ListBox:AddInfo(str)
		--橙色 #e0000ff#u#g0ceff3
		--蓝色 #e0000ff#g28f1ff
		--#Y
	]], strCode))
end

function 取装备持久(aaa)
return  到数值(LUA_取返回值(string.format([[ 
		return EnumAction(%d,"equip"):GetEquipDur()
	]], aaa)))
end

function  取装备ID(aaa)
return 到数值(LUA_取返回值(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], aaa)))
end

function  取装备名字(aaa)
return  LUA_取返回值(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], aaa))
end

--------------------------------------------------------------
function  取身上武魂生命()--300最大
       if  到数值( 取装备ID(18) )>0 then
			return  到数值(LUA_取返回值(string.format([[ 
		return DataPool:GetKfsData("LIFE")
	]])))
	else
	return -1
    end
end

function 晴天点击确定()
for i=1,3 do
if  窗口是否出现("MessageBox_Self")==1 then
    --屏幕提示("晴天点击确认")
    LUA_Call(" setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
	延时(2000)
    end
  end
end

--0=武器 1=耳朵 2=护甲 3=手套 4=鞋子 5=腰带 6=戒指1 7=项链 8=坐骑1 9=行囊 10=格箱 11=戒指2 12=护符1 13=护符2 14=护腕 
--15=护肩 16=时装 17=暗器 18=御瑶盘 19=龙纹 20=帮会令牌 21=侠印

function 晴天穿上装备(装备名称,装备位置名称)
     if 装备名称==""  then
		屏幕提示("参数错误,晴天穿上装备")
		return
	end
	
	if 获取背包物品数量(装备名称)<=0 then
	屏幕提示("没有装备无法使用,晴天穿上装备")
			return
	end	
		
     if 装备位置名称=="左戒指"  then
		装备取下编号=7
		装备位置=6
		elseif 装备位置名称=="右戒指" then
		装备取下编号=8
		装备位置=11
       elseif  装备位置名称=="左护符" then
		装备取下编号=9
		装备位置=12
		elseif 装备位置名称=="右护符" then
		装备取下编号=10
		装备位置=13
       elseif  装备位置名称=="武器" then
		装备取下编号=11
		装备位置=0
		elseif 装备位置名称=="帽子" then
		装备取下编号=1
		装备位置=1
	   elseif 装备位置名称=="护肩" then
		装备取下编号=2
		装备位置=15	
			   elseif 装备位置名称=="护腕" then
		装备取下编号=3
		装备位置=14	
			   elseif 装备位置名称=="手套" then
		装备取下编号=4
		装备位置=3	
			   elseif 装备位置名称=="腰带" then
		装备取下编号=5
		装备位置=5	
					   elseif 装备位置名称=="鞋子" then
		装备取下编号=6
		装备位置=4
		
		elseif 装备位置名称=="衣服" then
		装备取下编号=12
		装备位置=2
			elseif 装备位置名称=="项链" then
		装备取下编号=13
		装备位置=7
		
		elseif 装备位置名称=="暗器" then
		装备取下编号=14
		装备位置=17
		
		elseif 装备位置名称=="龙纹" then
		装备取下编号=25
		装备位置=19
		
		elseif 装备位置名称=="令牌" then
		装备取下编号=16
		装备位置=20
		
		elseif 装备位置名称=="豪侠印" then
		装备取下编号="100"
		装备位置=21
		
		elseif 装备位置名称=="武魂" then
		装备取下编号=""
		装备位置=18
		else
		屏幕提示("请设置好对应的装备名字再使用穿上装备")
		return
	end

     计次循环 i=1,5 执行
	    if 装备位置名称=="武魂" then
		坐骑_下坐骑()
		右键使用物品(装备名称,2) 
         延时(6000)
		else
		右键使用物品(装备名称,2) 
         延时(1000)
		end
		
		装备ID = LUA_取返回值(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], 装备位置))
		
		当前装备名称 = LUA_取返回值(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], 装备位置))

        如果 到数值(装备ID)>0   则
		屏幕提示(" 晴天成功穿上"..装备名称.."|在位置:"..装备位置)
              跳出循环   
         结束
     结束
end

function 晴天取下装备获取名字(装备位置名称)
     if 装备位置名称=="左戒指" then
		装备取下编号=7
		装备位置=6
		elseif 装备位置名称=="右戒指" then
		装备取下编号=8
		装备位置=11
       elseif  装备位置名称=="左护符" then
		装备取下编号=9
		装备位置=12
		elseif 装备位置名称=="右护符" then
		装备取下编号=10
		装备位置=13
       elseif  装备位置名称=="武器" then
		装备取下编号=11
		装备位置=0
		elseif 装备位置名称=="帽子" then
		装备取下编号=1
		装备位置=1
	   elseif 装备位置名称=="护肩" then
		装备取下编号=2
		装备位置=15	
			   elseif 装备位置名称=="护腕" then
		装备取下编号=3
		装备位置=14	
			   elseif 装备位置名称=="手套" then
		装备取下编号=4
		装备位置=3	
			   elseif 装备位置名称=="腰带" then
		装备取下编号=5
		装备位置=5	
					   elseif 装备位置名称=="鞋子" then
		装备取下编号=6
		装备位置=4
		
		elseif 装备位置名称=="衣服" then
		装备取下编号=12
		装备位置=2
			elseif 装备位置名称=="项链" then
		装备取下编号=13
		装备位置=7
					elseif 装备位置名称=="暗器" then
		装备取下编号=14
		装备位置=17
		
		elseif 装备位置名称=="龙纹" then
		装备取下编号=25
		装备位置=19
		
		elseif 装备位置名称=="令牌" then
		装备取下编号=16
		装备位置=20
		
		--------------------------------------特殊装备
		elseif 装备位置名称=="豪侠印" then
		装备取下编号=""
		装备位置=21
		
		elseif 装备位置名称=="武魂" then
	     装备取下编号=""
		装备位置=18
	end
	-------------------------------------------

		local 装备持久 =到数值( LUA_取返回值(string.format([[ 
		return EnumAction(%d,"equip"):GetEquipDur()
	]], 装备位置)))
	
	 if 装备位置名称=="武魂" then
	    local 装备持久= 取身上武魂生命()
	 end
	
	if 装备持久<=0 then
		屏幕提示("装备持久不够,不取下")
		return 0
	end
	
     计次循环 i=1,5 执行
         LUA_Call ("MainMenuBar_SelfEquip_Clicked();")
         延时 (1000)
         如果 窗口是否出现("SelfEquip") 则   
		装备名称 = LUA_取返回值(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], 装备位置))

		if 装备名称=="" then
			屏幕提示(装备位置名称.."不存在装备")
			return 0
			else
             屏幕提示("需要升级的装备:"..装备位置名称.."|"..装备名称)
		end
              if 装备位置名称=="豪侠印" then
				
				 LUA_Call ("setmetatable(_G, {__index = Xiulian_Env});Xiulian_JueWei_Page_Switch();")
				 延时 (2000)
				 LUA_Call ("setmetatable(_G, {__index = SelfJunXian_Env});SelfJunXian_Equip_Clicked(0);")
             	延时 (2000)
				关闭窗口("SelfJunXian")
				elseif 装备位置名称=="武魂" then
				 LUA_Call ("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Wuhun_Switch();")
				 延时 (2000)
				 LUA_Call ("setmetatable(_G, {__index =  Wuhun_Env});Wuhun_Equip_Clicked(0);")
             	延时 (2000)
				关闭窗口("Wuhun")
				else
				 LUA_Call(string.format([[ setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)]], 装备取下编号))
			end 
             
              延时 (1000)
			装备ID = LUA_取返回值(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], 装备位置))
	
              如果 装备ID=="0" 则  --检测脱下装备成功
                   LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();")      
                   延时(500)  
                   返回 装备名称
              结束
         结束      
     结束
     LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();")      
     延时(500) 
			装备ID = LUA_取返回值(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], 装备位置))
	
     如果 装备ID=="0" 则
          返回 装备名称
     否则  
         
    返回 0
     结束     
end


function 晴天_九州商会购买物品(名称, 数量, 总价格)
    
      计次循环 i=1,5 执行
             跨图寻路("洛阳",330,299)
             如果 对话NPC("乔复盛")==1 则
              延时 (1000)
               NPC二级对话("查看所有商店")
               延时 (1000)
               如果 窗口是否出现("PS_ShopList")==1 则
                          	LUA_Call([[setmetatable(_G, {__index = PS_ShopList_Env}) PS_ShopList_ChangeTabIndex(3)]])	
                            延时 (1000)
                    跳出循环
               结束    
          结束
    结束
	--搜索物品
    num = 0
	while true do
	LUA_Call(string.format([[	
         PlayerShop:PacketSend_Search(2 , 2, 1, "%s", 1)		
	]], 名称))
	
	延时(1500)
	--遍历第一页有没有符合条件的商品
	
		local tem = LUA_取返回值(string.format([[
				setmetatable(_G, {__index = PS_ShopSearch_Env})
				for i = 1 ,10 do 
					local theAction = EnumAction( i - 1 , "playershop_cur_page")
					if theAction:GetID() ~= 0 then
						--物品名,店主名,所属商店ID,数量,总价格
						local pName ,pShopName, pShopID ,pCount ,pYB = PlayerShop:GetItemPSInfo( i - 1 )			
						if pName ~= nil and pShopID ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
							if pName == "%s" and pYB <= %d then
							   PushDebugMessage(pName.."/"..pShopName.."/"..pCount.."/"..pYB)
							   --点击购买后,直接返回
							   PlayerShop:SearchPageBuyItem(i - 1, "item")
							   return pCount
							end
						end
					end
				end
				return 0
		]], 名称, 总价格), "b")
		延时 (500)
		num = num+tonumber(tem)
		if num >= 数量 then
			return 1
		end
    end
    延时 (2000)
    晴天_判断关闭窗口("PS_ShopSearch")
	晴天_判断关闭窗口("PS_ShopList")
	晴天_判断关闭窗口("Quest")	
end


function 龙纹升级()
	存物品("龙纹")
	取出物品("龙纹玉灵|铸纹血玉") 
	取出物品("金币") 
	延时 (1000)
	跨图寻路("金陵",364,421)
	LPname= 晴天取下装备获取名字("龙纹")
        if LPname==0 then
             return
         end
	lwindex = 枪王_取背包物品位置(LPname,2)
	装备ID = LUA_取返回值(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], 装备位置))
	--龙纹等级
	main_lv = LUA_取返回值(string.format([[
		local main_lv = PlayerPackage:GetBagLWData(%s, "LEVEL")
		return main_lv
	]],lwindex))

	nLevel = LUA_取返回值(string.format([[
		local nLevel = PlayerPackage:GetBagLWData(%s, "STAR")
		return nLevel
	]],lwindex))
	-- local nCount_Need = PlayerPackage:GetBagLWStarUpInfo(m_Equip_Idx, "STUFFNUM2") --升星需要苟天才数量
	-- local nCount_YLS = PlayerPackage:GetBagLWStarUpInfo(m_Equip_Idx, "STUFFNUM1") --需要玉龙随数量
	-- local nLevel = PlayerPackage:GetBagLWData(m_Equip_Idx, "STAR")
	枪王_友情提示("龙纹等级"..main_lv)
	延时 (5000)
	
	if tonumber(main_lv) == 100 then
		晴天_写角色配置项("物资数据","绑定销毁",晴天_获取角色配置项("物资数据","绑定销毁").."|龙纹玉灵|铸纹血玉")
		晴天穿上装备(LPname,"龙纹")
		return
	else
		延时 (1000)
		if 对话NPC("焦鹰")==1 then 
			延时 (1000)
			if NPC二级对话("提升龙纹成长等级") == 1 then 
				延时 (2000)
				右键使用物品(LPname,1)
				延时 (2000)
				右键使用物品("龙纹玉灵",1)
				延时 (2000)
				右键使用物品("铸纹血玉",1)
				延时 (2000)
				for i =1,tonumber(获取背包物品数量("龙纹玉灵")) do
					LUA_Call("setmetatable(_G, {__index = LongwenLevelUp_Env});LongwenLevelUp_OK_Clicked();")
					if tonumber(获取人物信息(45)) < 10000 then
						晴天穿上装备(LPname,"龙纹")
						break
					elseif tonumber(main_lv) == 100 then
						晴天穿上装备(LPname,"龙纹")
						break
					end
					延时 (500)
				end
				存物品("金币")
				晴天穿上装备(LPname,"龙纹")
				return 
			end
		end
	end
	晴天穿上装备(LPname,"龙纹")
end

function 龙纹星级升级()
	存物品("龙纹")
	取出物品("初级勾天彩|中级勾天彩|高级勾天彩|玉龙髓") 
	取出物品("金币") 
	LPname= 晴天取下装备获取名字("龙纹")
        if LPname==0 then
             return
         end
	lwindex = 枪王_取背包物品位置(LPname,2)
	-- local nCount_Need = PlayerPackage:GetBagLWStarUpInfo(m_Equip_Idx, "STUFFNUM2") --升星需要苟天才数量
	-- local nCount_YLS = PlayerPackage:GetBagLWStarUpInfo(m_Equip_Idx, "STUFFNUM1") --需要玉龙随数量
	-- local nLevel = PlayerPackage:GetBagLWData(m_Equip_Idx, "STAR")
	nLevel = LUA_取返回值(string.format([[
		local nLevel = PlayerPackage:GetBagLWData(%s, "STAR")
		return nLevel
	]],lwindex))
	nCount_Need = LUA_取返回值(string.format([[
		local nCount_Need = PlayerPackage:GetBagLWData(%s, "STAR")
		return nCount_Need
	]],lwindex))
	nCount_YLS = LUA_取返回值(string.format([[
		local nCount_YLS = PlayerPackage:GetBagLWData(%s, "STAR")
		return nCount_YLS
	]],lwindex))
	枪王_友情提示("星级"..nLevel)
	
	if tonumber(nLevel) == 8 then 
		晴天_写角色配置项("物资数据","绑定卖出",晴天_获取角色配置项("物资数据","绑定卖出").."|初级勾天彩|玉龙髓")
		晴天穿上装备(LPname,"龙纹")
		return
	else
		if tonumber(nLevel)<6 and 获取背包物品数量("初级勾天彩") >30 then
			if 获取背包物品数量("玉龙髓") < 400 then
				晴天_九州商会购买物品("玉龙髓",400,5*400*10000)
			end
			if 获取背包物品数量("玉龙髓") >= 400 then
				屏幕提示("5星龙纹开始升级")
				跨图寻路("金陵",364,421)
				for i=1,3 do 
					if 对话NPC("焦鹰")==1 then 
						if NPC二级对话("提升龙纹星级") == 1 then
							延时(1000)
							右键使用物品(LPname,1)
							延时(1000)
							LUA_Call("setmetatable(_G, {__index = LongwenStarUp_Env});LongwenStarUp_OK_Clicked();")
							存物品("金币")
							晴天穿上装备(LPname,"龙纹")
							break
						end
					end
				end
				晴天穿上装备(LPname,"龙纹")
				
			end
		elseif tonumber(nLevel)==6 and 获取背包物品数量("中级勾天彩") >60 then
			if 获取背包物品数量("玉龙髓") < 400 then
				晴天_九州商会购买物品("玉龙髓",400,5*400*10000)
			end
			if 获取背包物品数量("玉龙髓") >= 400 then
				屏幕提示("6星龙纹开始升级")
				跨图寻路("金陵",364,421)
				for i=1,3 do 
					if 对话NPC("焦鹰")==1 then 
						if NPC二级对话("提升龙纹星级") == 1 then
							延时(1000)
							右键使用物品(LPname,1)
							延时(1000)
							LUA_Call("setmetatable(_G, {__index = LongwenStarUp_Env});LongwenStarUp_OK_Clicked();")
							存物品("金币")
							晴天穿上装备(LPname,"龙纹")
							break
						end
					end
				end
				晴天穿上装备(LPname,"龙纹")
			end
		elseif tonumber(nLevel)==7 and 获取背包物品数量("高级勾天彩") >120 then
			if 获取背包物品数量("玉龙髓") < 400 then
				晴天_九州商会购买物品("玉龙髓",400,5*400*10000)
			end
			if 获取背包物品数量("玉龙髓") >= 400 then
				屏幕提示("7星龙纹开始升级")
				跨图寻路("金陵",364,421)
				for i=1,3 do 
					if 对话NPC("焦鹰")==1 then 
						if NPC二级对话("提升龙纹星级") == 1 then
							延时(1000)
							右键使用物品(LPname,1)
							延时(1000)
							LUA_Call("setmetatable(_G, {__index = LongwenStarUp_Env});LongwenStarUp_OK_Clicked();")
							存物品("金币")
							晴天穿上装备(LPname,"龙纹")
							break
						end
					end
				end
				晴天穿上装备(LPname,"龙纹")
			end
		end
		晴天穿上装备(LPname,"龙纹")
	end
	晴天穿上装备(LPname,"龙纹")
	取出物品("龙纹")
end

function 枪王_取背包物品位置(物品列表,是否绑定)
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
						return i
					end	
				end
			end
		end	
		
			]],tbangding,物品列表))
			return tonumber(tem)
end
龙纹升级()

龙纹星级升级()
