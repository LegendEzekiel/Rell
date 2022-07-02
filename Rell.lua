SpellData = {
    ["Q"] = {
        ['range'] = 685,
        ['delay'] = 0.35,
        ['width'] = 150,
        ['speed'] = math.flt_max,
        ['type'] = SkillshotType.SkillshotLine,
        ['collision'] = false,
        ['collisionFlags'] = bit.bor(CollisionFlag.CollidesWithYasuoWall, CollisionFlag.CollidesWithMinions, CollisionFlag.CollidesWithHeroes),
        ['minHitChance'] = HitChance.High,
        ['boundingRadiusMod'] = false
    },
    ["W"] = {
        ['range'] = 900,
        ['delay'] = 0.35,
        ['width'] = 200,
        ['speed'] = math.flt_max,
        ['type'] = SkillshotType.SkillshotLine,
        ['collision'] = false,
        ['collisionFlags'] = CollisionFlag.CollidesWithYasuoWall,
        ['minHitChance'] = HitChance.High,
        ['boundingRadiusMod'] = false
    },
    ["E"] = {
        ['range'] = 1500,
        ['delay'] = 0.35,
        ['width'] = 320,
        ['speed'] = math.flt_max,
        ['type'] = SkillshotType.SkillshotLine,
        ['collision'] = false,
        ['collisionFlags'] = CollisionFlag.CollidesWithYasuoWall,
        ['minHitChance'] = HitChance.High,
        ['boundingRadiusMod'] = false
    },

    ["R"] = {
        ['maxRange'] = 1200,
        ['range'] = 450,
        ['delay'] = 0.25,
        ['width'] = 225,
        ['speed'] = 300,
        ['type'] = SkillshotType.SkillshotCircle,
        ['collision'] = false,
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
        ['Use W'] = nil;
        ['Use W2'] = nil;
        ['Use E'] = nil;
        ['Use R'] = nil;
        ['Use Key R'] = nil;
        ['Use R Number'] = nil;
    },
    ["Harass"] = {
        ['Use Q'] = nil;
        ['Use E'] = nil;
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
        ['W2'] = nil;
        ['E'] = nil;
        ['R'] = nil;

    },
    ['Draw'] = {

    }


};

