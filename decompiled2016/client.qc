//Decompiled code. Please respect the original copyright.
void() player_pain;
void(vector org) spawn_tfog;
void(vector org, entity death_owner) spawn_tdeath;
void(entity client) Setup_Slowmo;
void(entity client) Medal;
float modelindex_eyes;
float modelindex_player;
string nextmap;

void() info_intermission =
{
	self.angles = self.mangle;
};

void() SetChangeParms =
{
	if ((self.health <= TE_SPIKE))
	{
		SetNewParms();
		return;
	}
	if ((self.health > self.max_health))
	{
		self.health = self.max_health;
	}
	parm1 = self.items;
	parm2 = self.health;
	parm3 = self.armorvalue;
	parm4 = 12;
	parm6 = self.ammo_rockets_real;
	parm7 = self.ammo_cells_real;
	parm8 = self.weapon;
	parm9 = self.armortype;
	parm10 = self.exshells;
	parm11 = self.exnails;
	parm12 = self.exrockets;
	parm14 = self.ammo_shells2;
	parm15 = self.exshells2;
	if ((deathmatch != TE_EXPLOSION))
	{
		parm16 = self.nade_lives;
	}
};

void() SetNewParms =
{
	parm1 = TE_LIGHTNING1;
	if ((deathmatch != TE_EXPLOSION))
	{
		parm2 = 130;
	}
	else
	{
		parm2 = SVC_INTERMISSION;
	}
	parm3 = TE_SPIKE;
	parm4 = TE_SPIKE;
	parm6 = TE_SPIKE;
	parm7 = TE_SPIKE;
	parm8 = IT_NAILGUN;
	parm9 = TE_SPIKE;
	parm10 = 40;
	parm11 = 560;
	parm12 = TE_SPIKE;
	parm14 = SVC_INTERMISSION;
	parm15 = 60;
	if ((deathmatch != TE_EXPLOSION))
	{
		parm16 = IT_NAILGUN;
	}
};

void() DecodeLevelParms =
{
	if (!deathmatch)
	{
		if ((world.model == "maps/start.bsp"))
		{
			SetNewParms();
		}
	}
	self.items = parm1;
	self.health = parm2;
	self.armorvalue = parm3;
	self.ammo_shells_real = parm4;
	self.ammo_rockets_real = parm6;
	self.ammo_cells_real = parm7;
	self.weapon = parm8;
	self.armortype = parm9;
	self.ammo_hshells = TE_SPIKE;
	self.exhshells = TE_SPIKE;
	self.exshells = TE_SPIKE;
	self.exnails = TE_SPIKE;
	self.exrockets = TE_SPIKE;
	self.pfov = 90;
	self.ammo_shells2 = TE_SPIKE;
	self.exshells2 = TE_SPIKE;
	if ((deathmatch != TE_EXPLOSION))
	{
		self.nade_lives = parm16;
		self.plasma_lives = parm16;
	}
};

entity() FindIntermission =
{
	local entity spot;
	local float cyc;

	spot = find(world, classname, /*20166i*/"info_intermission");
	if (spot)
	{
		cyc = random() * IT_NAILGUN;
		while ((cyc > IT_SHOTGUN))
		{
			spot = find(spot, classname, /*20166i*/"info_intermission");
			if (!spot)
			{
				spot = find(spot, classname, /*20166i*/"info_intermission");
			}
			cyc = cyc - IT_SHOTGUN;
		}
		return (spot);
	}
	spot = find(world, classname, /*20184i*/"info_player_start");
	if (spot)
	{
		return (spot);
	}
	objerror(/*20202i*/"FindIntermission: no spot");
	return (world);
};

void() GotoNextMap =
{
	local string newmap;

	if ((cvar(/*20245i*/"samelevel") == IT_SHOTGUN))
	{
		changelevel(mapname);
	}
	else
	{
		newmap = stringserverinfokey(mapname);
		if ((newmap != ""))
		{
			changelevel(newmap);
		}
		else
		{
			changelevel(nextmap);
		}
	}
};

