//Decompiled code. Please respect the original copyright.
void() door_go_down;
void() door_go_up;

void() door_blocked =
{
	T_Damage(other, self, self.goalentity, self.dmg, 15);
	if ((self.wait >= TE_SPIKE))
	{
		if ((self.state == TE_EXPLOSION))
		{
			door_go_up();
		}
		else
		{
			door_go_down();
		}
	}
};

void() door_hit_top =
{
	sound(self, (chan_no_phs_add | IT_SUPER_SHOTGUN), self.noise1, IT_SHOTGUN, IT_SHOTGUN);
	self.state = TE_SPIKE;
	if ((self.spawnflags & IT_ROCKET_LAUNCHER))
	{
		return;
	}
	self.think = door_go_down;
	self.nextthink = (self.ltime + self.wait);
};

void() door_hit_bottom =
{
	sound(self, (chan_no_phs_add | IT_SUPER_SHOTGUN), self.noise1, IT_SHOTGUN, IT_SHOTGUN);
	self.state = IT_SHOTGUN;
};

void() door_go_down =
{
	sound(self, IT_SUPER_SHOTGUN, self.noise2, IT_SHOTGUN, IT_SHOTGUN);
	if (self.max_health)
	{
		self.takedamage = IT_SHOTGUN;
		self.health = self.max_health;
	}
	self.state = TE_EXPLOSION;
	SUB_CalcMove(self.pos1, self.speed, door_hit_bottom);
};

void() door_go_up =
{
	if ((self.state == IT_SUPER_SHOTGUN))
	{
		return;
	}
	if ((self.state == TE_SPIKE))
	{
		self.nextthink = (self.ltime + self.wait);
		return;
	}
	sound(self, IT_SUPER_SHOTGUN, self.noise2, IT_SHOTGUN, IT_SHOTGUN);
	self.state = IT_SUPER_SHOTGUN;
	SUB_CalcMove(self.pos2, self.speed, door_hit_top);
	SUB_UseTargets();
};

void() door_fire =
{
	local entity oself;
	local entity starte;

	if ((self.owner != self))
	{
		objerror(/*26033i*/"door_fire: self.owner != self");
	}
	if (self.items)
	{
		sound(self, TE_EXPLOSION, self.noise4, IT_SHOTGUN, IT_SHOTGUN);
	}
	self.message = string_null;
	oself = self;
	if ((self.spawnflags & IT_ROCKET_LAUNCHER))
	{
		if (((self.state == IT_SUPER_SHOTGUN) || (self.state == TE_SPIKE)))
		{
			starte = self;
			do
			{
				door_go_down();
				self = self.enemy;

			} while (((self != starte) && (self != world)));
			self = oself;
			return;
		}
	}
	starte = self;
	do
	{
		self.goalentity = activator;
		door_go_up();
		self = self.enemy;

	} while (((self != starte) && (self != world)));
	self = oself;
};

void() door_use =
{
	local entity oself;

	self.message = "";
	self.owner.message = "";
	self.enemy.message = "";
	oself = self;
	self = self.owner;
	door_fire();
	self = oself;
};

void() door_trigger_touch =
{
	if ((other.health <= TE_SPIKE))
	{
		return;
	}
	if ((time < self.attack_finished))
	{
		return;
	}
	self.attack_finished = (time + IT_SHOTGUN);
	activator = other;
	self = self.owner;
	door_use();
};

void() door_killed =
{
	local entity oself;

	oself = self;
	self = self.owner;
	self.health = self.max_health;
	self.takedamage = TE_SPIKE;
	door_use();
	self = oself;
};

