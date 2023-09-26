#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;function to close menus
BigClose()
{
MouseMove, 1870, 96
sleep, 1000
click
Sleep, 1500
return
}

;function to close the map screens as they aren't focused and the above function does not work
MapClose()
{
ControlFocus,, ahk_exe Firestone.exe
MouseMove, 1870, 706
sleep, 1000
click
sleep, 1500
return
}

;function to get the campaign coins and tokens
ClaimCampaign(){
ControlFocus,, ahk_exe Firestone.exe
;similar command like this will be used at the beginning of each function to open the map/ screen for the action to be made
GoMap()
MouseMove, 1857, 606
sleep, 1000
click
sleep, 1500
MouseMove, 165, 977
sleep, 1000
click
sleep, 1500
BigClose()
return
}

GoMap()
{ControlFocus,, ahk_exe Firestone.exe
 MainMenu()
MouseMove, 1863, 353
Sleep, 1000
click
sleep, 1500
}

;function to redeem the missions
MapRedeem(){
ControlFocus,, ahk_exe Firestone.exe
MouseMove, 94, 325
sleep, 1000
click
sleep, 1500
; opens map and tries to claim first mission, if the mission reward page will not be shown it will end
ImageSearch, X,Y,686,319,1234,628, General\reward.png
If( ErrorLevel = 1)
{
sleep, 1500
MapClose()
; it will go to missions stars if you have idle troops
ImageSearch,X,Y,430,965,1245,1045, General\missions2.png
if(ErrorLevel=0)
 MapStart()
return
}
 if(ErrorLevel=0)
{
sleep, 1000
MouseMove, 987, 469
Sleep, 1500
Click
sleep, 1000
MapRedeem()
return
}
return
}

;function to start the map missions, should be all nodes + the gift missions for the world domination mini-event
MapStart(){
Point := {1207:32,1290:99,1177:35,1104:43,883:460,616:204,581:295,672:423,884:233,828:375,923:369,1017:426,867:543,1228:550,655:357,712:517,1314:306,1340:545,1424:777,1438:871,1357:429,1452:498,1364:646,1162:454,980:228,1442:418,1066:970,633:576,502:330,538:190,733:229,1130:546,1041:518,812:637,874:664,705:592,460:670,1297:193,1394:355,1252:392,1486:770,910:759,1224:463,720:675,1255:853,1224:312,929:609,1481:261,463:433,1145:626,1326:798,556:500,1044:676,1099:894,780:845,1276:694,970:810,849:794,919:942,797:504,484:920,1460:580,671:755,547:1041,1055:780,1435:683,384:1009,1150:340,1221:467,742:389,967:547}
ControlFocus,, ahk_exe Firestone.exe
For x,y in Point
{
 Click %x%, %y%
Sleep, 1500
 Click 963, 958
Sleep, 1500
 MapClose()
Sleep, 1500
 ImageSearch,X,Y,430,965,1245,1045, General\missions2.png
If(ErrorLevel=1)
{
sleep, 1500
BigClose()
return
}
 }
BigClose()
return
}

;expeditions function
Expedition(){
ControlFocus,, ahk_exe Firestone.exe
MainMenu()
MouseMove, 1857, 481
sleep, 1000
click
sleep, 1500
MouseMove, 308, 406
sleep, 1000
click
sleep, 1500
MouseMove, 1321, 331
sleep, 1000
click
sleep, 1500
click
sleep, 1500
BigClose()
BigClose()
return
}


;alchemist start, needs a bit of tinkering for the fail(gems) part, does blood and dust alchemy
Alchemist(){
ControlFocus,, ahk_exe Firestone.exe
MainMenu()
MouseMove, 1869, 203
Sleep, 1000
click
Sleep, 1500
MouseMove, 511, 837
Sleep, 1000
click
Sleep, 1500
MouseMove, 949, 777
Sleep, 1000
click
sleep, 1500
;checks if the alchemy was started or the spend gems screens appears
ImageSearch,X,Y,10,10,1845,1045, General\gems.png
 if (ErrorLevel = 0)
{
BigClose()
BigClose()
BigClose()
return
}
MouseMove, 1282, 777
Sleep, 1000
click
sleep, 1500
MouseMove, 949, 777
Sleep, 1000
click
sleep, 1500
MouseMove, 1282, 777
Sleep, 1000
click
sleep, 1500
BigClose()
BigClose()
return
}

;opens the firestone tree
GoFirestone()
{ControlFocus,, ahk_exe Firestone.exe
MainMenu()
MouseMove, 1869, 203
Sleep, 1000
click
Sleep, 1500
MouseMove, 329, 657
Sleep, 1000
click
sleep, 1500
MouseMove, 1809, 975
Sleep, 1000
click
Sleep, 1500
MouseMove, 1522,892
return
}

