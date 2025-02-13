# NamNamEatingWA

## Description
<p>In the MMORPG World of Warcraft, you can customize WeakAuras to automatically triggered chat message in certain environment. A weakaura that I used often in
game is the Nam Nam (https://wago.io/rJLsKGVt-), which triggers a saying at the beginning of the event and another saying 10 seconds after. 
 Personally, I really enjoy this WeakAura and have been using this opporunity to tell a two lines joke. Instead of updating it manually everytime 
  that I log in, I decided to update this weakaura with custom code that stores the jokes locally and will loop through them and depending on the the length of the joke, it will change the sending behavior. </p>

## Feature
- You can add jokes and remove old jokes 
- You can customize how the joke is tell with "SAY", "EMOTE", "YELL"
- Provide a light hearted or dark environment for you friends!
- Uses of C_Timer.After to make sure to the message isn't spammed

## How to Use
If you make it here, I am assuming you play WoW and have weakaura already and have the nam nam weakaura. all you have to do is, open WeakAura with
```
/wa
```
select eating nam nam 
Click the Action tab
Unclick Chat Message in "On Show" & "On Hide"
within "On Show"
click Custom then in the box below copy & paste the lua code in 
click done
then you are the next stand up comedian in Azeroth!
