//Decompiled code. Please respect the original copyright.

void() bot_map_load =
{
};
void (entity e, float chan, string samp, float vol, float atten) frik_sound = #8; 
void (entity client, string s) frik_stuffcmd = #21; 
void (...) frik_sprint = #24; 
vector (entity e, float speed) frik_aim = #44; 
void (entity client, string s, ...) frik_centerprint = #73; 
void (entity e) frik_setspawnparms = #78; 
void (float to, float f) frik_WriteByte = #52; 
void (float to, float f) frik_WriteChar = #53; 
void (float to, float f) frik_WriteShort = #54; 
void (float to, float f) frik_WriteLong = #55; 
void (float to, float f) frik_WriteCoord = #56; 
void (float to, float f) frik_WriteAngle = #57; 
void (float to, string s) frik_WriteString = #58; 
void (float to, entity s) frik_WriteEntity = #59; 
void (entity client, string s, ...) frik_big_centerprint = #73; 
.float wallhug;
.float keys;
.float oldkeys;
.float ishuman;
.float b_frags;
.float b_clientno;
.float b_shirt;
.float b_pants;
.float ai_time;
.float b_sound;
.float missile_speed;
.float portal_time;
.float b_skill;
.float switch_wallhug;
.float b_aiflags;
.float b_num;
.float b_chattime;
.float b_menu;
.float b_menu_time;
.float b_menu_value;
.float route_failed;
.float dyn_flags;
.float dyn_time;
.float dyn_plat;
.entity temp_way;
.entity last_way;
.entity phys_obj;
.entity target1;
.entity target2;
.entity target3;
.entity target4;
.entity _next;
.entity _last;
.entity current_way;
.vector b_angle;
.float b_angle_y;
.float b_angle_z;
.vector mouse_emu;
.float mouse_emu_y;
.float mouse_emu_z;
.vector obs_dir;
.float obs_dir_y;
.float obs_dir_z;
.vector movevect;
.float movevect_y;
.float movevect_z;
.vector b_dir;
.float b_dir_y;
.float b_dir_z;
.vector dyn_dest;
.float dyn_dest_y;
.float dyn_dest_z;
float SVC_UPDATEFRAGS    = 14;
float SVC_UPDATECOLORS    = 17;
float AI_POINT_TYPES    = 29152;
float AI_READAHEAD_TYPES    = 36528;
float AI_IGNORE_TYPES    = 4864;
float active_clients;
float max_clients;
float real_frametime;
float bot_count;
float b_options;
float waypoint_mode;
float dump_mode;
float waypoints;
float direct_route;
float sv_friction;
float sv_gravity;
float sv_accelerate;
float sv_maxspeed;
float sv_stopspeed;
entity fixer;
entity route_table;
entity b_temp1;
entity b_temp2;
entity b_temp3;
entity player_head;
entity phys_head;
entity way_head;
float busy_waypoints;
float saved_bots;
float saved_skills1;
float saved_skills2;
float current_bots;
float(float clientno) ClientBitFlag;
float() ClientNextAvailable;
void(float whichteam, float whatbot, float whatskill) BotConnect;
void(entity bot) BotDisconnect;
void(float clientno) BotInvalidClientNo;
void(entity who) UpdateClient;
void() DynamicWaypoint;
entity(vector org) make_waypoint;
void() ClearAllWays;
void() FixWaypoints;
float() begin_route;
void(entity this, float direct) bot_get_path;
void() WaypointThink;
entity(entity start) FindWayPoint;
float(entity e) bot_can_rj;
void() bot_jump;
void() frik_bot_roam;
float(vector weird) frik_walkmove;
void() frik_movetogoal;
void() frik_obstacles;
float(float flag) frik_recognize_plat;
float(vector sdir) frik_KeysForDir;
void(vector whichway, float danger) frik_obstructed;
void() SV_Physics_Client;
void() SV_ClientThink;
void() CL_KeyMove;
string() PickARandomName;
float(entity targ) fov;
float(float y1, float y2) angcomp;
float(entity targ1, entity targ2) wisible;
float(entity targ) sisible;
float(entity targ) fisible;
vector(entity ent) realorigin;
void(entity ent) target_drop;
void(entity ent) target_add;
void() KickABot;
void() BotImpulses;
void(entity targ, float success) bot_lost;
string(float r) BotName;
float(float v) frik_anglemod;
void() bot_chat;
void(float tpic) bot_start_topic;
void() bot_way_edit;
void() bot_menu_display;
void (entity e, float chan, string samp, float vol, float atten) frik_sound;
void (entity client, string s) frik_stuffcmd;
void (...) frik_sprint;
vector (entity e, float speed) frik_aim;
void (entity client, string s, ...) frik_centerprint;
void (entity e) frik_setspawnparms;
void (float to, float f) frik_WriteByte;
void (float to, float f) frik_WriteChar;
void (float to, float f) frik_WriteShort;
void (float to, float f) frik_WriteLong;
void (float to, float f) frik_WriteCoord;
void (float to, float f) frik_WriteAngle;
void (float to, string s) frik_WriteString;
void (float to, entity s) frik_WriteEntity;
void (entity client, string s, ...) frik_big_centerprint;

