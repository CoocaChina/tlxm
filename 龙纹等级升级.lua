
function ����_д��ɫ������(AAA, BBB, CCC)
    local ����= ��ȡ������Ϣ(12)
    local ·��=string.format("C:\\����С��\\��ɫ����\\%s.ini",����)
    ��Ļ��ʾ(����..":д��ɫ������|"..AAA.."|"..BBB.."|"..CCC)
    ��ʱ(100)
	if string.find(����_��ȡ��ɫ������(AAA, BBB),CCC) ~=1 then
		д������(·��,AAA,BBB,CCC)
	end
    ��ʱ(100)
end
function ����_��ȡ��ɫ������(AAA, BBB)
    local ����= ��ȡ������Ϣ(12)
    local ·��=string.format("C:\\����С��\\��ɫ����\\%s.ini",����)
    ��Ļ��ʾ(����..":����ɫ������|"..AAA.."|"..BBB)
    ��ʱ(100)
	shuju=��������(·��,AAA,BBB)
	��ʱ(100)
    return shuju
    
end
function ǹ��_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."������QQ2820783511��".."#eFF0000".."%-88s"
		DebugListBox_ListBox:AddInfo(str)
		--��ɫ #e0000ff#u#g0ceff3
		--��ɫ #e0000ff#g28f1ff
		--#Y
	]], strCode))
end

function ȡװ���־�(aaa)
return  ����ֵ(LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetEquipDur()
	]], aaa)))
end

function  ȡװ��ID(aaa)
return ����ֵ(LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], aaa)))
end

function  ȡװ������(aaa)
return  LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], aaa))
end

--------------------------------------------------------------
function  ȡ�����������()--300���
       if  ����ֵ( ȡװ��ID(18) )>0 then
			return  ����ֵ(LUA_ȡ����ֵ(string.format([[ 
		return DataPool:GetKfsData("LIFE")
	]])))
	else
	return -1
    end
end

function ������ȷ��()
for i=1,3 do
if  �����Ƿ����("MessageBox_Self")==1 then
    --��Ļ��ʾ("������ȷ��")
    LUA_Call(" setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
	��ʱ(2000)
    end
  end
end

--0=���� 1=���� 2=���� 3=���� 4=Ь�� 5=���� 6=��ָ1 7=���� 8=����1 9=���� 10=���� 11=��ָ2 12=����1 13=����2 14=���� 
--15=���� 16=ʱװ 17=���� 18=������ 19=���� 20=������� 21=��ӡ

function ���촩��װ��(װ������,װ��λ������)
     if װ������==""  then
		��Ļ��ʾ("��������,���촩��װ��")
		return
	end
	
	if ��ȡ������Ʒ����(װ������)<=0 then
	��Ļ��ʾ("û��װ���޷�ʹ��,���촩��װ��")
			return
	end	
		
     if װ��λ������=="���ָ"  then
		װ��ȡ�±��=7
		װ��λ��=6
		elseif װ��λ������=="�ҽ�ָ" then
		װ��ȡ�±��=8
		װ��λ��=11
       elseif  װ��λ������=="�󻤷�" then
		װ��ȡ�±��=9
		װ��λ��=12
		elseif װ��λ������=="�һ���" then
		װ��ȡ�±��=10
		װ��λ��=13
       elseif  װ��λ������=="����" then
		װ��ȡ�±��=11
		װ��λ��=0
		elseif װ��λ������=="ñ��" then
		װ��ȡ�±��=1
		װ��λ��=1
	   elseif װ��λ������=="����" then
		װ��ȡ�±��=2
		װ��λ��=15	
			   elseif װ��λ������=="����" then
		װ��ȡ�±��=3
		װ��λ��=14	
			   elseif װ��λ������=="����" then
		װ��ȡ�±��=4
		װ��λ��=3	
			   elseif װ��λ������=="����" then
		װ��ȡ�±��=5
		װ��λ��=5	
					   elseif װ��λ������=="Ь��" then
		װ��ȡ�±��=6
		װ��λ��=4
		
		elseif װ��λ������=="�·�" then
		װ��ȡ�±��=12
		װ��λ��=2
			elseif װ��λ������=="����" then
		װ��ȡ�±��=13
		װ��λ��=7
		
		elseif װ��λ������=="����" then
		װ��ȡ�±��=14
		װ��λ��=17
		
		elseif װ��λ������=="����" then
		װ��ȡ�±��=25
		װ��λ��=19
		
		elseif װ��λ������=="����" then
		װ��ȡ�±��=16
		װ��λ��=20
		
		elseif װ��λ������=="����ӡ" then
		װ��ȡ�±��="100"
		װ��λ��=21
		
		elseif װ��λ������=="���" then
		װ��ȡ�±��=""
		װ��λ��=18
		else
		��Ļ��ʾ("�����úö�Ӧ��װ��������ʹ�ô���װ��")
		return
	end

     �ƴ�ѭ�� i=1,5 ִ��
	    if װ��λ������=="���" then
		����_������()
		�Ҽ�ʹ����Ʒ(װ������,2) 
         ��ʱ(6000)
		else
		�Ҽ�ʹ����Ʒ(װ������,2) 
         ��ʱ(1000)
		end
		
		װ��ID = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], װ��λ��))
		
		��ǰװ������ = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], װ��λ��))

        ��� ����ֵ(װ��ID)>0   ��
		��Ļ��ʾ(" ����ɹ�����"..װ������.."|��λ��:"..װ��λ��)
              ����ѭ��   
         ����
     ����
