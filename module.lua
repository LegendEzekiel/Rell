print(Game.localPlayer.hash)
if 3929091571 ~= Game.localPlayer.hash then --Game.HashStringSDBM("TwistedFate") == 3494766226
    return
end
Champions.CppScriptMaster(false);
Environment.LoadModule("Rell");

--UnLoad
Callback.Bind(CallbackType.OnUnload, function()
    Champions.Clean()--clean QWER Spell pointer , spell range dmobj
end)


--print("end");

