	playerList= GetPlayerList()
	for player in playerList.list do 
		distance = player:GetRangeTo(GetMe())
		ShowToClient("RADAR", player:GetName() .. " at " .. distance/100)
	end
