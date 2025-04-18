/*
Steam 1.5.3.0: "BlueCode-Win64-Shipping.exe"+4913EB0 -- Hash: idk man, I'm just solving for x. -- Memory Size: same bro, it's a hard knock life out here.

Epic 1.5.4.10: "BlueCode-Win64-Shipping.exe"+4AA0C30 -- Hash: 5489623D371FBFCA9B3191451D11FC67 -- Memory Size: 83144704

GOG 0.2.5.10: "BlueCode-Win64-Shipping.exe"+428E660 -- Hash: CDBA2132C8C9857F561A3DB227D31D63 -- Memory Size: 74301440
GOG 1.5.15.0: "BlueCode-Win64-Shipping.exe"+4A2BFF0 -- Hash: 9FB5FDE478E136341A9E92C6367D9FA5 -- Memory Size: 82640896



GameState values:
None           = 0,
IIS            = 1,
Intro          = 2,
Playing        = 3,
Inspecting     = 4,
PuzzleMode     = 5,
Journal        = 6,
OneiricJournal = 7,
Paused         = 8,
Loading        = 9,
Message        = 10,
ReadyToPlay    = 11


Level values:
Main Menu        = 1
Intro            = 2
White Beach      = 3
Base Camp        = 4
Sleep            = 5
Black Beach      = 6
Peak             = 7
Desert           = 8
Town             = 9
Temple           = 10
Ending           = 11
Alternate Ending = 12

The only reason this was even remotely possible was due to Ero's extensive help.

*/


state("BlueCode-Win64-Shipping", "Epic Games 1.5.4.10")
{
    byte GameState: 0x4AA0C30, 0x118, 0x348;
    byte levelID: 0x4AA0C30, 0x180, 0x8A2;
}
state("BlueCode-Win64-Shipping", "GOG 0.2.5.10")
{
    byte GameState: 0x428E660, 0x128, 0x348;
    byte levelID: 0x428E660, 0x188, 0x77A;
}
state("BlueCode-Win64-Shipping", "GOG 1.5.15.0")
{
    byte GameState: 0x4A2BFF0, 0x118, 0x348;
    byte levelID: 0x4A2BFF0, 0x180, 0x8A2;
}
state("BlueCode-Win64-Shipping", "Steam 1.5.3.0")
{
    byte GameState: 0x4913EB0, 0x118, 0x348;
    byte levelID: 0x4913EB0, 0x180, 0x88A;
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


    settings.Add("any", true, "Any%");
    settings.SetToolTip("any", "Enable this if you're doing Any% speedruns. Disable if IL checkbox is enabled");

    settings.Add("Prologue", true, "Prologue: A Family Heirloom", "any");
    settings.SetToolTip("Prologue", "Allow the Autosplitter to split inside the Prologue");
    settings.CurrentDefaultParent = "Prologue";
    settings.Add("black_screen1", true, "Level Transition");
    settings.SetToolTip("black_screen1", "Split on black screen after exiting room");
    //settings.Add("on_text1", false, "On Text");
    //settings.SetToolTip("on_text1", "Split when the text saying 'Chapter 1: 74 Miles East of Otaheite' appears");
    settings.CurrentDefaultParent = null;

    settings.Add("chapter_1", true, "Chapter 1: 74 Miles East of Otaheite", "any");
    settings.SetToolTip("chapter_1", "Allow the Autosplitter to split inside Chapter 1");
    settings.CurrentDefaultParent = "chapter_1";
    settings.Add("load_screen1", true, "Level Transition");
    settings.SetToolTip("load_screen1", "Split at load screen leading into Chapter 2");
    //settings.Add("on_text2", false, "On Text");
    //settings.SetToolTip("on_text2", "Split when the text saying 'Chapter 2: The Everhart Expedition' appears");
    settings.CurrentDefaultParent = null;

    settings.Add("chapter_2", true, "Chapter 2: The Everhart Expedition", "any");
    settings.SetToolTip("chapter_2", "Allow the Autosplitter to split inside Chapter 2");
    settings.CurrentDefaultParent = "chapter_2";
    settings.Add("Stone", false);
    settings.SetToolTip("Stone", "Splits upon collection of the stone block in the hidden room");
    settings.Add("sleep", false, "Dream");
    settings.SetToolTip("sleep", "Split at load screen leading into Norah's swimming dream");
    settings.Add("load_screen2", true, "Level Transition");
    settings.SetToolTip("load_screen2", "Split at load screen leading into Chapter 3");
    //settings.Add("on_text3", false, "On Text");
    //settings.SetToolTip("on_text3", "Split when the text saying 'Chapter 3: The Vanishing of the Lady Shannon' appears");
    settings.CurrentDefaultParent = null;

    settings.Add("chapter_3", true, "Chapter 3: The Vanishing of the Lady Shannon", "any");
    settings.SetToolTip("chapter_3", "Allow the Autosplitter to split inside Chapter 3");
    settings.CurrentDefaultParent = "chapter_3";
    settings.Add("load_screen3", true, "Level Transition");
    settings.SetToolTip("load_screen3", "Split at load screen leading into Chapter 4");
    //settings.Add("on_text4", false, "On Text");
    //settings.SetToolTip("on_text4", "Split when the text saying 'Chapter 4: Quite a Show' appears");
    settings.CurrentDefaultParent = null;

    settings.Add("chapter_4", true, "Chapter 4: Quite a Show", "any");
    settings.SetToolTip("chapter_4", "Allow the Autosplitter to split inside Chapter 4");
    settings.CurrentDefaultParent = "chapter_4";
    //settings.Add("desert", false, "Desert");
    //settings.SetToolTip("desert", "Split at load screen leading into Norah's desert expedition dream");
    //settings.Add("return", false, "Awaken");
    //settings.SetToolTip("return", "Split at load screen exiting the desert dream");
    settings.Add("load_screen4", true, "Level Transition");
    settings.SetToolTip("load_screen4", "Split at load screen leading into Chapter 5");
    //settings.Add("on_text5", false, "On Text");
    //settings.SetToolTip("on_text5", "Split when the text saying 'Chapter 5: Sunken' appears");
    settings.CurrentDefaultParent = null;

    settings.Add("chapter_5", true, "Chapter 5: Sunken", "any");
    settings.SetToolTip("chapter_5", "Allow the Autosplitter to split inside Chapter 5");
    settings.CurrentDefaultParent = "chapter_5";
    settings.Add("load_screen5", true, "Level Transition");
    settings.SetToolTip("load_screen5", "Split at load screen leading into Chapter 6");
    //settings.Add("on_text6", false, "On Text");
    //settings.SetToolTip("on_text6", "Split when the text saying 'Chapter 6: Fhalgof'n' appears");
    settings.CurrentDefaultParent = null;

    settings.Add("chapter_6", true, "Chapter 6: Fhalgof'n", "any");
    settings.SetToolTip("chapter_6", "Allow the Autosplitter to split inside Chapter 6");
    settings.CurrentDefaultParent = "chapter_6";
    settings.Add("Fate");
    settings.SetToolTip("Fate", "Split at load screen after you choose your fate");
    //settings.Add("End");
    //settings.SetToolTip("End", "Split at credit sequence to end the run");
    settings.CurrentDefaultParent = null;


    settings.Add("IL", false, "ILs");
    settings.SetToolTip("IL", "Enable if you are doing chapter ILs. Starts timer when loading from chapter selection, and splits at the end of the chapter.");
}



