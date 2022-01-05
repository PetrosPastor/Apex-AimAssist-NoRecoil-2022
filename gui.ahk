#NoEnv
#SingleInstance force
#MaxThreadsBuffer on
SendMode Input
SetWorkingDir %A_ScriptDir%
DetectHiddenWindows On
SetTitleMatchMode RegEx

RunAsAdmin()

Gosub, IniRead

; global variable
script_version := "version 1.0"

; Convert sens to sider format
sider_sen := sens * 10
sider_vv := volume
sider_bhz := bhz_humanizor * 10
sider_gs := gs_humanizor * 10
sider_aa := aa_humanizor * 10

; GUI

SetFormat, float, 0.1
Gui, Font, S15 CDefault Bold, Verdana
Gui, Add, Text, x90 y-1 w400 h100 , Apex-NoRecoil+Aim Assist
Gui, Font, S7 CDefault Bold, Verdana
Gui, Add, Text, x65 y28 w430 h100 ,by (PetrosPastor(AimAssist+ExtraTools)/MgSweet(Everything else))
Gui, Font, S10 CDefault Bold, Verdana
Gui, Add, Text, x205 y49 w100 h20 , %script_version%
Gui, Font, ,
Gui, Add, GroupBox, x11 y69 w480 h290 , Settings
Gui, Font, S10 Bold, 
Gui, Add, Text, x330 y94 w50 h30 , sens:
Gui, Add, Slider, x380 y89 w100 h30 vsider_sen gSlide range0-50 tickinterval1 AltSubmit, %sider_sen%
Gui, Font, S8 Bold, 
Gui, Add, Text, x142 y98 w80 h30 , voice_vol:
Gui, Add, Slider, x215 y95 w100 h30 vsider_vv gSlidevv range0-100 tickinterval1 AltSubmit, %sider_vv%
Gui, Font, S6 Bold, 
Gui, Add, Text, x155 y180 w120 h30 , bhhumanizor:
Gui, Add, Slider, x220 y175 w100 h30 vsider_bhz gSlidebhz range0-40 tickinterval1 AltSubmit, %sider_bhz%
Gui, Font, S6 Bold, 
Gui, Add, Text, x162 y140 w120 h30 , gshumanizor:
Gui, Add, Slider, x220 y135 w100 h30 vsider_gs gSlidegs range0-40 tickinterval1 AltSubmit, %sider_gs%
Gui, Font, S6 Bold, 
Gui, Add, Text, x148 y220 w120 h30 , aahumanizor:
Gui, Add, Slider, x220 y215 w100 h30 vsider_aa gSlideaa range0-40 tickinterval1 AltSubmit, %sider_aa%
Gui, Font, S8,
Gui, Add, Text, x25 y290 w100 h30 , blind_mode:
Gui, Font, S10, 
if (blind_mode == "Tritanopia") {
    Gui, Add, DropDownList, x100 y284 w110 vblind_mode, off|Protanopia|Deutranopia|Tritanopia||
} else if (blind_mode== "Deutranopia") {
    Gui, Add, DropDownList, x100 y284 w100 vblind_mode, off|Protanopia|Deutranopia||Tritanopia|
} else if (blind_mode == "Protanopia") {
    Gui, Add, DropDownList, x100 y284 w110 vblind_mode, off|Protanopia||Deutranopia|Tritanopia|
} else {
    Gui, Add, DropDownList, x100 y284 w110 vblind_mode, off||Protanopia|Deutranopia|Tritanopia|
} 
if (auto_fire == "1") {
    Gui, Add, CheckBox, x330 y129 w110 h30 vauto_fire Checked, auto_fire
} else {
    Gui, Add, CheckBox, x330 y129 w110 h30 vauto_fire, auto_fire
}
if (enable_voice == "1") {
    Gui, Add, CheckBox, x20 y89 w120 h30 venable_voice Checked, enable_voice    
} else {
    Gui, Add, CheckBox, x20 y89 w120 h30 venable_voice, enable_voice	
}
if (auto_trigger == "1") {
    Gui, Add, CheckBox, x330 y209 w150 h30 vauto_trigger Checked, auto_trigger
} else {
    Gui, Add, CheckBox, x330 y209 w150 h30 vauto_trigger, auto_trigger
}
if (ads_only == "1") {
    Gui, Add, CheckBox, x330 y169 w110 h30 vads_only Checked, ads_only
} else {
    Gui, Add, CheckBox, x330 y169 w110 h30 vads_only, ads_only
}
Gui, Font, S9 Bold, 
if (bloodhZ_aimassist == "1") {
    Gui, Add, CheckBox, x20 y169 w120 h30 vbloodhZ_aimassist Checked, bloodhZ_aimassist
} else {
    Gui, Add, CheckBox, x20 y169 w120 h30 vbloodhZ_aimassist, bloodhZ_aimassist
}
Gui, Font, S7 Bold, 
if (gold_scope_aimassist == "1") {
    Gui, Add, CheckBox, x20 y129 w140 h30 vgold_scope_aimassist Checked, gold_scope_aimassist
} else {
    Gui, Add, CheckBox, x20 y129 w140 h30 vgold_scope_aimassist, gold_scope_aimassist
}
Gui, Font, S9 Bold, 
if (color_aimassist == "1") {
    Gui, Add, CheckBox, x20 y209 w120 h30 vcolor_aimassist Checked, color_aimassist
} else {
    Gui, Add, CheckBox, x20 y209 w120 h30 vcolor_aimassist, color_aimassist
}
if (noADS_aimassist == "1") {
    Gui, Add, CheckBox, x20 y249 w160 h30 vnoADS_aimassist Checked, noADS_aimassist
} else {
    Gui, Add, CheckBox, x20 y249 w160 h30 vnoADS_aimassist, noADS_aimassist
}

