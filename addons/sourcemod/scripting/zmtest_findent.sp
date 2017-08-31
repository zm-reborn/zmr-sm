#include <sourcemod>
#include <sdktools>


public void OnPluginStart()
{
    RegConsoleCmd( "sm_zm_findent", Cmd_FindEnt );
}

public Action Cmd_FindEnt( int client, int args )
{
    ReplyToCommand( client, "Finding info_zombiespawns..." );
    
    int ent = -1;
    while ( (ent = FindEntityByClassname( ent, "info_zombiespawn" )) != -1 )
    {
        ReplyToCommand( client, "Found info_zombiespawn! (%i)", ent );
    }
    
    return Plugin_Handled;
}