void(entity client, string s) stuffcmd =
{

	if ((client.ishuman == IT_SHOTGUN))
	{
		frik_stuffcmd(client, s);
	}
	b_temp1 = player_head;
	while (b_temp1)
	{
		if ((b_temp1.classname == "botcam"))
		{
			if (((b_temp1.enemy == client) && b_temp1.ishuman))
			{
				frik_stuffcmd(b_temp1, s);
			}
		}
		b_temp1 = b_temp1._next;
	}
};

void(entity e) setspawnparms =
{
	if ((e.ishuman == IT_SHOTGUN))
	{
		frik_setspawnparms(e);
	}
	else
	{
		b_temp1 = player_head;
		while (b_temp1)
		{
			if (b_temp1.ishuman)
			{
				frik_setspawnparms(b_temp1);
				return;
			}
			b_temp1 = b_temp1._next;
		}
		SetNewParms();
	}
};

void(entity client, string s) sprint =
{
	if ((client.ishuman == IT_SHOTGUN))
	{
		frik_sprint(client, s);
	}
	b_temp1 = player_head;
	while (b_temp1)
	{
		if ((b_temp1.classname == "botcam"))
		{
			if (((b_temp1.enemy == client) && b_temp1.ishuman))
			{
				frik_sprint(b_temp1, s);
			}
		}
		b_temp1 = b_temp1._next;
	}
};

void(string s) bprint =
{
	_bprint(s);
};

void(entity client, string s) centerprint =
{
	if ((client.ishuman == IT_SHOTGUN))
	{
		frik_centerprint(client, s);
	}
	b_temp1 = player_head;
	while (b_temp1)
	{
		if ((b_temp1.classname == "botcam"))
		{
			if (((b_temp1.enemy == client) && b_temp1.ishuman))
			{
				frik_centerprint(b_temp1, s);
			}
		}
		b_temp1 = b_temp1._next;
	}
};

void(entity e, float sped) aim =
{
	e.missile_speed = sped;
	return (frik_aim(e, sped));
};

void(entity e, float chan, string samp, float vol, float atten) sound =
{

	frik_sound(e, chan, samp, vol, atten);
	if ((samp == "items/inv3.wav"))
	{
		return;
	}
	else
	{
		if ((e.classname == "player"))
		{
			e.b_sound = (time + IT_SHOTGUN);
		}
		else
		{
			if ((other.classname == "player"))
			{
				other.b_sound = (time + IT_SHOTGUN);
			}
		}
	}
};

void(float to, float f) WriteByte =
{
	if (((to == IT_SHOTGUN) && (msg_entity.ishuman != IT_SHOTGUN)))
	{
		return;
	}
	frik_WriteByte(to, f);
};

void(float to, float f) WriteChar =
{
	if (((to == IT_SHOTGUN) && (msg_entity.ishuman != IT_SHOTGUN)))
	{
		return;
	}
	frik_WriteChar(to, f);
};

void(float to, float f) WriteShort =
{
	if (((to == IT_SHOTGUN) && (msg_entity.ishuman != IT_SHOTGUN)))
	{
		return;
	}
	frik_WriteShort(to, f);
};

void(float to, float f) WriteLong =
{
	if (((to == IT_SHOTGUN) && (msg_entity.ishuman != IT_SHOTGUN)))
	{
		return;
	}
	frik_WriteLong(to, f);
};

void(float to, float f) WriteCoord =
{
	if (((to == IT_SHOTGUN) && (msg_entity.ishuman != IT_SHOTGUN)))
	{
		return;
	}
	frik_WriteCoord(to, f);
};

void(float to, float f) WriteAngle =
{
	if (((to == IT_SHOTGUN) && (msg_entity.ishuman != IT_SHOTGUN)))
	{
		return;
	}
	frik_WriteAngle(to, f);
};

