local last_attack_timer     = 0
local last_move_time        = 0
local last_tick_timer       = 0

function ScriptInit()
end


function ScriptUpdate(draw, ui, plataform)
end

function Wait(plataform, MS)
   local tick = plataform:GetGameTick();

   -- Inicialization Tick Timer Records
   if(last_tick_timer == 0)then
        last_tick_timer = tick;
   end

   if(tick > last_tick_timer)then
    last_tick_timer = tick + MS;
    return true;
   end

   return false;
end

function Orb(plataform, me, target, delay)
    if (not me) then
        return;
    end

    if(delay == 0)then
        delay = 1;
    end

    if target ~= nil and (plataform:GetGameTick()) > (last_attack_timer + (me:GetAttackDelayTicks())) then
        local tpos = target:GetPosition();
        plataform:ClickOrder(tpos, delay, true);
        last_attack_timer = plataform:GetGameTick() + (delay / 1000);
    elseif plataform:GetGameTick() > last_move_time and plataform:GetGameTick() > last_attack_timer + me:GetAttackCastDelayTicks() then  -- 
        last_move_time = plataform:GetGameTick() + (delay / 1000);
        plataform:MouseClick(false, delay);
    end

end

function StringContains(list, str)

    local str = str:lower()
    for _, s in ipairs(list) do
        if str:find(s:lower()) then
            return true
        end
    end
    return false

end

function FindClosestEnemy(me, enemyList)

    local closestEnemy = nil
    for _, enemy in pairs(enemyList) do
        if (closestEnemy == nil or enemy:DisTo(me) < closestEnemy:DisTo(me)) then
            closestEnemy = enemy;
        end
    end
    return closestEnemy;

end

function CheckLastHit(enemy, damage)
    if (enemy:GetHP() > damage) then
        return nil;
    else
        return enemy;
    end
end

function FindLowestHP(enemyList)
    local lowestHP = nil
    for _, enemy in pairs(enemyList) do
        if (lowestHP == nil or enemy:GetHP() < lowestHP:GetHP()) then
            lowestHP = enemy;
        end
    end
    return lowestHP;
end

function IsValidObj(value)
    if(not value)then
        return false;
    end

    if(not value:IsAlive() or not value:IsVisible())then
        return false;
    end
    if(not value:IsTargetable())then
        return false;
    end
    return true;
end



function IsValidEnemy(value, me)

    if(not IsValidObj(value))then
        return false;
    end
    if (not value:IsEnimy(me)) then
        return false;
    end
    return true;

end


function IsClosets(value, me, range)

    if(range == 0)then
        range = me:GetRange();
    end
    return value:DisTo(me) < range;

end

function IsCloset(obj, me)
    return IsClosets(obj, me, 0)
end


