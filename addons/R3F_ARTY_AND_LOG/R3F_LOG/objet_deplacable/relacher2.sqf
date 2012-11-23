/**
 * Hurr durr some french BS
 */

if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
}
else
{
	R3F_LOG_mutex_local_verrou = true;
	
	R3F_LOG_force_horizontally = true;
	R3F_LOG_joueur_deplace_objet = objNull;
	sleep 1;
	
	R3F_LOG_mutex_local_verrou = false;
};