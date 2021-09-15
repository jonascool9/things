local Players = game:GetService("Players")
local http = game:GetService("HttpService")
local webhook = "you're webhook"

--Joining
Players.PlayerAdded:Connect(function(plr)
	local data =
		{
			["contents"] = "",
			["username"] = plr.Name .. " - (#"..plr.userId..")",
			["avatar_url"] = "https://www.roblox.com/Thumbs/Avatar.ashx?x=500&y=500&Format=Png&userId="..plr.userId,
			["embeds"] = {{
				["title"]= plr.name,
				["description"] = "Server: "..game.JobId,
				["type"]= "rich",
				["color"]= tonumber(0x6AA84F),
				["fields"]={
					{
						["name"]="Event: Player joined",
						["value"]="User: **"..plr.Name.."** with ID: **"..plr.UserId.."** has joined [game](https://www.roblox.com/games/".. game.PlaceId..")/[Profile](https://www.roblox.com/users/"..plr.UserId.."/profile)",
						["inline"]=true}}}}
		}
	http:PostAsync(webhook,http:JSONEncode(data))
end)

--Leaving
Players.PlayerRemoving:Connect(function(plr)
	local leavedata =
		{
			["contents"] = "",
			["username"] = plr.Name .. " - (#"..plr.userId..")",
			["avatar_url"] = "https://www.roblox.com/Thumbs/Avatar.ashx?x=500&y=500&Format=Png&userId="..plr.userId,
			["embeds"] = {{
				["title"]= plr.name,
				["description"] = plr.Name .. " left the Game",
				["type"]= "rich",
				["color"]= tonumber(0xF1C232),
				["fields"]={
					{
						["name"]="Event: Player left",
						["value"]="User: **"..plr.Name.."** with ID: **"..plr.UserId.."** left [game](https://www.roblox.com/games/".. game.PlaceId..")/[Profile](https://www.roblox.com/users/"..plr.UserId.."/profile)",
						["inline"]=true}}}}
		}
	http:PostAsync(webhook,http:JSONEncode(leavedata))
end)
