local ids = {
	["Farlight"] = {
		"331a0213d1a290f7" = true,
	}
}

local IDPath = gg.FILES_DIR .. "/libHeader.so"

if ( not file.exists(IDPath) ) then
	io.open(IDPath, "w"):write(math.random(999999, 999999999))
end

local dID = file.read(IDPath) .. file.lastTime(IDPath)

local deviceID = dID:getHash()

function principal()
	local menu = gg.choice({
		"copiar id",
		"Farlight Vip"
	}, 0, "título!")

	if menu == 1 then
		local a = gg.alert(deviceID, "copiar")
		if a == 1 then
			gg.copyText(deviceID, false)
		end
	elseif menu == 2 then
		if ( ids["Farlight"][deviceID] ) then
			link = "https://raw.githubusercontent.com/Nick13y/hacksXD/main/Farlight"

			local c = gg.makeRequest(link).content

			if ( c ) then
				return load(c)()
			else
				gg.alert("sem internet")
				os.exit()
			end
		else
			gg.alert("você não tem acesso")
		end
	end
end

while ( true ) do
	if ( gg.isVisible() ) then
		gg.setVisible(false)
		principal()
	end
end
