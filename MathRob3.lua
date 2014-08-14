local CombatState=0
function MathRob_OnLoad(frame)
	frame:RegisterEvent("UNIT_HEALTH")
	frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	frame:RegisterEvent("PLAYER_REGEN_DISABLED")
	ChatFrame1:AddMessage("RegisterEventSuccessful")
end

function MathRob_OnEvent(frame,event,...)
	if event == "PLAYER_REGEN_ENABLED" then  
		CombatState=0
		ChatFrame1:AddMessage("Out Combat")
		Box:SetTexture(0,0,0,1)
	end
	if event == "PLAYER_REGEN_DISABLED" then  
		CombatState=1
		ChatFrame1:AddMessage("In Combat")
		Box:SetTexture(1,1,1,1)
	end
	if (event == "UNIT_HEALTH" or  event == "PLAYER_REGEN_DISABLED" ) then
		--ChatFrame1:AddMessage(tostring(UnitPower("target",2)))
		[[form = GetShapeshiftFormID()
		if ( form == CAT_FORM)  then 
			ChatFrame1:AddMessage("猫形态")]]
		if (({UnitAura("player","野蛮咆哮")})[7] == nil or ({UnitAura("player","野蛮咆哮")})[7]-GetTime()<2) then 
			ChatFrame1:AddMessage("使用野蛮咆哮")
			Box:SetTexture(0.125,0,0,1)
		else 
		if  (({UnitAura("target","破甲",nil,"HARMFUL")})[7] == nil or ({UnitAura("target","破甲",nil,"HARMFUL")})[7]-GetTime()<2) then 
			ChatFrame1:AddMessage("使用破甲")
			Box:SetTexture(0.25,0,0,1)
		else
		if (UnitPower("player" ,3)< 31 and ({UnitAura("player","狂暴")})[7] ==nil and ({GetSpellCooldown("猛虎之怒")})[2]==0 )then
			ChatFrame1:AddMessage("使用猛虎之怒")
			Box:SetTexture(0.375,0,0,1)
		else
		if (UnitPower("player" ,3)>70 and  ({GetSpellCooldown("狂暴")})[2]==0) then 
			ChatFrame1:AddMessage("使用狂暴")
			Box:SetTexture(0.5,0,0,1)
		else
		if (({UnitAura("target","斜掠",nil,"HARMFUL")})[7]== nil or ({UnitAura("target","斜掠",nil,"HARMFUL")})[7]-GetTime()<3) then 
			ChatFrame1:AddMessage("使用斜掠")
			Box:SetTexture(0.625,0,0,1)
		else
		if  (GetComboPoints("player")==5 and (({UnitAura("target","割裂",nil,"HARMFUL")})[7]== nil or ({UnitAura("target","割裂",nil,"HARMFUL")})[7]-GetTime()<2)) then
			ChatFrame1:AddMessage("使用割裂")
			Box:SetTexture(0.75,0,0,1)
		else
		if (GetComboPoints("player")>2 and ({UnitAura("target","割裂",nil,"HARMFUL")})[7]-GetTime()<12 and abs(({UnitAura("target","割裂",nil,"HARMFUL")})[7]-({UnitAura("player","野蛮咆哮")})[7])<4) then
			ChatFrame1:AddMessage("使用野蛮咆哮")
			Box:SetTexture(0.125,0,0,1)
		else
		if (GetComboPoints("player")==5 and ({UnitAura("target","割裂",nil,"HARMFUL")})[7]-GetTime()>10 and ({UnitAura("player","野蛮咆哮")})[7]-GetTime()>10 ) then
			ChatFrame1:AddMessage("使用凶猛撕咬")
			Box:SetTexture(0,0.125,0,1)
		else 
			ChatFrame1:AddMessage("使用撕碎")
			Box:SetTexture(1,0,0,1)
		end
		end
		end
		end
		end
		end
		end
		end
	    [[end]]
        [[ChatFrame1:AddMessage("枭兽形态判断")

	    if ( form == MOONKIN_FORM)  then 
			ChatFrame1:AddMessage("枭兽形态")

		if (({UnitAura("target","月火术",nil,"HARMFUL")})[7] == nil or ({UnitAura("target","月火术",nil,"HARMFUL")})[7]-GetTime()<2) then 
			ChatFrame1:AddMessage("使用月火术")
			Box:SetTexture(0.125,0,0,1)
		else 
		if  (({UnitAura("target","阳炎术",nil,"HARMFUL")})[7] == nil or ({UnitAura("target","阳炎术",nil,"HARMFUL")})[7]-GetTime()<2) then 
			ChatFrame1:AddMessage("使用阳炎术")
			Box:SetTexture(0.25,0,0,1)
		else
		if ({GetSpellCooldown("星涌术")})[2]==0) then 
			ChatFrame1:AddMessage("使用星涌术")
			Box:SetTexture(0.5,0,0,1)		
		else
		if ({GetSpellCooldown("星辰坠落")})[2]==0) then 
			ChatFrame1:AddMessage("使用星辰坠落")
			Box:SetTexture(0.5,0,0,1)
		else
		if ( GetEclipseDirection() == moon) then 
			ChatFrame1:AddMessage("使用愤怒")
			Box:SetTexture(0.5,0,0,1)	
		else
		if ( GetEclipseDirection() == sun) then 
			ChatFrame1:AddMessage("使用星火术")
			Box:SetTexture(0.5,0,0,1)	
		end			
		end
		end		
		end
        end
        end
        end]]
	end
end