Gui, Add, Text, x245 y284 w120 h30 , resolution:
Gui, Font, S10, 
if (resolution == "3840x2160") {
    Gui, Add, DropDownList, x332 y284 vresolution, 1280x720|1366x768|1600x900|1680x1050|1920x1080|2560x1440|3840x2160||
} else if (resolution == "2560x1440") {
    Gui, Add, DropDownList, x332 y284 vresolution, 1280x720|1366x768|1600x900|1680x1050|1920x1080|2560x1440||3840x2160|
} else if (resolution == "1680x1050") {
    Gui, Add, DropDownList, x332 y284 vresolution, 1280x720|1366x768|1600x900||1680x1050||1920x1080|2560x1440|3840x2160|
} else if (resolution == "1600x900") {
    Gui, Add, DropDownList, x332 y284 vresolution, 1280x720|1366x768|1600x900||1680x1050|1920x1080|2560x1440|3840x2160|
} else if (resolution == "1366x768") {
    Gui, Add, DropDownList, x332 y284 vresolution, 1280x720|1366x768||1600x900|1600x900|1920x1080|2560x1440|3840x2160|
} else if (resolution == "1280x720") {
    Gui, Add, DropDownList, x332 y284 vresolution, 1280x720||1366x768|1600x900|1600x900|1920x1080|2560x1440|3840x2160|
} else {
    Gui, Add, DropDownList, x332 y284 vresolution, 1280x720|1366x768|1600x900|1680x1050|1920x1080||2560x1440|3840x2160
} 
Gui, Font, S18 Bold, 
Gui, Add, Button, x155 y315 w190 h40 gbtSave, Save and Run!
Gui, Font, , 
Gui, Add, Link, x158 y358 w200 h18 , <a href="https://github.com/thirdpetros">PetrosPastor/Apex-NoRecoil+AimAssist</a>
Gui, Add, Link, x158 y378 w200 h18 , <a href="https://github.com/mgsweet/Apex-NoRecoil-2021">mgsweet/Apex-NoRecoil-2021</a>
ActiveMonitorInfo(X, Y, Width, Height)
xPos := Width / 2 - 477 / 2
yPos := Height / 2 - 335 / 2