end

function ����ȡ��װ����ȡ����(װ��λ������)
     if װ��λ������=="���ָ" then
		װ��ȡ�±��=7
		װ��λ��=6
		elseif װ��λ������=="�ҽ�ָ" then
		װ��ȡ�±��=8
		װ��λ��=11
       elseif  װ��λ������=="�󻤷�" then
		װ��ȡ�±��=9
		װ��λ��=12
		elseif װ��λ������=="�һ���" then
		װ��ȡ�±��=10
		װ��λ��=13
       elseif  װ��λ������=="����" then
		װ��ȡ�±��=11
		װ��λ��=0
		elseif װ��λ������=="ñ��" then
		װ��ȡ�±��=1
		װ��λ��=1
	   elseif װ��λ������=="����" then
		װ��ȡ�±��=2
		װ��λ��=15	
			   elseif װ��λ������=="����" then
		װ��ȡ�±��=3
		װ��λ��=14	
			   elseif װ��λ������=="����" then
		װ��ȡ�±��=4
		װ��λ��=3	
			   elseif װ��λ������=="����" then
		װ��ȡ�±��=5
		װ��λ��=5	
					   elseif װ��λ������=="Ь��" then
		װ��ȡ�±��=6
		װ��λ��=4
		
		elseif װ��λ������=="�·�" then
		װ��ȡ�±��=12
		װ��λ��=2
			elseif װ��λ������=="����" then
		װ��ȡ�±��=13
		װ��λ��=7
					elseif װ��λ������=="����" then
		װ��ȡ�±��=14
		װ��λ��=17
		
		elseif װ��λ������=="����" then
		װ��ȡ�±��=25
		װ��λ��=19
		
		elseif װ��λ������=="����" then
		װ��ȡ�±��=16
		װ��λ��=20
		
		--------------------------------------����װ��
		elseif װ��λ������=="����ӡ" then
		װ��ȡ�±��=""
		װ��λ��=21
		
		elseif װ��λ������=="���" then
	     װ��ȡ�±��=""
		װ��λ��=18
	end
	-------------------------------------------

		local װ���־� =����ֵ( LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetEquipDur()
	]], װ��λ��)))
	
	 if װ��λ������=="���" then
	    local װ���־�= ȡ�����������()
	 end
	
	if װ���־�<=0 then
		��Ļ��ʾ("װ���־ò���,��ȡ��")
		return 0
	end
	
     �ƴ�ѭ�� i=1,5 ִ��
         LUA_Call ("MainMenuBar_SelfEquip_Clicked();")
         ��ʱ (1000)
         ��� �����Ƿ����("SelfEquip") ��   
		װ������ = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], װ��λ��))

		if װ������=="" then
			��Ļ��ʾ(װ��λ������.."������װ��")
			return 0
			else
             ��Ļ��ʾ("��Ҫ������װ��:"..װ��λ������.."|"..װ������)
		end
              if װ��λ������=="����ӡ" then
				
				 LUA_Call ("setmetatable(_G, {__index = Xiulian_Env});Xiulian_JueWei_Page_Switch();")
				 ��ʱ (2000)
				 LUA_Call ("setmetatable(_G, {__index = SelfJunXian_Env});SelfJunXian_Equip_Clicked(0);")
             	��ʱ (2000)
				�رմ���("SelfJunXian")
				elseif װ��λ������=="���" then
				 LUA_Call ("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Wuhun_Switch();")
				 ��ʱ (2000)
				 LUA_Call ("setmetatable(_G, {__index =  Wuhun_Env});Wuhun_Equip_Clicked(0);")
             	��ʱ (2000)
				�رմ���("Wuhun")
				else
				 LUA_Call(string.format([[ setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)]], װ��ȡ�±��))
			end 
             
              ��ʱ (1000)
			װ��ID = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], װ��λ��))
	
              ��� װ��ID=="0" ��  --�������װ���ɹ�
                   LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();")      
                   ��ʱ(500)  
                   ���� װ������
              ����
         ����      
     ����
     LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();")      
     ��ʱ(500) 
			װ��ID = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], װ��λ��))
	
     ��� װ��ID=="0" ��
          ���� װ������
     ����  
         
    ���� 0
     ����     