void() ExitIntermission =
{
	if (deathmatch)
	{
		GotoNextMap();
		return;
	}
	intermission_exittime = time + IT_SHOTGUN;
	intermission_running = intermission_running + IT_SHOTGUN;
	if ((intermission_running == IT_SUPER_SHOTGUN))
	{
		if ((world.model == "maps/e1m7.bsp"))
		{
			ENG_SwitchTrack(IT_SUPER_SHOTGUN, TE_EXPLOSION);
			if (!cvar(/*20282i*/"registered"))
			{
				WriteByte(IT_SUPER_SHOTGUN, SVC_FINALE);
				WriteString(IT_SUPER_SHOTGUN, "As the corpse of the monstrous entity\nChthon sinks back into the lava whence\nit rose, you grip the Rune of Earth\nMagic tightly. Now that you have\nconquered the Dimension of the Doomed,\nrealm of Earth Magic, you are ready to\ncomplete your task in the other three\nhaunted lands of Quake. Or are you? If\nyou don't register Quake, you'll never\nknow what awaits you in the Realm of\nBlack Magic, the Netherworld, and the\nElder World!");
			}
			else
			{
				WriteByte(IT_SUPER_SHOTGUN, SVC_FINALE);
				WriteString(IT_SUPER_SHOTGUN, "As the corpse of the monstrous entity\nChthon sinks back into the lava whence\nit rose, you grip the Rune of Earth\nMagic tightly. Now that you have\nconquered the Dimension of the Doomed,\nrealm of Earth Magic, you are ready to\ncomplete your task. A Rune of magic\npower lies at the end of each haunted\nland of Quake. Go forth, seek the\ntotality of the four Runes!");
			}
			return;
		}
		else
		{
			if ((world.model == "maps/e2m6.bsp"))
			{
				ENG_SwitchTrack(IT_SUPER_SHOTGUN, TE_EXPLOSION);
				WriteByte(IT_SUPER_SHOTGUN, SVC_FINALE);
				WriteString(IT_SUPER_SHOTGUN, "The Rune of Black Magic throbs evilly in\nyour hand and whispers dark thoughts\ninto your brain. You learn the inmost\nlore of the Hell-Mother; Shub-Niggurath!\nYou now know that she is behind all the\nterrible plotting which has led to so\nmuch death and horror. But she is not\ninviolate! Armed with this Rune, you\nrealize that once all four Runes are\ncombined, the gate to Shub-Niggurath's\nPit will open, and you can face the\nWitch-Goddess herself in her frightful\notherworld cathedral.");
				return;
			}
			else
			{
				if ((world.model == "maps/e3m6.bsp"))
				{
					ENG_SwitchTrack(IT_SUPER_SHOTGUN, TE_EXPLOSION);
					WriteByte(IT_SUPER_SHOTGUN, SVC_FINALE);
					WriteString(IT_SUPER_SHOTGUN, "The charred viscera of diabolic horrors\nbubble viscously as you seize the Rune\nof Hell Magic. Its heat scorches your\nhand, and its terrible secrets blight\nyour mind. Gathering the shreds of your\ncourage, you shake the devil's shackles\nfrom your soul, and become ever more\nhard and determined to destroy the\nhideous creatures whose mere existence\nthreatens the souls and psyches of all\nthe population of Earth.");
					return;
				}
				else
				{
					if ((world.model == "maps/e4m7.bsp"))
					{
						ENG_SwitchTrack(IT_SUPER_SHOTGUN, TE_EXPLOSION);
						WriteByte(IT_SUPER_SHOTGUN, SVC_FINALE);
						WriteString(IT_SUPER_SHOTGUN, "Despite the awful might of the Elder\nWorld, you have achieved the Rune of\nElder Magic, capstone of all types of\narcane wisdom. Beyond good and evil,\nbeyond life and death, the Rune\npulsates, heavy with import. Patient and\npotent, the Elder Being Shub-Niggurath\nweaves her dire plans to clear off all\nlife from the Earth, and bring her own\nfoul offspring to our world! For all the\ndwellers in these nightmare dimensions\nare her descendants! Once all Runes of\nmagic power are united, the energy\nbehind them will blast open the Gateway\nto Shub-Niggurath, and you can travel\nthere to foil the Hell-Mother's plots\nin person.");
						return;
					}
				}
			}
		}
		GotoNextMap();
	}
	if ((intermission_running == TE_EXPLOSION))
	{
		if (!cvar(/*20282i*/"registered"))
		{
			WriteByte(IT_SUPER_SHOTGUN, SVC_SELLSCREEN);
			return;
		}
		if (((serverflags & 15) == 15))
		{
			WriteByte(IT_SUPER_SHOTGUN, SVC_FINALE);
			WriteString(IT_SUPER_SHOTGUN, "Now, you have all four Runes. You sense\ntremendous invisible forces moving to\nunseal ancient barriers. Shub-Niggurath\nhad hoped to use the Runes Herself to\nclear off the Earth, but now instead,\nyou will use them to enter her home and\nconfront her as an avatar of avenging\nEarth-life. If you defeat her, you will\nbe remembered forever as the savior of\nthe planet. If she conquers, it will be\nas if you had never been born.");
			return;
		}
	}
	GotoNextMap();
};