/*
================
door_touch

Prints messages and opens key doors
================
*/
void() door_touch =
{
	if (other.classname != "player")
		return;
	if (self.owner.attack_finished > time)
		return;

	self.owner.attack_finished = time + 2;

	if (self.owner.message != "")
	{
		centerprint (other, self.owner.message);
		sound (other, CHAN_VOICE, "misc/talk.wav", 1, ATTN_NORM);
	}
	
// key door stuff
	if (!self.items)
		return;

// FIXME: blink key on player's status bar
	if ( (self.items & other.items) != self.items )
	{
		if (self.owner.items == IT_KEY1)
		{
			switch (world.worldtype)
			{
			case WT_MEDIEVAL:
				centerprint (other, "You need the silver key");
				break;
			case WT_METAL:
				centerprint (other, "You need the silver runekey");
				break;
			case WT_BASE:
				centerprint (other, "You need the silver keycard");
				break;
			}
		}
		else
		{
			switch (world.worldtype)
			{
			case WT_MEDIEVAL:
				centerprint (other, "You need the gold key");
				break;
			case WT_METAL:
				centerprint (other, "You need the gold runekey");
				break;
			case WT_BASE:
				centerprint (other, "You need the gold keycard");
				break;
			}
		}

		sound (self, CHAN_VOICE, self.noise3, 1, ATTN_NORM);
		return;
	}

	other.items = other.items - self.items;
	self.touch = SUB_Null;
	if (self.enemy)
		self.enemy.touch = SUB_Null;    // get paired door
	door_use ();
};
// void() door_touch =
// {
// #error Corrupt1 Function: door_touch
// #if 0

// 	if ((other.classname != "player"))
// 	{
// 		return;
// 	}
// 	if ((self.owner.attack_finished > time))
// 	{
// 		return;
// 	}
// 	self.owner.attack_finished = (time + IT_SUPER_SHOTGUN);
// 	if ((self.owner.message != ""))
// 	{
// 		centerprint(other, self.owner.message);
// 		sound(other, IT_SUPER_SHOTGUN, "misc/talk.wav", IT_SHOTGUN, IT_SHOTGUN);
// 	}
// 	if (!self.items)
// 	{
// 		return;
// 	}
// 	if (((self.items & other.items) != self.items))
// 	{
// 		if ((self.owner.items == IT_KEY1))
// 		{
// 		}
// 		else
// 		{
// 			centerprint(other, "You need the silver key");
// 		}
// 		else
// 		{
// 			do
// 			{
// 				centerprint(other, "You need the silver runekey");
// 			}
// 			else
// 			{
// 				do
// 				{
// 					centerprint(other, "You need the silver keycard");
// 				}
// 				else
// 				{
// 				}

// 			} while ((world.worldtype == IT_SHOTGUN));

// 		} while ((world.worldtype == IT_SUPER_SHOTGUN));
// 	}
// }
// }
// }
// else
// {
// }
// else
// {
// centerprint(other, "You need the gold key");
// }
// else
// {
// do
// {
// centerprint(other, "You need the gold runekey");
// }
// else
// {
// do
// {
// 	centerprint(other, "You need the gold keycard");
// }
// else
// {
// }

// } while ((world.worldtype == IT_SHOTGUN));

// } while ((world.worldtype == IT_SUPER_SHOTGUN));
// }
// }
// }
// }
// sound(self, IT_SUPER_SHOTGUN, self.noise3, IT_SHOTGUN, IT_SHOTGUN);
// return;
// }
// other.items = (other.items - self.items);
// self.touch = SUB_Null;
// if (self.enemy)
// {
// self.enemy.touch = SUB_Null;
// }
// door_use();
// #endif
// };

entity(vector fmins, vector fmaxs) spawn_field =
{
	local entity trigger;
	local vector t1;
	local vector t2;

	trigger = spawn();
	trigger.movetype = TE_SPIKE;
	trigger.solid = IT_SHOTGUN;
	trigger.owner = self;
	trigger.touch = door_trigger_touch;
	t1 = fmins;
	t2 = fmaxs;
	setsize(trigger, (t1 - '60 60 8'), (t2 + '60 60 8'));
	return (trigger);
};

float(entity e1, entity e2) EntitiesTouching =
{
	if ((e1.mins_x > e2.maxs_x))
	{
		return (TE_SPIKE);
	}
	if ((e1.mins_y > e2.maxs_y))
	{
		return (TE_SPIKE);
	}
	if ((e1.mins_z > e2.maxs_z))
	{
		return (TE_SPIKE);
	}
	if ((e1.maxs_x < e2.mins_x))
	{
		return (TE_SPIKE);
	}
	if ((e1.maxs_y < e2.mins_y))
	{
		return (TE_SPIKE);
	}
	if ((e1.maxs_z < e2.mins_z))
	{
		return (TE_SPIKE);
	}
	return (IT_SHOTGUN);
};