end


function ����_�����̻Ṻ����Ʒ(����, ����, �ܼ۸�)
    
      �ƴ�ѭ�� i=1,5 ִ��
             ��ͼѰ·("����",330,299)
             ��� �Ի�NPC("�Ǹ�ʢ")==1 ��
              ��ʱ (1000)
               NPC�����Ի�("�鿴�����̵�")
               ��ʱ (1000)
               ��� �����Ƿ����("PS_ShopList")==1 ��
                          	LUA_Call([[setmetatable(_G, {__index = PS_ShopList_Env}) PS_ShopList_ChangeTabIndex(3)]])	
                            ��ʱ (1000)
                    ����ѭ��
               ����    
          ����
    ����
	--������Ʒ
    num = 0
	while true do
	LUA_Call(string.format([[	
         PlayerShop:PacketSend_Search(2 , 2, 1, "%s", 1)		
	]], ����))
	
	��ʱ(1500)
	--������һҳ��û�з�����������Ʒ
	
		local tem = LUA_ȡ����ֵ(string.format([[
				setmetatable(_G, {__index = PS_ShopSearch_Env})
				for i = 1 ,10 do 
					local theAction = EnumAction( i - 1 , "playershop_cur_page")
					if theAction:GetID() ~= 0 then
						--��Ʒ��,������,�����̵�ID,����,�ܼ۸�
						local pName ,pShopName, pShopID ,pCount ,pYB = PlayerShop:GetItemPSInfo( i - 1 )			
						if pName ~= nil and pShopID ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
							if pName == "%s" and pYB <= %d then
							   PushDebugMessage(pName.."/"..pShopName.."/"..pCount.."/"..pYB)
							   --��������,ֱ�ӷ���
							   PlayerShop:SearchPageBuyItem(i - 1, "item")
							   return pCount
							end
						end
					end
				end
				return 0
		]], ����, �ܼ۸�), "b")
		��ʱ (500)
		num = num+tonumber(tem)
		if num >= ���� then
			return 1
		end
    end
    ��ʱ (2000)
    ����_�жϹرմ���("PS_ShopSearch")
	����_�жϹرմ���("PS_ShopList")
	����_�жϹرմ���("Quest")	
end


