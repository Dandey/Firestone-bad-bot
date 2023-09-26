# FIrestone-bad-bot
A small script that automates some mechanics in Firestone Idle RPG

Get prepared for a bit of wall text TL;DR a lot of limitations

* The script is intended to work on windowed fullscreen on 1920x1080 monitors for aplications based(tested on steam and the defunct kartridge, but it should work without issues on epic as well, not sure about browser versions/via emulators as I haven't tried out and most likely will not do it). Why is that? Basically the game gets resized if you go lower/higher resolution so the coords will change, not sure if on small changes the script should work or it completely dies but it is what it is.
* The scripts needs focus and steals controls, tried to make it work via virtual input, but it didn't worked, not sure if by the way how the game or coded or I am simply doing a bad coding job.
* If the game freezes the scripts dies, couldn't figure out a way to bypass that.
* If the game is not on the 1920x1080 part the script may get haywire and completely random points on screen/ other applications, sorry for this.
* Biggest part of the script is coord based, an alternative would be to go with icons from the main screen, but the images get the background as well so you will need a lot of pictures to make it fully working and it feels there will be more work in the long run in case of UI changes compared with the coords.
* As I don't prestige too often there will not be a prestige/ going through zones part of the script
* The scripts claims the campaign reward, does map missions, does expeditions, does alchemist(for the moment hard coded for blood and dust, will try to make an easy way to select how to do that, but it will take me a bit to get used to GUI editting) and firestone tree(quite a bad functions, but if you don't end up on some of the bad uninted stuff that I couldn't test it should work, don't leave everything for it as it might finish on a lot of solo upgrades)
* Would like to add claiming of dailies/ weeklies but so far not sure how to fully implement it, don't get your hopes too high.
* No plan to implement function for the mini events.
* Won't answer to question about imformation that is listed here.