void() IntermissionThink =
{
	if ((time < intermission_exittime))
	{
		return;
	}
	if (((!self.button0 && !self.button1) && !self.button2))
	{
		return;
	}
	ExitIntermission();
};

void() execute_changelevel =
{
	local entity pos;

	intermission_running = IT_SHOTGUN;
	if (deathmatch)
	{
		intermission_exittime = time + TE_LIGHTNING1;
	}
	else
	{
		intermission_exittime = time + IT_SUPER_SHOTGUN;
	}
	pos = FindIntermission();
	ENG_SwitchTrack(TE_EXPLOSION, TE_EXPLOSION);
	pos = FindIntermission();
	other = find(world, classname, /*1957i*/"player");
	while ((other != world))
	{
		other.view_ofs = VEC_ORIGIN;
		other.v_angle = pos.mangle;
		other.angles = pos.mangle;
		other.fixangle = IT_SHOTGUN;
		other.nextthink = (time + 0.5);
		other.takedamage = TE_SPIKE;
		other.solid = TE_SPIKE;
		other.movetype = TE_SPIKE;
		other.modelindex = TE_SPIKE;
		setorigin(other, pos.origin);
		other = find(other, classname, /*1957i*/"player");
	}
	WriteByte(IT_SUPER_SHOTGUN, SVC_INTERMISSION);
};

void() changelevel_touch =
{

	if ((other.classname != "player"))
	{
		return;
	}
	if (deathmatch)
	{
		if (((cvar(/*20245i*/"samelevel") == IT_SUPER_SHOTGUN) || ((cvar(/*20245i*/"samelevel") == TE_EXPLOSION) && (mapname != "start"))))
		{
			T_Damage(other, self, self, 50000, 22);
			return;
		}
	}
	_bprint(other.netname, /*23119i*/" exited the level\n");
	nextmap = self.map;
	SUB_UseTargets();
	self.touch = SUB_Null;
	self.think = execute_changelevel;
	self.nextthink = (time + 0.1);
};

void() trigger_changelevel =
{
	if (!self.map)
	{
		objerror(/*23156i*/"chagnelevel trigger doesn't have map");
	}
	InitTrigger();
	self.touch = changelevel_touch;
};
void() set_suicide_frame;

void(entity ent) CopyToDeadbody =
{
	local entity deadbody;

	deadbody = spawn();
	deadbody.angles = ent.angles;
	deadbody.model = ent.model;
	deadbody.modelindex = ent.modelindex;
	deadbody.frame = ent.frame;
	deadbody.colormap = ent.colormap;
	deadbody.movetype = ent.movetype;
	deadbody.velocity = ent.velocity;
	deadbody.flags = TE_SPIKE;
	setorigin(deadbody, ent.origin);
	setsize(deadbody, ent.mins, ent.maxs);
	deadbody.think = SUB_Remove;
	deadbody.nextthink = (time + TE_EXPLOSION);
};

