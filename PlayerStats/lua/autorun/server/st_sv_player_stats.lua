util.AddNetworkString( "print_new_player_messages" )
util.AddNetworkString( "print_player_ret_messages" )
util.AddNetworkString( "give_player_their_stats" )
util.AddNetworkString( "give_player_all_stats" )

hook.Add( "Initialize", "SetUpFirstGPAPSValues", function()

	if cookie.GetString( "st_total_ply" ) == nil then
		cookie.Set( "st_total_ply", "0" )
	end

end )

hook.Add( "PlayerInitialSpawn", "GreetPlayersAndPrintStats", function( ply ) 

	local numply = cookie.GetNumber( "st_total_ply" )
	ply.plyjoins = tonumber( ply:GetPData( "st_times_joined", 0 ) )
	
	if ply.plyjoins == 0 then
		numply = numply + 1
		ply:SetPData( "st_player_number", tostring( numply ) )
		net.Start( "print_new_player_messages" )
			net.WriteInt( numply, 32 )
			net.WriteString( ply:Name() )
		net.Broadcast()
		ply.plyjoins = ply.plyjoins + 1
	else
		net.Start( "print_player_ret_messages" )
			net.WriteInt( ply.plyjoins, 32 )
			net.WriteString( ply:Name() )
		net.Broadcast()
		ply.plyjoins = ply.plyjoins + 1
	end
	numply = tostring( numply )
	ply:SetPData( "st_times_joined", tostring( ply.plyjoins ) )
	cookie.Set( "st_total_ply", numply )

end )

hook.Add( "PlayerSay", "PrintPlayerStatsInfo", function( ply, txt )

	if string.lower( txt ) == ".mystats" then
		net.Start("give_player_their_stats")
			net.WriteString( ply:GetPData( "st_times_joined" ) )
			net.WriteString( ply:GetPData( "st_player_number" ) )
			net.WriteString( cookie.GetString( "st_total_ply" ) )
		net.Send( ply )
		return ""
	end

end )