void(float to, string s) WriteString =
{
	if (((to == IT_SHOTGUN) && (msg_entity.ishuman != IT_SHOTGUN)))
	{
		return;
	}
	frik_WriteString(to, s);
};

void(float to, entity s) WriteEntity =
{
	if (((to == IT_SHOTGUN) && (msg_entity.ishuman != IT_SHOTGUN)))
	{
		return;
	}
	frik_WriteEntity(to, s);
};

float() botcam =
{
	if ((self.classname != "botcam"))
	{
		return (TE_SPIKE);
	}
	setorigin(self, self.enemy.origin);
	self.items = self.enemy.items;
	self.weapon = self.enemy.weapon;
	self.weaponmodel = self.enemy.weaponmodel;
	self.currentammo = self.enemy.currentammo;
	self.weaponframe = self.enemy.weaponframe;
	self.ammo_shells = self.enemy.ammo_shells;
	self.ammo_nails = self.enemy.ammo_nails;
	self.ammo_rockets = self.enemy.ammo_rockets;
	self.ammo_cells = self.enemy.ammo_cells;
	self.view_ofs = self.enemy.view_ofs;
	self.health = self.enemy.health;
	self.armorvalue = self.enemy.armorvalue;
	self.dmg_take = self.enemy.dmg_take;
	self.dmg_save = self.enemy.dmg_save;
	self.dmg_inflictor = self.enemy.dmg_inflictor;
	self.punchangle = self.enemy.punchangle;
	self.deadflag = self.enemy.deadflag;
	msg_entity = self;
	WriteByte(IT_SHOTGUN, TE_LIGHTNING1);
	WriteEntity(IT_SHOTGUN, self.enemy);
	WriteByte(IT_SHOTGUN, TE_LAVASPLASH);
	WriteAngle(IT_SHOTGUN, self.enemy.v_angle_x);
	WriteAngle(IT_SHOTGUN, self.enemy.v_angle_y);
	WriteAngle(IT_SHOTGUN, self.enemy.v_angle_z);
	self.modelindex = TE_SPIKE;
	self.impulse = TE_SPIKE;
	return (IT_SHOTGUN);
};

void() botcam_u =
{
	if ((self.classname != "botcam"))
	{
		self.enemy = player_head;
	}
	else
	{
		do
		{
			self.enemy = self.enemy._next;

		} while ((self.enemy.classname == "botcam"));
	}
	if ((self.enemy == self))
	{
		do
		{
			self.enemy = self.enemy._next;

		} while ((self.enemy.classname == "botcam"));
	}
	self.classname = "botcam";
	self.solid = TE_SPIKE;
	self.movetype = TE_SPIKE;
	self.takedamage = TE_SPIKE;
	if (!self.enemy)
	{
		sprint(self, "No one left to track!\n");
		msg_entity = self;
		WriteByte(IT_SHOTGUN, TE_LIGHTNING1);
		WriteEntity(IT_SHOTGUN, self);
		PutClientInServer();
		return;
	}
	if (!self.enemy.ishuman)
	{
		self.enemy.dmg_take = TE_SPIKE;
		self.enemy.dmg_save = TE_SPIKE;
	}
	sprint(self, "Now tracking ");
	sprint(self, self.enemy.netname);
	sprint(self, "\n");
};

void() ClientFixRankings =
{
	local float cno;

	if ((self.switch_wallhug > time))
	{
		return;
	}
	self.switch_wallhug = TE_SPIKE;
	b_temp2 = nextent(world);
	cno = TE_SPIKE;
	while ((cno < max_clients))
	{
		if ((!b_temp2.ishuman && (active_clients & ClientBitFlag(cno))))
		{
			UpdateClient(b_temp2);
		}
		cno = cno + IT_SHOTGUN;
		b_temp2 = nextent(b_temp2);
	}
};

void() ClientInRankings =
{
	local float cno;

	cno = self.colormap - IT_SHOTGUN;
	BotInvalidClientNo(cno);
	if (player_head)
	{
		player_head._last = self;
	}
	self._next = player_head;
	self._last = world;
	player_head = self;
	if (!self.phys_obj)
	{
		b_temp2 = phys_head;
		while (((b_temp2 != world) && (b_temp2.owner != self)))
		{
			b_temp2 = b_temp2._next;
		}
		self.phys_obj = b_temp2;
	}
	if ((self.ishuman == IT_SUPER_SHOTGUN))
	{
		self.ishuman = TE_SPIKE;
		return;
	}
	active_clients = active_clients | ClientBitFlag(cno);
	self.b_clientno = cno;
	self.ishuman = IT_SHOTGUN;
	self.switch_wallhug = (time + IT_SHOTGUN);
};