local function Init()


    Champions.Q = (SDKSpell.Create(SpellSlot.Q, MenuConfig['Use Range']['Q'].value, DamageType.Magical))
    Champions.W = (SDKSpell.Create(SpellSlot.W, MenuConfig['Use Range']['W'].value, DamageType.Magical))
    Champions.E = (SDKSpell.Create(SpellSlot.E, MenuConfig['Use Range']['E'].value, DamageType.Magical))
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

    Champions.W:SetSkillshot(
            SpellData['W']['delay'],
            SpellData['W']['width'],
            SpellData['W']['speed'],
            SpellData['W']['type'],
            SpellData['W']['collision'],
            SpellData['W']['collisionFlags'],
            SpellData['W']['minHitChance'],
            SpellData['W']['boundingRadiusMod']
    );
    Champions.E:SetSkillshot(
            SpellData['E']['delay'],
            SpellData['E']['width'],
            SpellData['E']['speed'],
            SpellData['E']['type'],
            SpellData['E']['collision'],
            SpellData['E']['collisionFlags'],
            SpellData['E']['minHitChance'],
            SpellData['E']['boundingRadiusMod']
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
        strR = string.gsub(strR, "It will only be used when there is an enemy within the specified range,which can back the enemy stun", "只有在指定范围内有敌人时才会使用，该范围可以支持敌人眩晕");


        return strR;

    end
    return str;

end

local function LoadMenu()


    local Combo = Menu:AddMenu("Combo", AutoLanguage("Combo"));
    MenuConfig['Combo']['Use Q'] = Combo:AddCheckBox("useQ", AutoLanguage('Use Q'));
    MenuConfig['Combo']['Use W'] = Combo:AddCheckBox("useW", AutoLanguage('Use W'));
    MenuConfig['Combo']['Use W2'] = Combo:AddCheckBox("useW2", AutoLanguage('Use W2'));
    MenuConfig['Combo']['Use W2']:AddTooltip(AutoLanguage("It will only be used when there is an enemy within the specified range,which can back the enemy stun"));

    MenuConfig['Combo']['Use E'] = Combo:AddCheckBox("useE", AutoLanguage('Use E'));
    MenuConfig['Combo']['Use R'] = Combo:AddCheckBox("useR", AutoLanguage('Use R'));
    --MenuConfig['Combo']['Use Key R'] = Combo:AddKeyBind("keyR", ("Key R"), 84, false, false);
    --MenuConfig['Combo']['Use Key R']:PermaShow(true, true);
    MenuConfig['Combo']['Use R Number'] = Combo:AddSlider("useRrange", 'Use R >= X Enemy', 3, 1, 5)

    MenuConfig['Combo']['Use R Number']:PermaShow(true, true);
    local Harass = Menu:AddMenu("Harass", "Harass");
    MenuConfig['Harass']['Use Q'] = Harass:AddCheckBox("HuseQ", AutoLanguage('Use Q'));
    MenuConfig['Harass']['Use E'] = Harass:AddCheckBox("HuseE", AutoLanguage('Use E'));


    --local Auto = Menu:AddMenu("Auto", "Auto");

    local UseRange = Menu:AddMenu("useRange", AutoLanguage("Use Range Settings"));
    MenuConfig['Use Range']['Q'] = UseRange:AddSlider("useQRange", AutoLanguage('Use Q Range'), 685, 1, 685, 10, function(s)
        --print(MenuConfig['Use Range']['Q'].value);
        Champions.Q = (SDKSpell.Create(SpellSlot.Q, MenuConfig['Use Range']['Q'].value, DamageType.Magical))
        Q = Champions.Q;
    end)
    MenuConfig['Use Range']['W'] = UseRange:AddSlider("useWRange", AutoLanguage('Use W Range'), 600, 1, 900, 1, function(s)
        Champions.W = (SDKSpell.Create(SpellSlot.W, MenuConfig['Use Range']['W'].value, DamageType.Magical))
        W = Champions.W;
    end)
    MenuConfig['Use Range']['W2'] = UseRange:AddSlider("useW2Range", AutoLanguage('Use W2 Range'), 500, 1, 500, 1, function(s)
        Champions.W = (SDKSpell.Create(SpellSlot.W, MenuConfig['Use Range']['W2'].value, DamageType.Magical))
        W = Champions.W;
    end)

    MenuConfig['Use Range']['E'] = UseRange:AddSlider("useERange", AutoLanguage('Use E Range'), 1500, 1, 1500, 1, function(s)
        Champions.E = (SDKSpell.Create(SpellSlot.E, MenuConfig['Use Range']['E'].value, DamageType.Magical))
    end)
    MenuConfig['Use Range']['R'] = UseRange:AddSlider("useRRange", AutoLanguage('Use R Range'), 400, 1, 450, 1, function(s)
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

local function UseQ()
    if Q:Ready() then
        local T = TargetSelector.GetTarget(Q.range, DamageType.Magical);

        if T and T:IsValidTarget(Q.range) then
            local Pred = Q:GetPrediction(T);
            if Pred and Pred.hitchance >= HitChance.High then
                if My.position:Distance(Pred.castPosition) <= Q.range then
                    Q:Cast(Pred.castPosition);
                end
            end
        end
    end
end

local function UseW()
    if W:Ready() then

        local SpellName = My.spellBook:GetSpellEntry(1):GetName();
        if SpellName == 'RellW_Dismount' then
            local T = TargetSelector.GetTarget(W.range, DamageType.Magical);
            if T and T:IsValidTarget(W.range) then


                local Pred = W:GetPrediction(T);


                if Pred and Pred.hitchance >= HitChance.Medium then
                    --print(W.range)
                    if My.position:Distance(Pred.castPosition) <= W.range then
                        W:Cast(Pred.castPosition);

                    end
                end
            end

        end

    end
    --RellW_Dismount 下马劈


end

local function UseW2()
    if W:Ready() then

        local SpellName = My.spellBook:GetSpellEntry(1):GetName();
        if SpellName == 'RellW_MountUp' then
            local T = TargetSelector.GetTarget(MenuConfig['Use Range']['W2'].value, DamageType.Magical);
            if T and T:IsValidTarget(MenuConfig['Use Range']['W2'].value) then
                W:Cast();
            end

        end

        --336 Range


    end

    --RellW_MountUp  上马

end

local function UseE()

    if E:Ready() then

        local T = TargetSelector.GetTarget(MenuConfig['Use Range']['E'].value, DamageType.Magical);
        if T and T:IsValidTarget(MenuConfig['Use Range']['E'].value) then

            if My.position:Distance(T.position)<=250 then

                E:Cast(T);
            end


--            for _, ally in ObjectManager.allyHeroes:pairs() do
--                if not ally.isMe then
--                    local allyObj = nil;
--                    --print('=============')
--                    for i, v in ally.buffManager.buffs:pairs() do
--                        if v.isValid then
--                            --print(v:GetName())
--
--                            if v:GetName() == 'relle_target' then
--                                allyObj = ally;
--                            end
--                        end
--                    end
--
--
--
--                    --print('=============')
--
--
--                    if allyObj then
----
----                        allyObjPos2d=allyObj.position:To2D();
----                        MyPos2d=My.position:To2D();
----                        Tpos2d=T.position:To2D();
----
----                        local a = Tpos2d:IsOnLineSegment(allyObjPos2d, MyPos2d)
----                        print(a)
----
----                      local b=  MyPos2d:AngleDegBetween(allyObjPos2d);
----print(b)
----                        b=  allyObjPos2d:AngleDegBetween(Tpos2d);
----                        print(b)
--
--                    end
--                end
--
--
--            end
--



            --   print(    My.position:Extended(T.position,1500));

        end

    end

end

local function UseR()
    local AoePosition = R:GetCastOnBestAOEPosition(MenuConfig['Combo']['Use R Number'].value)

    if AoePosition:IsValid() then
        R:Cast(AoePosition);
    end

end
local function Combo()
    if MenuConfig['Combo']['Use Q'].value then
        UseQ();
    end
    if MenuConfig['Combo']['Use W'].value then
        UseW();
    end
    if MenuConfig['Combo']['Use W2'].value then
        UseW2();
    end
    if MenuConfig['Combo']['Use E'].value then
        UseE();
    end
    if MenuConfig['Combo']['Use R'].value then
        UseR();
    end
end

local function Harass()
    if MenuConfig['Harass']['Use Q'].value then
        UseQ();
    end
    if MenuConfig['Harass']['Use E'].value then
        UseE();
    end
end

local function WRangeChange()
    local SpellName = My.spellBook:GetSpellEntry(1):GetName();
    if SpellName == 'RellW_Dismount' then

        Champions.W = (SDKSpell.Create(SpellSlot.W, MenuConfig['Use Range']['W'].value, DamageType.Magical))
        W = Champions.W;

    end
    if SpellName == 'RellW_MountUp' then

        Champions.W = (SDKSpell.Create(SpellSlot.W, MenuConfig['Use Range']['W2'].value, DamageType.Magical))
        W = Champions.W;

    end


end

local function ontick()
    if My.isAlive == false then
        return ;
    end
    WRangeChange();

    if Champions.Combo then
        Combo();
        --UseQ2();
    end

    if Champions.Harass then

       Harass();
        --UseQ2();

    end


end

Callback.Bind(CallbackType.OnTick, ontick)

local function OnSpellAnimationStart(sender, CastArgs)


end
Callback.Bind(CallbackType.OnSpellAnimationStart, OnSpellAnimationStart)
local fontSize = 16
Callback.Bind(CallbackType.OnImguiDraw, function()
    --local dmg = HealthPrediction.GetIncomingDamage(Game.localPlayer, 0.1, true, true)
    --local text = string.format("Damage: %d", dmg)
    --local tX, tY = Renderer.CalcTextSize(text, fontSize)
    --Renderer.DrawWorldText(text, Game.localPlayer.position, Math.Vector2(-tX / 2, 0), fontSize)

    --Renderer.DrawCircle3D( My.position:To2D(),50,255,2,3154116607)


end)


