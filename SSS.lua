--By W4rGo
craftId=24;
mpCost=150;
mat1="Crystal: S-Grade";
mat1num=1;
mat2="Soul Ore";
mat2num=40; 

weigthLimit=95;

function getItemByName(name)
	invList = GetInventory();
	for item in invList.list do
		if item.Name == name then
			 --ShowToClient("ITEM", item.Name .. " (ID: " .. item.displayId  .. ")");
			return item
		end
	end
	return nil
end

function hasItem(name)
	invList = GetInventory();
	for item in invList.list do
		if item.Name == name then
			 --ShowToClient("ITEM", item.Name .. " (ID: " .. item.displayId  .. ")");
			return true
		end
	end
	return false
end

while(true) do
	if(GetMe():GetWeightPrecent()>weigthLimit) then
	    ShowToClient("Weight","Weigth limit approaching, Script stopped");
		break;
    end;
	
	if(hasItem(mat1)) then 
		if(getItemByName(mat1).ItemNum < mat1num) then
			ShowToClient("Missing",mat1);
			break;
		end;
	else 
		ShowToClient("Missing",mat1);
		break;
	end;
	
	if(hasItem(mat2)) then 
		if(getItemByName(mat2).ItemNum < mat2num) then
			ShowToClient("Missing",mat2);
			break;
		end;
	else 
		ShowToClient("Missing",mat2);
		break;
	end;
	
	while( GetMe():GetMp()>mpCost ) do
		Sleep(1000);
		CraftItem(craftId);
	end;
end;