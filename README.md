# Apex-AimAssist-NoRecoil-2022
(This project is based on another project from github.com/mgsweet)

An AutoHotKey script minimize recoil with auto weapon detection for Apex Legends and new golden scope and blood hound ultimate aim assist.

Apex no-recoil + AimAssist by 
(PetrosPastor(AimAssist+ExtraTools)/MgSweet(Everything else)
Version 1.0
(still in development)

![alt text](https://github.com/PetrosPastor/Apex-AimAssist-NoRecoil-2022/blob/main/ScreenShot/Screenshot1.jpg?raw=true)

sens: (Mouse Sensitivity): This should be the same as your in-game mouse Sensitivity

enable_voice: A robotic voice line tells you the equipped weapon name and etc. (Mainly for debugging)

voice_vol: The volume of voice line

auto_fire: If you check this ,it shoots single fire guns rapidly just by holding left_mouse

ads_only: If you use Hold ADS in game DONT check this ,but if you use Toggle ADS check this

gold_scope_aimassist: Allow aim assist on all the guns which have a gold scope (through aim down sight on gold scope)

auto_trigger: If it sees the target (through gold scope or bloodhound ultimate) it automatically shoots the gun

bloodhZ_aimassist: BloodHound ultimate turn enemies red so you have 30 second aim assist after activating his 
ultimate
(Press J for toggling this feature manually if it doesnt active by pressing Z (Voice line tells you if it activated))

color_aimassist: A feature that enables auto-aiming on a specific color (range of colors) (in development-dont use for now)

noADS_aimassist: check this to enable aim assist out of ADS (aim assist without right click)

gs_humanizer: This will smooth the golden scope aim assist.(bigger number cause faster aim (less smoothing but more shaking))-
work best on 1.5

bhz_humanizer: This will smooth the blood hound ultimate aim assist.(bigger number cause faster aim (less smoothing but more shaking))-
work best on 1.5

aa_humanizer: This will smooth the color aim assist.(bigger number cause faster aim (less smoothing but more shaking))-
work best on 1.5

blind_mode: if you use a blind mode set it here,If you use "off" blind mode it gonna drag your mouse into the 
damage numbers. So if you use aim assist dont put blind mode on "off" or just hide damage numbers in game setting or can
just play on "Tritanopia". the other two blind modes turn enemy blue but tritanopia turn enemy red.
(MgSweet original no recoil has bug that if you play on a blind mode other than "off" the "Supply Guns no recoil feature"
stops working.So I fixed this bug in my code and now you can have weapon detection on all blind modes.

resolution: Choose your screen/game resolution here. Remember to set you desktop resoltion to the resolution of the game
and put resolution scale on 100%

uuid_generator: Execute this at it will generate and replace a unique UI id for you. (do it once)

Shortcut keys:
P: pause/Unpause the script
O: Enable/Disable voice
End: Close the script
J: Enable Blood Hound ultimate manualy (if auto detect messed up)

known bugs:
#1 It doesnt recognize weapon switching after (Weapon Auto_Cycle on empty in game)
(I mean if you enable Weapon Auto_Cycle on empty and you empty the gun then the game will switch the gun itself and the no-recoil script doesnt 
recognize that the switching happend)
(Made a code for this but this is buggy for now)

#2 If you equip throwables by double clicking on them in backpack it doesn't recognize switching from gun to throwable
and (if you have auto_fire on) the throwable will automatically throw itself by clicking left mouse button (U cant hold it)

Resolution reminder:
You need to fix pixel coordination for these resolutions yourself
Fix gs(golden scope pixels)-BloodhoundTL/DR pixels-Sniper golden scope pixels
Pick a white 0xFFFFFF pixel and replace its x,y coordination with pixels in the file
bug: 1600x900 golden scope icons may not have a white 0xFFFFFF pixel - I'll fix it later
1600x900
2560x1440
3840x2160