void() LinkDoors =
{
	local entity t;
	local entity starte;
	local vector cmins;
	local vector cmaxs;

	if (self.enemy)
	{
		return;
	}
	if ((self.spawnflags & IT_NAILGUN))
	{
		self.enemy = self;
		self.owner = self;
		return;
	}
	cmins = self.mins;
	cmaxs = self.maxs;
	starte = self;
	t = self;
	do
	{
		self.owner = starte;
		if (self.health)
		{
			starte.health = self.health;
		}
		if (self.targetname)
		{
			starte.targetname = self.targetname;
		}
		if ((self.message != ""))
		{
			starte.message = self.message;
		}
		t = find(t, classname, self.classname);
		if (!t)
		{
			self.enemy = starte;
			self = self.owner;
			if (self.health)
			{
				return;
			}
			if (self.targetname)
			{
				return;
			}
			if (self.items)
			{
				return;
			}
			self.owner.trigger_field = spawn_field(cmins, cmaxs);
			return;
		}
		if (EntitiesTouching(self, t))
		{
			if (t.enemy)
			{
				objerror(/*26312i*/"cross connected doors");
			}
			self.enemy = t;
			self = t;
			if ((t.mins_x < cmins_x))
			{
				cmins_x = t.mins_x;
			}
			if ((t.mins_y < cmins_y))
			{
				cmins_y = t.mins_y;
			}
			if ((t.mins_z < cmins_z))
			{
				cmins_z = t.mins_z;
			}
			if ((t.maxs_x > cmaxs_x))
			{
				cmaxs_x = t.maxs_x;
			}
			if ((t.maxs_y > cmaxs_y))
			{
				cmaxs_y = t.maxs_y;
			}
			if ((t.maxs_z > cmaxs_z))
			{
				cmaxs_z = t.maxs_z;
			}
		}
	} while(1);
};


/*QUAKED func_door (0 .5 .8) ? START_OPEN x DOOR_DONT_LINK GOLD_KEY SILVER_KEY TOGGLE
if two doors touch, they are assumed to be connected and operate as a unit.

TOGGLE causes the door to wait in both the start and end states for a trigger event.

START_OPEN causes the door to move to its destination when spawned, and operate in reverse.  It is used to temporarily or permanently close off an area when triggered (not usefull for touch or takedamage doors).

Key doors are allways wait -1.

"message"       is printed when the door is touched if it is a trigger door and it hasn't been fired yet
"angle"         determines the opening direction
"targetname" if set, no touch field will be spawned and a remote button or trigger field activates the door.
"health"        if set, door must be shot open
"speed"         movement speed (100 default)
"wait"          wait before returning (3 default, -1 = never return)
"lip"           lip remaining at end of move (8 default)
"dmg"           damage to inflict when blocked (2 default)
"sounds"
0)      no sound
1)      stone
2)      base
3)      stone chain
4)      screechy metal
*/