void() respawn =
{
	if ((self.setup_death == IT_SHOTGUN))
	{
		Player_SetupDeath();
	}
};

void() true_respawn =
{
	if (coop)
	{
		CopyToDeadbody(self);
		setspawnparms(self);
		PutClientInServer();
	}
	else
	{
		if (deathmatch)
		{
			CopyToDeadbody(self);
			SetNewParms();
			PutClientInServer();
		}
		else
		{
			localcmd(/*23236i*/"restart\n");
		}
	}
};
void() PlayerDropStuff;

void() ClientKill =
{
	if (intermission_running)
	{
		return;
	}
	if ((self.suicide_time > time))
	{
		return;
	}
	stuffcmd(self, "chase_active 1\n");
	self.setup_death = IT_SHOTGUN;
	self.health = TE_SPIKE;
	_bprint(self.netname, /*23274i*/" suicides\n");
	PlayerDropStuff();
	set_suicide_frame();
	self.modelindex = modelindex_player;
	self.frags = (self.frags - IT_SUPER_SHOTGUN);
	respawn();
};

entity() SelectSpawnPoint =
{
	local entity spot;
	local entity thing;
	local float numspots;
	local float totalspots;
	local float pcount;
	local entity spots;

	if (coop)
	{
		if (!spotspawn)
		{
			spotspawn = IT_SHOTGUN;
			spot = find(world, classname, /*20184i*/"info_player_start");
			if (spot)
			{
				return (spot);
			}
		}
		lastspawn = find(lastspawn, classname, /*23296i*/"info_player_coop");
		if (lastspawn)
		{
			return (lastspawn);
		}
	}
	if (!deathmatch)
	{
		if (serverflags)
		{
			spot = find(world, classname, /*23313i*/"info_player_start2");
			if (spot)
			{
				return (spot);
			}
		}
		spot = find(world, classname, /*20184i*/"info_player_start");
		if (spot)
		{
			return (spot);
		}
	}
	numspots = TE_SPIKE;
	totalspots = TE_SPIKE;
	spots = world;
	spot = find(world, classname, /*23332i*/"info_player_deathmatch");
	while (spot)
	{
		totalspots = totalspots + IT_SHOTGUN;
		thing = findradius(spot.origin, 84);
		pcount = TE_SPIKE;
		while (thing)
		{
			if ((thing.classname == "player"))
			{
				pcount = pcount + IT_SHOTGUN;
			}
			thing = thing.chain;
		}
		if ((pcount == TE_SPIKE))
		{
			spot.goalentity = spots;
			spots = spot;
			numspots = numspots + IT_SHOTGUN;
		}
		spot = find(spot, classname, /*23332i*/"info_player_deathmatch");
	}
	totalspots = totalspots - IT_SHOTGUN;
	if (!numspots)
	{
		totalspots = rint((random() * totalspots));
		spot = find(world, classname, /*23332i*/"info_player_deathmatch");
		while ((totalspots > TE_SPIKE))
		{
			totalspots = totalspots - IT_SHOTGUN;
			spot = find(spot, classname, /*23332i*/"info_player_deathmatch");
		}
		return (spot);
	}
	numspots = numspots - IT_SHOTGUN;
	numspots = rint((random() * numspots));
	spot = spots;
	while ((numspots > TE_SPIKE))
	{
		spot = spot.goalentity;
		numspots = numspots - IT_SHOTGUN;
	}
	return (spot);
};
void() PlayerDie;

void() PutClientInServer =
{
	Setup_Gametype();
};

void() info_player_start =
{
};

void() info_player_start2 =
{
};

void() info_player_deathmatch =
{
};

void() info_player_coop =
{
};

