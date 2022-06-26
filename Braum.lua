SpellData = {
    ["Q"] = {
        ['range'] = 1050,
        ['delay'] = 0.25,
        ['width'] = 120,
        ['speed'] = 1700,
        ['type'] = SkillshotType.SkillshotLine,
        ['collision'] = true,
        ['collisionFlags'] = bit.bor(CollisionFlag.CollidesWithYasuoWall, CollisionFlag.CollidesWithMinions, CollisionFlag.CollidesWithHeroes),
        ['minHitChance'] = HitChance.High,
        ['boundingRadiusMod'] = false
    },
    ["W"] = {
        ['range'] = 650,
        ['delay'] = 0,
        ['width'] = 0,
        ['speed'] = 0,
        ['type'] = SkillshotType.SkillshotLine,
        ['collision'] = false,
        ['collisionFlags'] = CollisionFlag.CollidesWithYasuoWall,
        ['minHitChance'] = HitChance.High,
        ['boundingRadiusMod'] = false
    },

    ["R"] = {
        ['maxRange'] = 1200,
        ['range'] = 1200,
        ['delay'] = 0.5,
        ['width'] = 210,
        ['speed'] = 1400,
        ['type'] = SkillshotType.SkillshotLine,
        ['collision'] = true,
        ['collisionFlags'] = CollisionFlag.CollidesWithYasuoWall,
        ['minHitChance'] = HitChance.High,
        ['boundingRadiusMod'] = true
    },

}

My = Game.localPlayer;
Menu = UI.Menu.CreateMenu(My.charName, Game.localPlayer.displayName, 2);
Champions.CreateBaseMenu(Menu, 0);
Q = nil;
W = nil;
E = nil;
R = nil;
MenuConfig = {
    ["Combo"] = {
        ['Use Q'] = nil;

        ['Use R'] = nil;
        ['Use Key R'] = nil;
        ['Use R Number'] = nil;
    },
    ["Harass"] = {
        ['Use Q'] = nil;

    },
    ["Auto"] = {

        ['Use E'] = nil;
    },
    ["Sup"] = {

        ['Sup W'] = nil;
    },
    ['Use Range'] = {
        ['Q'] = nil;
        ['W'] = nil;
        ['E'] = nil;
        ['R'] = nil;

    },
    ['Draw'] = {

    }


};

local function Init()


    Champions.Q = (SDKSpell.Create(SpellSlot.Q, MenuConfig['Use Range']['Q'].value, DamageType.Magical))
    Champions.W = (SDKSpell.Create(SpellSlot.W, MenuConfig['Use Range']['W'].value, DamageType.Magical))
    Champions.E = (SDKSpell.Create(SpellSlot.E, 0, DamageType.Magical))
    Champions.R = (SDKSpell.Create(SpellSlot.R, MenuConfig['Use Range']['R'].value, DamageType.Magical))

    Champions.Q:SetSkillshot(
            SpellData['Q']['delay'],
            SpellData['Q']['width'],
            SpellData['Q']['speed'],
            SpellData['Q']['type'],
            SpellData['Q']['collision'],
            SpellData['Q']['collisionFlags'],
            SpellData['Q']['minHitChance'],
            SpellData['Q']['boundingRadiusMod']
    );

    Champions.R:SetSkillshot(
            SpellData['R']['delay'],
            SpellData['R']['width'],
            SpellData['R']['speed'],
            SpellData['R']['type'],
            SpellData['R']['collision'],
            SpellData['R']['collisionFlags'],
            SpellData['R']['minHitChance'],
            SpellData['R']['boundingRadiusMod']
    );

    Q = Champions.Q;
    W = Champions.W;
    E = Champions.E;
    R = Champions.R;
end