void() func_door =
{
	switch (world.worldtype)
	{
	case WT_MEDIEVAL:
		precache_sound ("doors/medtry.wav");
		precache_sound ("doors/meduse.wav");
		self.noise3 = "doors/medtry.wav";
		self.noise4 = "doors/meduse.wav";
		break;
	case WT_METAL:
		precache_sound ("doors/runetry.wav");
		precache_sound ("doors/runeuse.wav");
		self.noise3 = "doors/runetry.wav";
		self.noise4 = "doors/runeuse.wav";
		break;
	case WT_BASE:
		precache_sound ("doors/basetry.wav");
		precache_sound ("doors/baseuse.wav");
		self.noise3 = "doors/basetry.wav";
		self.noise4 = "doors/baseuse.wav";
		break;
	default:
		dprint ("no worldtype set!\n");
	}

	switch (self.sounds)
	{
	case 0:
		precache_sound ("misc/null.wav");
		precache_sound ("misc/null.wav");
		self.noise1 = "misc/null.wav";
		self.noise2 = "misc/null.wav";
		break;
	case 1:
		precache_sound ("doors/drclos4.wav");
		precache_sound ("doors/doormv1.wav");
		self.noise1 = "doors/drclos4.wav";
		self.noise2 = "doors/doormv1.wav";
		break;
	case 2:
		precache_sound ("doors/hydro1.wav");
		precache_sound ("doors/hydro2.wav");
		self.noise2 = "doors/hydro1.wav";
		self.noise1 = "doors/hydro2.wav";
		break;
	case 3:
		precache_sound ("doors/stndr1.wav");
		precache_sound ("doors/stndr2.wav");
		self.noise2 = "doors/stndr1.wav";
		self.noise1 = "doors/stndr2.wav";
		break;
	case 4:
		precache_sound ("doors/ddoor1.wav");
		precache_sound ("doors/ddoor2.wav");
		self.noise1 = "doors/ddoor2.wav";
		self.noise2 = "doors/ddoor1.wav";
		break;
	}

	SetMovedir ();

	self.max_health = self.health;
	self.solid = SOLID_BSP;
	self.movetype = MOVETYPE_PUSH;
	setorigin (self, self.origin);  
	setmodel (self, self.model);
	self.classname = "door";

	self.blocked = door_blocked;
	self.use = door_use;
	
	if (self.spawnflags & DOOR_SILVER_KEY)
		self.items = IT_KEY1;
	if (self.spawnflags & DOOR_GOLD_KEY)
		self.items = IT_KEY2;
	
	if (!self.speed)
		self.speed = 100;
	if (!self.wait)
		self.wait = 3;
	if (!self.lip)
		self.lip = 8;
	if (!self.dmg)
		self.dmg = 2;

	self.pos1 = self.origin;
	self.pos2 = self.pos1 + self.movedir*(fabs(self.movedir*self.size) - self.lip);

// DOOR_START_OPEN is to allow an entity to be lighted in the closed position
// but spawn in the open position
	if (self.spawnflags & DOOR_START_OPEN)
	{
		setorigin (self, self.pos2);
		self.pos2 = self.pos1;
		self.pos1 = self.origin;
	}

	self.state = STATE_BOTTOM;

	if (self.health)
	{
		self.takedamage = DAMAGE_YES;
		self.th_die = door_killed;
	}
	
	if (self.items)
		self.wait = -1;
		
	self.touch = door_touch;

// LinkDoors can't be done until all of the doors have been spawned, so
// the sizes can be detected properly.
	self.think = LinkDoors;
	self.nextthink = self.ltime + 0.1;
};
// void() func_door =
// {
// #error Corrupt1 Function: func_door
// #if 0

// }
// else
// {
// 	precache_sound(/*26344i*/"doors/medtry.wav");
// 	precache_sound(/*26361i*/"doors/meduse.wav");
// 	self.noise3 = "doors/medtry.wav";
// 	self.noise4 = "doors/meduse.wav";
// }
// else
// {
// 	do
// 	{
// 		precache_sound(/*26378i*/"doors/runetry.wav");
// 		precache_sound(/*26396i*/"doors/runeuse.wav");
// 		self.noise3 = "doors/runetry.wav";
// 		self.noise4 = "doors/runeuse.wav";
// 	}
// 	else
// 	{
// 		do
// 		{
// 			precache_sound(/*26414i*/"doors/basetry.wav");
// 			precache_sound(/*26432i*/"doors/baseuse.wav");
// 			self.noise3 = "doors/basetry.wav";
// 			self.noise4 = "doors/baseuse.wav";
// 		}
// 		else
// 		{
// 			do
// 			{
// 				dprint(/*26450i*/"no worldtype set!\n");
// 			}
// 			else
// 			{
// 			}

// 		} while ((world.worldtype == IT_SHOTGUN));

