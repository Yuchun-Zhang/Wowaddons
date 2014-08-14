local CombatState=0
local BurstTab=0
local SpellOccupy=0
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
		Box:SetTexture(0,0.125,0,1)
	end
	if (event == "UNIT_HEALTH" or  event == "PLAYER_REGEN_DISABLED" ) then
		--ChatFrame1:AddMessage("Newevent")
		form = GetShapeshiftFormID()
		
		if ( form == MOONKIN_FORM)  then 
			--ChatFrame1:AddMessage("枭兽形态")
			power = UnitPower("player",SPELL_POWER_ECLIPSE)
			--ChatFrame1:AddMessage(tostring(power))
			--ChatFrame1:AddMessage(tostring(({UnitAura("player","月蚀")})[7]))
			--ChatFrame1:AddMessage(tostring(({UnitAura("player","超凡之盟")})[7]))
			--ChatFrame1:AddMessage("STEP1")
			if ((({UnitAura("player","月蚀")})[7] ~= nil or ({UnitAura("player","日蚀")})[7] ~= nil or ({UnitAura("player","超凡之盟")})[7] ~= nil) and  ({GetActionCooldown(62)})[1]== 0 ) then 
				ChatFrame1:AddMessage("使用手套")
				Box:SetTexture(0,0.125,1,1)				
				return
			end
			--ChatFrame1:AddMessage("STEP1.5")
			if (({UnitAura("player","超凡之盟")})[7]~= nil and ({UnitAura("player","超凡之盟")})[7]-GetTime() > 13) then
				ChatFrame1:AddMessage("BurstTab=1")
				BurstTab=1
			end
			--ChatFrame1:AddMessage("STEP2")
			if ((({UnitAura("player","超凡之盟")})[7]~= nil and ({UnitAura("player","超凡之盟")})[7]-GetTime()<5) or ({UnitAura("player","超凡之盟")})[7] == nil) then
				ChatFrame1:AddMessage("BurstTab=0")
				BurstTab=0
			end
			if (({UnitAura("player","超凡之盟")})[7] ~= nil  and ({GetSpellCooldown("星辰坠落")})[2] <3 ) then
				ChatFrame1:AddMessage("使用星辰坠落")
				Box:SetTexture(0,0.75,0,1)
				return				
			end
			--ChatFrame1:AddMessage("STEP3")
			if (BurstTab == 1 and abs(({UnitAura("target","月火术",nil,"HARMFUL")})[7] - ({UnitAura("target","阳炎术",nil,"HARMFUL")})[7])<1) then
				BurstTab=0
				ChatFrame1:AddMessage("BurstTab=0 No2")
			end

			if (BurstTab == 1) then 
				ChatFrame1:AddMessage("使用月火术")
				Box:SetTexture(0,0.125,0,1)
				return  
			end

			--ChatFrame1:AddMessage("有判断")
			if (({UnitAura("target","月火术",nil,"HARMFUL")})[7] == nil or ({UnitAura("target","月火术",nil,"HARMFUL")})[7]-GetTime()<2) then 
				ChatFrame1:AddMessage("使用月火术")
				Box:SetTexture(0,0.125,0,1)
				return  
			end
			if  (({UnitAura("target","阳炎术",nil,"HARMFUL")})[7] == nil or ({UnitAura("target","阳炎术",nil,"HARMFUL")})[7]-GetTime()<2) then 
				ChatFrame1:AddMessage("使用阳炎术")
				Box:SetTexture(0,0.25,0,1)
				return
			end
			if (({GetSpellCooldown("自然之力")})[2]==0) then 
				ChatFrame1:AddMessage("使用自然之力")
				Box:SetTexture(0,0.875,0,1)		
				return
			end
			if (({GetSpellCooldown("星涌术")})[2]<3) then 
				ChatFrame1:AddMessage("使用星涌术")
				Box:SetTexture(0,0.625,0,1)		
				return
			end
			if (({GetSpellCooldown("星辰坠落")})[2]<3) then 
				ChatFrame1:AddMessage("使用星辰坠落")
				Box:SetTexture(0,0.75,0,1)
				return
			end
			direction=GetEclipseDirection()
			if ( direction == "none") then 
				direction="moon"
			end
			if ( direction == "moon") then 
				ChatFrame1:AddMessage("使用愤怒")
				Box:SetTexture(0,0.375,0,1)	
				return
			end
			if ( direction == "sun") then 
				ChatFrame1:AddMessage("使用星火术")
				Box:SetTexture(0,0.5,0,1)
				return
			end
		end
	end
end