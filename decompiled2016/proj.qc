//Decompiled code. Please respect the original copyright.

float() _PRJ_Bounce =
{
	if ((other.takedamage == IT_SUPER_SHOTGUN))
	{
		return (TE_SPIKE);
	}
	sound(self, IT_SHOTGUN, "weapons/bounce.wav", IT_SHOTGUN, IT_SHOTGUN);
	if ((self.velocity == VEC_ORIGIN))
	{
		self.avelocity = VEC_ORIGIN;
	}
	return (IT_SHOTGUN);
};

float() _PRJ_Remove =
{
	remove(self);
	return (IT_SHOTGUN);
};

float() _PRJ_Stop =
{
	if (other.takedamage)
	{
		return (TE_SPIKE);
	}
	sound(self, IT_SHOTGUN, "zombie/z_miss.wav", IT_SHOTGUN, IT_SHOTGUN);
	self.velocity = VEC_ORIGIN;
	self.avelocity = VEC_ORIGIN;
	self.proj_touch = _PRJ_Remove;
	return (IT_SHOTGUN);
};

void() _PRJ_Touch =
{
	local entity ignore;
	local entity boom;

	// check validity of projectile
	if (other == self.owner)
		return; // don't explode on owner

	if (self.voided) {
		return;
	}

	if (pointcontents(self.origin) == CONTENT_SKY)
	{
		remove(self);
		return;
	}

	// handle custom touch
	if (other != self) // didn't expire
		if (self.proj_touch) // is valid function
			if (self.proj_touch())
				return;

	// void projectile
	self.voided = 1;

	// do projectile damage
	ignore = self;

	// Arkage: Gryo test
	boom = Gyro_Force_Create("boom", self.origin);
	Gyro_Force_ApplyAffector_Sphere(boom, 10, FALSE);
	Gyro_Force_Attach(boom, self);
	
	if (other.health >= 1 && self.damage_direct)
	{
		T_Damage (other, self, self.owner, self.damage_direct, self.mod_direct);
		ignore = other;
	}

	if (self.radius_exp)
		T_RadiusDamage (self, self.owner, self.damage_exp, self.radius_exp, ignore, self.mod_exp);
	
	// run projectile effect
	switch (self.proj_effect)
	{
	case PE_SPIKE:
		if (ignore != self) // hit something
			spawn_touchblood (self.damage_direct);
		else if (other != self) // didn't expire
			TE_spike(self.origin);
		break;
	case PE_SUPERSPIKE:
		if (ignore != self) // hit something
			spawn_touchblood (self.damage_direct);
		else if (other != self) // didn't expire
			TE_superspike(self.origin);
		break;
	case PE_WIZSPIKE:
		if (ignore != self) // hit something
			spawn_touchblood (self.damage_direct);
		else if (other != self) // didn't expire
			TE_wizspike(self.origin);
		break;
	case PE_KNIGHTSPIKE:
		if (ignore != self) // hit something
			spawn_touchblood (self.damage_direct);
		else if (other != self) // didn't expire
			TE_knightspike(self.origin);
		break;
	case PE_LASER:
		if (other != self)
			sound (self, CHAN_WEAPON, "enforcer/enfstop.wav", 1, ATTN_STATIC);
		self.origin = self.origin - 8 * normalize(self.velocity);
	case PE_GUNSHOT:
		if (ignore != self) // hit something
			spawn_touchblood (self.damage_direct);
		else if (other != self) // didn't expire
			TE_gunshot(self.origin);
		break;
	case PE_EXPLOSION:
		self.origin = self.origin - 8 * normalize(self.velocity);
	case PE_EXPLOSIONGROUND:
		TE_explosion(self.origin);
		break;
	case PE_EXPLOSIONGROUND:
		TE_explosion(self.origin);
		break;
	case PE_ZOMBIEGIB:
		sound (self, CHAN_WEAPON, "zombie/z_hit.wav", 1, ATTN_NORM);
		break;
	}
	
	Gyro_Force_Remove(boom);
	remove(self);
};
// void() _PRJ_Touch =
// {
// #error Corrupt1 Function: _PRJ_Touch
// #if 0
// 	local entity ignore;