// 	} while ((world.worldtype == IT_SUPER_SHOTGUN));
// } while(1);
// }
// }
// }
// }
// }
// else
// {
// precache_sound(/*26469i*/"misc/null.wav");
// precache_sound(/*26469i*/"misc/null.wav");
// self.noise1 = "misc/null.wav";
// self.noise2 = "misc/null.wav";
// }
// else
// {
// do
// {
// precache_sound(/*26483i*/"doors/drclos4.wav");
// precache_sound(/*26501i*/"doors/doormv1.wav");
// self.noise1 = "doors/drclos4.wav";
// self.noise2 = "doors/doormv1.wav";
// }
// else
// {
// do
// {
// precache_sound(/*26519i*/"doors/hydro1.wav");
// precache_sound(/*26536i*/"doors/hydro2.wav");
// self.noise2 = "doors/hydro1.wav";
// self.noise1 = "doors/hydro2.wav";
// }
// else
// {
// do
// {
// precache_sound(/*26553i*/"doors/stndr1.wav");
// precache_sound(/*26570i*/"doors/stndr2.wav");
// self.noise2 = "doors/stndr1.wav";
// self.noise1 = "doors/stndr2.wav";
// }
// else
// {
// do
// {
// precache_sound(/*26587i*/"doors/ddoor1.wav");
// precache_sound(/*26604i*/"doors/ddoor2.wav");
// self.noise1 = "doors/ddoor2.wav";
// self.noise2 = "doors/ddoor1.wav";
// }
// else
// {
// }

// } while ((self.sounds == IT_SHOTGUN));

// } while ((self.sounds == IT_SUPER_SHOTGUN));

// } while ((self.sounds == TE_EXPLOSION));

// } while ((self.sounds == IT_NAILGUN));
// }
// }
// }
// }
// }
// SetMovedir();
// self.max_health = self.health;
// self.solid = IT_NAILGUN;
// self.movetype = TE_WIZSPIKE;
// setorigin(self, self.origin);
// setmodel(self, self.model);
// self.classname = "door";
// self.blocked = door_blocked;
// self.use = door_use;
// if ((self.spawnflags & IT_GRENADE_LAUNCHER))
// {
// self.items = IT_KEY1;
// }
// if ((self.spawnflags & IT_SUPER_NAILGUN))
// {
// self.items = IT_KEY2;
// }
// if (!self.speed)
// {
// self.speed = 100;
// }
// if (!self.wait)
// {
// self.wait = TE_EXPLOSION;
// }
// if (!self.lip)
// {
// self.lip = IT_SUPER_NAILGUN;
// }
// if (!self.dmg)
// {
// self.dmg = IT_SUPER_SHOTGUN;
// }
// self.pos1 = self.origin;
// self.pos2 = (self.pos1 + (self.movedir * (fabs((self.movedir * self.size)) - self.lip)));
// if ((self.spawnflags & IT_SHOTGUN))
// {
// setorigin(self, self.pos2);
// self.pos2 = self.pos1;
// self.pos1 = self.origin;
// }
// self.state = IT_SHOTGUN;
// if (self.health)
// {
// self.takedamage = IT_SHOTGUN;
// self.th_die = door_killed;
// }
// if (self.items)
// {
// self.wait = CONTENT_EMPTY;
// }
// self.touch = door_touch;
// self.think = LinkDoors;
// self.nextthink = (self.ltime + 0.1);
// #endif
// };
void() fd_secret_move1;
void() fd_secret_move2;
void() fd_secret_move3;
void() fd_secret_move4;
void() fd_secret_move5;
void() fd_secret_move6;
void() fd_secret_done;

void() fd_secret_use =
{
	local float temp;

	self.health = 10000;
	if ((self.origin != self.oldorigin))
	{
		return;
	}
	self.message = string_null;
	SUB_UseTargets();
	if (!(self.spawnflags & IT_SUPER_NAILGUN))
	{
		self.th_pain = SUB_Null;
		self.takedamage = TE_SPIKE;
	}
	self.velocity = VEC_ORIGIN;
	sound(self, IT_SUPER_SHOTGUN, self.noise1, IT_SHOTGUN, IT_SHOTGUN);
	self.nextthink = (self.ltime + 0.1);
	temp = IT_SHOTGUN - (self.spawnflags & IT_SUPER_SHOTGUN);
	makevectors(self.mangle);
	if (!self.t_width)
	{
		if ((self.spawnflags & IT_NAILGUN))
		{
			self.t_width = fabs((v_up * self.size));
		}
		else
		{
			self.t_width = fabs((v_right * self.size));
		}
	}
	if (!self.t_length)
	{
		self.t_length = fabs((v_forward * self.size));
	}
	if ((self.spawnflags & IT_NAILGUN))
	{
		self.dest1 = (self.origin - (v_up * self.t_width));
	}
	else
	{
		self.dest1 = (self.origin + (v_right * (self.t_width * temp)));
	}
	self.dest2 = (self.dest1 + (v_forward * self.t_length));
	SUB_CalcMove(self.dest1, self.speed, fd_secret_move1);
	sound(self, IT_SUPER_SHOTGUN, self.noise2, IT_SHOTGUN, IT_SHOTGUN);
};

