
function ����_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."��������ʾ��".."#eFF0000".."%-88s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function ����_ȡ������Ʒ����(��Ʒ�б�,�Ƿ��)
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
					end	
				end
			end
		end	
		return tem
			]],tbangding,��Ʒ�б�))
	��Ļ��ʾ(�Ƿ��)
	��Ļ��ʾ(tem)
	return tonumber(tem)		
end
		
		
function ȡ��������60������λ��(��Ʒ�б�,�Ƿ��)
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
						local main_lv = PlayerPackage:GetBagLWData(i, "LEVEL")
						if main_lv >59 then
							return i
						end
					end	
				end
			end
		end	
		return 1
			]],tbangding,��Ʒ�б�))
			return tonumber(tem)
end

function ����_�ž��ϼ�����(�۸�,����λ��)

		��ͼѰ·("����",433,381);��ʱ(500)
		�Ի�NPC("�̺��");��ʱ(500)
		NPC�����Ի�("���������",1);��ʱ(500)
		��ʱ (500)


		-- �ϼ�_��Ʒ
		LUA_Call(string.format([[ 
		TAuction:PacketSend_SellItem(1,tonumber(%d) , tonumber(%d) ,1) 
			]],����λ��,�۸�), "s",1)
end
function �����ϼ�()
	ȡ����Ʒ("����")
	for i = 0,100 do
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
						local main_lv = PlayerPackage:GetBagLWData(i, "LEVEL")
						if main_lv >59 then
							return i
						end
					end	
				end
			end
		end	
		return 1
			]],1,"����"))
	if tem ~= 1 then
	attrstr = LUA_ȡ����ֵ(string.format([[
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
	���� = 0
	for i=1,#��Ҫ���� do
		if string.find(attrstr,��Ҫ����[i]) then
			����=����+1
		end
	end
	����_������ʾ("��������:"..attrstr)
	����_������ʾ("��Ҫ��������:"..����)
	��ʱ(3000)
	��Ʒ = 0
	if tonumber(����) <= 1 and string.find(attrstr,"Ѫ����") and string.find(attrstr,"������") and string.find(attrstr,"�𹥻�") and string.find(attrstr,"������") and string.find(attrstr,"������") and string.find(attrstr,"����") then
		����_�ž��ϼ�����(2000,i)
	end
	if tonumber(����) <= 0  then
		for i = 1,#��Ʒ���� do
			if string.find(attrstr,��Ʒ����[i]) then
				��Ʒ=��Ʒ+1
			end
		end
		����_������ʾ("��Ʒ��������:"..��Ʒ)
		if tonumber(��Ʒ) == 6 then
			if string.find(attrstr,"����") then
				����_�ž��ϼ�����(25555,i)
			elseif string.find(attrstr,"���ķ���") then
				����_�ž��ϼ�����(19999,i)
			elseif string.find(attrstr,"����") then
				����_�ž��ϼ�����(17777,i)
			elseif string.find(attrstr,"��") then
				����_�ž��ϼ�����(16666,i)
			elseif string.find(attrstr,"����") then
				����_�ž��ϼ�����(15555,i)
			else 
				����_�ž��ϼ�����(13333,i)
			end
		elseif tonumber(��Ʒ) == 5 then
			if string.find(attrstr,"����") then
				����_�ž��ϼ�����(3555,i)
			else
				����_�ž��ϼ�����(1888,i)
			end
		elseif tonumber(��Ʒ) == 4 then
			if string.find(attrstr,"����") then
				����_�ž��ϼ�����(1222,i)
			else
				����_�ž��ϼ�����(666,i)
			end
		elseif tonumber(��Ʒ) == 3 then
			if string.find(attrstr,"����") then
				����_�ž��ϼ�����(444,i)
			else
				����_�ž��ϼ�����(333,i)
			end
		else
			��Ļ��ʾ("��������")
		end
	end		
	end
	end
end

��Ҫ����=
{ 
"�ڹ�����",
"�⹦����",
"����",
"����",
"�ڹ�����",
"�⹦����",
"����",
"������",
}
��Ʒ����=
{
"Ѫ����",
"������",
"�𹥻�",
"������",
"������",
"����",
}



�����ϼ�()