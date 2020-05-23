//Decompiled code. Please respect the original copyright.
void() info_player_start;
void(entity targ, entity attacker, float mod) ClientObituary;
void(entity inflictor, entity attacker, float damage, float radius, entity ignore, float mod) T_RadiusDamage;
void() monster_death_use;
void() FoundTarget;

float(entity targ, entity inflictor) CanDamage =
{

	if ((targ.movetype == TE_WIZSPIKE))
	{
		traceline(inflictor.origin, (0.5 * (targ.absmin + targ.absmax)), IT_SHOTGUN, self);
		if ((trace_fraction == IT_SHOTGUN))
		{
			return (IT_SHOTGUN);
		}
		if ((trace_ent == targ))
		{
			return (IT_SHOTGUN);
		}
		return (TE_SPIKE);
	}
	traceline(inflictor.origin, targ.origin, IT_SHOTGUN, self);
	if ((trace_fraction == IT_SHOTGUN))
	{
		return (IT_SHOTGUN);
	}
	traceline(inflictor.origin, (targ.origin + '15 15 0'), IT_SHOTGUN, self);
	if ((trace_fraction == IT_SHOTGUN))
	{
		return (IT_SHOTGUN);
	}
	traceline(inflictor.origin, (targ.origin + '-15 -15 0'), IT_SHOTGUN, self);
	if ((trace_fraction == IT_SHOTGUN))
	{
		return (IT_SHOTGUN);
	}
	traceline(inflictor.origin, (targ.origin + '-15 15 0'), IT_SHOTGUN, self);
	if ((trace_fraction == IT_SHOTGUN))
	{
		return (IT_SHOTGUN);
	}
	traceline(inflictor.origin, (targ.origin + '15 -15 0'), IT_SHOTGUN, self);
	if ((trace_fraction == IT_SHOTGUN))
	{
		return (IT_SHOTGUN);
	}
	return (TE_SPIKE);
};

void(entity targ, entity attacker, float mod) Killed =
{
	local entity oself;

	oself = self;
	self = targ;
	if ((self.health < -99))
	{
		self.health = -99;
	}
	self.enemy = attacker;
	if (((self.movetype == TE_WIZSPIKE) || (self.movetype == TE_SPIKE)))
	{
		self.th_die();
		self = oself;
		return;
	}
	if ((self.flags & IT_ROCKET_LAUNCHER))
	{
		killed_monsters = killed_monsters + IT_SHOTGUN;
		WriteByte(IT_SUPER_SHOTGUN, SVC_KILLEDMONSTER);
		monster_death_use();
	}
	ClientObituary(self, attacker, mod);
	self.takedamage = TE_SPIKE;
	self.touch = SUB_Null;
	self.effects = TE_SPIKE;
	self.th_die();
	self = oself;
};

float(entity targ, entity attacker) OnSameTeam =
{
	if ((attacker == targ))
	{
		return (IT_SHOTGUN);
	}
	if (((targ.classname != "player") || (attacker.classname != "player")))
	{
		return (TE_SPIKE);
	}
	if (coop)
	{
		return (IT_SHOTGUN);
	}
	if ((teamplay == TE_SPIKE))
	{
		return (TE_SPIKE);
	}
	if (!targ.team)
	{
		return (TE_SPIKE);
	}
	if ((targ.team == attacker.team))
	{
		return (IT_SHOTGUN);
	}
	return (TE_SPIKE);
};

float(entity targ, entity attacker, float mod) DisallowFriendlyFire =
{
	if (((targ == attacker) && (teamplay != IT_SHOTGUN)))
	{
		return (TE_SPIKE);
	}
	OnSameTeam(targ, attacker);
	if ((OnSameTeam(targ, attacker) && ((teamplay == IT_SHOTGUN) || (teamplay == TE_EXPLOSION))))
	{
		return (IT_SHOTGUN);
	}
	return (TE_SPIKE);
};

void(entity targ, entity inflictor, entity attacker, float damage, float mod) T_Damage =
{
	local vector dir;
	local entity oldself;
	local float save;
	local float take;

	if (!targ.takedamage)
	{
		return;
	}
	damage_attacker = attacker;
	damage_mod = mod;
	if (((attacker.super_damage_finished > time) && (mod != 15)))
	{
		if ((deathmatch == IT_NAILGUN))
		{
			damage = damage * IT_SUPER_NAILGUN;
		}
		else
		{
			damage = damage * IT_NAILGUN;
		}
	}
	save = ceil((targ.armortype * damage));
	if ((save >= targ.armorvalue))
	{
		save = targ.armorvalue;
		targ.armortype = TE_SPIKE;
		targ.items = (targ.items - (targ.items & 57344));
	}
	targ.armorvalue = (targ.armorvalue - save);
	take = ceil((damage - save));
	if ((targ.flags & IT_SUPER_NAILGUN))
	{
		targ.dmg_take = (targ.dmg_take + take);
		targ.dmg_save = (targ.dmg_save + save);
		targ.dmg_inflictor = inflictor;
	}
	damage_inflictor = inflictor;
	if (((inflictor != world) && (targ.movetype == TE_EXPLOSION)))
	{
		dir = targ.origin - ((inflictor.absmin + inflictor.absmax) * 0.5);
		dir = normalize(dir);
		targ.velocity = (targ.velocity + ((dir * damage) * 1.75));
		if (((rj > IT_SHOTGUN) && (attacker == targ)))
		{
			if ((targ.classname == "player"))
			{
				targ.velocity = (targ.velocity + ((dir * damage) * rj));
			}
		}
	}
	if ((targ.flags & IT_LIGHTNING))
	{
		return;
	}
	if ((targ.invincible_finished >= time))
	{
		if ((targ.invincible_sound < time))
		{
			sound(targ, TE_EXPLOSION, "items/protect3.wav", IT_SHOTGUN, IT_SHOTGUN);
			targ.invincible_sound = (time + IT_SUPER_SHOTGUN);
		}
		return;
	}
	if (DisallowFriendlyFire(targ, attacker, mod))
	{
		return;
	}
	targ.health = (targ.health - take);
	if ((targ.health <= TE_SPIKE))
	{
		Killed(targ, attacker, mod);
		return;
	}
	oldself = self;
	self = targ;
	if (((self.flags & IT_ROCKET_LAUNCHER) && (attacker != world)))
	{
		if (((self != attacker) && (attacker != self.enemy)))
		{
			if (((self.classname != attacker.classname) || (self.classname == "monster_army")))
			{
				if ((self.enemy.classname == "player"))
				{
					self.oldenemy = self.enemy;
				}
				self.enemy = attacker;
				FoundTarget();
			}
		}
	}
	if (self.th_pain)
	{
		self.th_pain(attacker, take);
	}
	self = oldself;
};

void(entity inflictor, entity attacker, float damage, float radius, entity ignore, float mod) T_RadiusDamage =
{
	local float points;
	local entity head;
	local vector org;

	head = findradius(inflictor.origin, radius);
	while (head)
	{
		if ((head != ignore))
		{
			if (head.takedamage)
			{
				org = head.origin + ((head.mins + head.maxs) * 0.5);
				points = 0.5 * vlen((inflictor.origin - org));
				if ((points < TE_SPIKE))
				{
					points = TE_SPIKE;
				}
				points = damage - points;
				if ((head == attacker))
				{
					points = points * 0.5;
				}
				if ((points > TE_SPIKE))
				{
					if (CanDamage(head, inflictor))
					{
						T_Damage(head, inflictor, attacker, points, mod);
					}
				}
			}
		}
		head = head.chain;
	}
};
