/*
GWorld Values & Hashes:

GOG 1.03.01: "SM2-Win64-Shipping.exe"+5187E70 || Hash: BAE78A1CDAC9B6A0748F7068D2AD4A8E || Memory Size: 90656768

Steam 1.03.03: "SM2-Win64-Shipping.exe"+5187EB0 || Hash: 46CF383D59B0F0B4FAD0C0E95C427416 || Memory Size: 90656768

Epic 1.03.08: Hash: 44401A57D34A3043925DEE4F71F8DE80 || Memory Size: 90656768

Level Values:
L00 = 0,
Heart of the Forest = 1,
Abandoned Barn = 2,
Enchanted River = 3,
Ice Ambush = 4,
Depths of the Mountain = 5,
Vertiginous Descent = 6,
Boiling Baths = 7,
Smurf Paradise = 8,
Volcanic Panic = 9,
Astral Nothingness = 10,
L11 = 11,
L12 = 12,
L13 = 13,
L14 = 14,
L15 = 15,
L16 = 16,
L17 = 17,
L18 = 18,
L19 = 19,
L20 = 20,
L21 = 21,
L22 = 22,
L23 = 23,
L24 = 24,
L25 = 25,
L26 = 26,
Main Menu = 27,
Hub = 28,
Tutorial = 29,
DEBUG = 30,
L27 = 31,
L28 = 32,
L29 = 33,
L30 = 34,
CREDITS = 35,
ELevel_MAX = 36
*/

state("SM2-Win64-Shipping","GOG 1.03.01")
{
    byte levelID: 0x5187E70, 0x180, 0x278;
    byte loads: 0x05170530, 0x30, 0x6D0, 0x3D0, 0x20, 0x2D0, 0x3D8;
    byte menuPage: 0x05170530, 0x30, 0x6D0, 0x3A8;
    byte cutscene: 0x050431A0, 0x750, 0x50, 0x6B0, 0x230, 0x130, 0x8;
    byte doBeLoadingt: 0x5187E70, 0x118, 0x3B0;
}
state("SM2-Win64-Shipping","Steam 1.03.03")
{
    byte levelID: 0x5187EB0, 0x180, 0x278;
    byte loads: 0x05170570, 0x30, 0x6D0, 0x3D0, 0x20, 0x2D0, 0x3D8;
    byte menuPage: 0x05170570, 0x30, 0x6D0, 0x3A8;
    byte cutscene: 0x0503FF28, 0x130, 0xB18, 0xC70, 0x5A8, 0x30, 0x3F0, 0x8;
    byte doBeLoading: 0x5187EB0, 0x118, 0x3B0;
}
state("SM2-Win64-Shipping","Epic Games 1.03.08")
{
    byte levelID: 0x04D0DFF8, 0x1E0, 0x20, 0xD28, 0x278;
    byte loads: 0x05171570, 0x30, 0x6D0, 0x3D0, 0x20, 0x2D0, 0x3D8;
    byte menuPage: 0x05171570, 0x30, 0x6D0, 0x3A8;
    byte cutscene: 0x04FB2460, 0xA0, 0x7B0, 0x348;
}



