local mod_storage = minetest.get_mod_storage()
minetest.register_chatcommand("hidenames", {
	description = "Make all nametags invisible",
	privs = {server = true},
	func = function(name, param)
    mod_storage:set_int("hidenames", 1)
		for _, player in pairs(minetest.get_connected_players()) do
			player:set_nametag_attributes({color = {a = 0, r = 255, g = 255, b = 255}})
		end
	end
})

minetest.register_chatcommand("shownames", {
	description = "Make all nametags visible",
	privs = {server = true},
	func = function(name, param)
    mod_storage:set_int("hidenames", 0)
		for _, player in pairs(minetest.get_connected_players()) do
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 255}})
		end
	end
})
minetest.register_on_joinplayer(function(player)
  if mod_storage:get_int("hidenames", 1) == 1 then
    player:set_nametag_attributes({color = {a =0, r = 255, g = 255, b = 255}})
  else
    player:set_nametag_attributes({color = {a =255, r = 255, g = 255, b = 255}})
  end
end)