void() ClientDisconnected =
{
	if ((player_head == self))
	{
		player_head = self._next;
	}
	if (self._next)
	{
		self._next._last = self._last;
	}
	if (self._last)
	{
		self._last._next = self._next;
	}
	active_clients = active_clients - (active_clients & ClientBitFlag(self.b_clientno));
};

float() BotPreFrame =
{
	if ((self.b_clientno == CONTENT_EMPTY))
	{
		return (IT_SHOTGUN);
	}
	if (self.ishuman)
	{
		if (self.switch_wallhug)
		{
			ClientFixRankings();
		}
		if ((self.classname == "botcam"))
		{
			return (IT_SHOTGUN);
		}
	}
	if ((self.b_frags != self.frags))
	{
		if ((self.b_frags > self.frags))
		{
			if ((pointcontents(self.origin) == CONTENT_LAVA))
			{
				bot_start_topic(TE_LAVASPLASH);
			}
			else
			{
				bot_start_topic(TE_LIGHTNING3);
			}
		}
		else
		{
			bot_start_topic(IT_SUPER_SHOTGUN);
		}
		self.b_frags = self.frags;
	}
	DynamicWaypoint();
	return (TE_SPIKE);
};

float() BotPostFrame =
{
	if ((self.b_clientno == CONTENT_EMPTY))
	{
		return (IT_SHOTGUN);
	}
	if (self.ishuman)
	{
		if ((waypoint_mode > TE_EXPLOSION))
		{
			bot_menu_display();
		}
		BotImpulses();
		if (botcam())
		{
			return (IT_SHOTGUN);
		}
	}
	return (TE_SPIKE);
};

void(string h) BotSay =
{
	WriteByte(IT_SUPER_SHOTGUN, IT_SUPER_NAILGUN);
	WriteByte(IT_SUPER_SHOTGUN, IT_SHOTGUN);
	WriteString(IT_SUPER_SHOTGUN, self.netname);
	WriteByte(IT_SUPER_SHOTGUN, IT_SUPER_NAILGUN);
	WriteByte(IT_SUPER_SHOTGUN, IT_SUPER_SHOTGUN);
	WriteString(IT_SUPER_SHOTGUN, h);
};

void() BotSayInit =
{
	WriteByte(IT_SUPER_SHOTGUN, IT_SUPER_NAILGUN);
	WriteByte(IT_SUPER_SHOTGUN, IT_SHOTGUN);
	WriteString(IT_SUPER_SHOTGUN, self.netname);
};

void(string h) BotSay2 =
{
	WriteByte(IT_SUPER_SHOTGUN, IT_SUPER_NAILGUN);
	WriteByte(IT_SUPER_SHOTGUN, IT_SUPER_SHOTGUN);
	WriteString(IT_SUPER_SHOTGUN, h);
};

void(string h) BotSayTeam =
{
	local entity t;

	if (!teamplay)
	{
		return;
	}
	t = player_head;
	while (t)
	{
		if ((t.team == self.team))
		{
			msg_entity = t;
			WriteByte(IT_SHOTGUN, IT_SUPER_NAILGUN);
			WriteByte(IT_SHOTGUN, IT_SHOTGUN);
			WriteByte(IT_SHOTGUN, 40);
			WriteString(IT_SHOTGUN, self.netname);
			WriteByte(IT_SHOTGUN, IT_SUPER_NAILGUN);
			WriteByte(IT_SHOTGUN, IT_SUPER_SHOTGUN);
			WriteByte(IT_SHOTGUN, 41);
			WriteString(IT_SHOTGUN, h);
		}
		t = t._next;
	}
};

void() BotInit =
{
	local entity ent;
	local entity fisent;
	local float numents;

	ent = nextent(world);
	max_clients = TE_SPIKE;
	while ((ent != world))
	{
		max_clients = max_clients + IT_SHOTGUN;
		ent = nextent(ent);
	}
	if ((max_clients > IT_GRENADE_LAUNCHER))
	{
		max_clients = IT_GRENADE_LAUNCHER;
	}
	ent = nextent(world);
	fisent = world;
	while ((numents < max_clients))
	{
		phys_head = spawn();
		if (fisent)
		{
			fisent._next = phys_head;
		}
		phys_head._last = fisent;
		fisent = phys_head;
		ent.phys_obj = phys_head;
		phys_head.classname = "phys_obj";
		phys_head.owner = ent;
		numents = numents + IT_SHOTGUN;
		ent = nextent(ent);
	}
	precache_model(/*2237i*/"progs/s_light.spr");
	precache_model(/*2255i*/"progs/s_bubble.spr");
};

