//Decompiled code. Please respect the original copyright.

void() trigger_reactivate =
{
	self.solid = IT_SHOTGUN;
};

void() multi_wait =
{
	if (self.max_health)
	{
		self.health = self.max_health;
		self.takedamage = IT_SHOTGUN;
		self.solid = IT_SUPER_SHOTGUN;
	}
};

void() multi_trigger =
{
	if ((self.nextthink > time))
	{
		return;
	}
	if ((self.classname == "trigger_secret"))
	{
		if ((self.enemy.classname != "player"))
		{
			return;
		}
		found_secrets = found_secrets + IT_SHOTGUN;
		WriteByte(IT_SUPER_SHOTGUN, SVC_FOUNDSECRET);
	}
	if (self.noise)
	{
		sound(self, IT_SUPER_SHOTGUN, self.noise, IT_SHOTGUN, IT_SHOTGUN);
	}
	self.takedamage = TE_SPIKE;
	activator = self.enemy;
	SUB_UseTargets();
	if ((self.wait > TE_SPIKE))
	{
		self.think = multi_wait;
		self.nextthink = (time + self.wait);
	}
	else
	{
		self.touch = SUB_Null;
		self.nextthink = (time + 0.1);
		self.think = SUB_Remove;
	}
};

void() multi_killed =
{
	self.enemy = damage_attacker;
	multi_trigger();
};

void() multi_use =
{
	self.enemy = activator;
	multi_trigger();
};

void() multi_touch =
{
	if ((other.classname != "player"))
	{
		return;
	}
	if ((self.movedir != VEC_ORIGIN))
	{
		makevectors(other.angles);
		if (((v_forward * self.movedir) < TE_SPIKE))
		{
			return;
		}
	}
	self.enemy = other;
	multi_trigger();
};

/*QUAKED trigger_multiple (.5 .5 .5) ? notouch
Variable sized repeatable trigger.  Must be targeted at one or more entities.  If "health" is set, the trigger must be killed to activate each time.
If "delay" is set, the trigger waits some time after activating before firing.
"wait" : Seconds between triggerings. (.2 default)
If notouch is set, the trigger is only fired by other entities, not by touching.
NOTOUCH has been obsoleted by trigger_relay!
sounds
1)	secret
2)	beep beep
3)	large switch
4)
set "message" to text string
*/
void() trigger_multiple =
{
	switch (self.sounds)
	{
	case 1:
		precache_sound ("misc/secret.wav");
		self.noise = "misc/secret.wav";
		break;
	case 2:
		precache_sound ("misc/talk.wav");
		self.noise = "misc/talk.wav";
		break;
	case 3:
		precache_sound ("misc/trigger1.wav");
		self.noise = "misc/trigger1.wav";
		break;
	}
	
	if (!self.wait)
		self.wait = 0.2;
	self.use = multi_use;

	InitTrigger ();

	if (self.health)
	{
		if (self.spawnflags & SPAWNFLAG_NOTOUCH)
			objerror ("health and notouch don't make sense\n");
		self.max_health = self.health;
		self.th_die = multi_killed;
		self.takedamage = DAMAGE_YES;
		self.solid = SOLID_BBOX;
		setorigin (self, self.origin);	// make sure it links into the world
	}
	else
	{
		if ( !(self.spawnflags & SPAWNFLAG_NOTOUCH) )
		{
			self.touch = multi_touch;
		}
	}
};
// void() trigger_multiple =
// {
// #error Corrupt1 Function: trigger_multiple
// #if 0

// 	do_tail
// 	{
// 		precache_sound(/*27226i*/"misc/secret.wav");
// 		self.noise = "misc/secret.wav";
// 	}
// 	else
// 	{
// 		do
// 		{
// 			precache_sound(/*10531i*/"misc/talk.wav");
// 			self.noise = "misc/talk.wav";
// 		}
// 		else
// 		{
// 			do
// 			{
// 				precache_sound(/*27242i*/"misc/trigger1.wav");
// 				self.noise = "misc/trigger1.wav";
// 			}
// 			else
// 			{

// 			} while ((self.sounds == IT_SHOTGUN));

// 		} while ((self.sounds == IT_SUPER_SHOTGUN));

// 	} while ((self.sounds == TE_EXPLOSION));
// }
// }
// }
// if (!self.wait)
// {
// self.wait = 0.2;
// }
// self.use = multi_use;
// InitTrigger();
// if (self.health)
// {
// if ((self.spawnflags & IT_SHOTGUN))
// {
// objerror(/*27260i*/"health and notouch don't make sense\n");
// }
// self.max_health = self.health;
// self.th_die = multi_killed;
// self.takedamage = IT_SHOTGUN;
// self.solid = IT_SUPER_SHOTGUN;
// setorigin(self, self.origin);
// }
// else
// {
// if (!(self.spawnflags & IT_SHOTGUN))
// {
// self.touch = multi_touch;
// }
// }
// #endif
// };


