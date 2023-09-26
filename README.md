# Firestone-bad-bot
A small script that automates some mechanics in Firestone Idle RPG

Script is done in AHK so you will need version 1.1.33 to be able to run it

Get prepared for a bit of wall text TL;DR a lot of limitations

* The script is intended to work on windowed fullscreen on 1920x1080 monitors for aplications based(tested on steam and the defunct kartridge, but it should work without issues on epic as well, not sure about browser versions/via emulators as I haven't tried out and most likely will not do it). Why is that? Basically the game gets resized if you go lower/higher resolution so the coords will change, not sure if on small changes the script should work or it completely dies but it is what it is.
* The scripts needs focus and steals controls, tried to make it work via virtual input, but it didn't worked, not sure if by the way how the game or coded or I am simply doing a bad coding job.
* If the game freezes the scripts dies, couldn't figure out a way to bypass that.
* If the game is not on the 1920x1080 part the script may get haywire and completely random points on screen/ other applications, sorry for this.
* Biggest part of the script is coord based, an alternative would be to go with icons from the main screen, but the images get the background as well so you will need a lot of pictures to make it fully working and it feels there will be more work in the long run in case of UI changes compared with the coords.
* As I don't prestige too often there will not be a prestige/ going through zones part of the script
* The scripts claims the campaign reward, does map missions, does expeditions, does alchemist(for the moment hard coded for blood and dust, will try to make an easy way to select how to do that, but it will take me a bit to get used to GUI editting) and firestone tree(quite a bad functions, but if you don't end up on some of the bad uninted stuff that I couldn't test it should work, don't leave everything for it as it might finish on a lot of solo upgrades)
* Fail safe at the moment is hard-coded to my light blue color, if someone would help with the code for the other colors(have only for purple other than my blue)/ if someone needs to get the color, open Windows Spy, make it follow mouse and use the `Color` button from the UI to get the color code and replace at the end of `Functions.ahk` the current code with your one(but keep the Ox).
* Would like to add claiming of dailies/ weeklies but so far not sure how to fully implement it, don't get your hopes too high.
* No plan to implement function for the mini events.
* UI looks a bit empty as I plan to add more stuff to it, will see if I will manage it or will just have to resize it a smaller size.
* Won't answer to question about imformation that is listed here.
