--change these colors however you want
--the addons will use these in the messages
local BASE_TEXT_COLOR = Color( 255, 255, 128 )
local PLAYER_TEXT_COLOR = Color( 128, 255, 128 )
local NUMBER_COLOR = Color( 255, 128, 128 )

net.Receive( "print_new_player_messages", function( len, ply )

	local numply = net.ReadInt( 32 )
	local newply = net.ReadString()
	numply = tostring( numply )
	
	chat.AddText( BASE_TEXT_COLOR, "Welcome ", PLAYER_TEXT_COLOR, newply, BASE_TEXT_COLOR, " to this server, they are player ", NUMBER_COLOR, "#" .. numply, BASE_TEXT_COLOR, "!" )
	
	--you can add other stuff here, like
	--surface.PlaySound
	
end )

net.Receive( "print_player_ret_messages", function( len, ply )

	local numply = net.ReadInt( 32 )
	local newply = net.ReadString()
	numply = tostring( numply )
	
	chat.AddText( BASE_TEXT_COLOR, "Welcome ", PLAYER_TEXT_COLOR, newply, BASE_TEXT_COLOR, " back to this server, they have joined ", NUMBER_COLOR, numply, BASE_TEXT_COLOR, " times before!" )

	--you can add other stuff here, like
	--surface.PlaySound
	
end )

net.Receive( "give_player_their_stats", function( len, ply )

	local timesjoin = net.ReadString()
	local plynum = net.ReadString()
	local nplayers = net.ReadString()
	
	chat.AddText( PLAYER_TEXT_COLOR, LocalPlayer():Name(), BASE_TEXT_COLOR, ", you are player ", NUMBER_COLOR, "#" .. plynum, BASE_TEXT_COLOR, "." )
	chat.AddText( BASE_TEXT_COLOR, "You have spawned into this server ", NUMBER_COLOR, timesjoin, BASE_TEXT_COLOR, " times." )
	chat.AddText( BASE_TEXT_COLOR, "A total of ", NUMBER_COLOR, nplayers, BASE_TEXT_COLOR, " players have joined this server." )

end )