;the firestone function, a bit complicated to explain
FirestoneTest()
{
 MouseMove, 567, 958
Sleep, 1000
click
Sleep, 1500
;clicks to see if there is running missions or it can start
ImageSearch,X,Y, 524,223,1394,384, General\gems.png
If(ErrorLevel=0)
{
MainMenu()
return
}
MouseMove, 567, 958
Sleep, 1000
click
Sleep, 1500
; tries to find first node available, if none is found it will scroll the tree and restart the function
PixelSearch,X,Y, 205, 208, 1887, 850, 0x0D49DE, 3, Fast RGB
if(ErrorLevel=1)
{loop, 35
 {
Send {WheelDown}
Sleep, 200
}
FirestoneTest()
return
}
if(ErrorLevel=0)
{
Sleep, 1000
MouseMove, X, Y
Click
Sleep, 1500
MouseMove, 812, 775
Sleep, 1000
Click
Sleep, 1500
; after it starts the first node, it goes searching for the nodes in the following collumns
PixelSearch,W,Z,X+400,Y,1887,850, 0x0D49DE, 3, Fast RGB
if(ErrorLevel=0)
{
Sleep, 1000
MouseMove, W, Z
Click
Sleep, 1500
MouseMove, 812, 775
Sleep, 1000
Click
Sleep, 1500
BigClose()
BigClose()
return
}
if(ErrorLevel=1)
{
 ; searches for another node on the current commun
 PixelSearch,W,Z,X,Y+130,1887,850, 0x0D49DE, 3, Fast RGB
 if(ErrorLevel=0)
 {
  Sleep, 1000
MouseMove, W, Z
Click
Sleep, 1500
MouseMove, 812, 775
Sleep, 1000
Click
Sleep, 1500
BigClose()
BigClose()
return
}
if(ErrorLevel=1)
{
 ; if no nodes are found it check if the reest of the nodes are locked, otherwise it just scrolls on the tree
 PixelSearch,W,Z,205, 208, 1887, 850, 0x919CB2, 3, Fast RGB
 if(ErrorLevel=0)
 {
  BigClose()
  BigClose()
  return
 }
 if(ErrorLevel=1)
 {
  loop, 35
 {
Send {WheelDown}
Sleep, 200
}
PixelSearch,X,Y, 205, 208, 1887, 850, 0x0D49DE, 3, Fast RGB
if(ErrorLevel=0)
{
Sleep, 1000
MouseMove, X, Y
Click
Sleep, 1500
MouseMove, 812, 775
Sleep, 1000
Click
Sleep, 1500
  loop, 35
 {
Send {WheelUp}
Sleep, 200
}
  BigClose()
  BigClose()
  return
}
return
}
}
}
}
}


;function that does the guardian training and guardian evolving(auto evolving not tested, might wait a bit too low for it to work)
Guardian(){
ControlFocus,, ahk_exe Firestone.exe
MainMenu()
MouseMove, 1869, 203
Sleep, 1000
click
Sleep, 1500
MouseMove, 658, 284
Sleep, 1000
click
Sleep, 1500
ImageSearch,X,Y, 193,159,624,268, General\evolve.png
if(ErrorLevel=0)
{
 MouseMove, 1450,174
 Sleep, 1000
 Click
 Sleep, 1500
 MouseMove, 1117, 750
 Click
 Sleep, 10500
 MouseMove, 1291, 171
 Sleep, 1000
 Click
 Sleep, 1500
}
MouseMove, 1138, 787
Sleep, 1000
click
Sleep, 1500
BigClose()
BigClose()
return
}

;check to see if we are on the mainmenu in case script ends up badly on another menu, also skips the rate pop-up, it is done via avatar color(default one light blue as that's where I am)
MainMenu()
{
ControlFocus,, ahk_exe Firestone.exe
;check via avatar
;ImageSearch,X,Y,12,39,160,184, General\main2.png
PixelSearch, X, Y, 124, 81, 124, 81, 0x2BC3C6, 3, Fast RGB ;- background color blue
;PixelSearch, X, Y, 124, 81, 124, 81, 0xAB44F7, 3, Fast RGB ;- background color purple
;check via battlepass
;ImageSearch,X,Y,402,895,550,1026, General\main.png
;small test of icons
;ImageSearch,X,Y,13,253,123,663, General\icon.png
if(ErrorLevel=1)
{
BigClose()
}
if(ErrorLevel=0)
{
return
}
PixelSearch, X, Y, 124, 81, 124, 81, 0x2BC3C6, 3, Fast RGB ;- background color blue
;PixelSearch, X, Y, 124, 81, 124, 81, 0xAB44F7, 3, Fast RGB ;- background color purple
if(ErrorLevel=1)
{
BigClose()
}
if(ErrorLevel=0)
{
return
}
PixelSearch, X, Y, 124, 81, 124, 81, 0x2BC3C6, 3, Fast RGB ;- background color blue
;PixelSearch, X, Y, 124, 81, 124, 81, 0xAB44F7, 3, Fast RGB ;- background color purple
if(ErrorLevel=1)
{
BigClose()
}
if(ErrorLevel=0)
{
return
}
PixelSearch, X, Y, 124, 81, 124, 81, 0x2BC3C6, 3, Fast RGB ;- background color blue
;PixelSearch, X, Y, 124, 81, 124, 81, 0xAB44F7, 3, Fast RGB ;- background color purple
if(ErrorLevel=1)
{
MouseMove, 1402, 327
Sleep, 1000
Click
}
if(ErrorLevel=0)
{
return
}
PixelSearch, X, Y, 124, 81, 124, 81, 0x2BC3C6, 3, Fast RGB ;- background color blue
;PixelSearch, X, Y, 124, 81, 124, 81, 0xAB44F7, 3, Fast RGB ;- background color purple
if(ErrorLevel=1)
{
MouseMove, 960, 805
Sleep, 1000
Click
}
if(ErrorLevel=0)
{
return
}
return
}
