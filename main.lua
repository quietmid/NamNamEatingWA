-- Still testing. I change the C_Timer to 10.5 because sometimes it doesn't catch the Well Fed buff.
-- I still want to come up with a better way to catergorize the jokes, so there can be more flexibility instead of
-- just a two lines joke or one say & one emote + one say & one more combo
-- maybe later on it can be one say & one emote + one say and etc.

-- Define jokes (modify this list if needed)
local jokes = {
    {"Why don’t eggs tell jokes?", "Because they might crack up."},
    {"Why don’t skeletons fight each other?", "They don’t have the guts."},
    {"Why did the scarecrow win an award?", "Because he was outstanding in his field!"},
    {"Why don’t some fish play piano?", "Because they can’t find their scales!"},
    {"Why did the bicycle fall over?", "Because it was two-tired!"},
    {"What is the leading cause of dry skin?", "Towel"},
    {"damnn this is delicious.", "SAY", "opens a bag of dicks and start eating", "EMOTE", "rails a fat line of white", "EMOTE", "I AM READY", "YELL"}
}

-- Save last joke index (use WeakAura's internal storage)
if not wa_global then wa_global = {} end
if not wa_global.jokeIndex then wa_global.jokeIndex = 1 end

-- Get the next joke & determine if the joke is a short joke or long joke
local joke = jokes[wa_global.jokeIndex]
local jokeLength = #joke
local longJoke = (jokeLength > 2) and 1 or 0
-- Send the first part of the joke
if longJoke == 0 then
    SendChatMessage(joke[1], "SAY")
else 
    SendChatMessage(joke[1], joke[2])
    C_Timer.After(0.5, function()
            SendChatMessage(joke[3], joke[4])        
    end)
end

-- Cycle to the next joke for the next trigger
wa_global.jokeIndex = wa_global.jokeIndex % #jokes + 1
-- Delay for the second part of the joke
C_Timer.After(10.5, function()
        if AuraUtil.FindAuraByName("Well Fed", "player") then
            if longJoke == 1 and joke[5] and joke[6] then
                SendChatMessage(joke[5], joke[6])
                
                C_Timer.After(0.5, function()  -- Small delay before second joke line
                        if joke[7] and joke[8] then
                            SendChatMessage(joke[7], joke[8])
                        end
                end)
            elseif longJoke == 0 and joke[2] then
                SendChatMessage(joke[2], "SAY")
            end
        else
            print("no food buff found")
        end
end)