void() NextLevel =
{
	local entity o;

	if ((nextmap != ""))
	{
		return;
	}
	if ((mapname == "start"))
	{
		if (!cvar(/*20282i*/"registered"))
		{
			mapname = "e1m1";
		}
		else
		{
			if (!(serverflags & IT_SHOTGUN))
			{
				mapname = "e1m1";
				serverflags = serverflags | IT_SHOTGUN;
			}
			else
			{
				if (!(serverflags & IT_SUPER_SHOTGUN))
				{
					mapname = "e2m1";
					serverflags = serverflags | IT_SUPER_SHOTGUN;
				}
				else
				{
					if (!(serverflags & IT_NAILGUN))
					{
						mapname = "e3m1";
						serverflags = serverflags | IT_NAILGUN;
					}
					else
					{
						if (!(serverflags & IT_SUPER_NAILGUN))
						{
							mapname = "e4m1";
							serverflags = serverflags - TE_WIZSPIKE;
						}
					}
				}
			}
		}
		o = spawn();
		o.map = mapname;
	}
	else
	{
		o = find(world, classname, /*23488i*/"trigger_changelevel");
		if ((!o || (mapname == "start")))
		{
			o = spawn();
			o.map = mapname;
		}
	}
	nextmap = o.map;
	if ((o.nextthink < time))
	{
		o.think = execute_changelevel;
		o.nextthink = (time + 0.1);
	}
};

void() firefight_death_setup =
{
	if (((deathmatch == IT_SUPER_SHOTGUN) && (self.health == IT_SHOTGUN)))
	{
		if (((F_LIVES < TE_SPIKE) && (self.owner.ishuman == TE_SPIKE)))
		{
			self.health = TE_TELEPORT;
		}
		if ((((F_LIVES < TE_SPIKE) && (bot_count > TE_SPIKE)) && (self.owner.ishuman == IT_SHOTGUN)))
		{
			self.health = TE_TELEPORT;
		}
		else
		{
			if (((F_LIVES < TE_SPIKE) && (self.owner.ishuman == IT_SHOTGUN)))
			{
				localcmd(/*23236i*/"restart\n");
			}
		}
	}
};

void() CheckRules =
{
	if (((deathmatch && timelimit) && (time >= timelimit)))
	{
		NextLevel();
	}
	if (((deathmatch && fraglimit) && (self.frags >= fraglimit)))
	{
		NextLevel();
	}
};

void() player_respawn_think =
{
	local entity oself;

	if ((((self.owner.classname != "player") || (self.owner == world)) || (self.owner.health > TE_SPIKE)))
	{
		remove(self);
		return;
	}
	firefight_death_setup();
	self.health = (self.health - IT_SHOTGUN);
	if ((self.owner.ishuman == IT_SHOTGUN))
	{
		if (((self.health > TE_SPIKE) && (self.health < IT_NAILGUN)))
		{
			stuffcmd(self.owner, "play player/beep1.wav\n");
		}
		stuffcmd(self.owner, "cl_respawn ");
		stuffcmd(self.owner, ftos(self.health));
		stuffcmd(self.owner, " \n");
	}
	if ((self.health < IT_SHOTGUN))
	{
		oself = self;
		self = self.owner;
		self.impulse = TE_SPIKE;
		self.button0 = TE_SPIKE;
		self.button1 = TE_SPIKE;
		self.button2 = TE_SPIKE;
		if ((self.ishuman == IT_SHOTGUN))
		{
			stuffcmd(self, "play player/beep2.wav\n");
		}
		true_respawn();
		self = oself;
		remove(self);
		return;
	}
	self.nextthink = (time + IT_SHOTGUN);
};

void() Player_SetupDeath =
{
	local entity dt;

	dt = spawn();
	if ((deathmatch == TE_EXPLOSION))
	{
		dt.health = TE_LIGHTNING1;
	}
	else
	{
		dt.health = IT_SUPER_NAILGUN;
	}
	dt.owner = self;
	dt.think = player_respawn_think;
	dt.nextthink = (time + IT_SHOTGUN);
	self.setup_death = TE_SPIKE;
	self.weaponframe = TE_SPIKE;
};

