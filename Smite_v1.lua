local autoSmite = false
local Autor = "guilimama01234";
 
function ScriptInit()
end
 
local smites = { "SmiteDamageTracker", "SmiteDamageTrackerStalker", "SmiteDamageTrackerAvatar" }
local targetList = { "SRU_Dragon", "SRU_RiftHerald", "SRU_Baron", "?" }
function ScriptUpdate(draw, ui, plataform)
    local me          = plataform:GetPlayer()
    local minions     = plataform:GetMinionsList()
    local smiteDamage = 0;
 
 
    ui:Begin("Auto Smite", true)
    autoSmite = ui:CheckBox("Auto Smite", autoSmite)
    if (not autoSmite) then
        return
    end
 
    local PlayerBuffers = me:GetBuffer()
    for _, buff in pairs(PlayerBuffers) do
        local buffName = buff:GetName()
 
        for z, smite in pairs(smites) do
            if (buffName == smite) then
                local count1 = buff:GetCount();
                local count2 = buff:GetCountAlt();
                ui:Text(string.format(" -> GET! %s Count1 %d Count2 %f", buffName, count1, count2))
                if (count1 > 0) then
                    smiteDamage = count1 + 0.0;
                end
                if (count2 > count1) then
                    smiteDamage = count2;
                end
                if (smiteDamage == 0) then
                    smiteDamage = 600.0;
                end
 
                break;
            end
        end
    end
    ui:Text(string.format("Smite Damage: %d", smiteDamage))
    if (smiteDamage <= 0) then
        return;
    end
 
 
    local F = me:F()
    local SkillTimer = F:GetTimer() + 2;
    local GameTick = plataform:GetGameTick();
    ui:Text(string.format("F: %f Game: %f", SkillTimer, GameTick));
 
    for _, mob in pairs(minions) do
       
        if (SkillTimer > GameTick) then
            goto CONTINUE;
        end
  
        if (not mob:IsAlive() or me:DisTo(mob) > (me:GetRange() + 200)) then
            goto CONTINUE;
        end
 
        if (not me:IsEnemy(mob)) then
            goto CONTINUE;
        end
       
        local name = mob:GetName()

        
        for _, target in pairs(targetList) do           
            if (string.find(name, target)) then 

                draw:DrawCircle3D(mob, Vec4(1, 0, 0, 1), name);

                local mob_pos = mob:GetPosition();
                if (smiteDamage >= mob:GetHP()) then
                    plataform:SetPos(mob_pos);
                    F:Cast();
                end

            end
        end
 
        ::CONTINUE::
    end
    ui:End()
end
