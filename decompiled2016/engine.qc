//Decompiled code. Please respect the original copyright.
float (string s) cvar = #45; 
void (vector o, vector d, float color, float count) particle = #48; 
void(entity killer, entity killee) _logfrag = #79; 
string(entity e, string key) _infokey = #80; 
void(vector where, float set) multicast = #82; 
float(string extname) checkextension = #99; 
__variant(...) te_blood = #405; 
__variant(...) _te_gunshot = #418; 
__variant(...) _te_spike = #419; 
__variant(...) _te_superspike = #420; 
__variant(...) _te_explosion = #421; 
__variant(...) _te_tarexplosion = #422; 
__variant(...) _te_wizspike = #423; 
__variant(...) _te_knightspike = #424; 
__variant(...) _te_lavasplash = #425; 
__variant(...) _te_teleport = #426; 
__variant(...) _te_explosion2 = #427; 
__variant(...) _te_lightning1 = #428; 
__variant(...) _te_lightning2 = #429; 
__variant(...) _te_lightning3 = #430; 
__variant(...) _te_beam = #431; 
string(string cvarname) cvar_string = #448; 
void (...) _bprint = #23; 
void (...) _sprint = #24; 
float(string s) _stof = #81; 
float IT_AXE    = 4096;
float IT_SHOTGUN    = 1;
float IT_SUPER_SHOTGUN    = 2;
float IT_NAILGUN    = 4;
float IT_SUPER_NAILGUN    = 8;
float IT_GRENADE_LAUNCHER    = 16;
float IT_ROCKET_LAUNCHER    = 32;
float IT_LIGHTNING    = 64;
float IT_EXTRA_WEAPON    = 128;
float IT_EXTRA_WEAPON2    = 8388608;
float IT_SKULL    = 16777216;
float IT_BR    = 67108864;
float IT_SHELLS    = 256;
float IT_NAILS    = 512;
float IT_ROCKETS    = 1024;
float IT_CELLS    = 2048;
float IT_ARMOR1    = 8192;
float IT_ARMOR2    = 16384;
float IT_ARMOR3    = 32768;
float IT_KEY1    = 131072;
float IT_KEY2    = 262144;
float IT_INVISIBILITY    = 524288;
float CONTENT_EMPTY    = -1;
float CONTENT_SOLID    = -2;
float CONTENT_WATER    = -3;
float CONTENT_SLIME    = -4;
float CONTENT_LAVA    = -5;
float CONTENT_SKY    = -6;
vector VEC_ORIGIN;
vector VEC_HULL_MIN    = '-16 -16 -24';
vector VEC_HULL_MAX    = '16 16 32';
vector VEC_HULL2_MIN    = '-32 -32 -24';
vector VEC_HULL2_MAX    = '32 32 64';
float SVC_TEMPENTITY    = 23;
float SVC_KILLEDMONSTER    = 27;
float SVC_FOUNDSECRET    = 28;
float SVC_INTERMISSION    = 30;
float SVC_FINALE    = 31;
float SVC_SELLSCREEN    = 33;
float TE_SPIKE;
float TE_EXPLOSION    = 3;
float TE_LIGHTNING1    = 5;
float TE_LIGHTNING2    = 6;
float TE_WIZSPIKE    = 7;
float TE_LIGHTNING3    = 9;
float TE_LAVASPLASH    = 10;
float TE_TELEPORT    = 11;
string string_null;
entity activator;
entity damage_attacker;
entity damage_inflictor;
float damage_mod;
float framecount;
float timelimit;
float fraglimit;
float rj;
float skill;
entity lastspawn;
float spotspawn;
entity shub;
.string killtarget;
.void(entity attacker, float damage) th_pain;
.void() th_die;
.float speed;
.string map;
.float ammo_shells_real;
.float ammo_nails_real;
.float ammo_rockets_real;
.float ammo_cells_real;
.float maxspeed;
.float gravity;
.float attack_finished;
.float pain_finished;
.float invincible_finished;
.float super_damage_finished;
.float cnt;
float intermission_running;
float intermission_exittime;
entity newmis;
.float alpha;
.float worldtype;
var .float delay = worldtype;
.float wait;
.float t_length;
.float t_width;
.vector finaldest;
.float finaldest_y;
.float finaldest_z;
.vector finalangle;
.float finalangle_y;
.float finalangle_z;
.float count;
.float dmg;
.vector mangle;
.float mangle_y;
.float mangle_z;
.float lip;
.float state;
.vector pos1;
.float pos1_y;
.float pos1_z;
.vector pos2;
.float pos2_y;
.float pos2_z;
.float height;
.vector dest1;
.float dest1_y;
.float dest1_z;
.vector dest2;
.float dest2_y;
.float dest2_z;
var .float weaponframe_time = worldtype;
var .float suicide_time = wait;
var .float show_hostile = t_length;
var .float lightning_sound = t_width;
var .float fly_sound = finaldest;
var .float invincible_sound = finaldest_y;
var .float invisible_finished = finaldest_z;
var .float super_sound = finalangle;
var .float swim_flag = finalangle_y;
var .float air_finished = finalangle_z;
var .float waterdmg = count;
var .float jump_flag = dmg;
var .float damage_direct = worldtype;
var .float damage_exp = wait;
var .float radius_exp = t_length;
var .float expire_time = t_width;
var .float proj_think_time = finaldest;
var .float light_lev = worldtype;
var .float style = wait;
var .float search_time = worldtype;
var .float attack_state = wait;
var .float pausetime = t_length;
var .float hknightattack = t_width;
var .float lefty = finaldest;
var .float wizardidle = finaldest_y;
var .float inpain = finaldest_z;
.float weaponstate;
.float walkframe;
.float ammo_type;
var .float bubble_count = weaponstate;
var .float bubble_state = walkframe;
var .float mod_direct = weaponstate;
var .float mod_exp = walkframe;
var .float proj_effect = ammo_type;
.float voided;
.void() think1;
var .void() proj_think = think1;
.void() proj_touch;
var .void() th_stand = think1;
var .void() th_walk = proj_touch;
.void() th_run;
.void() th_missile;
.void() th_melee;
.entity trigger_field;
var .entity oldenemy = trigger_field;
.entity movetarget;
.string wad;
var .string noise4 = wad;
var .string mdl = wad;
void (vector ang) makevectors;
void (entity e, vector o) setorigin;
void (entity e, string m) setmodel;
void (entity e, vector min, vector max) setsize;
float () random;
vector (vector v) normalize;
void (string e) error;
void (string e) objerror;
float (vector v) vlen;
float (vector v) vectoyaw;
entity () spawn;
void (entity e) remove;
void (vector v1, vector v2, float nomonsters, entity forent) traceline;
entity () checkclient;
entity (entity start, .string fld, string match) find;
string (string s) precache_sound;
string (string s) precache_model;
entity (vector org, float rad) findradius;
void (...) dprint;
string (float f) ftos;
string (vector v) vtos;
void () coredump;
void () traceon;
void () traceoff;
void (entity e) eprint;
float (float yaw, float dist) walkmove;
float () droptofloor;
void (float style, string value) lightstyle;
float (float v) rint;
float (float v) floor;
float (float v) ceil;
float (entity e) checkbottom;
float (vector v) pointcontents;
float (float f) fabs;
void (string s) localcmd;
entity (entity e) nextent;
void () ChangeYaw;
vector (vector v) vectoangles;
void (float step) movetogoal;
string (string s) precache_file;
void (entity e) makestatic;
void (string s) changelevel;
void (string var, string val) cvar_set;
void (vector pos, string samp, float vol, float atten) ambientsound;
string (string s) precache_model2;
string (string s) precache_sound2;
string (string s) precache_file2;
void(vector tdest, float tspeed, void() func) SUB_CalcMove;
void(entity ent, vector tdest, float tspeed, void() func) SUB_CalcMoveEnt;
void(vector destangle, float tspeed, void() func) SUB_CalcAngleMove;
void() SUB_CalcMoveDone;
void() SUB_CalcAngleMoveDone;
void() SUB_Null;
void() SUB_UseTargets;
void() SUB_Remove;
void(entity targ, entity inflictor, entity attacker, float damage, float mod) T_Damage;
float(entity targ, entity inflictor) CanDamage;
.float nade_lives;
.float plasma_lives;
.float kill_time;
.float kill_amount;
.float reloading;
float F_LIVES;
float round_kills;
float round;
.float elite;
float MAX_MONS;
float TOTAL_MONS;
float ROUND_NEW;
float CATCH;
.float slowmo;
float MAX_SLOWMO;
float SLOWMO_TOGGLE;
.float slowmo_flags;
float VOICE_COUNT;
float crosshair_time;
float icon_time;
.float canpick;
.float weapon_type;
.float next_jump_time;
.float setup_death;
void() Player_SetupDeath;
.float needles;
float(float wep, float cliptype) W_GetMaxClip;
void() player_throw_grenade;
void() pre_player_throw_grenade;
void() pre_player_melee;
void(entity t_ent, float weptype, float cliptype, float newamt) SetAmmoFor;
void() NeedlerHome;
.float selnade;
.float weaponheat;
.entity pp_cooldown;
.float pickup_time;
.float canpickup_time;
.float lives;
.float exshells;
.float exshells2;
.float exhshells;
.float exnails;
.float exrockets;
.float excells;
.float ammo_sniper;
.float exsniper;
.float ammo_ppistol;
.float exppistol;
.float ammo_prifle;
.float exprifle;
.float prifle_heat;
.float ammo_sword;
.float exsword;
.float ammo_needler;
.float exneedler;
.float needler_heat;
.float ammo_shells2;
.float ammo_hshells;
.float ammo_br;
.float exbr;
.float axhitme;
.float ohealth;
.float regen;
.float donefire;
.float wepanim;
.float fireframe;
.float jump_time;
.float pain_time;
.float reload_time;
.float pull_time;
.float nade_time;
.float melee_time;
.float death_type;
.float pfov;
void(float to, float f) WriteByte;
void(float to, string s) WriteString;
void() reload;
float chan_no_phs_add;
float eng_support;
void() EFF_SetEffects;
float (string s) cvar;
void (vector o, vector d, float color, float count) particle;
void(entity killer, entity killee) _logfrag;
string(entity e, string key) _infokey;
void(vector where, float set) multicast;
float(string extname) checkextension;
__variant(...) te_blood;
__variant(...) _te_gunshot;
__variant(...) _te_spike;
__variant(...) _te_superspike;
__variant(...) _te_explosion;
__variant(...) _te_tarexplosion;
__variant(...) _te_wizspike;
__variant(...) _te_knightspike;
__variant(...) _te_lavasplash;
__variant(...) _te_teleport;
__variant(...) _te_explosion2;
__variant(...) _te_lightning1;
__variant(...) _te_lightning2;
__variant(...) _te_lightning3;
__variant(...) _te_beam;
string(string cvarname) cvar_string;
void (...) _bprint;
void (...) _sprint;
float(string s) _stof;