void() PlayerDeathThink =
{
	local float forward;

	if ((self.setup_death == IT_SHOTGUN))
	{
		Player_SetupDeath();
	}
	if ((self.flags & IT_NAILS))
	{
		forward = vlen(self.velocity);
		forward = forward - 20;
		if ((forward <= TE_SPIKE))
		{
			self.velocity = VEC_ORIGIN;
		}
		else
		{
			self.velocity = (forward * normalize(self.velocity));
		}
	}
	if ((self.deadflag == IT_SUPER_SHOTGUN))
	{
		if (((self.button2 || self.button1) || self.button0))
		{
			return;
		}
		self.deadflag = TE_EXPLOSION;
		return;
	}
	if (((!self.button2 && !self.button1) && !self.button0))
	{
		return;
	}
	self.button0 = TE_SPIKE;
	self.button1 = TE_SPIKE;
	self.button2 = TE_SPIKE;
	respawn();
};

void() PlayerJump =
{
	local float vjump;

	vjump = cvar(/*23668i*/"sol_jump");
	if ((self.flags & IT_CELLS))
	{
		return;
	}
	if ((self.next_jump_time > time))
	{
		stuffcmd(self, "-jump\n");
		return;
	}
	if ((self.waterlevel >= IT_SUPER_SHOTGUN))
	{
		if ((self.swim_flag < time))
		{
			self.swim_flag = (time + IT_SHOTGUN);
			if ((random() < 0.5))
			{
				sound(self, IT_NAILGUN, "misc/water1.wav", IT_SHOTGUN, IT_SHOTGUN);
			}
			else
			{
				sound(self, IT_NAILGUN, "misc/water2.wav", IT_SHOTGUN, IT_SHOTGUN);
			}
		}
		return;
	}
	if (!(self.flags & IT_NAILS))
	{
		return;
	}
	if (!(self.flags & IT_AXE))
	{
		return;
	}
	self.flags = (self.flags - (self.flags & IT_AXE));
	self.button2 = TE_SPIKE;
	sound(self, IT_NAILGUN, "player/plyrjmp8.wav", IT_SHOTGUN, IT_SHOTGUN);
	if (vjump)
	{
		self.velocity_z = (self.velocity_z + vjump);
	}
	else
	{
		self.flags = (self.flags - IT_NAILS);
		self.velocity_z = (self.velocity_z + 225);
	}
	self.jump_time = (time + 0.15);
};

void() CheckWaterJump =
{
	local vector start;
	local vector end;

	makevectors(self.angles);
	start = self.origin;
	start_z = start_z + IT_SUPER_NAILGUN;
	v_forward_z = TE_SPIKE;
	normalize(v_forward);
	end = start + (v_forward * 24);
	traceline(start, end, IT_SHOTGUN, self);
	if ((trace_fraction < IT_SHOTGUN))
	{
		start_z = (start_z + self.maxs_z) - IT_SUPER_NAILGUN;
		end = start + (v_forward * 24);
		self.movedir = (trace_plane_normal * -50);
		traceline(start, end, IT_SHOTGUN, self);
		if ((trace_fraction == IT_SHOTGUN))
		{
			self.flags = (self.flags | IT_CELLS);
			self.velocity_z = 225;
			self.flags = (self.flags - (self.flags & IT_AXE));
			self.teleport_time = (time + IT_SUPER_SHOTGUN);
			return;
		}
	}
};

