#include <sourcemod>
#include <sdktools>


public void OnPluginStart()
{
    RegConsoleCmd( "sm_zm_giveitem", Cmd_GiveItem );
}

public Action Cmd_GiveItem( int client, int args )
{
    if ( !client ) return Plugin_Handled;
    
    
    char wep[256];
    
    if ( args )
    {
        GetCmdArgString( wep, sizeof( wep ) ); 
    }
    else
    {
        strcopy( wep, sizeof( wep ), "weapon_zm_rifle" ); 
    }
    
    ReplyToCommand( client, "Giving item %s!", wep );
    
    
    ReplyToCommand( client, "Checking if you're alive..." );
    
    if ( !IsPlayerAlive( client ) )
    {
        ReplyToCommand( client, "You are not alive!" );
        return Plugin_Handled;
    }
    
    
    ReplyToCommand( client, "Checking your team..." );
    
    if ( GetClientTeam( client ) != 2 )
    {
        ReplyToCommand( client, "You are not human!" );
        return Plugin_Handled;
    }
    
    
    ReplyToCommand( client, "Giving..." );
    
    GivePlayerItem( client, wep, 0 ); 
    
    return Plugin_Handled;
}
