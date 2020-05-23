//Decompiled code. Please respect the original copyright.
void() W_SetCurrentAmmo;
void(float weap) W_WeaponSwitch;
void(entity ent) W_UpdateAmmoCounts;
void(entity client) pre_player_pull;
void(entity t_wep, float weptype) SetWeaponAmmo;
void() weapon_touch;

void() SUB_regen =
{
	local float r;

	r = floor((random() * TE_LIGHTNING3));
	if ((ROUND_NEW == IT_SHOTGUN))
	{
		self.model = self.mdl;
		if ((self.weapon_type == TE_SPIKE))
		{
			self.solid = IT_SHOTGUN;
		}
		else
		{
			self.solid = IT_SUPER_SHOTGUN;
		}
		if ((self.weapon_type == IT_SHOTGUN))
		{
			if ((r == TE_SPIKE))
			{
				self.weapon = IT_NAILGUN;
				self.skin = IT_NAILGUN;
			}
			else
			{
				if ((r == IT_SHOTGUN))
				{
					self.weapon = IT_SUPER_NAILGUN;
					self.skin = TE_WIZSPIKE;
				}
				else
				{
					if ((r == IT_SUPER_SHOTGUN))
					{
						self.weapon = IT_LIGHTNING;
						self.skin = IT_SHOTGUN;
					}
					else
					{
						if ((r == TE_EXPLOSION))
						{
							self.weapon = IT_SHOTGUN;
							self.skin = IT_SUPER_NAILGUN;
						}
						else
						{
							if ((r == IT_NAILGUN))
							{
								self.weapon = IT_EXTRA_WEAPON;
								self.skin = IT_SUPER_SHOTGUN;
							}
							else
							{
								if ((r == TE_LIGHTNING1))
								{
									self.weapon = IT_GRENADE_LAUNCHER;
									self.skin = TE_LIGHTNING2;
								}
								else
								{
									if ((r == TE_LIGHTNING2))
									{
										self.weapon = IT_SUPER_SHOTGUN;
										self.skin = TE_LIGHTNING1;
									}
									else
									{
										if ((r == TE_WIZSPIKE))
										{
											self.weapon = IT_ROCKET_LAUNCHER;
											self.skin = TE_EXPLOSION;
										}
										else
										{
											if ((r == IT_SUPER_NAILGUN))
											{
												self.weapon = IT_BR;
												self.skin = IT_NAILGUN;
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
		self.touch = weapon_touch;
		self.flags = IT_SHELLS;
		setorigin(self, self.origin);
		SetWeaponAmmo(self, self.weapon);
	}
	else
	{
		self.nextthink = (time + IT_SHOTGUN);
	}
};

void() PlaceItem =
{
	local float oldz;

	self.mdl = self.model;
	self.flags = IT_SHELLS;
	self.solid = IT_SHOTGUN;
	self.movetype = TE_LIGHTNING2;
	self.velocity = VEC_ORIGIN;
	self.origin_z = (self.origin_z + TE_LIGHTNING2);
	oldz = self.origin_z;
	if (!droptofloor())
	{
		dprint(/*13103i*/"Bonus item fell out of level at ");
		dprint(vtos(self.origin));
		dprint(/*2101i*/"\n");
		remove(self);
		return;
	}
};

void() StartItem =
{
	self.nextthink = (time + 0.2);
	self.think = PlaceItem;
};

void() bound_other_ammo =
{
	if ((other.ammo_shells_real > 100))
	{
		other.ammo_shells_real = 100;
	}
	if ((other.ammo_nails_real > 200))
	{
		other.ammo_nails_real = 200;
	}
	if ((other.ammo_rockets_real > 100))
	{
		other.ammo_rockets_real = 100;
	}
	if ((other.ammo_cells_real > 100))
	{
		other.ammo_cells_real = 100;
	}
	if ((other.exshells > 100))
	{
		other.exshells = 100;
	}
	if ((other.exnails > 200))
	{
		other.exnails = 200;
	}
	if ((other.exrockets > 100))
	{
		other.exrockets = 100;
	}
	if ((other.excells > 100))
	{
		other.excells = 100;
	}
};
float() W_BestWeapon;

void() BackpackTouch =
{
	local string s;
	local float best;
	local float old;
	local float new;
	local entity stemp;
	local float acount;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= TE_SPIKE))
	{
		return;
	}
	acount = TE_SPIKE;
	sprint(other, "You get ");
	if (self.items)
	{
		if (((other.items & self.items) == TE_SPIKE))
		{
			acount = IT_SHOTGUN;
			sprint(other, "the ");
			sprint(other, self.netname);
		}
	}
	stemp = self;
	self = other;
	best = W_BestWeapon();
	self = stemp;
	other.exshells = (other.exshells + self.exshells);
	other.exnails = (other.exnails + self.exnails);
	other.exrockets = (other.exrockets + self.exrockets);
	other.excells = (other.excells + self.excells);
	new = self.items;
	if (!new)
	{
		new = other.weapon;
	}
	old = other.items;
	other.items = (other.items | new);
	bound_other_ammo();
	if (self.exshells)
	{
		if (acount)
		{
			sprint(other, ", ");
		}
		acount = IT_SHOTGUN;
		s = ftos(self.exshells);
		sprint(other, s);
		sprint(other, " shells");
	}
	if (self.exnails)
	{
		if (acount)
		{
			sprint(other, ", ");
		}
		acount = IT_SHOTGUN;
		s = ftos(self.exnails);
		sprint(other, s);
		sprint(other, " nails");
	}
	if (self.exrockets)
	{
		if (acount)
		{
			sprint(other, ", ");
		}
		acount = IT_SHOTGUN;
		s = ftos(self.exrockets);
		sprint(other, s);
		sprint(other, " rockets");
	}
	if (self.excells)
	{
		if (acount)
		{
			sprint(other, ", ");
		}
		acount = IT_SHOTGUN;
		s = ftos(self.excells);
		sprint(other, s);
		sprint(other, " cells");
	}
	sprint(other, "\n");
	sound(other, TE_EXPLOSION, "weapons/lock4.wav", IT_SHOTGUN, IT_SHOTGUN);
	stuffcmd(other, "bf\n");
	remove(self);
	self = other;
};

void() DropBackpack =
{
	local entity item;

	if (!(((self.exshells + self.exnails) + self.exrockets) + self.excells))
	{
		return;
	}
	item = spawn();
	item.origin = (self.origin - '0 0 24');
	item.items = self.weapon;
	if ((item.items == IT_AXE))
	{
		item.netname = "Axe";
	}
	else
	{
		if ((item.items == IT_SHOTGUN))
		{
			item.netname = "Pistol";
		}
		else
		{
			if ((item.items == IT_SUPER_SHOTGUN))
			{
				item.netname = "SMG";
			}
			else
			{
				if ((item.items == IT_NAILGUN))
				{
					item.netname = "Rifle";
				}
				else
				{
					if ((item.items == IT_SUPER_NAILGUN))
					{
						item.netname = "Super Nailgun";
					}
					else
					{
						if ((item.items == IT_GRENADE_LAUNCHER))
						{
							item.netname = "Grenade Launcher";
						}
						else
						{
							if ((item.items == IT_ROCKET_LAUNCHER))
							{
								item.netname = "Rocket Launcher";
							}
							else
							{
								if ((item.items == IT_LIGHTNING))
								{
									item.netname = "Thunderbolt";
								}
								else
								{
									item.netname = "";
								}
							}
						}
					}
				}
			}
		}
	}
	item.exshells = self.exshells;
	item.exnails = self.exnails;
	item.exrockets = self.exrockets;
	item.excells = self.excells;
	item.velocity_z = 300;
	item.velocity_x = (-100 + (random() * 200));
	item.velocity_y = (-100 + (random() * 200));
	item.flags = IT_SHELLS;
	item.solid = IT_SHOTGUN;
	item.movetype = TE_LIGHTNING2;
	setmodel(item, /*13335i*/"progs/backpack.mdl");
	setsize(item, '-16 -16 0', '16 16 56');
	item.touch = BackpackTouch;
	item.nextthink = (time + 120);
	item.think = SUB_Remove;
};

void() plasma_nade_touch =
{
	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.plasma_lives >= IT_NAILGUN))
	{
	}
	else
	{
		other.plasma_lives = (other.plasma_lives + IT_SHOTGUN);
		NadeCounter(other);
		sprint(other, "picked up a Plasma grenade\n");
		sound(self, IT_SHOTGUN, "weapons/pbounce.wav", IT_SHOTGUN, IT_SHOTGUN);
		stuffcmd(other, "bf\n");
		self.mdl = self.model;
		self.model = string_null;
		self.solid = TE_SPIKE;
		if (deathmatch)
		{
			self.nextthink = (time + 20);
			self.think = SUB_regen;
		}
		activator = other;
		SUB_UseTargets();
	}
};

void() nade_touch =
{
	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.nade_lives >= IT_NAILGUN))
	{
	}
	else
	{
		other.nade_lives = (other.nade_lives + IT_SHOTGUN);
		NadeCounter(other);
		sprint(other, "picked up a Frag grenade\n");
		sound(self, IT_SHOTGUN, "weapons/grenpick.wav", IT_SHOTGUN, IT_SHOTGUN);
		stuffcmd(other, "bf\n");
		self.mdl = self.model;
		self.model = string_null;
		self.solid = TE_SPIKE;
		if (deathmatch)
		{
			self.nextthink = (time + 20);
			self.think = SUB_regen;
		}
		activator = other;
		SUB_UseTargets();
	}
};

void() pod_touch =
{
	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.impulse == 13))
	{
		other.ammo_nails = 60;
		other.exnails = 560;
		other.weapon = IT_NAILGUN;
		W_UpdateAmmoCounts(other);
		pre_player_pull(other);
		stuffcmd(other, "bf\n");
		self.mdl = self.model;
		self.model = string_null;
		self.solid = TE_SPIKE;
		if (deathmatch)
		{
			self.nextthink = (time + 20);
			self.think = SUB_regen;
		}
		activator = other;
		SUB_UseTargets();
	}
};

void() item_nade =
{
	if ((deathmatch == TE_EXPLOSION))
	{
		remove(self);
	}
	self.owner = other;
	self.classname = "weapon_pickup";
	self.touch = nade_touch;
	setmodel(self, /*13501i*/"progs/fraggren.mdl");
	setsize(self, VEC_ORIGIN, '2 2 2');
	StartItem();
};

void() item_plasma_nade =
{
	if ((deathmatch == TE_EXPLOSION))
	{
		remove(self);
	}
	self.owner = other;
	self.classname = "weapon_pickup";
	self.touch = plasma_nade_touch;
	setmodel(self, /*13530i*/"progs/plasgren.mdl");
	setsize(self, VEC_ORIGIN, '2 2 2');
	StartItem();
};

void() item_weapon_pod =
{
	local float r;

	if ((deathmatch != IT_SUPER_SHOTGUN))
	{
		remove(self);
		return;
	}
	r = floor((random() * TE_LIGHTNING3));
	if ((r == TE_SPIKE))
	{
		self.weapon = IT_NAILGUN;
		self.skin = IT_NAILGUN;
	}
	else
	{
		if ((r == IT_SHOTGUN))
		{
			self.weapon = IT_SUPER_NAILGUN;
			self.skin = TE_WIZSPIKE;
		}
		else
		{
			if ((r == IT_SUPER_SHOTGUN))
			{
				self.weapon = IT_LIGHTNING;
				self.skin = IT_SHOTGUN;
			}
			else
			{
				if ((r == TE_EXPLOSION))
				{
					self.weapon = IT_SHOTGUN;
					self.skin = IT_SUPER_NAILGUN;
				}
				else
				{
					if ((r == IT_NAILGUN))
					{
						self.weapon = IT_EXTRA_WEAPON;
						self.skin = IT_SUPER_SHOTGUN;
					}
					else
					{
						if ((r == TE_LIGHTNING1))
						{
							self.weapon = IT_GRENADE_LAUNCHER;
							self.skin = TE_LIGHTNING2;
						}
						else
						{
							if ((r == TE_LIGHTNING2))
							{
								self.weapon = IT_SUPER_SHOTGUN;
								self.skin = TE_LIGHTNING1;
							}
							else
							{
								if ((r == TE_WIZSPIKE))
								{
									self.weapon = IT_ROCKET_LAUNCHER;
									self.skin = TE_EXPLOSION;
								}
								else
								{
									if ((r == IT_SUPER_NAILGUN))
									{
										self.weapon = IT_BR;
										self.skin = IT_NAILGUN;
									}
								}
							}
						}
					}
				}
			}
		}
	}
	SetWeaponAmmo(self, self.weapon);
	self.classname = "weapon_pickup";
	self.mdl = self.model;
	self.effects = IT_SUPER_NAILGUN;
	self.weapon_type = IT_SHOTGUN;
	self.movetype = TE_SPIKE;
	self.solid = IT_SUPER_SHOTGUN;
	self.flags = IT_SHELLS;
	self.owner = other;
	self.touch = weapon_touch;
	self.velocity = VEC_ORIGIN;
	setmodel(self, /*13566i*/"progs/pod.mdl");
	setsize(self, VEC_HULL_MIN, VEC_HULL_MAX);
};

void() Touch_Die =
{
	self.think = SUB_Remove;
	self.nextthink = (time + 15);
	if ((self.selnade == TE_SPIKE))
	{
		self.touch = nade_touch;
	}
	else
	{
		self.touch = plasma_nade_touch;
	}
};

void(float gren_type) ThrowNade =
{
	local entity newthrow;

	newthrow = spawn();
	newthrow.owner = self;
	newthrow.selnade = gren_type;
	newthrow.origin = ((self.origin + '0 0 16') + ((v_right * CONTENT_SKY) * (IT_SUPER_SHOTGUN * (random() + -0.5))));
	if ((newthrow.selnade == TE_SPIKE))
	{
		setmodel(newthrow, /*13501i*/"progs/fraggren.mdl");
	}
	else
	{
		setmodel(newthrow, /*13530i*/"progs/plasgren.mdl");
	}
	setsize(newthrow, VEC_ORIGIN, VEC_ORIGIN);
	makevectors(self.v_angle);
	if (self.v_angle_x)
	{
		newthrow.velocity = ((((v_forward * 45) + (v_up * 200)) + (((IT_SUPER_SHOTGUN * (random() + -0.5)) * v_right) * 20)) + (((IT_SUPER_SHOTGUN * (random() + -0.5)) * v_up) * TE_LIGHTNING2));
	}
	else
	{
		newthrow.velocity = aim(self, 10000);
		newthrow.velocity = (newthrow.velocity * 45);
		newthrow.velocity_z = 200;
	}
	newthrow.movetype = TE_LAVASPLASH;
	newthrow.solid = IT_SHOTGUN;
	newthrow.classname = "weapon_pickup";
	newthrow.flags = IT_SHELLS;
	newthrow.gravity = TE_LIGHTNING1;
	newthrow.avelocity = '300 300 300';
	newthrow.think = Touch_Die;
	newthrow.nextthink = (time + IT_SHOTGUN);
};

void() Dead_Nades =
{
	if ((self.nade_lives == IT_SHOTGUN))
	{
		ThrowNade(TE_SPIKE);
	}
	else
	{
		if ((self.nade_lives > IT_SHOTGUN))
		{
			ThrowNade(TE_SPIKE);
			ThrowNade(TE_SPIKE);
		}
	}
	if ((self.plasma_lives == IT_SHOTGUN))
	{
		ThrowNade(IT_SHOTGUN);
	}
	else
	{
		if ((self.plasma_lives > IT_SHOTGUN))
		{
			ThrowNade(IT_SHOTGUN);
			ThrowNade(IT_SHOTGUN);
		}
	}
};
