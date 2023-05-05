dofile("C:\\scripts\\util.lua")

local hero = "Diana"
local author = "Shadowy"

local Me = nil;
local Heros = {}
local SKILL_R_DIANA_RANGE = 460;
local SKILL_Q_DIANA_RANGE = 750;
local SKILL_E_DIANA_RANGE = 825;
local SKILL_W_DIANA_RANGE = 1180;


local actived = false;
local menu_enable = true;
local vk_space = 0x20
local q_combo = true
local w_combo = true
local e_combo = true
local r_combo = true
local r_count = 1


function ScriptInit()
end

function GetMyTarget(player, list_of_heros, range)
    if (list_of_heros == nil) or (player == nil) or (not player:IsAlive())
    then
        return nil;
    end

    if (range == 0) then
        range = player:GetRange();
    end

    local MyTarget = nil;
    local ListEnenmy = {};

    for _, v in pairs(list_of_heros) do
        if (not IsValidEnemy(v, player))
        then
            goto CONTINUE;
        end

        if (v:DisTo(player) > range) then
            goto CONTINUE;
        end

        table.insert(ListEnenmy, v);

        if (MyTarget == nil) then
            MyTarget = v;
            goto CONTINUE;
        end

        ::CONTINUE::
    end

    return MyTarget, #ListEnenmy;
end

function ScriptUpdate(draw, ui, plataform)
    if (not plataform:IsLolForeground()) then
        return;
    end
    Me = plataform:GetPlayer();
    Heros = plataform:GetHeroList();

    if (not string.find(hero, Me:GetName())) then
        return;
    end

    ui:Begin("Diana Script", true);


    menu_enable = ui:Begin("Diana Script", menu_enable);
    actived = ui:CheckBox("Ativar? ", actived);
    q_combo = ui:CheckBox("Use Q", q_combo)
    w_combo = ui:CheckBox("Use W", w_combo)
    SKILL_W_DIANA_RANGE = ui:SliderInt("W Distance", SKILL_W_DIANA_RANGE, 0, 10000)
    e_combo = ui:CheckBox("Use E", e_combo)
    r_combo = ui:CheckBox("Use R", r_combo)
    r_count = ui:SliderInt("Player count", r_count, 0, 5)


    if (not actived) then
        ui:End();
        return;
    end




    if (not plataform:isKeyPress(vk_space)) then
        ui:End();
        return;
    end



    local MyEnemy, Ecounts = GetMyTarget(Me, Heros, SKILL_R_DIANA_RANGE);
    if (Ecounts == 0) then
        ui:End();
        return;
    end
    if (not MyEnemy) then
        ui:End();
        return
    end

    local Q = Me:Q();
    local W = Me:W();
    local E = Me:E();
    local R = Me:R();

    local gameTick = plataform:GetGameTick();

    local mspos = plataform:GetPos();
    local pos = MyEnemy:GetPosition();

    ui:Text(string.format("Distance: %f  Count: %d", MyEnemy:DisTo(Me), Ecounts))
    local BufferMark = "dianamoonlight";


    local function CastSpell(Combo, Distance, Spell)
        if (not Combo and MyEnemy:DisTo(Me) > Distance) then
            return
        end
        local SpellTimer = (Spell:GetTimer() + 0.50);
        if (Spell:GetLevel() > 0 and gameTick > SpellTimer) then
            plataform:SetPos(pos)
            plataform:Wait(50)
            Spell:Cast()
        end

        if (Spell ~= Q) then
            return
        end

        local buffs = MyEnemy:GetBuffer()

        for _, bf in pairs(buffs) do
            local BufferName = bf:GetName();

            if (not BufferName) then
                goto CONTINUE;
            end
            if (bf:GetEnd() < gameTick) then
                goto CONTINUE;
            end

            if (string.find(BufferName, BufferMark)) then

                E:Cast()

            end

            ::CONTINUE::
        end
    end

    plataform:SetPos(pos)
    plataform:Wait(30)

    CastSpell(q_combo, SKILL_Q_DIANA_RANGE, Q);
    CastSpell(w_combo, SKILL_W_DIANA_RANGE, W);
    CastSpell(e_combo, SKILL_E_DIANA_RANGE, E);

    plataform:Wait(30)
    plataform:SetMousePos(mspos)


    local RTimer = R:GetTimer() + 0.5;
    if (r_combo and Ecounts <= r_count
        and MyEnemy:DisTo(Me) <= SKILL_R_DIANA_RANGE
        and gameTick > RTimer) then
        R:Cast()
    end


    ui:End();
end