void() fd_secret_move1 =
{
	self.nextthink = (self.ltime + IT_SHOTGUN);
	self.think = fd_secret_move2;
	sound(self, IT_SUPER_SHOTGUN, self.noise3, IT_SHOTGUN, IT_SHOTGUN);
};

void() fd_secret_move2 =
{
	sound(self, IT_SUPER_SHOTGUN, self.noise2, IT_SHOTGUN, IT_SHOTGUN);
	SUB_CalcMove(self.dest2, self.speed, fd_secret_move3);
};

void() fd_secret_move3 =
{
	sound(self, IT_SUPER_SHOTGUN, self.noise3, IT_SHOTGUN, IT_SHOTGUN);
	if (!(self.spawnflags & IT_SHOTGUN))
	{
		self.nextthink = (self.ltime + self.wait);
		self.think = fd_secret_move4;
	}
};

void() fd_secret_move4 =
{
	sound(self, IT_SUPER_SHOTGUN, self.noise2, IT_SHOTGUN, IT_SHOTGUN);
	SUB_CalcMove(self.dest1, self.speed, fd_secret_move5);
};

void() fd_secret_move5 =
{
	self.nextthink = (self.ltime + IT_SHOTGUN);
	self.think = fd_secret_move6;
	sound(self, IT_SUPER_SHOTGUN, self.noise3, IT_SHOTGUN, IT_SHOTGUN);
};

void() fd_secret_move6 =
{
	sound(self, IT_SUPER_SHOTGUN, self.noise2, IT_SHOTGUN, IT_SHOTGUN);
	SUB_CalcMove(self.oldorigin, self.speed, fd_secret_done);
};

void() fd_secret_done =
{
	if ((!self.targetname || (self.spawnflags & IT_GRENADE_LAUNCHER)))
	{
		self.health = 10000;
		self.takedamage = IT_SHOTGUN;
		self.th_pain = fd_secret_use;
		self.th_die = fd_secret_use;
	}
	sound(self, (chan_no_phs_add | IT_SUPER_SHOTGUN), self.noise3, IT_SHOTGUN, IT_SHOTGUN);
};

void() secret_blocked =
{
	if ((time < self.attack_finished))
	{
		return;
	}
	self.attack_finished = (time + 0.5);
	T_Damage(other, self, self, self.dmg, 15);
};

