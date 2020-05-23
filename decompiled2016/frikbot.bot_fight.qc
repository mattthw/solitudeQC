//Decompiled code. Please respect the original copyright.
.entity avoid;

float(entity e) bot_size_player =
{
	local float sz;

	sz = e.health + (e.armorvalue * e.armortype);
	if ((e.weapon == IT_ROCKET_LAUNCHER))
	{
		sz = sz + 60;
	}
	else
	{
		if ((e.weapon == IT_LIGHTNING))
		{
			sz = sz + 60;
		}
		else
		{
			if ((e.weapon == IT_GRENADE_LAUNCHER))
			{
				sz = sz + 50;
			}
			else
			{
				if ((e.weapon == IT_SUPER_NAILGUN))
				{
					sz = sz + 50;
				}
				else
				{
					if ((e.weapon == IT_NAILGUN))
					{
						sz = sz + 40;
					}
					else
					{
						if ((e.weapon == IT_SUPER_SHOTGUN))
						{
							sz = sz + 40;
						}
						else
						{
							if ((e.weapon == IT_SHOTGUN))
							{
								sz = sz + TE_LAVASPLASH;
							}
							else
							{
								if ((e.weapon == IT_AXE))
								{
									sz = sz - 50;
								}
							}
						}
					}
				}
			}
		}
	}
	if ((e.items & 4194304))
	{
		sz = sz + 200;
	}
	if ((e.items & 1048576))
	{
		sz = sz + 300;
	}
	if ((e.items & IT_INVISIBILITY))
	{
		sz = sz + 250;
	}
	return (sz);
};

void() bot_dodge_stuff =
{
	local entity foe;
	local entity head;
	local float avdist;
	local float foesz;
	local float flen;
	local float tsz;
	local vector v;

	if ((waypoint_mode > TE_EXPLOSION))
	{
		return;
	}
	self.avoid = world;
	if (self.enemy)
	{
		v = self.origin - realorigin(self.enemy);
		foesz = bot_size_player(self.enemy);
		foesz = foesz + (vlen(v) * 0.5);
	}
	else
	{
		foesz = 9999999;
	}
	avdist = IT_SHELLS;
	foe = find(world, classname, /*3131i*/"grenade");
	while (foe)
	{
		flen = vlen((foe.origin - self.origin));
		if ((flen < avdist))
		{
			avdist = flen;
			self.avoid = foe;
		}
		foe = find(foe, classname, /*3131i*/"grenade");
	}
	if (!self.avoid)
	{
		foe = find(world, classname, /*3139i*/"missile");
		while (foe)
		{
			if ((foe.owner != self))
			{
				flen = vlen((foe.origin - self.origin));
				if ((flen < avdist))
				{
					avdist = flen;
					self.avoid = foe;
				}
			}
			foe = find(foe, classname, /*3139i*/"missile");
		}
		if (!self.avoid)
		{
			foe = find(world, classname, /*3147i*/"d");
			while (foe)
			{
				if ((foe.owner != self))
				{
					flen = vlen((foe.origin - self.origin));
					if ((flen < avdist))
					{
						avdist = flen;
						self.avoid = foe;
					}
				}
				foe = find(foe, classname, /*3147i*/"d");
			}
		}
	}
	if (coop)
	{
		if (!self.enemy)
		{
			foe = findradius(self.origin, 9999);
			while (foe)
			{
				if ((foe.flags & IT_ROCKET_LAUNCHER))
				{
					if ((foe.health > TE_SPIKE))
					{
						tsz = bot_size_player(foe) + (vlen((foe.origin - self.origin)) * 0.5);
						if ((tsz < foesz))
						{
							if (fisible(foe))
							{
								self.enemy = foe;
								foesz = tsz;
							}
						}
					}
				}
				foe = foe.chain;
			}
		}
	}
	else
	{
		head = findradius(self.origin, 9999);
		while (head)
		{
			if ((head.classname == "Needle-spikes"))
			{
				if ((head.health > TE_SPIKE))
				{
					tsz = bot_size_player(head) + (vlen((head.origin - self.origin)) * 0.5);
					if ((tsz < foesz))
					{
						fov(head);
						if (((fov(head) || (head.b_sound > time)) || (self.b_skill == TE_EXPLOSION)))
						{
							if (fisible(head))
							{
								self.enemy = head;
								foesz = tsz;
							}
						}
					}
				}
			}
			head = head.chain;
		}
		foe = player_head;
		while (foe)
		{
			if ((foe != self))
			{
				if ((foe.modelindex != TE_SPIKE))
				{
					if ((foe.health > TE_SPIKE))
					{
						if (!(teamplay && (self.team == foe.team)))
						{
							tsz = bot_size_player(foe) + (vlen((foe.origin - self.origin)) * 0.5);
							if ((tsz < foesz))
							{
								fov(foe);
								if (((fov(foe) || (foe.b_sound > time)) || (self.b_skill == TE_EXPLOSION)))
								{
									if (fisible(foe))
									{
										self.enemy = foe;
										foesz = tsz;
									}
								}
							}
						}
					}
				}
			}
			foe = foe._next;
		}
	}
};