local function AutoLanguage(str)


    local i_lg = UI:GetLanguage(); --0=英语  1=中文
    if i_lg == 0 then
        --英语

        return str;
    end

    if i_lg == 1 then
        --中文
        local strR = string.gsub(str, "Combo", "连招");
        strR = string.gsub(strR, "Settings", "设置");
        strR = string.gsub(strR, "Use", "使用");
        strR = string.gsub(strR, "Enemy", "敌方");
        strR = string.gsub(strR, "Auto", "自动");
        strR = string.gsub(strR, "Range", "范围");
        strR = string.gsub(strR, "Drawing", "绘制");
        strR = string.gsub(strR, "Olny", "仅");
        strR = string.gsub(strR, "Pull", "拉");
        strR = string.gsub(strR, "Turret", "塔");
        strR = string.gsub(strR, "Or", "或");
        strR = string.gsub(strR, "Push", "推");
        strR = string.gsub(strR, "Away", "走");
        strR = string.gsub(strR, "To", "到");
        strR = string.gsub(strR, "Down", "下");
        strR = string.gsub(strR, "My", "自己");
        strR = string.gsub(strR, "Pred", "预测");
        strR = string.gsub(strR, "Damage", "伤害值");
        strR = string.gsub(strR, "Current", "当前");
        strR = string.gsub(strR, "Cast", "施法");
        strR = string.gsub(strR, "Check", "检查");
        strR = string.gsub(strR, "There is a problem with the SDK, the adjustment of the Aoe skill range requires F7 to reload", "Sdk存在问题,Aoe技能使用范围调整需要F7重新加载");
        strR = string.gsub(strR, "Prevent soldiers from being misplaced and give priority to coalition forces closest to the mouse position", "防止士兵错位，优先考虑离鼠标位置最近的联军");

        return strR;

    end
    return str;

end

local function LoadMenu()


    local Combo = Menu:AddMenu("Combo", AutoLanguage("Combo"));
    MenuConfig['Combo']['Use Q'] = Combo:AddCheckBox("useQ", AutoLanguage('Use Q'));

    MenuConfig['Combo']['Use R'] = Combo:AddCheckBox("useR", AutoLanguage('Use R'));
    MenuConfig['Combo']['Use Key R'] = Combo:AddKeyBind("keyR", ("Key R"), 84, false, false);
    MenuConfig['Combo']['Use Key R']:PermaShow(true, true);
    MenuConfig['Combo']['Use R Number'] = Combo:AddSlider("useRrange", AutoLanguage('Use R >= X Enemy'), 3, 1, 5)
    MenuConfig['Combo']['Use R Number']:PermaShow(true, true);

    local Harass = Menu:AddMenu("Harass", "Harass");
    MenuConfig['Harass']['Use Q'] = Harass:AddCheckBox("useQ", AutoLanguage('Use Q'))

    local Auto = Menu:AddMenu("Auto", "Auto");
    MenuConfig['Auto']['Use E'] = Auto:AddCheckBox("useE", AutoLanguage('Use E'))

    local Sup = Menu:AddMenu("Sup", "Sup Cast");

    MenuConfig['Sup']['Sup W'] = Sup:AddKeyBind("keyw", ("Key W "), 87, false, false);
    MenuConfig['Sup']['Sup W']:AddTooltip(AutoLanguage("Prevent soldiers from being misplaced and give priority to coalition forces closest to the mouse position"));

    local UseRange = Menu:AddMenu("useRange", AutoLanguage("Use Range Settings"));
    MenuConfig['Use Range']['Q'] = UseRange:AddSlider("useQRange", AutoLanguage('Use Q Range'), 800, 1, 1050, 10, function(s)
        --print(MenuConfig['Use Range']['Q'].value);
        Champions.Q = (SDKSpell.Create(SpellSlot.Q, MenuConfig['Use Range']['Q'].value, DamageType.Magical))
        Q = Champions.Q;
    end)
    MenuConfig['Use Range']['W'] = UseRange:AddSlider("useWRange", AutoLanguage('Use W Range'), 650, 1, 650, 1, function(s)
        Champions.W = (SDKSpell.Create(SpellSlot.W, MenuConfig['Use Range']['W'].value, DamageType.Magical))
        W = Champions.W;
    end)
    --MenuConfig['Use Range']['E'] = UseRange:AddSlider("useERange", AutoLanguage('Use E Range'), 800, 1, 800, 1, function(s)
    --    Champions.E = (SDKSpell.Create(SpellSlot.E, MenuConfig['Use Range']['E'].value, DamageType.Magical))
    --end)
    MenuConfig['Use Range']['R'] = UseRange:AddSlider("useRRange", AutoLanguage('Use R Range'), 800, 1, 1200, 1, function(s)


        Champions.R = (SDKSpell.Create(SpellSlot.R, MenuConfig['Use Range']['R'].value, DamageType.Magical))
        R = Champions.R;
    end)

    MenuConfig['Use Range']['R']:AddTooltip(AutoLanguage("There is a problem with the SDK, the adjustment of the Aoe skill range requires F7 to reload"));


    --draw
    local draw = Menu:AddMenu("draw", "Drawing", false);

    Init();
    Champions.CreateColorMenu(draw, true)