void() trigger_once =
{
	self.wait = CONTENT_EMPTY;
	trigger_multiple();
};

void() trigger_relay =
{
	self.use = SUB_UseTargets;
};

void() trigger_secret =
{
	total_secrets = total_secrets + IT_SHOTGUN;
	self.wait = CONTENT_EMPTY;
	if (!self.message)
	{
		self.message = "You found a secret area!";
	}
	if (!self.sounds)
	{
		self.sounds = IT_SHOTGUN;
	}
	if ((self.sounds == IT_SHOTGUN))
	{
		precache_sound(/*27226i*/"misc/secret.wav");
		self.noise = "misc/secret.wav";
	}
	else
	{
		if ((self.sounds == IT_SUPER_SHOTGUN))
		{
			precache_sound(/*10531i*/"misc/talk.wav");
			self.noise = "misc/talk.wav";
		}
	}
	trigger_multiple();
};

void() counter_use =
{
	self.count = (self.count - IT_SHOTGUN);
	if ((self.count < TE_SPIKE))
	{
		return;
	}
	if ((self.count != TE_SPIKE))
	{
		if (((activator.classname == "player") && ((self.spawnflags & IT_SHOTGUN) == TE_SPIKE)))
		{
			if ((self.count >= IT_NAILGUN))
			{
				centerprint(activator, "There are more to go...");
			}
			else
			{
				if ((self.count == TE_EXPLOSION))
				{
					centerprint(activator, "Only 3 more to go...");
				}
				else
				{
					if ((self.count == IT_SUPER_SHOTGUN))
					{
						centerprint(activator, "Only 2 more to go...");
					}
					else
					{
						centerprint(activator, "Only 1 more to go...");
					}
				}
			}
		}
		return;
	}
	if (((activator.classname == "player") && ((self.spawnflags & IT_SHOTGUN) == TE_SPIKE)))
	{
		centerprint(activator, "Sequence completed!");
	}
	self.enemy = activator;
	multi_trigger();
};

void() trigger_counter =
{
	self.wait = CONTENT_EMPTY;
	if (!self.count)
	{
		self.count = IT_SUPER_SHOTGUN;
	}
	self.use = counter_use;
};

void() play_teleport =
{
	sound(self, IT_SUPER_SHOTGUN, "misc/r_tele1.wav", IT_SHOTGUN, IT_SHOTGUN);
	remove(self);
};

void(vector org) spawn_tfog =
{
	local entity s;

	s = spawn();
	s.origin = org;
	s.nextthink = (time + 0.2);
	s.think = play_teleport;
	TE_teleport(org);
};

void() tdeath_touch =
{
	if ((other == self.owner))
	{
		return;
	}
	if ((other.classname == "player"))
	{
		if (((other.invincible_finished > time) && (self.owner.invincible_finished > time)))
		{
			other.invincible_finished = TE_SPIKE;
			self.owner.invincible_finished = TE_SPIKE;
			T_Damage(other, self, self.owner, 50000, SVC_UPDATEFRAGS);
			T_Damage(self.owner, self, other, 50000, SVC_UPDATEFRAGS);
			return;
		}
		if ((other.invincible_finished > time))
		{
			T_Damage(self.owner, self, self.owner, 50000, SVC_UPDATEFRAGS);
			return;
		}
	}
	if (other.health)
	{
		T_Damage(other, self, self.owner, 50000, 13);
	}
};

void(vector org, entity death_owner) spawn_tdeath =
{
	local entity death;

	death = spawn();
	death.classname = "teledeath";
	death.movetype = TE_SPIKE;
	death.solid = IT_SHOTGUN;
	death.angles = VEC_ORIGIN;
	setsize(death, (death_owner.mins - '1 1 1'), (death_owner.maxs + '1 1 1'));
	setorigin(death, org);
	death.touch = tdeath_touch;
	death.nextthink = (time + 0.2);
	death.think = SUB_Remove;
	death.owner = death_owner;
	force_retouch = IT_SUPER_SHOTGUN;
};