// 	if ((other == self.owner))
// 	{
// 		return;
// 	}
// 	if (self.voided)
// 	{
// 		return;
// 	}
// 	if ((pointcontents(self.origin) == CONTENT_SKY))
// 	{
// 		remove(self);
// 		return;
// 	}
// 	if ((other != self))
// 	{
// 		if (self.proj_touch)
// 		{
// 			if (self.proj_touch())
// 			{
// 				return;
// 			}
// 		}
// 	}
// 	self.voided = IT_SHOTGUN;
// 	ignore = self;
// 	if (((other.health >= IT_SHOTGUN) && self.damage_direct))
// 	{
// 		T_Damage(other, self, self.owner, self.damage_direct, self.mod_direct);
// 		ignore = other;
// 	}
// 	if (self.radius_exp)
// 	{
// 		T_RadiusDamage(self, self.owner, self.damage_exp, self.radius_exp, ignore, self.mod_exp);
// 	}
// 	do_tail
// 	{
// 		if ((ignore != self))
// 		{
// 			spawn_touchblood(self.damage_direct);
// 		}
// 		else
// 		{
// 			if ((other != self))
// 			{
// 				TE_spike(self.origin);
// 			}
// 		}
// 	}
// 	else
// 	{
// 		do
// 		{
// 			if ((ignore != self))
// 			{
// 				spawn_touchblood(self.damage_direct);
// 			}
// 			else
// 			{
// 				if ((other != self))
// 				{
// 					TE_superspike(self.origin);
// 				}
// 			}
// 		}
// 		else
// 		{
// 			do
// 			{
// 				if ((ignore != self))
// 				{
// 					spawn_touchblood(self.damage_direct);
// 				}
// 				else
// 				{
// 					if ((other != self))
// 					{
// 						TE_wizspike(self.origin);
// 					}
// 				}
// 			}
// 			else
// 			{
// 				do
// 				{
// 					if ((ignore != self))
// 					{
// 						spawn_touchblood(self.damage_direct);
// 					}
// 					else
// 					{
// 						if ((other != self))
// 						{
// 							TE_knightspike(self.origin);
// 						}
// 					}
// 				}
// 				else
// 				{
// 					do
// 					{
// 						if ((other != self))
// 						{
// 							sound(self, IT_SHOTGUN, "enforcer/enfstop.wav", IT_SHOTGUN, TE_EXPLOSION);
// 						}
// 						self.origin = (self.origin - (IT_SUPER_NAILGUN * normalize(self.velocity)));
// 						do
// 						{
// 							if ((ignore != self))
// 							{
// 								spawn_touchblood(self.damage_direct);
// 							}
// 							else
// 							{
// 								if ((other != self))
// 								{
// 									TE_gunshot(self.origin);
// 								}
// 							}
// 						}
// 						else
// 						{
// 							do
// 							{
// 								self.origin = (self.origin - (IT_SUPER_NAILGUN * normalize(self.velocity)));
// 								do
// 								{
// 									plasmaexplo(self.origin);
// 									sound(self, IT_SHOTGUN, "weapons/plasma_blow.wav", IT_SHOTGUN, IT_SHOTGUN);
// 								}
// 								else
// 								{
// 									do
// 									{
// 										sound(self, IT_SHOTGUN, "zombie/z_hit.wav", IT_SHOTGUN, IT_SHOTGUN);
// 									}
// 									else
// 									{

// 									} while ((self.proj_effect == IT_SHOTGUN));

// 								} while ((self.proj_effect == IT_SUPER_SHOTGUN));

// 							} while ((self.proj_effect == TE_EXPLOSION));

// 						} while ((self.proj_effect == IT_NAILGUN));

// 					} while ((self.proj_effect == IT_SUPER_NAILGUN));

// 				} while ((self.proj_effect == TE_LIGHTNING1));

// 			} while ((self.proj_effect == TE_LIGHTNING2));

// 		} while ((self.proj_effect == TE_WIZSPIKE));

// 	} while ((self.proj_effect == TE_LIGHTNING3));
// }
// }
// }
// }
// }
// }
// }
// remove(self);
// #endif
// };

void() _PRJ_Expire =
{
	other = self;
	_PRJ_Touch();
};

void() _PRJ_Think =
{
	if ((self.expire_time > time))
	{
		_PRJ_Expire();
		return;
	}
	self.nextthink = (time + self.proj_think_time);
	self.proj_think();
};

void() PRJ_SetBouncyProjectile =
{
	newmis.proj_touch = _PRJ_Bounce;
	newmis.movetype = TE_LAVASPLASH;
	newmis.avelocity = '300 300 300';
};

void() PRJ_SetTossedProjectile =
{
	newmis.proj_touch = _PRJ_Stop;
	newmis.movetype = TE_LAVASPLASH;
	newmis.avelocity = '3000 1000 2000';
};

void(float damg, float damgrad, float damgmod) PRJ_SetRadiusDamage =
{
	newmis.damage_exp = damg;
	newmis.radius_exp = damgrad;
	newmis.mod_exp = damgmod;
};

void(void() thinkfunc, float thinktimeinit, float thinkres) PRJ_SetThink =
{
	newmis.think = _PRJ_Think;
	newmis.nextthink = (time + thinktimeinit);
	newmis.proj_think = thinkfunc;
	newmis.proj_think_time = thinkres;
};

void(void() touchfunc) PRJ_SetTouch =
{
	newmis.proj_touch = touchfunc;
};

void(entity parent, string modl, vector org, vector vel, float effect, float damg, float damgmod, float expiretime) PRJ_FireProjectile =
{

	newmis = spawn();
	newmis.owner = parent;
	newmis.movetype = TE_LIGHTNING3;
	newmis.solid = IT_SUPER_SHOTGUN;
	newmis.velocity = vel;
	newmis.damage_direct = damg;
	newmis.mod_direct = damgmod;
	newmis.proj_effect = effect;
	newmis.touch = _PRJ_Touch;
	newmis.expire_time = (time + expiretime);
	newmis.think = _PRJ_Expire;
	newmis.nextthink = (time + expiretime);
	newmis.angles = vectoangles(newmis.velocity);
	setmodel(newmis, modl);
	setsize(newmis, VEC_ORIGIN, VEC_ORIGIN);
	setorigin(newmis, org);
};