end

LoadMenu();
local function GetEnemyQ2(T)

    for _, t in ObjectManager.enemyHeroes:pairs() do
        if T.position:Distance(t.position) <= 400 and t.networkId ~= T.networkId then
            return t;
        end
    end

    return nil;

end

local function UseE()
    if E:Ready() then
        local T = TargetSelector.GetTarget(Q.range, DamageType.Magical);
        if T then
            if T:IsValidTarget(E.range) then
                local Pred = Q:GetPrediction(T);
                if Pred and Pred.hitchance >= HitChance.High then
                    if My.position:Distance(Pred.castPosition) <= E.range then
                        E:Cast(Pred.castPosition);
                    end
                end


            end
        end


    end


end

local function UseR()
    if R:Ready() then
        print(R.range)
        local AoePosition = R:GetCastOnBestAOEPosition(MenuConfig['Combo']['Use R Number'].value)
        print(AoePosition);
        if AoePosition:IsValid() then

            R:Cast(AoePosition);
        end
    end


end

local function UseQ()

    local T = TargetSelector.GetTarget(Q.range, DamageType.Magical);
    if T then
        if T:IsValidTarget(Q.range) then
            local Pred = Q:GetPrediction(T);
            if Pred and Pred.hitchance >= HitChance.High then
                if My.position:Distance(Pred.castPosition) <= Q.range then
                    Q:Cast(Pred.castPosition);
                end
            end


        end
    end


end

local function Combo()


    if MenuConfig['Combo']['Use Q'].value then
        UseQ();
    end

    --if MenuConfig['Combo']['Use E'].value then
    --    UseE();
    --end
    --
    if MenuConfig['Combo']['Use R'].value then
        UseR();
    end
    --
    --if MenuConfig['Combo']['Use W'].value then
    --    UseWCombo();
    --end
end

local function GetTurr(Tg)


    for _, turr in ObjectManager.allyTurrets:pairs() do
        --print(My.position:Distance(turr.position))
        --print(turr.isAlive)
        if turr.isAlive and Tg.isEnemy and turr.position:Distance(Tg.position) <= 1100 then
            return turr;
        end


    end

    return nil;

end

local function Harass()
    if MenuConfig['Harass']['Use Q'].value then
        UseQ();
    end

    --if MenuConfig['Harass']['Use E'].value then
    --    UseE();
    --end
end

local function GetCursRangeAlly(Curspos, CursRange)

    local allobj = nil;
    local maxRange = 10000;

    for _, ally in ObjectManager.allyHeroes:pairs() do
        if not ally.isMe then

            local my_ally_range = Curspos:Distance(ally.position);
            --
            --print(my_ally_range)
            --print(CursRange)
            --
            --print(My.position:Distance(ally.position))
            --print(W.range)
            if my_ally_range <= CursRange and My.position:Distance(ally.position) <= W.range and my_ally_range < maxRange then
                allobj = ally;
                maxRange = my_ally_range;

            end
        end


    end
    return allobj;

end

local function UseW()
    if W:Ready() then

        local cursPos = Game:GetCursorWorldPosition();
        local ally = GetCursRangeAlly(cursPos, 500);

        if ally then
            W:Cast(ally);

        end
    end


end

local function ontick()
    if My.isAlive == false then
        return ;
    end



    --if MenuConfig['Auto']['Auto W'].value then
    --    AutoWLogicHP();
    --end

    if Champions.Combo then
        Combo();
        --UseQ2();
    end

    if Champions.Harass then

        Harass();
        --UseQ2();

    end



    --Key R
    if MenuConfig['Combo']['Use Key R'].value then
        UseR();
    end

    if MenuConfig['Sup']['Sup W'].value then
        UseW();
    end

end

Callback.Bind(CallbackType.OnTick, ontick)

local function OnSpellAnimationStart(sender, CastArgs)
    if sender.isMe then

        if CastArgs.target and not CastArgs.target.isHero then

            local ally = GetCursRangeAlly(CastArgs.target.position, 500)
            if ally then
                W:Cast(ally);
                return false
            end
        end

    end


end
Callback.Bind(CallbackType.OnSpellAnimationStart, OnSpellAnimationStart)
