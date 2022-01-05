#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
#SingleInstance force
#MaxThreadsBuffer on
#Persistent
Process, Priority, , A
SetBatchLines, -1
ListLines Off
SetWorkingDir %A_ScriptDir%
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input

RunAsAdmin()

; read settings.ini
GoSub, IniRead

global UUID := "a3546c6608644e42ad7d9b98858ac05e"

HideProcess()

; weapon type constant, mainly for debuging
global DEFAULT_WEAPON_TYPE := "DEFAULT"
global R99_WEAPON_TYPE := "R99"
global R301_WEAPON_TYPE := "R301"
global FLATLINE_WEAPON_TYPE := "FLATLINE"
global SPITFIRE_WEAPON_TYPE := "SPITFIRE"
global KRABER_WEAPON_TYPE := "KRABER"
global LSTAR_WEAPON_TYPE := "LSTAR"
global DEVOTION_WEAPON_TYPE := "DEVOTION"
global DEVOTION_TURBO_WEAPON_TYPE := "DEVOTION TURBO"
global VOLT_WEAPON_TYPE := "volt"
global HAVOC_WEAPON_TYPE := "HAVOC"
global HAVOC_TURBO_WEAPON_TYPE := "HAVOC TURBO"
global PROWLER_WEAPON_TYPE := "prowler"
global HEMLOK_WEAPON_TYPE := "HEMLOK"
global RE45_WEAPON_TYPE := "RE45"
global ALTERNATOR_WEAPON_TYPE := "alternator"
global P2020_WEAPON_TYPE := "P2020"
global RAMPAGE_WEAPON_TYPE := "RAMPAGE"
global WINGMAN_WEAPON_TYPE := "wingman"
global G7_WEAPON_TYPE := "G7"
global CAR_WEAPON_TYPE := "car"
global P3030_WEAPON_TYPE := "3030"
global SHOTGUN_WEAPON_TYPE := "shotgun"
global SNIPER_WEAPON_TYPE := "sniper"
global TRIPLETAKE_WEAPON_TYPE := "tripletake"
global BOCEK_WEAPON_TYPE := "bocek"

; x, y pos for weapon1 and weapon 2
global WEAPON_1_PIXELS = LoadPixel("weapon1")
global WEAPON_2_PIXELS = LoadPixel("weapon2")
; weapon color
global LIGHT_WEAPON_COLOR = 0x2D547D
global HEAVY_WEAPON_COLOR = 0x596B38
global ENERGY_WEAPON_COLOR = 0x286E5A
global SUPPY_DROP_COLOR = 0x3701B2
global SHOTGUN_WEAPON_COLOR = 0x07206B
global SNIPER_WEAPON_COLOR = 0x8f404b
global BOCEK_WEAPON_COLOR = 0x2f7c8e

; three x, y check point, true means 0xFFFFFFFF
; light weapon
global R99_PIXELS := LoadPixel("r99")
global R99_GS_PIXELS := LoadPixel("r99_gs")
global R301_PIXELS := LoadPixel("r301")
global RE45_PIXELS := LoadPixel("re45")
global RE45_GS_PIXELS := LoadPixel("re45_gs")
global P2020_PIXELS := LoadPixel("p2020")
global P2020_GS_PIXELS := LoadPixel("p2020_gs")
; heavy weapon
global FLATLINE_PIXELS := LoadPixel("flatline")
global PROWLER_PIXELS := LoadPixel("prowler")
global PROWLER_GS_PIXELS := LoadPixel("prowler_gs")
global HEMLOK_PIXELS := LoadPixel("hemlok")
global RAMPAGE_PIXELS := LoadPixel("rampage")
global WINGMAN_PIXELS := LoadPixel("wingman")
global WINGMAN_GS_PIXELS := LoadPixel("wingman_gs")
global P3030_PIXELS := LoadPixel("p3030")
; special
global CAR_PIXELS := LoadPixel("car")
global CAR_GS_PIXELS := LoadPixel("car_gs")
; energy weapon
global LSTAR_PIXELS := LoadPixel("lstar")
global DEVOTION_PIXELS := LoadPixel("devotion")
global VOLT_PIXELS := LoadPixel("volt")
global VOLT_GS_PIXELS := LoadPixel("volt_gs")
global HAVOC_PIXELS := LoadPixel("havoc")
; supply drop weapon
global G7_PIXELS := LoadPixel("g7")
global SPITFIRE_PIXELS := LoadPixel("spitfire")
global ALTERNATOR_PIXELS := LoadPixel("alternator")
global ALTERNATOR_GS_PIXELS := LoadPixel("alternator_gs")
; Turbocharger
global HAVOC_TURBOCHARGER_PIXELS := LoadPixel("havoc_turbocharger")
global DEVOTION_TURBOCHARGER_PIXELS := LoadPixel("devotion_turbocharger")
;BloodHound
global BloodHound_Ultimate_TL  := LoadPixel("BloodHoundUltimateTL")
global BloodHound_Ultimate_DR  := LoadPixel("BloodHoundUltimateDR")
global LONGBOW_GS_PIXELS := LoadPixel("longbow_goldenscope")
global CHARGERIFLE_GS_PIXELS := LoadPixel("chargerifle_goldenscope")
global SENTINAL_GS_PIXELS := LoadPixel("sentinal_goldenscope")