void() CH_Red =
{
	local vector src;
	local vector dir;

	if ((self.ishuman == TE_SPIKE))
	{
		return;
	}
	dir = aim(self, 100000);
	makevectors(self.v_angle);
	src = self.origin + (v_forward * TE_LAVASPLASH);
	src_z = self.absmin_z + (self.size_z * 0.7);
	if ((self.weapon == IT_SUPER_SHOTGUN))
	{
		traceline(src, (src + (dir * 100)), TE_SPIKE, self);
	}
	else
	{
		if ((self.weapon == IT_SHOTGUN))
		{
			traceline(src, (src + (dir * 1500)), TE_SPIKE, self);
		}
		else
		{
			if ((self.weapon == IT_BR))
			{
				traceline(src, (src + (dir * 1500)), TE_SPIKE, self);
			}
			else
			{
				if ((self.weapon == IT_GRENADE_LAUNCHER))
				{
					traceline(src, (src + (dir * 1800)), TE_SPIKE, self);
				}
				else
				{
					if ((self.weapon == IT_SUPER_NAILGUN))
					{
						traceline(src, (src + (dir * 400)), TE_SPIKE, self);
					}
					else
					{
						if ((self.weapon == IT_NAILGUN))
						{
							traceline(src, (src + (dir * 550)), TE_SPIKE, self);
						}
						else
						{
							if ((self.weapon == IT_ROCKET_LAUNCHER))
							{
								traceline(src, (src + (dir * 800)), TE_SPIKE, self);
							}
							else
							{
								if ((self.weapon == IT_LIGHTNING))
								{
									traceline(src, (src + (dir * 500)), TE_SPIKE, self);
								}
								else
								{
									traceline(src, (src + (dir * 300)), TE_SPIKE, self);
								}
							}
						}
					}
				}
			}
		}
	}
	puff_org = trace_endpos - (dir * IT_NAILGUN);
	if (trace_ent.takedamage)
	{
		stuffcmd(self, "cl_ch_red 1\n");
	}
	else
	{
		if (!trace_ent.takedamage)
		{
			stuffcmd(self, "cl_ch_red 0\n");
		}
	}
	if ((self.canpick == TE_SPIKE))
	{
		stuffcmd(self, "cl_ww 0\n");
	}
	crosshair_time = time + 0.1;
};

void() PlayerPreThink =
{
	if (BotPreFrame())
	{
		return;
	}
	if (intermission_running)
	{
		IntermissionThink();
		return;
	}
	makevectors(self.v_angle);
	CheckRules();
	if ((self.deadflag >= IT_SUPER_SHOTGUN))
	{
		PlayerDeathThink();
		return;
	}
	if ((self.slowmo_flags == IT_SHOTGUN))
	{
		Setup_Slowmo(self);
	}
	if ((self.deadflag == IT_SHOTGUN))
	{
		return;
	}
	if (self.button2)
	{
		PlayerJump();
	}
	else
	{
		self.flags = (self.flags | IT_AXE);
	}
	if ((((time > self.attack_finished) && (self.currentammo == TE_SPIKE)) && (self.weapon != IT_AXE)))
	{
		W_WeaponSwitch(W_BestWeapon());
	}
	if ((crosshair_time < time))
	{
		CH_Red();
	}
};

void() voice_play =
{
	if ((deathmatch == IT_SUPER_SHOTGUN))
	{
		sound(self.owner, IT_SUPER_SHOTGUN, "firefight.wav", IT_SHOTGUN, TE_SPIKE);
	}
	else
	{
		if ((deathmatch == IT_SHOTGUN))
		{
			sound(self.owner, IT_SUPER_SHOTGUN, "slayer.wav", IT_SHOTGUN, TE_SPIKE);
		}
	}
	remove(self);
};

void() Voice_announcer =
{
	local entity avoice;

	if ((VOICE_COUNT == IT_SHOTGUN))
	{
		return;
	}
	avoice = spawn();
	VOICE_COUNT = IT_SHOTGUN;
	avoice.think = voice_play;
	avoice.nextthink = (time + 0.7);
};

void() CheckPowerups =
{
	if ((self.health <= TE_SPIKE))
	{
		return;
	}
	if ((self.ishuman == IT_SHOTGUN))
	{
		Voice_announcer();
	}
	if ((self.ishuman == TE_SPIKE))
	{
		stuffcmd(self, "r_drawviewmodel 0\n");
	}
	CheckModel();
};

void() PlayerPostThink =
{
	if (BotPostFrame())
	{
		return;
	}
	if (intermission_running)
	{
		return;
	}
	if (self.deadflag)
	{
		return;
	}
	if (!(self.flags & IT_NAILS))
	{
		if ((self.next_jump_time < time))
		{
			self.next_jump_time = (time + 0.05);
		}
	}
	self.jump_flag = self.velocity_z;
	CheckPowerups();
	W_WeaponFrame();
};