;random window name
s := (s := "0123456789abcdefghijklmnopqrstuvwxyz") . s . s
loop, 16 {
	Random, r, 1, StrLen(s)
	i .= (c := SubStr(s, r, 1))
	StrReplace(s, c, "",, 1)
}

;create form
Gui, Show, x%xPos% y%yPos% h400 w500, % i
Return

;slide event
Slide:
    Gui,Submit,NoHide
    sens := sider_sen/10
    tooltip % sens
    SetTimer, RemoveToolTip, 500
return

;slidevv event
Slidevv:
    Gui,Submit,NoHide
    volume := sider_vv
    tooltip % volume
    SetTimer, RemoveToolTip, 500
return

;slidebhz event
Slidebhz:
    Gui,Submit,NoHide
    bhz_humanizor := sider_bhz/10
    tooltip % bhz_humanizor
    SetTimer, RemoveToolTip, 500
return

;slidegs event
Slidegs:
    Gui,Submit,NoHide
    gs_humanizor := sider_gs/10
    tooltip % gs_humanizor
    SetTimer, RemoveToolTip, 500
return

;slideaa event
Slideaa:
    Gui,Submit,NoHide
    aa_humanizor := sider_aa/10
    tooltip % aa_humanizor
    SetTimer, RemoveToolTip, 500
return

RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return

IniRead:
    IfNotExist, settings.ini
    {
        MsgBox, Couldn't find settings.ini. I'll create one for you.

        IniWrite, "1080x1920"`n, settings.ini, screen settings, resolution
        IniWrite, "5.0", settings.ini, mouse settings, sens
        IniWrite, "1.0", settings.ini, mouse settings, zoom_sens
        IniWrite, "1", settings.ini, mouse settings, auto_fire
        IniWrite, "0", settings.ini, mouse settings, ads_only
        IniWrite, "0"`n, settings.ini, mouse settings, gold_scope_aimassist 	
        IniWrite, "80", settings.ini, voice settings, volume
        IniWrite, "7", settings.ini, voice settings, rate
        IniWrite, "0", settings.ini, mouse settings, color_aimassist
	    IniWrite, "0", settings.ini, mouse settings, bloodhZ_aimassist
	    IniWrite, "0", settings.ini, mouse settings, auto_trigger
        IniWrite, "1", settings.ini, voice settings, enable_voice
	    IniWrite, "Tritanopia", settings.ini, other settings, blind_mode
		IniWrite, "0", settings.ini, mouse settings, noADS_aimassist
		IniWrite, "2", settings.ini, mouse settings, bhz_humanizor
		IniWrite, "2", settings.ini, mouse settings, gs_humanizor
		IniWrite, "2", settings.ini, mouse settings, aa_humanizor
        if (A_ScriptName == "gui.ahk") {
            Run "gui.ahk"
        } else if (A_ScriptName == "gui.exe") {
            Run "gui.exe"
        }
    }
    Else {
        IniRead, resolution, settings.ini, screen settings, resolution
        IniRead, sens, settings.ini, mouse settings, sens
        IniRead, auto_fire, settings.ini, mouse settings, auto_fire
        IniRead, gold_scope_aimassist, settings.ini, mouse settings, gold_scope_aimassist	
        IniRead, ads_only, settings.ini, mouse settings, ads_only
        IniRead, volume, settings.ini, voice settings, volume
        IniRead, rate, settings.ini, voice settings, rate
        IniRead, color_aimassist, settings.ini, mouse settings, color_aimassist
		IniRead, bloodhZ_aimassist, settings.ini, mouse settings, bloodhZ_aimassist
		IniRead, auto_trigger, settings.ini, mouse settings, auto_trigger
		IniRead, enable_voice, settings.ini, voice settings, enable_voice
		IniRead, blind_mode, settings.ini, other settings, blind_mode
		IniRead, volume, settings.ini, voice settings, volume
		IniRead, noADS_aimassist, settings.ini, mouse settings, noADS_aimassist
		IniRead, bhz_humanizor, settings.ini, mouse settings, bhz_humanizor
		IniRead, gs_humanizor, settings.ini, mouse settings, gs_humanizor
		IniRead, aa_humanizor, settings.ini, mouse settings, aa_humanizor
    }