void() teleport_touch =
{
	local entity t;
	local vector org;

	if (self.targetname)
	{
		if ((self.nextthink < time))
		{
			return;
		}
	}
	if ((self.spawnflags & IT_SHOTGUN))
	{
		if ((other.classname != "player"))
		{
			return;
		}
	}
	if (((other.health <= TE_SPIKE) || (other.solid != TE_EXPLOSION)))
	{
		return;
	}
	SUB_UseTargets();
	spawn_tfog(other.origin);
	t = find(world, targetname, self.target);
	if (!t)
	{
		objerror(/*27577i*/"couldn't find target");
	}
	makevectors(t.mangle);
	org = t.origin + (IT_ROCKET_LAUNCHER * v_forward);
	spawn_tfog(org);
	spawn_tdeath(t.origin, other);
	if (!other.health)
	{
		other.origin = t.origin;
		other.velocity = ((v_forward * other.velocity_x) + (v_forward * other.velocity_y));
		return;
	}
	setorigin(other, t.origin);
	other.angles = t.mangle;
	if ((other.classname == "player"))
	{
		other.fixangle = IT_SHOTGUN;
		other.teleport_time = (time + 0.7);
		if ((other.flags & IT_NAILS))
		{
			other.flags = (other.flags - IT_NAILS);
		}
		other.velocity = (v_forward * 300);
	}
	other.flags = (other.flags - (other.flags & IT_NAILS));
};

void() info_teleport_destination =
{
	self.mangle = self.angles;
	self.angles = VEC_ORIGIN;
	self.model = "";
	self.origin = (self.origin + '0 0 27');
	if (!self.targetname)
	{
		objerror(/*27614i*/"no targetname");
	}
};

void() teleport_use =
{
	self.nextthink = (time + 0.2);
	force_retouch = IT_SUPER_SHOTGUN;
	self.think = SUB_Null;
};

void() trigger_teleport =
{
	local vector o;

	InitTrigger();
	self.touch = teleport_touch;
	if (!self.target)
	{
		objerror(/*27667i*/"no target");
	}
	self.use = teleport_use;
	if (!(self.spawnflags & IT_SUPER_SHOTGUN))
	{
		precache_sound(/*27677i*/"ambience/hum1.wav");
		o = (self.mins + self.maxs) * 0.5;
		ambientsound(o, /*27677i*/"ambience/hum1.wav", 0.5, TE_EXPLOSION);
	}
};

void() trigger_setskill =
{
	remove(self);
};

void() trigger_onlyregistered_touch =
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
	if (cvar(/*20282i*/"registered"))
	{
		self.message = "";
		SUB_UseTargets();
		remove(self);
	}
	else
	{
		if ((self.message != ""))
		{
			centerprint(other, self.message);
			sound(other, IT_NAILGUN, "misc/talk.wav", IT_SHOTGUN, IT_SHOTGUN);
		}
	}
};

void() trigger_onlyregistered =
{
	precache_sound(/*10531i*/"misc/talk.wav");
	InitTrigger();
	self.touch = trigger_onlyregistered_touch;
};

void() hurt_on =
{
	self.solid = IT_SHOTGUN;
	self.nextthink = CONTENT_EMPTY;
};

void() hurt_touch =
{
	if (other.takedamage)
	{
		self.solid = TE_SPIKE;
		T_Damage(other, self, self, self.dmg, 25);
		self.think = hurt_on;
		self.nextthink = (time + IT_SHOTGUN);
	}
	return;
};

void() trigger_hurt =
{
	InitTrigger();
	self.touch = hurt_touch;
	if (!self.dmg)
	{
		self.dmg = TE_LIGHTNING1;
	}
};

void() trigger_push_touch =
{
	if ((other.classname == "grenade"))
	{
		other.velocity = ((self.speed * self.movedir) * TE_LAVASPLASH);
	}
	else
	{
		if ((other.health > TE_SPIKE))
		{
			other.velocity = ((self.speed * self.movedir) * TE_LAVASPLASH);
			if ((other.classname == "player"))
			{
				if ((other.fly_sound < time))
				{
					other.fly_sound = (time + 1.5);
					sound(other, TE_SPIKE, "ambience/windfly.wav", IT_SHOTGUN, IT_SHOTGUN);
				}
			}
		}
	}
	if ((self.spawnflags & IT_SHOTGUN))
	{
		remove(self);
	}
};

void() trigger_push =
{
	InitTrigger();
	precache_sound(/*27815i*/"ambience/windfly.wav");
	self.touch = trigger_push_touch;
	if (!self.speed)
	{
		self.speed = 1000;
	}
};

void() trigger_monsterjump_touch =
{
	if (((other.flags & 35) != IT_ROCKET_LAUNCHER))
	{
		return;
	}
	other.velocity_x = (self.movedir_x * self.speed);
	other.velocity_y = (self.movedir_y * self.speed);
	if (!(other.flags & IT_NAILS))
	{
		return;
	}
	other.flags = (other.flags - IT_NAILS);
	other.velocity_z = self.height;
};

void() trigger_monsterjump =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	if (!self.speed)
	{
		self.speed = 200;
	}
	if (!self.height)
	{
		self.height = 200;
	}
	if ((self.angles == VEC_ORIGIN))
	{
		self.angles = '0 360 0';
	}
	InitTrigger();
	self.touch = trigger_monsterjump_touch;
};