void() ClientConnect =
{
	ClientInRankings();
	_bprint(self.netname, /*23838i*/" entered the game\n");
	if (intermission_running)
	{
		GotoNextMap();
	}
};

void() ClientDisconnect =
{

	ClientDisconnected();
	ftos(self.frags);
	_bprint(self.netname, /*23871i*/" left the game with ", ftos(self.frags), /*23892i*/" frags\n");
	set_suicide_frame();
};

void(entity playermedal, float howmany) killmedals =
{

	if ((playermedal.ishuman == TE_SPIKE))
	{
		return;
	}
	if ((howmany == TE_LAVASPLASH))
	{
		centerprint(playermedal, "Killpocalypse!\n");
	}
	else
	{
		if ((howmany == TE_LIGHTNING3))
		{
			centerprint(playermedal, "Killpocalypse!\n");
		}
		else
		{
			if ((howmany == IT_SUPER_NAILGUN))
			{
				centerprint(playermedal, "Killtastrophe!\n");
			}
			else
			{
				if ((howmany == TE_WIZSPIKE))
				{
					centerprint(playermedal, "Killimanjaro!\n");
				}
				else
				{
					if ((howmany == TE_LIGHTNING2))
					{
						stuffcmd(playermedal, "cl_killmedals 5\n");
						Medal(playermedal);
					}
					else
					{
						if ((howmany == TE_LIGHTNING1))
						{
							stuffcmd(playermedal, "play killtrocity.wav\n");
							stuffcmd(playermedal, "cl_killmedals 4\n");
							Medal(playermedal);
						}
						else
						{
							if ((howmany == IT_NAILGUN))
							{
								stuffcmd(playermedal, "play killtacular.wav\n");
								stuffcmd(playermedal, "cl_killmedals 3\n");
								Medal(playermedal);
							}
							else
							{
								if ((howmany == TE_EXPLOSION))
								{
									stuffcmd(playermedal, "play triple.wav\n");
									stuffcmd(playermedal, "cl_killmedals 2\n");
									Medal(playermedal);
								}
								else
								{
									if ((howmany == IT_SUPER_SHOTGUN))
									{
										stuffcmd(playermedal, "play double.wav\n");
										stuffcmd(playermedal, "cl_killmedals 1\n");
										Medal(playermedal);
									}
									else
									{
										return;
									}
								}
							}
						}
					}
				}
			}
		}
	}
	if ((deathmatch == IT_SUPER_SHOTGUN))
	{
		Firefight_Scoring(playermedal, howmany);
	}
	else
	{
		if ((deathmatch == TE_EXPLOSION))
		{
			Add_Slowmo(playermedal, (howmany + CONTENT_EMPTY));
		}
	}
};

void(entity targ, entity attacker, float mod) ClientObituary =
{
	if ((attacker.kill_time >= time))
	{
		attacker.kill_amount = (attacker.kill_amount + IT_SHOTGUN);
		killmedals(attacker, attacker.kill_amount);
	}
	else
	{
		attacker.kill_amount = IT_SHOTGUN;
	}
	if (((targ.classname == "player") || (targ.flags & IT_ROCKET_LAUNCHER)))
	{
		attacker.kill_time = (time + IT_NAILGUN);
	}
	if ((attacker.flags & IT_SUPER_NAILGUN))
	{
		if ((attacker == targ))
		{
			SuicideMessage(targ.netname, mod);
			targ.frags = (targ.frags - IT_SHOTGUN);
			return;
		}
		if (OnSameTeam(targ, attacker))
		{
			TeamKillMessage(targ.netname, attacker.netname, mod);
			attacker.frags = (attacker.frags - IT_SHOTGUN);
			return;
		}
		if (((targ.flags & IT_SUPER_NAILGUN) || (targ.flags & IT_ROCKET_LAUNCHER)))
		{
			KillMessage(targ.netname, attacker.netname, mod);
			attacker.frags = (attacker.frags + IT_SHOTGUN);
		}
		return;
	}
	if ((targ.flags & IT_SUPER_NAILGUN))
	{
		targ.frags = (targ.frags - IT_SHOTGUN);
	}
};
