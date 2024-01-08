local branding = 
[[
  //
  ||   _____ _                 _      _    _ _   _ _ _   _           
  ||  / ____(_)               | |    | |  | | | (_) | | (_)          
  || | (___  _ _ __ ___  _ __ | | ___| |  | | |_ _| | |_ _  ___  ___ 
  ||  \___ \| | '_ ` _ \| '_ \| |/ _ \ |  | | __| | | __| |/ _ \/ __|
  ||  ____) | | | | | | | |_) | |  __/ |__| | |_| | | |_| |  __/\__ \
  || |_____/|_|_| |_| |_| .__/|_|\___|\____/ \__|_|_|\__|_|\___||___/
  ||                    | |                                          
  ||                    |_|                                          
  ||                   Made by Fadin_laws
  ||]]

Citizen.CreateThread(function()
    local CurrentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
    if not CurrentVersion then 
        print (' [~r~SimpleUtilities~w]: ~y~Simple Utilities was unbale to check for an update!')
    end
    
    function VersionCheckHTTPRequest()
        PerformHttpRequest('https://raw.githubusercontent.com/Fadinlaws123/ScriptVersionChecker/main/SimpleUtilities.json', VersionCheck, 'GET')
    end

    function VersionCheck(err, response, headers)
		Citizen.Wait(3000)
		if err == 200 then
			local Data = json.decode(response)
			if CurrentVersion ~= Data.NewestVersion then
				print( branding )			
				print('  ||    \n  ||    SimpleUtilities is outdated!')
				print('  ||    Current version: ^2' .. Data.NewestVersion .. '^7')
				print('  ||    Your version: ^1' .. CurrentVersion .. '^7')
				print('  ||    Please download the lastest version from ^5' .. Data.DownloadLocation .. '^7')
				if Data.Changes ~= '' then
					print('  ||    \n  ||    ^5Changes: ^7' .. Data.Changes .. "\n^0  \\\\\n")
				end
			else
				print( branding )			
				print('  ||    ^2SimpleUtilities is up to date!!^0')
				print('  ||    ^2Your version: ^3' .. CurrentVersion .. '\n^0  ||\n  \\\\\n')
			end
		else
			print( branding )			
			print('  ||    ^1There was an error grabbing the latest version! \n^0  ||\n  \\\\\n')
		end
		
		SetTimeout(60000000, VersionCheckHTTPRequest)
	end

	VersionCheckHTTPRequest()
end)