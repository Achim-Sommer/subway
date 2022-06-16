Config = {}

Config.MarkerSize = vec(0.95, 0.95, 0.45)
Config.RGB = {209, 142, 17}
Config.SubwayTimer = 10

Config.subwayBlip = {Sprite = 513, Color = 39, Display = 2, Scale = 1.0, Title = "U-Bahn"}

Config.Stations = {
	{
		stationNumber = 1,
		name = "LSIA Terminal",
		price = 5,
		ticketBuy = vector3(-1012.76, -2755.96, -0.1),
		exitMetro = vector3(-1067.48, -2697.0, -7.4),
	},
	{
		stationNumber = 2,
		name = "LSIA Parking",
		price = 5,
		ticketBuy = vector3(-908.96, -2351.32, -4.52),
		exitMetro = vector3(-891.84, -2342.32, -11.72),
	},
	{
		stationNumber = 3,
		name = "Puerto Del Sol",
		price = 5,
		ticketBuy = vector3(-541.8, -1281.44, 25.92),
		exitMetro = vector3(-539.08, -1277.04, 26.92),
	},
	{
		stationNumber = 4,
		name = "Strawberry",
		price = 5,
		ticketBuy = vector3(278.92, -1205.48, 37.88),
		exitMetro = vector3(296.88, -1204.08, 38.88),
	},
	{
		stationNumber = 6,
		name = "Burton",
		price = 5,
		ticketBuy = vector3(-280.52, -304.4, 17.28),
		exitMetro = vector3(-295.16, -303.92, 10.08),
	},
	{
		stationNumber = 7,
		name = "Portola",
		price = 5,
		ticketBuy = vector3(-849.28, -134.52, 27.2),
		exitMetro = vector3(-838.96, -151.28, 19.96),
	},
	{
		stationNumber = 8,
		name = "Del Perro",
		price = 5,
		ticketBuy = vector3(-1342.4, -506.88, 22.28),
		exitMetro = vector3(-1351.0, -466.6, 15.04),
	},
	{
		stationNumber = 9,
		name = "Little Seoul",
		price = 5,
		ticketBuy = vector3(-465.08, -702.44, 19.04),
		exitMetro = vector3(-507.56, -673.92, 11.8),
	},
	{
		stationNumber = 10,
		name = "Pillbox South",
		price = 5,
		ticketBuy = vector3(-215.2, -1034.12, 29.16),
		exitMetro = vector3(-216.84, -1039.12, 30.16),
	},
	{
		stationNumber = 11,
		name = "Davis",
		price = 5,
		ticketBuy = vector3(113.28, -1725.72, 29.12),
		exitMetro = vector3(109.6, -1722.4, 30.12),
	},
}

Config.SubwayLocations = {
	Locations = {
		Coords = {
			-- Paleto Bay
			vector3(-1012.76, -2755.96, -0.1), 
			vector3(-908.96, -2351.32, -4.52), 
			vector3(-541.8, -1281.44, 25.92), 
			vector3(278.92, -1205.48, 37.88), 
			vector3(-280.52, -304.4, 17.28), 
			vector3(-849.28, -134.52, 27.2), 
			vector3(-1342.4, -506.88, 22.28), 
			vector3(-465.08, -702.44, 19.04), 
			vector3(-215.2, -1034.12, 29.16), 
			vector3(113.28, -1725.72, 29.12), 
		}
	}
}