return

btSave:
    Gui, submit
    IniWrite, "%resolution%", settings.ini, screen settings, resolution
    IniWrite, "%sens%", settings.ini, mouse settings, sens
    IniWrite, "%auto_fire%", settings.ini, mouse settings, auto_fire
    IniWrite, "%ads_only%", settings.ini, mouse settings, ads_only
    IniWrite, "%gold_scope_aimassist%", settings.ini, mouse settings, gold_scope_aimassist    
    IniWrite, "%color_aimassist%", settings.ini, mouse settings, color_aimassist
    IniWrite, "%bloodhZ_aimassist%", settings.ini, mouse settings, bloodhZ_aimassist
    IniWrite, "%auto_trigger%", settings.ini, mouse settings, auto_trigger
    IniWrite, "%enable_voice%", settings.ini, voice settings, enable_voice
    IniWrite, "%blind_mode%", settings.ini, other settings, blind_mode
    IniWrite, "%volume%", settings.ini, voice settings, volume
	IniWrite, "%noADS_aimassist%", settings.ini, mouse settings, noADS_aimassist
	IniWrite, "%bhz_humanizor%", settings.ini, mouse settings, bhz_humanizor
	IniWrite, "%gs_humanizor%", settings.ini, mouse settings, gs_humanizor
	IniWrite, "%aa_humanizor%", settings.ini, mouse settings, aa_humanizor
    if (A_ScriptName == "gui.ahk") {
        CloseScript("apexmaster.ahk")
        Run "apexmaster.ahk"
    } else if (A_ScriptName == "gui.exe") {
        CloseScript("apexmaster.exe")
        Run "apexmaster.exe"
    }
ExitApp

CloseScript(Name) {
	DetectHiddenWindows On
	SetTitleMatchMode RegEx
	IfWinExist, i)%Name%.* ahk_class AutoHotkey
		{
		WinClose
		WinWaitClose, i)%Name%.* ahk_class AutoHotkey, , 2
		If ErrorLevel
			return "Unable to close " . Name
		else
			return "Closed " . Name
		}
	else
		return Name . " not found"
	}

ActiveMonitorInfo(ByRef X, ByRef Y, ByRef Width, ByRef Height)
{
    CoordMode, Mouse, Screen
    MouseGetPos, mouseX, mouseY
    SysGet, monCount, MonitorCount
    Loop %monCount% {
        SysGet, curMon, Monitor, %a_index%
        if ( mouseX >= curMonLeft and mouseX <= curMonRight and mouseY >= curMonTop and mouseY <= curMonBottom ) {
            X := curMonTop
            y := curMonLeft
            Height := curMonBottom - curMonTop
            Width := curMonRight - curMonLeft
            return
        }
    }
}

RunAsAdmin()
{
	Global 0
	IfEqual, A_IsAdmin, 1, Return 0
	
	Loop, %0%
		params .= A_Space . %A_Index%
	
	DllCall("shell32\ShellExecute" (A_IsUnicode ? "":"A"),uint,0,str,"RunAs",str,(A_IsCompiled ? A_ScriptFullPath : A_AhkPath),str,(A_IsCompiled ? "": """" . A_ScriptFullPath . """" . A_Space) params,str,A_WorkingDir,int,1)
	ExitApp
}

GuiClose:
ExitApp