function ��������()
	����Ʒ("����")
	ȡ����Ʒ("��������|����Ѫ��") 
	ȡ����Ʒ("���") 
	��ʱ (1000)
	��ͼѰ·("����",364,421)
	LPname= ����ȡ��װ����ȡ����("����")
        if LPname==0 then
             return
         end
	lwindex = ǹ��_ȡ������Ʒλ��(LPname,2)
	װ��ID = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], װ��λ��))
	--���Ƶȼ�
	main_lv = LUA_ȡ����ֵ(string.format([[
		local main_lv = PlayerPackage:GetBagLWData(%s, "LEVEL")
		return main_lv
	]],lwindex))

	nLevel = LUA_ȡ����ֵ(string.format([[
		local nLevel = PlayerPackage:GetBagLWData(%s, "STAR")
		return nLevel
	]],lwindex))
	-- local nCount_Need = PlayerPackage:GetBagLWStarUpInfo(m_Equip_Idx, "STUFFNUM2") --������Ҫ���������
	-- local nCount_YLS = PlayerPackage:GetBagLWStarUpInfo(m_Equip_Idx, "STUFFNUM1") --��Ҫ����������
	-- local nLevel = PlayerPackage:GetBagLWData(m_Equip_Idx, "STAR")
	ǹ��_������ʾ("���Ƶȼ�"..main_lv)
	��ʱ (5000)
	
	if tonumber(main_lv) == 100 then
		����_д��ɫ������("��������","������",����_��ȡ��ɫ������("��������","������").."|��������|����Ѫ��")
		���촩��װ��(LPname,"����")
		return
	else
		��ʱ (1000)
		if �Ի�NPC("��ӥ")==1 then 
			��ʱ (1000)
			if NPC�����Ի�("�������Ƴɳ��ȼ�") == 1 then 
				��ʱ (2000)
				�Ҽ�ʹ����Ʒ(LPname,1)
				��ʱ (2000)
				�Ҽ�ʹ����Ʒ("��������",1)
				��ʱ (2000)
				�Ҽ�ʹ����Ʒ("����Ѫ��",1)
				��ʱ (2000)
				for i =1,tonumber(��ȡ������Ʒ����("��������")) do
					LUA_Call("setmetatable(_G, {__index = LongwenLevelUp_Env});LongwenLevelUp_OK_Clicked();")
					if tonumber(��ȡ������Ϣ(45)) < 10000 then
						���촩��װ��(LPname,"����")
						break
					elseif tonumber(main_lv) == 100 then
						���촩��װ��(LPname,"����")
						break
					end
					��ʱ (500)
				end
				����Ʒ("���")
				���촩��װ��(LPname,"����")
				return 
			end
		end
	end
	���촩��װ��(LPname,"����")
end

