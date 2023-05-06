dofile("C:\\scripts\\util.lua");

-- lista de unidades para serem excluídas
local exclude               = { "Plant", "Test", "Respawn" }

local me
local heros
local minions


local vk_home               = 0x24
local vk_space              = 0x20
local vk_v                  = 0x56
local vk_c                  = 0x43

local menu_enabled          = true
local mob_attack            = false
local hero_attack           = false
local last_hit              = false

local delay_default         = 30



function GetTarget(you, list, hero, hit)
    if not you:IsAlive() then
        return
    end

    local enemies = {}
    for _, enemy in pairs(list) do

        if enemy:IsEnimy(you) and enemy:IsAlive() and IsClosets(enemy, you, 0) then

            if(not StringContains(exclude, enemy:GetName())) then
                table.insert(enemies, enemy)
            end
           
        end

    end
    
    local target
    if hero then
        target = FindClosestEnemy(you, enemies)
    elseif hit then
        for _, enemy in pairs(enemies) do

            local obj_enemy = CheckLastHit(enemy, you:GetDamage() + you:GetBonusAttack())
            if obj_enemy == nil then
                goto CONTINUE
            end

            if target == nil or obj_enemy:GetHP() < target:GetHP() then
                target = obj_enemy
            end

            ::CONTINUE::
        end
    else
        target = FindLowestHP(enemies)
    end

    return target
end


function ScriptInit()
end;


function ScriptUpdate(draw, ui, plataform)

    me          = plataform:GetPlayer();
    heros       = plataform:GetHeroList();
    minions     = plataform:GetMinionsList();

    if (me == nil) or (not plataform:IsLolForeground()) then
        return;
    end

    mob_attack  = false;
    hero_attack = false;
    last_hit    = false;


    if(plataform:isKeyDown(vk_home)) then
        menu_enabled = not menu_enabled;
    end

    local target = nil;
    if(plataform:isKeyPress(vk_v)) then
        target = GetTarget(me, minions, false, false);
        mob_attack = true;
    end

    if(plataform:isKeyPress(vk_c)) then
        target = GetTarget(me, minions, false, true);
        last_hit = true;
    end

    if(plataform:isKeyPress(vk_space)) then
        target = GetTarget(me, heros, true, false);
        hero_attack = true;
    end

    if(mob_attack or hero_attack or last_hit) then
        Orb(plataform, me, target, delay_default);
    end


    if(menu_enabled) then
        menu_enabled = ui:Begin("Simple OrbWalker", menu_enabled)

        ui:Text(string.format("Target NAME : [%s]", target ~= nil and target:GetName() or "NO ONE" ));

        ui:Text(string.format("Heros count: %d\nMinions Count %d", #heros, #minions));
    
        ui:Text(string.format("ATTACKS!\n[SPACE] HERO : [%s]\n[V] MINIONS : [%s]\n[C] LAST HIT (MINIONS ONLY) : [%s]\n\n\tHOME TO HIDE AND SHOW", hero_attack, mob_attack, last_hit));
    
        ui:End()
    end

end