init
{
    if(modules.First().ModuleMemorySize == 74301440) {
        version = "GOG 0.2.5.10";
    }
    else if(modules.First().ModuleMemorySize == 83144704) {
        version = "Epic Games 1.5.4.10";
    }
    else if(modules.First().ModuleMemorySize == 82640896) {
        version = "GOG 1.5.15.0";
    }
    else {
        version = "Steam 1.5.3.0";
    }
}

start
{
    if(settings["any"])
    {
        if ((old.GameState == 9 || old.GameState == 0) && current.GameState == 3 && current.levelID == 2) {
            return true;
        }
    } else if(settings["IL"])
    {
        if((old.GameState == 9 || old.GameState == 0) && current.GameState == 3) {
            return true;
        }
    }
    return false;
}

split
{
    if(settings["any"])
    {           //Prologue
        return ((settings["black_screen1"] && old.levelID == 2 && current.levelID == 3)                     ||
                //Chapter 1
                (settings["load_screen1"] && old.levelID == 3 && current.levelID == 4)                      ||
                //Chapter 2
                (settings["Stone"] && current.levelID == 4 && old.GameState == 4 && current.GameState == 3) ||
                (settings["sleep"] && old.levelID == 4 && current.levelID == 5)                             ||
                (settings["load_screen2"] && old.levelID == 5 && current.levelID == 6)                      ||
                //Chapter 3
                (settings["load_screen3"] && old.levelID == 6 && current.levelID == 7)                      ||
                //Chapter 4
                //(settings["desert"] && old.levelID == 7 && current.levelID == 8)                            ||
                //(settings["return"] && old.levelID == 8 && current.levelID == 7)                            ||
                (settings["load_screen4"] && old.levelID == 7 && current.levelID == 9)                      ||
                //Chapter 5
                (settings["load_screen5"] && old.levelID == 9 && current.levelID == 10)                     ||
                //Chapter 6
                (settings["Fate"] && old.levelID == 10 && (current.levelID == 11 || current.levelID == 12))
        );
    } else if(settings["IL"])
    {
         return ((old.levelID == 2 && current.levelID == 3)                     ||
                //Chapter 1
                (old.levelID == 3 && current.levelID == 4)                      ||
                //Chapter 2
                (old.levelID == 5 && current.levelID == 6)                      ||
                //Chapter 3
                (old.levelID == 6 && current.levelID == 7)                      ||
                //Chapter 4
                (old.levelID == 7 && current.levelID == 9)                      ||
                //Chapter 5
                (old.levelID == 9 && current.levelID == 10)                     ||
                //Chapter 6
                (old.levelID == 10 && (current.levelID == 11 || current.levelID == 12))
        );
    }
}

reset
{
    return (current.GameState == 2);
}

isLoading
{
    return (current.GameState == 9 || current.GameState == 0);
}
