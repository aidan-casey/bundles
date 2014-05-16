-- The bundle mod created by Golthem 
-- WTFPL 

local use_boats = minetest.get_modpath("boats")

-- Register the bundle item
minetest.register_craftitem("bundles:bundle", {
			description = "Stick bundle",
			inventory_image = "bundles_bundle.png"
})

if use_boats then
-- The paddle
-- Register the paddle item
minetest.register_craftitem("bundles:paddle", {
			description = "Paddle",
			inventory_image = "bundles_paddle.png"
})
end

-- Crafting!

-- Register the crafting to bundle
minetest.register_craft({
	output = 'bundles:bundle',
	recipe = {
		{'', '', ''},
		{'default:stick', 'default:stick', 'default:stick'},
		{'', '', ''},
	}
})

-- Register the crafting back to sticks
minetest.register_craft({
	output = 'default:stick 3',
	recipe = {
		{'', '', ''},
		{'', 'bundles:bundle', ''},
		{'', '', ''},
	}
})

if use_boats then
-- Register the crafting to a paddle
minetest.register_craft({
	output = 'bundles:paddle',
	recipe = {
		{'', '', 'default:wood'},
		{'', 'default:stick', ''},
		{'default:stick', '', ''},
	}
})

-- Register boat crafting. IF it finds the boats mod.
minetest.register_craft({
	output = "boats:boat",
	recipe = {
		{'bundles:bundle','bundles:bundle','bundles:bundle'},
		{'bundles:bundle','bundles:bundle','bundles:bundle'},
		{'bundles:bundle','bundles:bundle','bundles:bundle'},
	},		
})
end

-- Fuel!

-- Register the bundle fuel
minetest.register_craft({
	type = "fuel",
	recipe = "bundles:bundle",
	burntime = 15,	
})

if use_boats then
-- You can burn your paddle but, why would you want to?
minetest.register_craft({
	type = "fuel",
	recipe = "bundles:paddle",
	burntime = 2,	
})
end