float(string s) _stofdummy =
{
	return (TE_SPIKE);
};
var float(string s) stof = _stofdummy;

string(string cv) stringserverinfokey =
{

	if ((eng_support & IT_SUPER_SHOTGUN))
	{
		return (cvar_string(cv));
	}
	return ("");
};

void(float track, float looptrack) ENG_SwitchTrack =
{
	WriteByte(IT_SUPER_SHOTGUN, IT_ROCKET_LAUNCHER);
	WriteByte(IT_SUPER_SHOTGUN, track);
	WriteByte(IT_SUPER_SHOTGUN, looptrack);
};

void(string s) ENG_Finale =
{
	WriteByte(IT_SUPER_SHOTGUN, SVC_FINALE);
	WriteString(IT_SUPER_SHOTGUN, s);
};

void() ENG_Check =
{
	if (!cvar(/*1509i*/"pr_checkextension"))
	{
		return;
	}
	if (checkextension(/*1527i*/"FRIK_FILE"))
	{
		eng_support = eng_support | IT_SHOTGUN;
	}
	if (checkextension(/*1537i*/"DP_CVAR_STRING"))
	{
		eng_support = eng_support | IT_SUPER_SHOTGUN;
	}
	if (checkextension(/*1552i*/"DP_TE_STANDARDEFFECTBUILTINS"))
	{
		eng_support = eng_support | IT_NAILGUN;
	}
	if (checkextension(/*1581i*/"DP_TE_BLOOD"))
	{
		eng_support = eng_support | IT_SUPER_NAILGUN;
	}
	if (checkextension(/*1593i*/"DP_EF_RED"))
	{
		eng_support = eng_support | IT_GRENADE_LAUNCHER;
	}
	if (checkextension(/*1603i*/"DP_EF_BLUE"))
	{
		eng_support = eng_support | IT_ROCKET_LAUNCHER;
	}
	if ((eng_support & IT_SHOTGUN))
	{
		stof = _stof;
	}
	EFF_SetEffects();
};
