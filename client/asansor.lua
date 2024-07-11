ESX = nil
QBCore = nil
PlayerData = nil
PlayerJob = nil
PlayerGrade = nil

CreateThread(function()
	if Config.UseESX then
		ESX = exports["es_extended"]:getSharedObject()
		while not ESX.IsPlayerLoaded() do
            		Wait(100)
        	end
	
		PlayerData = ESX.GetPlayerData()
		PlayerJob = PlayerData.job.name
		PlayerGrade = PlayerData.job.grade

		RegisterNetEvent("esx:setJob", function(job)
			PlayerJob = job.name
			PlayerGrade = job.grade
		end)

	elseif Config.UseQBCore then

		QBCore = exports["qb-core"]:GetCoreObject()
		 
		CreateThread(function()
			while true do
				PlayerData = QBCore.Functions.GetPlayerData()
				if PlayerData.citizenid ~= nil then
					PlayerJob = PlayerData.job.name
					PlayerGrade = PlayerData.job.grade.level
					break
				end
				Wait(100)
			end
		end)

		RegisterNetEvent("QBCore:Client:OnJobUpdate", function(job)
			PlayerJob = job.name
			PlayerGrade = job.grade.level
		end)
	end
end)

CreateThread(function()
	for elevatorName, elevatorFloors in pairs(Config.Elevators) do
		for index, floor in pairs(elevatorFloors) do
			if Config.ThirdEyeName == 'ox_target' then
				local info = {}
				info.elevator = elevatorName
				info.level = index
				exports.ox_target:addBoxZone({
				    coords = vec3(floor.coords.x, floor.coords.y, floor.coords.z),
				    size = vec3(5, 4, 3),
				    rotation = floor.heading,
				    debug = drawZones,
				    options = {
					{
					    name = tostring(elevatorName .. index),
					    event = 'ox_target:debug',
					    icon = "fas fa-hand-point-up",
					    label = "Use Elevator From " .. floor.level,
					    onSelect = function()
						TriggerEvent("lf_elevator:showFloors",info)
					    end
					}
				    }
				})
			else
				exports[Config.ThirdEyeName]:AddBoxZone(elevatorName .. index, floor.coords, 5, 4, {
					name = elevatorName,
					heading = floor.heading,
					debugPoly = false,
					minZ = floor.coords.z - 1.5,
					maxZ = floor.coords.z + 1.5
				},
				{
					options = {
						{
							event = "lf_elevator:showFloors",
							icon = "fas fa-hand-point-up",
							label = "Asansörü Şuradan Kullan: " .. floor.level,
							elevator = elevatorName,
							level = index
						},
					},
					distance = 1.5 
				})
			end
		end
	end

	if Config.Notify.enabled then
		local wasNotified = false
		while true do
			local sleep = 3000
			local nearElevator = false
			local playerCoords = GetEntityCoords(PlayerPedId())
			for elevatorName, elevatorFloors in pairs(Config.Elevators) do
				for index, floor in pairs(elevatorFloors) do
					local distance = #(playerCoords - floor.coords)
					if distance <= 10.0 then
						sleep = 10
						if distance <= Config.Notify.distance then
							nearElevator = true
							break
						end
					end
				end
			end
			if nearElevator then
				if not wasNotified then
					NotifyHint()
					wasNotified = true
				end
			else
				wasNotified = false
			end
			Wait(sleep)
		end
	end

end)