startup
{
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
// Asks user to change to game time if LiveSplit is currently set to Real Time.
    {        
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | Alpha Prime",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );
        
        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }

    settings.Add("hub1", true, "Enter Smurf Forest");
    settings.SetToolTip("hub1", "Split upon entering the Smurf Forest chapter from Gargamel's Hovel");

    settings.Add("forest", true, "Smurf Forest");
    settings.SetToolTip("forest", "Allow auto-splitting in the Smurf Forest");
    settings.CurrentDefaultParent = "forest";
    settings.Add("heart", true, "Heart of the Forest");
    settings.SetToolTip("heart", "Split upon completion of the Heart of the Forest level");
    settings.Add("barn", true, "Abandoned Barn");
    settings.SetToolTip("barn", "Split upon completion of the Abandoned Barn level");
    settings.Add("river", true, "Enchanted River");
    settings.SetToolTip("river", "Split upon completion of the Enchanted River level");
    settings.CurrentDefaultParent = null;

    settings.Add("hub2", true, "Enter Snowy Mountains");
    settings.SetToolTip("hub2", "Split upon entering the Snowy Mountain chapter from Gargamel's Hovel");

    settings.Add("mountain", true, "Snowy Mountain");
    settings.SetToolTip("mountain", "Allow auto-splitting in the Snowy Mountain");
    settings.CurrentDefaultParent = "mountain";
    settings.Add("ice", true, "Ice Ambush");
    settings.SetToolTip("ice", "Split upon completion of the Ice Ambush level");
    settings.Add("depths", true, "Depths of the Mountain");
    settings.SetToolTip("depths", "Split upon completion of the Depths of the Mountain level");
    settings.Add("descent", true, "Vertiginous Descent");
    settings.SetToolTip("descent", "Split upon completion of the Vertiginous Descent level");
    settings.CurrentDefaultParent = null;

    settings.Add("hub3", true, "Enter the Land of Fire");
    settings.SetToolTip("hub3", "Split upon entering the Land of Fire chapter from Gargamel's Hovel");

    settings.Add("fire", true, "The Land of Fire");
    settings.SetToolTip("fire", "Allow auto-splitting in the Land of Fire");
    settings.CurrentDefaultParent = "fire";
    settings.Add("bath", true, "Boiling Baths");
    settings.SetToolTip("bath", "Split upon completion of the Boiling Baths level");
    settings.Add("paradise", true, "Smurf Paradise");
    settings.SetToolTip("paradise", "Split upon completion of the Smurf Paradise level");
    settings.Add("panic", true, "Volcanic Panic");
    settings.SetToolTip("panic", "Split upon completion of the Volcanic Panic level");
    settings.CurrentDefaultParent = null;

    settings.Add("end", true, "Astral Nothingness");
    settings.SetToolTip("end", "Split upon completion of the Astral Nothingness level");
}


init
{
    string MD5Hash;
    using (var md5 = System.Security.Cryptography.MD5.Create())
    using (var s = File.Open(modules.First().FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
    MD5Hash = md5.ComputeHash(s).Select(x => x.ToString("X2")).Aggregate((a, b) => a + b);
    print("Hash is: " + MD5Hash);

    /*
    switch (MD5Hash)
    {
        case "BAE78A1CDAC9B6A0748F7068D2AD4A8E":
            version = "GOG 1.03.01";
            break;

        case "46CF383D59B0F0B4FAD0C0E95C427416":
            version = "Steam 1.03.03";
            break;

        case "44401A57D34A3043925DEE4F71F8DE80":
            version = "Epic Games 1.03.08";
            break;
    }
    */

    if(MD5Hash == "BAE78A1CDAC9B6A0748F7068D2AD4A8E") {return(version = "GOG 1.03.01");}
    else if(MD5Hash == "46CF383D59B0F0B4FAD0C0E95C427416") {return(version = "Steam 1.03.03");}
    else if(MD5Hash == "44401A57D34A3043925DEE4F71F8DE80") {return(version = "Epic Games 1.03.08");}
    else{return("You fucked up livesplit, fix yourself");}
}





start
{
    return(old.levelID == 27 && current.levelID == 29);
}





split
{
    return ((settings["hub1"] && old.levelID == 28 && current.levelID == 1)    ||
            (settings["heart"] && old.levelID == 1 && current.levelID == 2)    ||
            (settings["barn"] && old.levelID == 2 && current.levelID == 3)     ||
            (settings["river"] && old.levelID == 3 && current.levelID == 28)   ||
            (settings["hub2"] && old.levelID == 28 && current.levelID == 4)    ||
            (settings["ice"] && old.levelID == 4 && current.levelID == 5)      ||
            (settings["depths"] && old.levelID == 5 && current.levelID == 6)   ||
            (settings["descent"] && old.levelID == 6 && current.levelID == 28) ||
            (settings["hub3"] && old.levelID == 28 && current.levelID == 7)    ||
            (settings["bath"] && old.levelID == 7 && current.levelID == 8)     ||
            (settings["paradise"] && old.levelID == 8 && current.levelID == 9) ||
            (settings["panic"] && old.levelID == 9 && current.levelID == 10)   ||
            (settings["end"] && old.levelID == 10 && current.levelID == 35));
}





reset
{
    return (old.levelID != 27 && old.levelID != 35 && current.levelID == 27);
}



isLoading
{
    return(current.doBeLoading != 0);
}