void(entity who) UpdateClient =
{
	WriteByte(IT_SUPER_SHOTGUN, 13);
	WriteByte(IT_SUPER_SHOTGUN, who.b_clientno);
	WriteString(IT_SUPER_SHOTGUN, who.netname);
	WriteByte(IT_SUPER_SHOTGUN, SVC_UPDATECOLORS);
	WriteByte(IT_SUPER_SHOTGUN, who.b_clientno);
	WriteByte(IT_SUPER_SHOTGUN, ((who.b_shirt * IT_GRENADE_LAUNCHER) + who.b_pants));
	WriteByte(IT_SUPER_SHOTGUN, SVC_UPDATEFRAGS);
	WriteByte(IT_SUPER_SHOTGUN, who.b_clientno);
	WriteShort(IT_SUPER_SHOTGUN, who.frags);
};

float(float clientno) ClientBitFlag =
{

	if ((clientno == TE_SPIKE))
	{
		return (IT_SHOTGUN);
	}
	else
	{
		if ((clientno == IT_SHOTGUN))
		{
			return (IT_SUPER_SHOTGUN);
		}
		else
		{
			if ((clientno == IT_SUPER_SHOTGUN))
			{
				return (IT_NAILGUN);
			}
			else
			{
				if ((clientno == TE_EXPLOSION))
				{
					return (IT_SUPER_NAILGUN);
				}
				else
				{
					if ((clientno == IT_NAILGUN))
					{
						return (IT_GRENADE_LAUNCHER);
					}
					else
					{
						if ((clientno == TE_LIGHTNING1))
						{
							return (IT_ROCKET_LAUNCHER);
						}
						else
						{
							if ((clientno == TE_LIGHTNING2))
							{
								return (IT_LIGHTNING);
							}
							else
							{
								if ((clientno == TE_WIZSPIKE))
								{
									return (IT_EXTRA_WEAPON);
								}
								else
								{
									if ((clientno == IT_SUPER_NAILGUN))
									{
										return (IT_SHELLS);
									}
									else
									{
										if ((clientno == TE_LIGHTNING3))
										{
											return (IT_NAILS);
										}
										else
										{
											if ((clientno == TE_LAVASPLASH))
											{
												return (IT_ROCKETS);
											}
											else
											{
												if ((clientno == TE_TELEPORT))
												{
													return (IT_CELLS);
												}
												else
												{
													if ((clientno == 12))
													{
														return (IT_AXE);
													}
													else
													{
														if ((clientno == 13))
														{
															return (IT_ARMOR1);
														}
														else
														{
															if ((clientno == SVC_UPDATEFRAGS))
															{
																return (IT_ARMOR2);
															}
															else
															{
																if ((clientno == 15))
																{
																	return (IT_ARMOR3);
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return (TE_SPIKE);
};

float() ClientNextAvailable =
{
	local float clientno;

	clientno = max_clients;
	while ((clientno > TE_SPIKE))
	{
		clientno = clientno - IT_SHOTGUN;
		if (!(active_clients & ClientBitFlag(clientno)))
		{
			return (clientno);
		}
	}
	return (CONTENT_EMPTY);
};

void(entity e1, entity e2, float flag) DeveloperLightning =
{
	WriteByte(TE_SPIKE, SVC_TEMPENTITY);
	if (flag)
	{
		WriteByte(TE_SPIKE, TE_LIGHTNING2);
	}
	else
	{
		WriteByte(TE_SPIKE, 13);
	}
	WriteEntity(TE_SPIKE, e2);
	WriteCoord(TE_SPIKE, e1.origin_x);
	WriteCoord(TE_SPIKE, e1.origin_y);
	WriteCoord(TE_SPIKE, e1.origin_z);
	WriteCoord(TE_SPIKE, e2.origin_x);
	WriteCoord(TE_SPIKE, e2.origin_y);
	WriteCoord(TE_SPIKE, e2.origin_z);
};

float(float tcolor) FindAnotherColor =
{
	local float bestbet;
	local float scolor;
	local float pcount;
	local float bestp;

	bestbet = CONTENT_EMPTY;
	bestp = IT_GRENADE_LAUNCHER;
	while ((scolor < SVC_UPDATEFRAGS))
	{
		if ((scolor != tcolor))
		{
			b_temp2 = player_head;
			pcount = TE_SPIKE;
			while ((b_temp2 != world))
			{
				if ((b_temp2.team == (scolor + IT_SHOTGUN)))
				{
					pcount = pcount + IT_SHOTGUN;
				}
				b_temp2 = b_temp2._next;
			}
			if (((pcount < bestp) && pcount))
			{
				bestbet = scolor;
				bestp = pcount;
			}
		}
		scolor = scolor + IT_SHOTGUN;
	}
	if ((bestbet < TE_SPIKE))
	{
		bestbet = tcolor;
		while ((bestbet == tcolor))
		{
			bestbet = floor((random() * 13));
		}
	}
	return (bestbet);
};

entity(float num) GetClientEntity =
{
	local entity upsy;

	upsy = world;
	num = num + IT_SHOTGUN;
	while ((num > TE_SPIKE))
	{
		num = num - IT_SHOTGUN;
		upsy = nextent(upsy);
	}
	return (upsy);
};

void(float whichteam, float whatbot, float whatskill) BotConnect =
{
	local float f;
	local string h;
	local entity uself;

	f = ClientNextAvailable();
	uself = self;
	if ((f == CONTENT_EMPTY))
	{
		bprint("Unable to connect a bot, server is full.\n");
		return;
	}
	bot_count = bot_count + IT_SHOTGUN;
	self = GetClientEntity(f);
	if (!saved_bots)
	{
		bot_start_topic(IT_SHOTGUN);
	}
	self.b_clientno = f;
	self.colormap = (f + IT_SHOTGUN);
	if (whatbot)
	{
		self.netname = BotName(whatbot);
	}
	else
	{
		self.netname = PickARandomName();
	}
	whatskill = rint(whatskill);
	if ((whatskill > TE_EXPLOSION))
	{
		whatskill = TE_EXPLOSION;
	}
	else
	{
		if ((whatskill < TE_SPIKE))
		{
			whatskill = TE_SPIKE;
		}
	}
	self.b_skill = whatskill;
	if (teamplay)
	{
		self.b_pants = (uself.team - IT_SHOTGUN);
		self.b_shirt = self.b_pants;
	}
	if ((teamplay && !coop))
	{
		if (whichteam)
		{
			self.b_pants = FindAnotherColor((uself.team - IT_SHOTGUN));
		}
		else
		{
			self.b_pants = (uself.team - IT_SHOTGUN);
		}
		self.b_shirt = self.b_pants;
	}
	self.team = (self.b_pants + IT_SHOTGUN);
	UpdateClient(self);
	SetNewParms();
	self.ishuman = IT_SUPER_SHOTGUN;
	ClientConnect();
	PutClientInServer();
	active_clients = active_clients | ClientBitFlag(f);
	f = ClientBitFlag((self.b_num - IT_SHOTGUN));
	current_bots = current_bots | f;
	if ((self.b_num <= IT_SUPER_NAILGUN))
	{
		saved_skills1 = (saved_skills1 & (65536 - (TE_EXPLOSION * f))) | (self.b_skill * f);
	}
	else
	{
		f = ClientBitFlag((self.b_num - TE_LIGHTNING3));
		saved_skills2 = (saved_skills2 & (65536 - (TE_EXPLOSION * f))) | (self.b_skill * f);
	}
	h = ftos(current_bots);
	cvar_set(/*2423i*/"scratch1", h);
	h = ftos(saved_skills1);
	cvar_set(/*2432i*/"scratch2", h);
	h = ftos(saved_skills2);
	cvar_set(/*2441i*/"scratch3", h);
	self = uself;
};

void(entity bot) BotDisconnect =
{
	local string h;
	local entity uself;

	uself = self;
	self = bot;
	bot_count = bot_count - IT_SHOTGUN;
	current_bots = current_bots - (current_bots & ClientBitFlag((self.b_num - IT_SHOTGUN)));
	h = ftos(current_bots);
	cvar_set(/*2423i*/"scratch1", h);
	ClientDisconnect();
	if ((self.b_clientno != CONTENT_EMPTY))
	{
		self.frags = TE_SPIKE;
		self.b_frags = TE_SPIKE;
		self.netname = "";
		self.classname = "";
		self.health = TE_SPIKE;
		self.items = TE_SPIKE;
		self.armorvalue = TE_SPIKE;
		self.weaponmodel = "";
		self.b_pants = TE_SPIKE;
		self.b_shirt = TE_SPIKE;
		self.ammo_cells = TE_SPIKE;
		self.ammo_rockets = TE_SPIKE;
		self.ammo_nails = TE_SPIKE;
		self.ammo_shells = TE_SPIKE;
		UpdateClient(self);
		active_clients = active_clients - (active_clients & ClientBitFlag(self.b_clientno));
		self.b_clientno = CONTENT_EMPTY;
	}
	self = uself;
};

void(float clientno) BotInvalidClientNo =
{
	local entity bot;

	bot = GetClientEntity(clientno);
	if ((bot.b_clientno > TE_SPIKE))
	{
		if ((active_clients & ClientBitFlag(self.b_clientno)))
		{
			bot.b_clientno = CONTENT_EMPTY;
			BotDisconnect(bot);
			active_clients = active_clients | ClientBitFlag(self.b_clientno);
			BotConnect(TE_SPIKE, bot.b_num, bot.b_skill);
			return;
		}
	}
};

void() LoadWaypoint =
{
	local vector org;
	local entity tep;
	local float r;

	org_x = cvar(/*2497i*/"saved1");
	org_y = cvar(/*2504i*/"saved2");
	org_z = cvar(/*2511i*/"saved3");
	tep = make_waypoint(org);
	r = cvar(/*2518i*/"saved4");
	tep.b_aiflags = floor((r / IT_NAILGUN));
	tep.b_pants = cvar(/*2423i*/"scratch1");
	tep.b_skill = cvar(/*2432i*/"scratch2");
	tep.b_shirt = cvar(/*2441i*/"scratch3");
	tep.b_frags = cvar(/*2525i*/"scratch4");
};

void() bot_return =
{
	if ((time > IT_SUPER_SHOTGUN))
	{
		if (((waypoint_mode == IT_SHOTGUN) || (waypoint_mode == TE_EXPLOSION)))
		{
			if ((saved_bots & IT_SHOTGUN))
			{
				BotConnect(TE_SPIKE, IT_SHOTGUN, (saved_skills1 & TE_EXPLOSION));
			}
			if ((saved_bots & IT_SUPER_SHOTGUN))
			{
				BotConnect(TE_SPIKE, IT_SUPER_SHOTGUN, ((saved_skills1 & 12) / IT_NAILGUN));
			}
			if ((saved_bots & IT_NAILGUN))
			{
				BotConnect(TE_SPIKE, TE_EXPLOSION, ((saved_skills1 & 48) / IT_GRENADE_LAUNCHER));
			}
			if ((saved_bots & IT_SUPER_NAILGUN))
			{
				BotConnect(TE_SPIKE, IT_NAILGUN, ((saved_skills1 & 192) / IT_LIGHTNING));
			}
			if ((saved_bots & IT_GRENADE_LAUNCHER))
			{
				BotConnect(TE_SPIKE, TE_LIGHTNING1, ((saved_skills1 & 768) / IT_SHELLS));
			}
			if ((saved_bots & IT_ROCKET_LAUNCHER))
			{
				BotConnect(TE_SPIKE, TE_LIGHTNING2, ((saved_skills1 & 3072) / IT_ROCKETS));
			}
			if ((saved_bots & IT_LIGHTNING))
			{
				BotConnect(TE_SPIKE, TE_WIZSPIKE, ((saved_skills1 & 12288) / IT_AXE));
			}
			if ((saved_bots & IT_EXTRA_WEAPON))
			{
				BotConnect(TE_SPIKE, IT_SUPER_NAILGUN, ((saved_skills1 & 49152) / IT_ARMOR2));
			}
			if ((saved_bots & IT_SHELLS))
			{
				BotConnect(TE_SPIKE, TE_LIGHTNING3, (saved_skills2 & TE_EXPLOSION));
			}
			if ((saved_bots & IT_NAILS))
			{
				BotConnect(TE_SPIKE, TE_LAVASPLASH, ((saved_skills2 & 12) / IT_NAILGUN));
			}
			if ((saved_bots & IT_ROCKETS))
			{
				BotConnect(TE_SPIKE, TE_TELEPORT, ((saved_skills2 & 48) / IT_GRENADE_LAUNCHER));
			}
			if ((saved_bots & IT_CELLS))
			{
				BotConnect(TE_SPIKE, 12, ((saved_skills2 & 192) / IT_LIGHTNING));
			}
			if ((saved_bots & IT_AXE))
			{
				BotConnect(TE_SPIKE, 13, ((saved_skills2 & 768) / IT_SHELLS));
			}
			if ((saved_bots & IT_ARMOR1))
			{
				BotConnect(TE_SPIKE, SVC_UPDATEFRAGS, ((saved_skills2 & 3072) / IT_ROCKETS));
			}
			if ((saved_bots & IT_ARMOR2))
			{
				BotConnect(TE_SPIKE, 15, ((saved_skills2 & 12288) / IT_AXE));
			}
			if ((saved_bots & IT_ARMOR3))
			{
				BotConnect(TE_SPIKE, IT_GRENADE_LAUNCHER, ((saved_skills2 & 49152) / IT_ARMOR2));
			}
			saved_bots = TE_SPIKE;
		}
	}
};

void() WaypointWatch =
{
	local float bigboobs;
	local string h;

	if ((framecount < IT_NAILGUN))
	{
		return;
	}
	if ((max_clients < IT_SUPER_SHOTGUN))
	{
		return;
	}
	if ((waypoint_mode != TE_SPIKE))
	{
		bigboobs = cvar(/*2518i*/"saved4");
		if ((bigboobs != TE_SPIKE))
		{
			if (((bigboobs & TE_EXPLOSION) == IT_SHOTGUN))
			{
				ClearAllWays();
			}
			else
			{
				if (((bigboobs & TE_EXPLOSION) == TE_EXPLOSION))
				{
					FixWaypoints();
					h = ftos(b_options);
					cvar_set(/*2497i*/"saved1", h);
					cvar_set(/*2518i*/"saved4", /*2558i*/"0");
					cvar_set(/*2423i*/"scratch1", /*2558i*/"0");
					waypoint_mode = TE_EXPLOSION;
					return;
				}
			}
			LoadWaypoint();
			waypoint_mode = IT_SUPER_SHOTGUN;
			cvar_set(/*2518i*/"saved4", /*2558i*/"0");
		}
	}
	else
	{
		b_options = cvar(/*2497i*/"saved1");
		if ((coop || (b_options & IT_SHOTGUN)))
		{
			saved_bots = cvar(/*2423i*/"scratch1");
			saved_skills1 = cvar(/*2432i*/"scratch2");
			saved_skills2 = cvar(/*2441i*/"scratch3");
		}
		cvar_set(/*2518i*/"saved4", /*2558i*/"0");
		if ((max_clients > IT_SHOTGUN))
		{
			localcmd(/*2560i*/"exec maps/");
			localcmd(mapname);
			localcmd(/*2571i*/".way\n");
			waypoint_mode = IT_SHOTGUN;
			bot_map_load();
		}
		else
		{
			waypoint_mode = TE_EXPLOSION;
		}
	}
};

void() BotFrame =
{
	local float num;

	sv_maxspeed = cvar(/*2591i*/"sv_maxspeed");
	sv_gravity = cvar(/*2603i*/"sv_gravity");
	sv_friction = cvar(/*2614i*/"sv_friction");
	sv_accelerate = cvar(/*2626i*/"sv_accelerate");
	sv_stopspeed = cvar(/*2640i*/"sv_stopspeed");
	real_frametime = frametime;
	self = nextent(world);
	num = TE_SPIKE;
	while ((num < max_clients))
	{
		if ((self.ishuman == TE_SPIKE))
		{
			if ((active_clients & ClientBitFlag(num)))
			{
				frik_obstacles();
				CL_KeyMove();
				SV_ClientThink();
				SV_Physics_Client();
			}
		}
		self = nextent(self);
		num = num + IT_SHOTGUN;
	}
	WaypointWatch();
	if (saved_bots)
	{
		bot_return();
	}
};

void() BotImpulses =
{
	local float f;

	if ((self.impulse == 100))
	{
		f = cvar(/*2662i*/"skill");
		BotConnect(TE_SPIKE, TE_SPIKE, f);
	}
	else
	{
		if ((self.impulse == 101))
		{
			f = cvar(/*2662i*/"skill");
			if ((deathmatch == IT_SUPER_SHOTGUN))
			{
				BotConnect(TE_SPIKE, TE_SPIKE, f);
			}
			else
			{
				BotConnect(IT_SHOTGUN, TE_SPIKE, f);
			}
		}
		else
		{
			if ((self.impulse == 102))
			{
				KickABot();
			}
			else
			{
				if ((self.impulse == 103))
				{
					botcam_u();
				}
				else
				{
					if ((self.impulse == 104))
					{
						bot_way_edit();
					}
					else
					{
						return;
					}
				}
			}
		}
	}
	self.impulse = TE_SPIKE;
};
