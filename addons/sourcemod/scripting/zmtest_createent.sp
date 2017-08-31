#include <sourcemod>
#include <sdktools>


public void OnPluginStart()
{
    RegConsoleCmd( "sm_zm_createent", Cmd_CreateEnt );
}

public Action Cmd_CreateEnt( int client, int args )
{
    ReplyToCommand( client, "Creating info_zombiespawn..." );
    
    int ent = CreateEntityByName( "info_zombiespawn" );
    
    if ( ent < 1 )
    {
        ReplyToCommand( client, "Unable to create entity by name!" );
        return Plugin_Handled;
    }
    
    
    if ( !DispatchSpawn( ent ) )
    {
        ReplyToCommand( client, "Unable to dispatch spawn!" );
        return Plugin_Handled;
    }
    
    
    float pos[3] = { 1337.0, 1337.0, 8008.5 };
    
    ReplyToCommand( client, "Teleporting info_zombiespawn to {%.1f, %.1f, %.1f}...", pos[0], pos[1], pos[2] );
    
    TeleportEntity( ent, pos, NULL_VECTOR, NULL_VECTOR );
    
    float origin[3];
    GetEntPropVector( ent, Prop_Data, "m_vecOrigin", origin );
    
    ReplyToCommand( client, "%i teleported to {%.1f, %.1f, %.1f}", ent, origin[0], origin[1], origin[2] );
    
    return Plugin_Handled;
}