CreateThread(function()
    while Config.Use3DText do
        local sleep = 2000
        local playerCoords = GetEntityCoords(PlayerPedId())
        for elevatorName, elevatorFloors in pairs(Config.Elevators) do
            for index, floor in pairs(elevatorFloors) do
                local distance = #(playerCoords - floor.coords)
                if distance <= 10.0 then
                    sleep = 100
                    if distance <= 5 then
			sleep = 0
                        DrawText3Ds(floor.coords.x,floor.coords.y,floor.coords.z, "Asansör Çıkısını kullanmak için ~r~E~w~ tuslarına basın " .. floor.level)
                        if IsControlJustReleased(0, 38) then
                            local data = {}
                            data.elevator = elevatorName
                            data.level = index
                            TriggerEvent('lf_elevator:showFloors', data)
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent("lf_elevator:showFloors", function(data)
	local elevator = {}
	local floor = {}
	if Config.UseESX then
		PlayerData = ESX.GetPlayerData()
	elseif Config.UseQBCore then
		PlayerData = QBCore.Functions.GetPlayerData()
	end	
	for index, floor in pairs(Config.Elevators[data.elevator]) do
		if Config.NHMenu then
			table.insert(elevator, {
				header = floor.level,
				context = floor.label,
				disabled = isDisabled(index, floor, data),
				event = "lf_elevator:movement",
				args = { floor }
			})
		elseif Config.QBMenu then
			table.insert(elevator, {
				header = floor.level,
				txt = floor.label,
				disabled = isDisabled(index, floor, data),
				params ={ 
					event = "lf_elevator:movement",
					args = floor
					}
			})
		elseif Config.OXLib then
			table.insert(elevator, {
				label = floor.level..' - '..floor.label,
				args = { value = floor.coords, value2 = isDisabled(index, floor, data)}
			})
		end
	end
	if Config.NHMenu then
		TriggerEvent("nh-context:createMenu", elevator)
	elseif Config.QBMenu then
		TriggerEvent("qb-menu:client:openMenu", elevator)
	elseif Config.OXLib then
		lib.registerMenu({
			id = 'elevator_ox',
			title = 'Elevator Floor Selector',
			options = elevator,
			position = 'top-right',
		}, function(selected, scrollIndex, args)
			if not args.value2 then
				TriggerEvent("lf_elevator:movement", args.value)
			else
				NotifyNoAccess()
			end
		end)
		lib.showMenu('elevator_ox')
	end

end)

RegisterNetEvent("lf_elevator:movement", function(arg)
	local floor = {}
	if Config.OXLib then
		floor.coords = arg
	else
		floor = arg
	end
	local ped = PlayerPedId()
	DoScreenFadeOut(1500)
	while not IsScreenFadedOut() do
		Wait(10)
	end
	RequestCollisionAtCoord(floor.coords.x, floor.coords.y, floor.coords.z)
	while not HasCollisionLoadedAroundEntity(ped) do
		Wait(0)
	end
	SetEntityCoords(ped, floor.coords.x, floor.coords.y, floor.coords.z, false, false, false, false)
	SetEntityHeading(ped, floor.heading and floor.heading or 0.0)
	Wait(Config.ElevatorWaitTime*1000)
	DoScreenFadeIn(1500)
end)

function isDisabled(index, floor, data)
	if index == data.level then return true end
    if Config.UseESX then
        PlayerData = ESX.GetPlayerData()
    elseif Config.UseQBCore then
        PlayerData = QBCore.Functions.GetPlayerData()
    end
    local hasJob, hasItem = false, false
	if floor.jobs ~= nil and next(floor.jobs) then
		for jobName, gradeLevel in pairs(floor.jobs) do
			if PlayerJob == jobName and PlayerGrade >= gradeLevel then
				hasJob = true
				break
			end
		end
	end
	if floor.items ~= nil and next(floor.items) then
		if Config.UseESX then
			for i = 1, #floor.items, 1 do
				for k, v in ipairs(PlayerData.inventory) do
					if v.name == floor.items[i] and v.count > 0 then
						hasItem = true
						break
					end
				end
			end
		elseif Config.UseQBCore then
			for i = 1, #floor.items, 1 do
				for slot, item in pairs(PlayerData.items) do
					if PlayerData.items[slot] then
						if item.name == floor.items[i] then
							hasItem = true
							break
						end
					end
				end
			end
		end
	end
	if floor.jobs == nil and floor.items == nil then return false end 
	return floor.jobAndItem and not (hasJob and hasItem) or not (hasJob or hasItem)
end

function NotifyHint()
	AddTextEntry('elevatorHelp', Config.Notify.message)
	BeginTextCommandDisplayHelp('elevatorHelp')
	EndTextCommandDisplayHelp(0, false, true, -1)
end

function NotifyNoAccess()
	AddTextEntry('elevatorHelp', 'You cannot use this!')
	BeginTextCommandDisplayHelp('elevatorHelp')
	EndTextCommandDisplayHelp(0, false, true, -1)
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end