EMColProta := 0xb85950 
EMColDeute := 0xbda453 ,0xb07c40
; for gold optics
global EMCol := 0x3841AD,0x333DB1,0x51232c
global ColVn := 8
global AntiShakeX := (A_ScreenHeight // 80)
global AntiShakeY := (A_ScreenHeight // 64)
global ZeroX := (A_ScreenWidth // 2)
global ZeroY := (A_ScreenHeight // 2)
global CFovX := (A_ScreenWidth // 32+30)
global CFovY := (A_ScreenHeight // 32+25)
global ScanL := ZeroX - CFovX
global ScanT := ZeroY - CFovY
global ScanR := ZeroX + CFovX
global ScanB := ZeroY + CFovY
global NearAimScanL := ZeroX - AntiShakeX
global NearAimScanT := ZeroY - AntiShakeY
global NearAimScanR := ZeroX + AntiShakeX
global NearAimScanB := ZeroY + AntiShakeY

; for bloodh aimassist
global EMCol2 := 0x3841AD,0x333DB1
global ColVn2 := 8
global AntiShakeX2 := (A_ScreenHeight // 80)
global AntiShakeY2 := (A_ScreenHeight // 64)
global ZeroX2 := (A_ScreenWidth // 2)
global ZeroY2 := (A_ScreenHeight // 2)
global CFovX2 := ((A_ScreenWidth // 32)+250)
global CFovY2 := ((A_ScreenHeight // 32)+200)
global ScanL2 := ZeroX2 - CFovX2
global ScanT2 := ZeroY2 - CFovY2
global ScanR2 := ZeroX2 + CFovX2
global ScanB2 := ZeroY2 + CFovY2
global NearAimScanL2 := ZeroX2 - AntiShakeX2
global NearAimScanT2 := ZeroY2 - AntiShakeY2 
global NearAimScanR2 := ZeroX2 + AntiShakeX2
global NearAimScanB2 := ZeroY2 + AntiShakeY2

;dmgColors := 0xce2edc ,0xce42e0
;EMCol3 := 0x3841AD,0x333DB1,0xab2a21
; for color aim assist
global EMCol3 := 0x3841AD,0x333DB1,0xab2a21
global ColVn3 := 8
global AntiShakeX3 := (A_ScreenHeight // 80)
global AntiShakeY3 := (A_ScreenHeight // 64)
global ZeroX3 := (A_ScreenWidth // 2)
global ZeroY3 := (A_ScreenHeight // 2)
global CFovX3 := (A_ScreenWidth // 32+250)
global CFovY3 := (A_ScreenHeight // 32+180)
global ScanL3 := ZeroX3 - CFovX3
global ScanT3 := ZeroY3 - CFovY3
global ScanR3 := ZeroX3 + CFovX3
global ScanB3 := ZeroY3 + CFovY3
global NearAimScanL3 := ZeroX3 - AntiShakeX3
global NearAimScanT3 := ZeroY3 - AntiShakeY3
global NearAimScanR3 := ZeroX3 + AntiShakeX3
global NearAimScanB3 := ZeroY3 + AntiShakeY3

;bloodhound
global bloodhound_ultimate_time := 31
global is_bloodhound_z := false
global last_bloodhound_ztime :=  0

if(blind_mode  =="Tritanopia")
{
	SUPPY_DROP_COLOR = 0x312e90
}else if(blind_mode  =="Deutranopia")
{
	SUPPY_DROP_COLOR = 0x1920b2
	EMCol := EMColDeute
        EMCol2 := EMColDeute
}else if(blind_mode  =="Protanopia")
{
	SUPPY_DROP_COLOR = 0x714ab2
       EMCol := EMColProta
       EMCol2 := EMColProta
}else if(blind_mode  =="off")
{
	SUPPY_DROP_COLOR = 0x3701B2
}

; each player can hold 2 weapons
LoadPixel(name) {	
    global resolution
    IniRead, weapon_pixel_str, %A_ScriptDir%\resolution\%resolution%.ini, pixels, %name%
    weapon_num_pixels := []
    Loop, Parse, weapon_pixel_str, `,
    {
        if StrLen(A_LoopField) == 0 {
            Continue
        }
        weapon_num_pixels.Insert(A_LoopField)
    }
    return weapon_num_pixels
}

; load pattern from file
LoadPattern(filename) {
    FileRead, pattern_str, %A_ScriptDir%\pattern\%filename%
    pattern := []
    Loop, Parse, pattern_str, `n, `, , `" ,`r 
    {
        if StrLen(A_LoopField) == 0 {
            Continue
        }
        pattern.Insert(A_LoopField)
    }
    return pattern
}
;"
; light weapon pattern
global R301_PATTERN := LoadPattern("R301.txt")
global R99_PATTERN := LoadPattern("R99.txt")
global RE45_PATTERN := LoadPattern("RE45.txt")
global P2020_PATTERN := LoadPattern("P2020.txt")
; energy weapon pattern
global LSTAR_PATTERN := LoadPattern("Lstar.txt")
global DEVOTION_PATTERN := LoadPattern("Devotion.txt")
global TURBODEVOTION_PATTERN := LoadPattern("DevotionTurbo.txt")
global VOLT_PATTERN := LoadPattern("Volt.txt")
global HAVOC_PATTERN := LoadPattern("Havoc.txt")
global TURBOHAVOC_PATTERN := LoadPattern("HavocTurbo.txt")
global P3030_PATTERN := LoadPattern("3030.txt")
; special
global CAR_PATTERN := LoadPattern("CAR.txt")
; heavy weapon pattern
global FLATLINE_PATTERN := LoadPattern("Flatline.txt")
global RAMPAGE_PATTERN := LoadPattern("Rampage.txt")
global RAMPAGEAMP_PATTERN := LoadPattern("RampageAmp.txt")
global PROWLER_PATTERN := LoadPattern("Prowler.txt")
global HEMLOK_PATTERN := LoadPattern("Hemlok.txt")
global WINGMAN_PATTERN := LoadPattern("Wingman.txt")
; supply drop weapon pattern
global SPITFIRE_PATTERN := LoadPattern("Spitfire.txt")
global ALTERNATOR_PATTERN := LoadPattern("Alternator.txt")
global G7_Pattern := LoadPattern("G7.txt")

global currentWeapon := 3

; tips setting
global hint_method := "Say"

; voice setting
SAPI.voice := SAPI.GetVoices().Item(1) 	; uncomment this line to get female voice.
SAPI:=ComObjCreate("SAPI.SpVoice")
SAPI.rate:=rate 
if(enable_voice)
SAPI.volume:=volume
else
SAPI.volume:= 0
%hint_method%("Enabled")

; weapon detection
global current_pattern := ["0,0,0"]
global current_weapon_type := DEFAULT_WEAPON_TYPE
global is_single_fire_weapon := false
global is_gold_scope_weapon := false

; mouse sensitivity setting
zoom := 1.0/zoom_sens
global modifier := 4/sens*zoom

; check whether the current weapon match the weapon pixels
CheckWeapon(weapon_pixels)
{
    target_color := 0xFFFFFF
    i := 1
    loop, 3 {
        PixelGetColor, check_point_color, weapon_pixels[i], weapon_pixels[i + 1]
        if (weapon_pixels[i + 2] != (check_point_color == target_color)) {
            return False
        }
        i := i + 3
    }
    return True
}

CheckWeaponGS(weapon_gs_pixels)
{
    target_color := 0xFFFFFF
   
        PixelGetColor, check_point_color, weapon_gs_pixels[1], weapon_gs_pixels[2]
        if (check_point_color == target_color) {
            return True
			}      
    return False
}

CheckTurbocharger(turbocharger_pixels)
{
    target_color := 0xFFFFFF
    PixelGetColor, check_point_color, turbocharger_pixels[1], turbocharger_pixels[2]
    if (check_point_color == target_color) {
        return true
    }
    return false
}

loop {
if(noADS_aimassist && !GetKeyState("RButton", "P"))
	AimAssist()
}

Global is_in_chat := False

~*Enter::
if(IsMouseShown())
Return
is_in_chat := !is_in_chat
if(is_in_chat)
%hint_method%("Open chat")	
Else
%hint_method%("Close chat")	
return

~*Esc::
if(IsMouseShown())
Return
if(is_in_chat)
%hint_method%("Close chat")
is_in_chat := False
return

~*p::
if(is_in_chat)
	return
%hint_method%("paused")
	Suspend
	Pause

return

#If (A_IsSuspended)
	~*p::		
		Suspend, off	
		Pause, off	
			%hint_method%("unpaused")
	return
#If

Global is_in_inventory := False

~*Tab::
if(is_in_chat)
Return
is_in_inventory :=!is_in_inventory
Sleep 150
if(!is_in_inventory)
	DetectAndSetWeapon()	
return

~*O::
if(is_in_chat)
Return
if(enable_voice)
{
%hint_method%("Disable voice")
SAPI.volume:= 0
Sleep 100
}else
{
SAPI.volume:= volume
%hint_method%("Enable voice")
}
enable_voice := !enable_voice	
return

DetectAndSetWeapon()
{	
    sleep 100
    ; init
    is_single_fire_weapon := false
    is_gold_scope_weapon := false
    current_weapon_type := DEFAULT_WEAPON_TYPE
    ; first check which weapon is activate
    check_point_color := 0
    PixelGetColor, check_weapon1_color, WEAPON_1_PIXELS[1], WEAPON_1_PIXELS[2]
    PixelGetColor, check_weapon2_color, WEAPON_2_PIXELS[1], WEAPON_2_PIXELS[2]
    if (check_weapon1_color == LIGHT_WEAPON_COLOR || check_weapon1_color == HEAVY_WEAPON_COLOR || check_weapon1_color == ENERGY_WEAPON_COLOR 
	|| check_weapon1_color == SUPPY_DROP_COLOR || check_weapon1_color == SHOTGUN_WEAPON_COLOR|| check_weapon1_color == SNIPER_WEAPON_COLOR|| check_weapon1_color == BOCEK_WEAPON_COLOR) {
        check_point_color := check_weapon1_color
		currentWeapon :=1
    } else if (check_weapon2_color == LIGHT_WEAPON_COLOR || check_weapon2_color == HEAVY_WEAPON_COLOR || check_weapon2_color == ENERGY_WEAPON_COLOR 
        || check_weapon2_color == SUPPY_DROP_COLOR || check_weapon2_color == SHOTGUN_WEAPON_COLOR|| check_weapon2_color == SNIPER_WEAPON_COLOR|| check_weapon2_color == BOCEK_WEAPON_COLOR) {		
        check_point_color := check_weapon2_color
		currentWeapon :=2
    } else {
        return
    }	
    ; then check the weapon type
    if (check_point_color == LIGHT_WEAPON_COLOR) {
        if (CheckWeapon(R301_PIXELS)) {
            current_weapon_type := R301_WEAPON_TYPE
            current_pattern := R301_PATTERN
        } else if (CheckWeapon(R99_PIXELS)) {
            current_weapon_type := R99_WEAPON_TYPE
            current_pattern := R99_PATTERN
			if(CheckWeaponGS(R99_GS_PIXELS))			
			is_gold_scope_weapon := true			
        } else if (CheckWeapon(RE45_PIXELS)) {
            current_weapon_type := RE45_WEAPON_TYPE
            current_pattern := RE45_PATTERN
			if(CheckWeaponGS(RE45_GS_PIXELS))
			is_gold_scope_weapon := true
        } else if (CheckWeapon(P2020_PIXELS)) {
            current_weapon_type := P2020_WEAPON_TYPE
            current_pattern := P2020_PATTERN
            is_single_fire_weapon := true
			if(CheckWeaponGS(P2020_GS_PIXELS))
	        is_gold_scope_weapon := true
        } else if (CheckWeapon(CAR_PIXELS)) { 
            current_weapon_type := CAR_WEAPON_TYPE 
            current_pattern := CAR_PATTERN 
			if(CheckWeaponGS(CAR_GS_PIXELS))
            is_gold_scope_weapon := true
        }
    } else if (check_point_color == HEAVY_WEAPON_COLOR) {
        if (CheckWeapon(FLATLINE_PIXELS)) {
            current_weapon_type := FLATLINE_WEAPON_TYPE
            current_pattern := FLATLINE_PATTERN
        } else if (CheckWeapon(PROWLER_PIXELS)) {
            current_weapon_type := PROWLER_WEAPON_TYPE
            current_pattern := PROWLER_PATTERN
            is_single_fire_weapon := true
			if(CheckWeaponGS(PROWLER_GS_PIXELS))
			is_gold_scope_weapon := true
        } else if (CheckWeapon(HEMLOK_PIXELS)) {
            current_weapon_type := HEMLOK_WEAPON_TYPE
            current_pattern := HEMLOK_PATTERN
            is_single_fire_weapon := true
        } else if (CheckWeapon(RAMPAGE_PIXELS)) {
			current_weapon_type := RAMPAGE_WEAPON_TYPE
			current_pattern := RAMPAGE_PATTERN
        } else if (CheckWeapon(WINGMAN_PIXELS)) {
            current_weapon_type := WINGMAN_WEAPON_TYPE
            current_pattern := WINGMAN_PATTERN
            is_single_fire_weapon := true
			if(CheckWeaponGS(WINGMAN_GS_PIXELS))
            is_gold_scope_weapon := true
        } else if (CheckWeapon(CAR_PIXELS)) { 
            current_weapon_type := CAR_WEAPON_TYPE 
            current_pattern := CAR_PATTERN 
			if(CheckWeaponGS(CAR_GS_PIXELS))
            is_gold_scope_weapon := true
        } else if (CheckWeapon(P3030_PIXELS)) {
            current_weapon_type := P3030_WEAPON_TYPE 
            current_pattern := P3030_PATTERN
            is_single_fire_weapon := true
        }
    } else if (check_point_color == ENERGY_WEAPON_COLOR) {
        if (CheckWeapon(LSTAR_PIXELS)) {
            current_weapon_type := LSTAR_WEAPON_TYPE
            current_pattern := LSTAR_PATTERN
        } else if (CheckWeapon(DEVOTION_PIXELS)) {
            current_weapon_type := DEVOTION_WEAPON_TYPE
            current_pattern := DEVOTION_PATTERN
        if (CheckTurbocharger(DEVOTION_TURBOCHARGER_PIXELS)) {
            current_pattern := TURBODEVOTION_PATTERN
            current_weapon_type := DEVOTION_TURBO_WEAPON_TYPE
            }
        } else if (CheckWeapon(VOLT_PIXELS)) {
            current_weapon_type := VOLT_WEAPON_TYPE
            current_pattern := VOLT_PATTERN
			if(CheckWeaponGS(VOLT_GS_PIXELS))
            is_gold_scope_weapon := true
        } else if (CheckWeapon(HAVOC_PIXELS)) {
            current_weapon_type := HAVOC_WEAPON_TYPE
            current_pattern := HAVOC_PATTERN
            if (CheckTurbocharger(HAVOC_TURBOCHARGER_PIXELS)) {
            current_pattern := TURBOHAVOC_PATTERN
            current_weapon_type := HAVOC_TURBO_WEAPON_TYPE
            }
        }else
		{		
			current_weapon_type := TRIPLETAKE_WEAPON_TYPE
            is_single_fire_weapon :=true
		}
    } else if (check_point_color == SUPPY_DROP_COLOR) {		
        if (CheckWeapon(SPITFIRE_PIXELS)) {
            current_weapon_type := SPITFIRE_WEAPON_TYPE
            current_pattern := SPITFIRE_PATTERN
        } else if (CheckWeapon(ALTERNATOR_PIXELS)) {
            current_weapon_type := ALTERNATOR_WEAPON_TYPE			
            current_pattern := ALTERNATOR_PATTERN
			if(CheckWeaponGS(ALTERNATOR_GS_PIXELS))
			is_gold_scope_weapon := true
        } else if (CheckWeapon(G7_PIXELS)) {
            current_weapon_type := G7_WEAPON_TYPE
            current_pattern := G7_Pattern
            is_single_fire_weapon := true
        } else{
			current_weapon_type := KRABER_WEAPON_TYPE
			is_single_fire_weapon := true
			AntiShakeX := (A_ScreenHeight // 80)
			AntiShakeY := (A_ScreenHeight // 64)
			ZeroX := (A_ScreenWidth // 2)
			ZeroY := (A_ScreenHeight // 2)
			CFovX := (A_ScreenWidth // 32+350)
			CFovY := (A_ScreenHeight // 32+200)
			ScanL := ZeroX - CFovX
			ScanT := ZeroY - CFovY
			ScanR := ZeroX + CFovX
			ScanB := ZeroY + CFovY
			NearAimScanL := ZeroX - AntiShakeX
			NearAimScanT := ZeroY - AntiShakeY
			NearAimScanR := ZeroX + AntiShakeX
			NearAimScanB := ZeroY + AntiShakeY
			gs_tempHumanizer :=gs_humanizor
			gs_humanizor:= 1.5
		}
    } else if (check_point_color == SHOTGUN_WEAPON_COLOR) {
        current_weapon_type := SHOTGUN_WEAPON_TYPE
		is_single_fire_weapon :=true
		if(CheckWeaponGS(P2020_GS_PIXELS))
        is_gold_scope_weapon := true
    }else if (check_point_color == SNIPER_WEAPON_COLOR) {
		is_single_fire_weapon :=true
        current_weapon_type := SNIPER_WEAPON_TYPE        
		AntiShakeX := (A_ScreenHeight // 80)
		AntiShakeY := (A_ScreenHeight // 64)
		ZeroX := (A_ScreenWidth // 2)
		ZeroY := (A_ScreenHeight // 2)
		CFovX := (A_ScreenWidth // 32+300)
		CFovY := (A_ScreenHeight // 32+200)
		ScanL := ZeroX - CFovX
		ScanT := ZeroY - CFovY
		ScanR := ZeroX + CFovX
		ScanB := ZeroY + CFovY
		NearAimScanL := ZeroX - AntiShakeX
		NearAimScanT := ZeroY - AntiShakeY
		NearAimScanR := ZeroX + AntiShakeX
		NearAimScanB := ZeroY + AntiShakeY
		gs_tempHumanizer :=gs_humanizor
		gs_humanizor:= 1.5
		if(CheckWeaponGS(SENTINAL_GS_PIXELS)||CheckWeaponGS(LONGBOW_GS_PIXELS)||CheckWeaponGS(CHARGERIFLE_GS_PIXELS))
		{
			is_gold_scope_weapon := true
		}
    }else if (check_point_color == BOCEK_WEAPON_COLOR) {
        current_weapon_type := BOCEK_WEAPON_TYPE
		is_single_fire_weapon :=true		
    }
	if (check_point_color != SNIPER_WEAPON_COLOR && is_gold_scope_weapon &&current_weapon_type != KRABER_WEAPON_TYPE) {
		AntiShakeY := (A_ScreenHeight // 64)
		ZeroX := (A_ScreenWidth // 2)
		ZeroY := (A_ScreenHeight // 2)
		CFovX := (A_ScreenWidth // 32+30)
		CFovY := (A_ScreenHeight // 32+25)
		ScanL := ZeroX - CFovX
		ScanT := ZeroY - CFovY
		ScanR := ZeroX + CFovX
		ScanB := ZeroY + CFovY
		NearAimScanL := ZeroX - AntiShakeX
		NearAimScanT := ZeroY - AntiShakeY
		NearAimScanR := ZeroX + AntiShakeX
		NearAimScanB := ZeroY + AntiShakeY	
		gs_humanizor := gs_tempHumanizer			
	}
     
	 if(is_gold_scope_weapon&&gold_scope_aimassist)
		{
		adjustment := "GoldenScope"
		gun_name := current_weapon_type adjustment 
	   %hint_method%(gun_name)
	  }
	  else
	  {
	  %hint_method%(current_weapon_type)
	  }
	  
}

~E Up::
    Sleep, 200
    DetectAndSetWeapon()	
return

~*J Up::
if(IsMouseShown()||is_in_chat||!bloodhZ_aimassist)
Return
is_bloodhound_z := !is_bloodhound_z	
if(is_bloodhound_z)
{
last_bloodhound_ztime := A_TickCount
%hint_method%("Ultimate activated")
}else
{
%hint_method%("Ultimate gone")
}
return

~*1::	
~*2::
~B::
~R::
    DetectAndSetWeapon()
return

~*3::
    current_weapon_type := DEFAULT_WEAPON_TYPE
	is_single_fire_weapon :=true
	currentWeapon :=3
return

; For user using ads_only, they don't have to reset the current_weapon_type. 
; This is meaningful to me since I sometimes will shot after throwing a grenade.
~G::
~*Z::
	is_single_fire_weapon :=False
    if (!ads_only) {
        current_weapon_type := DEFAULT_WEAPON_TYPE
    }    
if(bloodhZ_aimassist&&!is_in_chat&&!IsMouseShown())
{
	if(!is_bloodhound_z)
	{	

	PixelSearch, Px, Py, BloodHound_Ultimate_TL[1]  , BloodHound_Ultimate_TL[2]  , BloodHound_Ultimate_DR[1]  , BloodHound_Ultimate_DR[2], 0xFFFFFF, 4, Fast
		if ErrorLevel
    			%hint_method%("Ultimate is not ready")
		else
			{
			is_bloodhound_z := true	
			last_bloodhound_ztime := A_TickCount
    			%hint_method%("Ultimate activated")	
			}
		
	}
}
return

~End::
%hint_method%("Closed")
Sleep 100
    ExitApp
return

AimAssist()
{
if(bloodhZ_aimassist&&is_bloodhound_z)
{
	if((A_TickCount - last_bloodhound_ztime)>30000)
	{
		is_bloodhound_z := false
		%hint_method%("Ultimate Gooone")		
	}	
}
if (!IsMouseShown()&&color_aimassist&&EMCol3 != 0x000000)
       {	
    Loop, {
     PixelSearch, AimPixelX3, AimPixelY3, NearAimScanL3, NearAimScanT3, NearAimScanR3, NearAimScanB3, EMCol3, ColVn3, Fast
        ; If the collimator is already in the corresponding color attachment, do not move to avoid shaking
        if (ErrorLevel) {
            loop, 10 {
                PixelSearch, AimPixelX3, AimPixelY3, ScanL3, ScanT3, ScanR3, ScanB3, EMCol3, ColVn3, Fast
                AimX3 := AimPixelX3 - ZeroX3
                AimY3 := AimPixelY3 - ZeroY3
                DirX3 := -1
                DirY3 := -1
                If ( AimX3 > 0 ) {
                    DirX3 := 1
                }
                If ( AimY3 > 0 ) {
                    DirY3 := 1
                }
                AimOffsetX3 := AimX3 * DirX3
                AimOffsetY3 := AimY3 * DirY3
                MoveX3 := Floor(( AimOffsetX3 ** ( 1 / 2 ))) * DirX3
                MoveY3 := Floor(( AimOffsetY3 ** ( 1 / 2 ))) * DirY3
                DllCall("mouse_event", uint, 1, int, MoveX3 * aa_humanizor, int, MoveY3, uint, 0, int, 0)				
                if (!GetKeyState("RButton","P")) {
                    break
                }
            }			
        }
		else
		{
		if(auto_trigger)
				Click , Left
		}
        if (!GetKeyState("RButton","P")) {
            break
        }
		
    }	
	return
}
if (!IsMouseShown()&&bloodhZ_aimassist &&is_bloodhound_z)
       {
    Loop, {
		
        PixelSearch, AimPixelX2, AimPixelY2, NearAimScanL2, NearAimScanT2, NearAimScanR2, NearAimScanB2, EMCol2, ColVn2, Fast
        ; If the collimator is already in the corresponding color attachment, do not move to avoid shaking
        if (ErrorLevel) {
            loop, 10 {
                PixelSearch, AimPixelX2, AimPixelY2, ScanL2, ScanT2, ScanR2, ScanB2, EMCol2, ColVn2, Fast
                AimX2 := AimPixelX2 - ZeroX2
                AimY2 := AimPixelY2 - ZeroY2
                DirX2 := -1
                DirY2 := -1
                If ( AimX2 > 0 ) {
                    DirX2 := 1
                }
                If ( AimY2 > 0 ) {
                    DirY2 := 1
                }
                AimOffsetX2 := AimX2 * DirX2
                AimOffsetY2 := AimY2 * DirY2
                MoveX2 := Floor(( AimOffsetX2 ** ( 1 / 2 ))) * DirX2
                MoveY2 := Floor(( AimOffsetY2 ** ( 1 / 2 ))) * DirY2		
                DllCall("mouse_event", uint, 1, int, MoveX2 * bhz_humanizor, int, MoveY2, uint, 0, int, 0)				
                if (!GetKeyState("RButton","P")) {
                    break
                }
            }					
        }
		else
		{
		if(auto_trigger)
		    Click , Left
		}
        if (!GetKeyState("RButton","P")) {
            break
        }
    }	
	return
}
 if (!IsMouseShown() && gold_scope_aimassist && is_gold_scope_weapon)
        {
    Loop, {
        PixelSearch, AimPixelX, AimPixelY, NearAimScanL, NearAimScanT, NearAimScanR, NearAimScanB, EMCol, ColVn, Fast
        ; If the collimator is already in the corresponding color attachment, do not move to avoid shaking
        if (ErrorLevel) {
            loop, 10 {
                PixelSearch, AimPixelX, AimPixelY, ScanL, ScanT, ScanR, ScanB, EMCol, ColVn, Fast
                AimX := AimPixelX - ZeroX
                AimY := AimPixelY - ZeroY
                DirX := -1
                DirY := -1
                If ( AimX > 0 ) {
                    DirX := 1
                }
                If ( AimY > 0 ) {
                    DirY := 1
                }
                AimOffsetX := AimX * DirX
                AimOffsetY := AimY * DirY
                MoveX := Floor(( AimOffsetX ** ( 1 / 2 ))) * DirX
                MoveY := Floor(( AimOffsetY ** ( 1 / 2 ))) * DirY
                DllCall("mouse_event", uint, 1, int, MoveX * gs_humanizor, int, MoveY, uint, 0, int, 0)		
                if (!GetKeyState("RButton","P")) {
                    break
                }
            }					
        }
		else
		{
		if(auto_trigger)
		    Click , Left
		}
        if (!GetKeyState("RButton","P")) {
            break
        }
    }	
}
}

~$*RButton:: 
	AimAssist()
return

AutoCycleWeaponChecker()
{
Sleep 200
	check_point_color := 0
    PixelGetColor, check_weapon1_color, WEAPON_1_PIXELS[1], WEAPON_1_PIXELS[2]
    PixelGetColor, check_weapon2_color, WEAPON_2_PIXELS[1], WEAPON_2_PIXELS[2]
    if (check_weapon1_color == LIGHT_WEAPON_COLOR || check_weapon1_color == HEAVY_WEAPON_COLOR 
        || check_weapon1_color == ENERGY_WEAPON_COLOR || check_weapon1_color == SUPPY_DROP_COLOR || check_weapon1_color == SHOTGUN_WEAPON_COLOR|| check_weapon1_color == SNIPER_WEAPON_COLOR) {
        check_point_color := check_weapon1_color
		if(currentWeapon==2)
		DetectAndSetWeapon()
    } else if (check_weapon2_color == LIGHT_WEAPON_COLOR || check_weapon2_color == HEAVY_WEAPON_COLOR || check_weapon2_color == ENERGY_WEAPON_COLOR 
        || check_weapon2_color == SUPPY_DROP_COLOR || check_weapon2_color == SHOTGUN_WEAPON_COLOR|| check_weapon2_color == SNIPER_WEAPON_COLOR) {		
        check_point_color := check_weapon2_color
		if(currentWeapon==1)
		DetectAndSetWeapon()
    } else {
        currentWeapon := 3
    }	
}

~$*LButton::
    if (IsMouseShown() || current_weapon_type == DEFAULT_WEAPON_TYPE || current_weapon_type == SHOTGUN_WEAPON_TYPE)
        return
	AutoCycleWeaponChecker()
    if (ads_only && !GetKeyState("RButton"))
        return

    if (is_single_fire_weapon && !auto_fire)
        return

    Loop {
        i := A_Index
        if (A_Index > current_pattern.MaxIndex()) {
            i := current_pattern.MaxIndex()
        }

        compensation := StrSplit(current_pattern[i],",")
        if (compensation.MaxIndex() < 3) {
            return
        }
        x := compensation[1]
        y := compensation[2]
        interval := compensation[3]
        
        if (is_single_fire_weapon) {
            Click
            Random, rand, 1, 20
            interval := interval + rand
        }

        DllCall("mouse_event", uint, 0x01, uint, Round(x * modifier), uint, Round(y * modifier))
        Sleep, interval
        
        if (!GetKeyState("LButton","P")) {
            DllCall("mouse_event", uint, 4, int, 0, int, 0, uint, 0, int, 0)
            break
        }
    }
return

IniRead:
global gold_scope_aimassist := "0" 
global bloodhZ_aimassist := "0" 
global color_aimassist := "0" 
global auto_trigger := "0" 
global enable_voice := "0" 
global bhz_humanizor := "2"
global gs_humanizor := "2"
global aa_humanizor := "2"
Global gs_tempHumanizer := gs_humanizor
    IfNotExist, settings.ini
    {
        MsgBox, Couldn't find settings.ini. I'll create one for you.

        IniWrite, "1080x1920"`n, settings.ini, screen settings, resolution
        IniWrite, "5.0", settings.ini, mouse settings, sens
        IniWrite, "1.0", settings.ini, mouse settings, zoom_sens
        IniWrite, "1", settings.ini, mouse settings, auto_fire
        IniWrite, "0", settings.ini, mouse settings, ads_only	
        IniWrite, "0", settings.ini, mouse settings, gold_scope_aimassist
        IniWrite, "80", settings.ini, voice settings, volume
        IniWrite, "7", settings.ini, voice settings, rate
        IniWrite, "1", settings.ini, mouse settings, color_aimassist
		IniWrite, "1", settings.ini, mouse settings, bloodhZ_aimassist
		IniWrite, "1", settings.ini, mouse settings, auto_trigger
		IniWrite, "1", settings.ini, voice settings, enable_voice
		IniWrite, "Tritanopia", settings.ini, other settings, blind_mode	
		IniWrite, "0", settings.ini, mouse settings, noADS_aimassist
		IniWrite, "2", settings.ini, mouse settings, bhz_humanizor
		IniWrite, "2", settings.ini, mouse settings, gs_humanizor
		IniWrite, "2", settings.ini, mouse settings, aa_humanizor
        if (A_ScriptName == "apexmaster.ahk") {
            Run "apexmaster.ahk"
        } else if (A_ScriptName == "apexmaster.exe") {
            Run "apexmaster.exe"
        }
    }
    Else {
        IniRead, resolution, settings.ini, screen settings, resolution
        IniRead, zoom_sens, settings.ini, mouse settings, zoom_sens
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
		IniRead, noADS_aimassist, settings.ini, mouse settings, noADS_aimassist	
		IniRead, bhz_humanizor, settings.ini, mouse settings, bhz_humanizor	
		IniRead, gs_humanizor, settings.ini, mouse settings, gs_humanizor	
		IniRead, aa_humanizor, settings.ini, mouse settings, aa_humanizor	
    }
return

; Suspends the script when mouse is visible ie: inventory, menu, map.
IsMouseShown()
{
    StructSize := A_PtrSize + 16
    VarSetCapacity(InfoStruct, StructSize)
    NumPut(StructSize, InfoStruct)
    DllCall("GetCursorInfo", UInt, &InfoStruct)
    Result := NumGet(InfoStruct, 8)
    
    if Result > 1
        return true
    else
        Return false
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


Say(text)
{	
    global SAPI	
    SAPI.Speak(text, 1)	
    sleep 150	
    return
}

Tooltip(Text)
{
    ActiveMonitorInfo(X, Y, Width, Height)
    xPos := Width / 2 - 50
    yPos := Height / 2 + (Height / 10)
    Tooltip, %Text%, xPos, yPos
    SetTimer, RemoveTooltip, 500
    return
    RemoveTooltip:
        SetTimer, RemoveTooltip, Off
        Tooltip
    return
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

HideProcess() {
    if ((A_Is64bitOS=1) && (A_PtrSize!=4))
        hMod := DllCall("LoadLibrary", Str, "hyde64.dll", Ptr)
    else if ((A_Is32bitOS=1) && (A_PtrSize=4))
        hMod := DllCall("LoadLibrary", Str, "hyde.dll", Ptr)
    Else
    {
        MsgBox, Mixed Versions detected!`nOS Version and AHK Version need to be the same (x86 & AHK32 or x64 & AHK64).`n`nScript will now terminate!
        ExitApp
    }

    if (hMod)
    {
        hHook := DllCall("SetWindowsHookEx", Int, 5, Ptr, DllCall("GetProcAddress", Ptr, hMod, AStr, "CBProc", ptr), Ptr, hMod, Ptr, 0, Ptr)
        if (!hHook)
        {
            MsgBox, SetWindowsHookEx failed!`nScript will now terminate!
            ExitApp
        }
    }
    else
    {
        MsgBox, LoadLibrary failed!`nScript will now terminate!
        ExitApp
    }

    MsgBox, % "Process ('" . A_ScriptName . "') hidden! `nYour uuid is " UUID	
    return
}

ExitSub:
	if (hHook)
	{
		DllCall("UnhookWindowsHookEx", Ptr, hHook)
		MsgBox, % "Process unhooked!"
	}
	if (hMod)
	{
		DllCall("FreeLibrary", Ptr, hMod)
		MsgBox, % "Library unloaded"
	}
ExitApp