function �����Ǽ�����()
	����Ʒ("����")
	ȡ����Ʒ("���������|�м������|�߼������|������") 
	ȡ����Ʒ("���") 
	LPname= ����ȡ��װ����ȡ����("����")
        if LPname==0 then
             return
         end
	lwindex = ǹ��_ȡ������Ʒλ��(LPname,2)
	-- local nCount_Need = PlayerPackage:GetBagLWStarUpInfo(m_Equip_Idx, "STUFFNUM2") --������Ҫ���������
	-- local nCount_YLS = PlayerPackage:GetBagLWStarUpInfo(m_Equip_Idx, "STUFFNUM1") --��Ҫ����������
	-- local nLevel = PlayerPackage:GetBagLWData(m_Equip_Idx, "STAR")
	nLevel = LUA_ȡ����ֵ(string.format([[
		local nLevel = PlayerPackage:GetBagLWData(%s, "STAR")
		return nLevel
	]],lwindex))
	nCount_Need = LUA_ȡ����ֵ(string.format([[
		local nCount_Need = PlayerPackage:GetBagLWData(%s, "STAR")
		return nCount_Need
	]],lwindex))
	nCount_YLS = LUA_ȡ����ֵ(string.format([[
		local nCount_YLS = PlayerPackage:GetBagLWData(%s, "STAR")
		return nCount_YLS
	]],lwindex))
	ǹ��_������ʾ("�Ǽ�"..nLevel)
	
	if tonumber(nLevel) == 8 then 
		����_д��ɫ������("��������","������",����_��ȡ��ɫ������("��������","������").."|���������|������")
		���촩��װ��(LPname,"����")
		return
	else
		if tonumber(nLevel)<6 and ��ȡ������Ʒ����("���������") >30 then
			if ��ȡ������Ʒ����("������") < 400 then
				����_�����̻Ṻ����Ʒ("������",400,5*400*10000)
			end
			if ��ȡ������Ʒ����("������") >= 400 then
				��Ļ��ʾ("5�����ƿ�ʼ����")
				��ͼѰ·("����",364,421)
				for i=1,3 do 
					if �Ի�NPC("��ӥ")==1 then 
						if NPC�����Ի�("���������Ǽ�") == 1 then
							��ʱ(1000)
							�Ҽ�ʹ����Ʒ(LPname,1)
							��ʱ(1000)
							LUA_Call("setmetatable(_G, {__index = LongwenStarUp_Env});LongwenStarUp_OK_Clicked();")
							����Ʒ("���")
							���촩��װ��(LPname,"����")
							break
						end
					end
				end
				���촩��װ��(LPname,"����")
				
			end
		elseif tonumber(nLevel)==6 and ��ȡ������Ʒ����("�м������") >60 then
			if ��ȡ������Ʒ����("������") < 400 then
				����_�����̻Ṻ����Ʒ("������",400,5*400*10000)
			end
			if ��ȡ������Ʒ����("������") >= 400 then
				��Ļ��ʾ("6�����ƿ�ʼ����")
				��ͼѰ·("����",364,421)
				for i=1,3 do 
					if �Ի�NPC("��ӥ")==1 then 
						if NPC�����Ի�("���������Ǽ�") == 1 then
							��ʱ(1000)
							�Ҽ�ʹ����Ʒ(LPname,1)
							��ʱ(1000)
							LUA_Call("setmetatable(_G, {__index = LongwenStarUp_Env});LongwenStarUp_OK_Clicked();")
							����Ʒ("���")
							���촩��װ��(LPname,"����")
							break
						end
					end
				end
				���촩��װ��(LPname,"����")
			end
		elseif tonumber(nLevel)==7 and ��ȡ������Ʒ����("�߼������") >120 then
			if ��ȡ������Ʒ����("������") < 400 then
				����_�����̻Ṻ����Ʒ("������",400,5*400*10000)
			end
			if ��ȡ������Ʒ����("������") >= 400 then
				��Ļ��ʾ("7�����ƿ�ʼ����")
				��ͼѰ·("����",364,421)
				for i=1,3 do 
					if �Ի�NPC("��ӥ")==1 then 
						if NPC�����Ի�("���������Ǽ�") == 1 then
							��ʱ(1000)
							�Ҽ�ʹ����Ʒ(LPname,1)
							��ʱ(1000)
							LUA_Call("setmetatable(_G, {__index = LongwenStarUp_Env});LongwenStarUp_OK_Clicked();")
							����Ʒ("���")
							���촩��װ��(LPname,"����")
							break
						end
					end
				end
				���촩��װ��(LPname,"����")
			end
		end
		���촩��װ��(LPname,"����")
	end
	���촩��װ��(LPname,"����")
	ȡ����Ʒ("����")
end

function ǹ��_ȡ������Ʒλ��(��Ʒ�б�,�Ƿ��)
	if �Ƿ�� ==0 or �Ƿ�� == nil then
		tbangding =10
	elseif  �Ƿ�� ==1 then
		tbangding = 0
	elseif  �Ƿ�� ==2 then
		tbangding = 1
	end
	local tem = LUA_ȡ����ֵ(string.format([[
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
		
			]],tbangding,��Ʒ�б�))
			return tonumber(tem)
end
��������()

�����Ǽ�����()
