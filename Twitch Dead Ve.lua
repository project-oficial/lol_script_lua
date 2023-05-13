dofile("C:\\scripts\\util.lua");


local me;
local Heros;
local active = false;

local Hero = "Twitch";
local Author = "Aprendiz";

function ScriptInit()
end

local EBaseDamage = { 20, 30, 40, 50, 60 };
local EDamagePerStack = { 15, 20, 25, 30, 35 };

local PASSIVE_MAX_STACKS = 6;
local E_TARGET_RANGE = 1200;
local vk_space = 0x20 -- Código da tecla "SPACE"

function GetEDamage(level, stacks)
    if (stacks < 1) then
        return 0.0;
    end
    if (level < 1) then
        return 0.0
    end

    local physicalDmg = 0;
    local magicalDmg  = 0;

    physicalDmg       = EBaseDamage[level]
    local bonusAttack = me:GetDamage() * stacks;

    physicalDmg       = physicalDmg + (EDamagePerStack[level] + 0.35 * bonusAttack)
    magicalDmg        = 0.33 * me:GetAbilityPower() * stacks
    return magicalDmg + physicalDmg;
end




function ScriptUpdate(draw, ui, plataform)
    me    = plataform:GetPlayer();
    Heros = plataform:GetHeroList();
    if (me == nil) or (not plataform:IsLolForeground()) then
        return;
    end

    if (not string.find(Hero, me:GetName())) then
        return;
    end


    ui:Begin("Twitch Dead Ve", true);

    ui:Text(string.format("me Name: %s", me:GetName()));
    active = ui:CheckBox(string.format("active? %s", active), active);

    if (not me:IsAlive()) or (Heros == nil) or (not active) then
        ui:End();
        return;
    end

    ui:Text(string.format("Total de herois em campo %d", #Heros));

    local enimylist = {};
    local demage = 0.0;
    local stack = 0;


    local Ticks = plataform:GetGameTick();
    local Eskill = me:E();
    local Wskill = me:W();
    local isEReady = false;
    local isWReady = false;


    if (Wskill:GetLevel() > 0) then
        isWReady = Ticks > Wskill:GetTimer()
        ui:Text(string.format("Skill W Ok %s", isWReady))
    end

    if (Eskill:GetLevel() > 0) then
        isEReady = Ticks > Eskill:GetTimer();
        ui:Text(string.format("Skill E Ok %s", isEReady))
    end

    for _, value in pairs(Heros) do
        if ((not value:IsAlive()) or (not value:IsEnemy(me))) then
            goto CONTINUE;
        end
        if (not value:IsVisible()) then
            goto CONTINUE;
        end
        if (value:DisTo(me) > E_TARGET_RANGE) then
            goto CONTINUE;
        end

        local listBuffers = value:GetBuffer();
        for _, v in pairs(listBuffers) do
            local nameBuffer = v:GetName();
            if (string.find(nameBuffer, "TwitchDeadlyVenom")) then
                stack = v:GetCount();
            end
        end
        if (stack < 1) then
            goto CONTINUE;
        end
        demage = GetEDamage(Eskill:GetLevel(), stack) - (value:GetArmor() + value:GetMagicResistence());


        local newEdmg    = {};
        newEdmg.object   = value;
        newEdmg.stacks   = stack;
        newEdmg.damage   = demage;
        newEdmg.distance = value:DisTo(me);
        newEdmg.killable = demage >= value:GetHP();

        table.insert(enimylist, newEdmg);
        ::CONTINUE::
    end
    ui:Text(string.format("Game Tick %f", Ticks))


    local mspos = plataform:GetPos();
    ui:Text(string.format("x:%f y:%f", mspos.x, mspos.y))
    for key, value in pairs(enimylist) do
        ui:Text(string.format("Enimy[%d] Name: %s | Distance : %f \n| killable : %s | Damage %f | HP : %d ", key,
            value.object:GetName(), value.distance, value.killable, value.damage, value.object:GetHP()))
        local ePos = value.object:GetPosition();

        if (isEReady or isWReady) then
            if (plataform:isKeyPress(vk_space)) then

                plataform:SetPos(ePos); -- posiciona o mouse
                plataform:Wait(50); -- espera 50ms (travando todos scripts)

                if (isWReady) then
                    Wskill:Cast();
                end

                if (value.killable and isEReady ) then
                    Eskill:Cast();
                end

                plataform:Wait(50); -- espera 50ms (travando todos scripts)
                plataform:SetMousePos(mspos); -- volta a posição anterior
            end
        end
    end

    ui:End();
end