vector(float wep) weapon_range =
{

	if ((wep == IT_AXE))
	{
		return ('48 0 64');
	}
	else
	{
		if ((wep == IT_SHOTGUN))
		{
			return ('128 0 99999');
		}
		else
		{
			if ((wep == IT_SUPER_SHOTGUN))
			{
				return ('128 0 99999');
			}
			else
			{
				if ((wep == IT_NAILGUN))
				{
					return ('180 0 3000');
				}
				else
				{
					if ((wep == IT_SUPER_NAILGUN))
					{
						return ('180 0 3000');
					}
					else
					{
						if ((wep == IT_GRENADE_LAUNCHER))
						{
							return ('180 48 3000');
						}
						else
						{
							if ((wep == IT_ROCKET_LAUNCHER))
							{
								return ('180 48 3000');
							}
							else
							{
								if ((wep == IT_LIGHTNING))
								{
									return ('350 0 512');
								}
							}
						}
					}
				}
			}
		}
	}
	return ('128 0 99999');
};

void(float brange) bot_weapon_switch =
{
	local float it;
	local float flag;
	local float pulse;
	local vector v;

	it = self.items & 127;
	while (it)
	{
		if (((self.ammo_rockets >= IT_SHOTGUN) && (it & IT_ROCKET_LAUNCHER)))
		{
			flag = IT_ROCKET_LAUNCHER;
			pulse = TE_WIZSPIKE;
		}
		else
		{
			if ((((self.waterlevel <= IT_SHOTGUN) && (self.ammo_cells >= IT_SHOTGUN)) && (it & IT_LIGHTNING)))
			{
				flag = IT_LIGHTNING;
				pulse = IT_SUPER_NAILGUN;
			}
			else
			{
				if (((self.ammo_nails >= IT_SUPER_SHOTGUN) && (it & IT_SUPER_NAILGUN)))
				{
					flag = IT_SUPER_NAILGUN;
					pulse = TE_LIGHTNING1;
				}
				else
				{
					if (((self.ammo_rockets >= IT_SHOTGUN) && (it & IT_GRENADE_LAUNCHER)))
					{
						flag = IT_GRENADE_LAUNCHER;
						pulse = TE_LIGHTNING2;
					}
					else
					{
						if (((self.ammo_shells >= IT_SUPER_SHOTGUN) && (it & IT_SUPER_SHOTGUN)))
						{
							flag = IT_SUPER_SHOTGUN;
							pulse = TE_EXPLOSION;
						}
						else
						{
							if (((self.ammo_nails >= IT_SHOTGUN) && (it & IT_NAILGUN)))
							{
								flag = IT_NAILGUN;
								pulse = IT_NAILGUN;
							}
							else
							{
								if (((self.ammo_shells >= IT_SHOTGUN) && (it & IT_SHOTGUN)))
								{
									flag = IT_SHOTGUN;
									pulse = IT_SUPER_SHOTGUN;
								}
								else
								{
									if (pulse)
									{
										self.impulse = pulse;
									}
									return;
								}
							}
						}
					}
				}
			}
		}
		if ((brange == CONTENT_EMPTY))
		{
			if (pulse)
			{
				self.impulse = pulse;
			}
			return;
		}
		v = weapon_range(flag);
		if (((brange < v_y) || (brange > v_z)))
		{
			it = it - flag;
		}
		else
		{
			if (pulse)
			{
				self.impulse = pulse;
			}
			return;
		}
	}
};
float max_nades;

