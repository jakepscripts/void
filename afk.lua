local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local PlayerName = game.Players.LocalPlayer.Name
local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/shlexware/Orion/main/source")))()
local content = "Welcome, " .. "@"..PlayerName .. "! Void is now loading.."

function notification(a_title, a_content, a_image, a_time)
    OrionLib:MakeNotification({
            Name = a_title;
            Content = a_content;
            Image = a_image;
            Time = a_time;
        }
    );
end

notification("Void", content, "rbxassetid://10198709880", 5)

local Window = OrionLib:MakeWindow({Name = "Void | " .. GameName, HidePremium = false, IntroText = "Void Scripts", SaveConfig = true, ConfigFolder = "Void"})
local Home = Window:MakeTab({Name = "Notice", Icon = "rbxassetid://7072978559", PremiumOnly = false})
Home:AddParagraph("Notice","Click anti-afk to prevent yourself from going idle ingame.")

Home:AddButton({Name = "Anti-Afk!",Callback = function()
    
       notification("Void", "Anti-AFK has now been enabled.", "rbxassetid://10198709880", 3)
       game.Players.LocalPlayer:Kick("ERR: 1038, You have been banned from My Restaurant for cheating/hacking. This ban is NOT appealable and you data is reset completely.")
        game:service "Players".LocalPlayer.Idled:connect(
                function()
                    game:service "VirtualUser":CaptureController()
                    game:service "VirtualUser":ClickButton2(Vector2.new())
                end
            )
        end
    }
)

