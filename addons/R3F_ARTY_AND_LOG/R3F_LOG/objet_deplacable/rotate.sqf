/**
 * Rotates the object
 */

if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
}
else
{
	private ["_newdir"];
	R3F_LOG_mutex_local_verrou = true;
	
	_newdir = (getDir R3F_LOG_joueur_deplace_objet - getDir player) + 45;
	R3F_LOG_joueur_deplace_objet setDir _newdir;
	R3F_ARTY_AND_LOG_PUBVAR_setDir = [R3F_LOG_joueur_deplace_objet, _newdir];
	publicVariable "R3F_ARTY_AND_LOG_PUBVAR_setDir";
	
	sleep 0.50;
	
	R3F_LOG_mutex_local_verrou = false;
};