void() secret_touch =
{
	if ((other.classname != "player"))
	{
		return;
	}
	if ((self.attack_finished > time))
	{
		return;
	}
	self.attack_finished = (time + IT_SUPER_SHOTGUN);
	if (self.message)
	{
		centerprint(other, self.message);
		sound(other, IT_NAILGUN, "misc/talk.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
};

/*QUAKED func_door_secret (0 .5 .8) ? open_once 1st_left 1st_down no_shoot always_shoot
Basic secret door. Slides back, then to the side. Angle determines direction.
wait  = # of seconds before coming back
1st_left = 1st move is left of arrow
1st_down = 1st move is down from arrow
always_shoot = even if targeted, keep shootable
t_width = override WIDTH to move back (or height if going down)
t_length = override LENGTH to move sideways
"dmg"           damage to inflict when blocked (2 default)

If a secret door has a targetname, it will only be opened by it's botton or trigger, not by damage.
"sounds"
1) medieval
2) metal
3) base
*/

void () func_door_secret =
{
	switch (self.sounds)
	{
	case 0:
	case 3:
		precache_sound ("doors/basesec1.wav");
		precache_sound ("doors/basesec2.wav");
		self.noise2 = "doors/basesec1.wav";
		self.noise1 = "doors/basesec2.wav";
		self.noise3 = "doors/basesec2.wav";
		break;
	case 1:
		precache_sound ("doors/latch2.wav");
		precache_sound ("doors/winch2.wav");
		precache_sound ("doors/drclos4.wav");
		self.noise1 = "doors/latch2.wav";
		self.noise2 = "doors/winch2.wav";
		self.noise3 = "doors/drclos4.wav";
		break;
	case 2:
		precache_sound ("doors/airdoor1.wav");
		precache_sound ("doors/airdoor2.wav");
		self.noise2 = "doors/airdoor1.wav";
		self.noise1 = "doors/airdoor2.wav";
		self.noise3 = "doors/airdoor2.wav";
		break;
	}

	if (!self.dmg)
		self.dmg = 2;
		
	// Magic formula...
	self.mangle = self.angles;
	self.angles = '0 0 0';
	self.solid = SOLID_BSP;
	self.movetype = MOVETYPE_PUSH;
	self.classname = "door";
	setmodel (self, self.model);
	setorigin (self, self.origin);  
	
	self.touch = secret_touch;
	self.blocked = secret_blocked;
	self.speed = 50;
	self.use = fd_secret_use;
	if ( !self.targetname || self.spawnflags&SECRET_YES_SHOOT)
	{
		self.health = 10000;
		self.takedamage = DAMAGE_YES;
		self.th_pain = fd_secret_use;
	}
	self.oldorigin = self.origin;
	if (!self.wait)
		self.wait = 5;          // 5 seconds before closing
}; 

// void() func_door_secret =
// {
// #error Corrupt1 Function: func_door_secret
// #if 0

// 	do_tail
// 	{
// 		precache_sound(/*26784i*/"doors/basesec1.wav");
// 		precache_sound(/*26803i*/"doors/basesec2.wav");
// 		self.noise2 = "doors/basesec1.wav";
// 		self.noise1 = "doors/basesec2.wav";
// 		self.noise3 = "doors/basesec2.wav";
// 	}
// 	else
// 	{
// 		do
// 		{
// 			precache_sound(/*26822i*/"doors/latch2.wav");
// 			precache_sound(/*26839i*/"doors/winch2.wav");
// 			precache_sound(/*26483i*/"doors/drclos4.wav");
// 			self.noise1 = "doors/latch2.wav";
// 			self.noise2 = "doors/winch2.wav";
// 			self.noise3 = "doors/drclos4.wav";
// 		}
// 		else
// 		{
// 			do
// 			{
// 				precache_sound(/*26856i*/"doors/airdoor1.wav");
// 				precache_sound(/*26875i*/"doors/airdoor2.wav");
// 				self.noise2 = "doors/airdoor1.wav";
// 				self.noise1 = "doors/airdoor2.wav";
// 				self.noise3 = "doors/airdoor2.wav";
// 			}
// 			else
// 			{

// 			} while ((self.sounds == TE_EXPLOSION));

// 		} while ((self.sounds == IT_SHOTGUN));

// 	} while ((self.sounds == IT_SUPER_SHOTGUN));
// }
// }
// }
// if (!self.dmg)
// {
// self.dmg = IT_SUPER_SHOTGUN;
// }
// self.mangle = self.angles;
// self.angles = VEC_ORIGIN;
// self.solid = IT_NAILGUN;
// self.movetype = TE_WIZSPIKE;
// self.classname = "door";
// setmodel(self, self.model);
// setorigin(self, self.origin);
// self.touch = secret_touch;
// self.blocked = secret_blocked;
// self.speed = 50;
// self.use = fd_secret_use;
// if ((!self.targetname || (self.spawnflags & IT_GRENADE_LAUNCHER)))
// {
// self.health = 10000;
// self.takedamage = IT_SHOTGUN;
// self.th_pain = fd_secret_use;
// }
// self.oldorigin = self.origin;
// if (!self.wait)
// {
// self.wait = TE_LIGHTNING1;
// }
// #endif
// };