void(float enemy_range) bot_shoot =
{
	local float r;
	local float g;

	r = random();
	g = angcomp(self.v_angle_x, self.b_angle_x);
	if ((fabs(g) > SVC_INTERMISSION))
	{
		return;
	}
	g = angcomp(self.v_angle_y, self.b_angle_y);
	if ((fabs(g) > SVC_INTERMISSION))
	{
		return;
	}
	max_nades = self.nade_lives + self.plasma_lives;
	if (((((max_nades != TE_SPIKE) && (r <= 0.01)) && (enemy_range <= 50)) && (deathmatch != TE_EXPLOSION)))
	{
		self.impulse = SVC_FOUNDSECRET;
	}
	else
	{
		self.button0 = IT_SHOTGUN;
	}
};

void() bot_fight_style =
{
	local vector v;
	local vector v1;
	local vector v2;
	local vector org;
	local float foedist;
	local float mysz;
	local float foesz;

	if ((self.enemy.health <= TE_SPIKE))
	{
		self.enemy = world;
		return;
	}
	else
	{
		if (!self.enemy.takedamage)
		{
			self.enemy = world;
			return;
		}
		else
		{
			if (!fisible(self.enemy))
			{
				self.enemy = world;
				return;
			}
		}
	}
	org = realorigin(self.enemy);
	makevectors(self.v_angle);
	foedist = vlen((org - self.origin));
	v = weapon_range(self.weapon);
	if (((foedist > v_y) && (foedist < v_z)))
	{
		traceline((self.origin + self.view_ofs), ((self.origin + self.view_ofs) + (v_forward * v_z)), TE_SPIKE, self);
		if ((vlen((trace_endpos - (self.origin + self.view_ofs))) >= v_y))
		{
			if ((trace_ent.classname == "player"))
			{
				if ((((trace_ent.team == self.team) && teamplay) || coop))
				{
					return;
				}
			}
			bot_shoot(TE_SPIKE);
		}
	}
	else
	{
		bot_weapon_switch(foedist);
	}
	if (!(self.b_aiflags & 161))
	{
		foesz = bot_size_player(self.enemy);
		mysz = bot_size_player(self) + TE_LIGHTNING1;
		if ((foesz > mysz))
		{
			if (teamplay)
			{
				if ((random() < 0.02))
				{
					bot_start_topic(TE_LIGHTNING1);
					self.b_chattime = IT_SHOTGUN;
				}
			}
			return;
		}
		else
		{
			if ((mysz < 140))
			{
				return;
			}
			else
			{
				if (self.avoid)
				{
					if (self.avoid.velocity_x)
					{
						v = self.avoid.velocity;
					}
					else
					{
						v = normalize((self.avoid.origin - self.origin));
					}
					v1_x = v_y * CONTENT_EMPTY;
					v1_y = v_x;
					v2_x = v_y;
					v2_y = v_x * CONTENT_EMPTY;
					foedist = vlen((self.avoid.origin - (self.origin + v1)));
					if ((foedist < vlen((self.avoid.origin - (self.origin + v2)))))
					{
						frik_walkmove(v2);
					}
					else
					{
						frik_walkmove(v1);
					}
				}
				else
				{
					if (!(self.enemy.flags & IT_ROCKET_LAUNCHER))
					{
						if (((foedist + IT_ROCKET_LAUNCHER) < v_x))
						{
							frik_walkmove((self.origin - org));
						}
						else
						{
							if (((foedist - IT_ROCKET_LAUNCHER) > v_x))
							{
								frik_walkmove((org - self.origin));
							}
							else
							{
								if (self.wallhug)
								{
									frik_walkmove(v_right);
								}
								else
								{
									frik_walkmove((v_right * CONTENT_EMPTY));
								}
							}
						}
					}
				}
			}
		}
	}
	else
	{
		foesz = bot_size_player(self.enemy);
		mysz = bot_size_player(self) + TE_LIGHTNING1;
		if ((foesz > mysz))
		{
			return;
		}
		else
		{
			if ((mysz < 140))
			{
				return;
			}
		}
		self.keys = (self.keys & 960);
	}
};
