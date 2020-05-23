//Decompiled code. Please respect the original copyright.

float(float key) CL_KeyState =
{
	return (((self.keys & key) > TE_SPIKE));
};

void() CL_KeyMove =
{
	local float anglespeed;
	local vector view;

	if ((self.keys != self.oldkeys))
	{
		self.movevect = VEC_ORIGIN;
		self.movevect_y = (self.movevect_y + (350 * CL_KeyState(IT_SUPER_NAILGUN)));
		self.movevect_y = (self.movevect_y - (350 * CL_KeyState(IT_NAILGUN)));
		self.movevect_x = (self.movevect_x + (200 * CL_KeyState(IT_GRENADE_LAUNCHER)));
		self.movevect_x = (self.movevect_x - (200 * CL_KeyState(IT_ROCKET_LAUNCHER)));
		self.movevect_z = (self.movevect_z + (200 * CL_KeyState(IT_SHOTGUN)));
		self.movevect_z = (self.movevect_z - (200 * CL_KeyState(IT_SUPER_SHOTGUN)));
		if (!(self.b_aiflags & IT_ROCKET_LAUNCHER))
		{
			self.movevect = (self.movevect * IT_SUPER_SHOTGUN);
		}
	}
	self.oldkeys = self.keys;
	if ((self.b_skill != IT_SUPER_SHOTGUN))
	{
		anglespeed = 1.5 * real_frametime;
		self.v_angle_y = (self.v_angle_y + ((anglespeed * CL_KeyState(IT_SHELLS)) * 140));
		self.v_angle_y = (self.v_angle_y - ((anglespeed * CL_KeyState(IT_NAILS)) * 140));
		self.v_angle_x = (self.v_angle_x - ((anglespeed * CL_KeyState(IT_LIGHTNING)) * 150));
		self.v_angle_x = (self.v_angle_x + ((anglespeed * CL_KeyState(IT_EXTRA_WEAPON)) * 150));
	}
	else
	{
		view_x = angcomp(self.b_angle_x, self.v_angle_x);
		view_y = angcomp(self.b_angle_y, self.v_angle_y);
		if ((vlen(view) > SVC_INTERMISSION))
		{
			self.mouse_emu = (self.mouse_emu + (view * SVC_INTERMISSION));
			if ((vlen(self.mouse_emu) > 180))
			{
				self.mouse_emu = (normalize(self.mouse_emu) * 180);
			}
		}
		else
		{
			self.mouse_emu = (view * (IT_SHOTGUN / real_frametime));
		}
		self.v_angle = (self.v_angle + (self.mouse_emu * real_frametime));
	}
	if ((self.v_angle_x > 80))
	{
		self.v_angle_x = 80;
	}
	else
	{
		if ((self.v_angle_x < -70))
		{
			self.v_angle_x = -70;
		}
	}
	if ((self.v_angle_z > 50))
	{
		self.v_angle_z = 50;
	}
	else
	{
		if ((self.v_angle_z < -50))
		{
			self.v_angle_z = -50;
		}
	}
	self.v_angle_y = frik_anglemod(self.v_angle_y);
};

void() SV_UserFriction =
{
	local vector vel;
	local vector start;
	local vector stop;
	local float sped;
	local float friction;
	local float newspeed;

	vel = self.velocity;
	vel_z = TE_SPIKE;
	sped = vlen(vel);
	vel = self.velocity;
	if (!sped)
	{
		return;
	}
	stop_x = self.origin_x + (vel_x / (sped * IT_GRENADE_LAUNCHER));
	start_x = stop_x;
	stop_y = self.origin_y + (vel_y / (sped * IT_GRENADE_LAUNCHER));
	start_y = stop_y;
	start_z = self.origin_z + self.mins_z;
	stop_z = start_z - 34;
	traceline(start, stop, IT_SHOTGUN, self);
	if ((trace_fraction == IT_SHOTGUN))
	{
		friction = sv_friction * IT_SUPER_SHOTGUN;
	}
	else
	{
		friction = sv_friction;
	}
	if ((sped < sv_stopspeed))
	{
		newspeed = sped - ((real_frametime * sv_stopspeed) * friction);
	}
	else
	{
		newspeed = sped - ((real_frametime * sped) * friction);
	}
	if ((newspeed < TE_SPIKE))
	{
		newspeed = TE_SPIKE;
	}
	newspeed = newspeed / sped;
	self.velocity_y = (vel_y * newspeed);
	self.velocity_x = (vel_x * newspeed);
};

void() SV_WaterJump =
{
	if (((time > self.teleport_time) || !self.waterlevel))
	{
		self.flags = (self.flags - (self.flags & IT_CELLS));
		self.teleport_time = TE_SPIKE;
	}
	self.velocity_x = self.movedir_x;
	self.velocity_y = self.movedir_y;
};

void() DropPunchAngle =
{
	local float len;

	len = vlen(self.punchangle);
	self.punchangle = normalize(self.punchangle);
	len = len - (TE_LAVASPLASH * real_frametime);
	if ((len < TE_SPIKE))
	{
		len = TE_SPIKE;
	}
	self.punchangle = (self.punchangle * len);
};

void(vector wishvel) SV_AirAccelerate =
{
	local float addspeed;
	local float wishspd;
	local float accelspeed;
	local float currentspeed;

	wishspd = vlen(wishvel);
	wishvel = normalize(wishvel);
	if ((wishspd > SVC_INTERMISSION))
	{
		wishspd = SVC_INTERMISSION;
	}
	currentspeed = self.velocity * wishvel;
	addspeed = wishspd - currentspeed;
	if ((addspeed <= TE_SPIKE))
	{
		return;
	}
	accelspeed = ((TE_LAVASPLASH * sv_accelerate) * wishspd) * real_frametime;
	if ((accelspeed > addspeed))
	{
		accelspeed = addspeed;
	}
	self.velocity = (self.velocity + (accelspeed * wishvel));
};

void(vector wishvel) SV_Accelerate =
{
	local float addspeed;
	local float wishspd;
	local float accelspeed;
	local float currentspeed;

	wishspd = vlen(wishvel);
	wishvel = normalize(wishvel);
	currentspeed = self.velocity * wishvel;
	addspeed = wishspd - currentspeed;
	if ((addspeed <= TE_SPIKE))
	{
		return;
	}
	accelspeed = (sv_accelerate * wishspd) * real_frametime;
	if ((accelspeed > addspeed))
	{
		accelspeed = addspeed;
	}
	self.velocity = (self.velocity + (accelspeed * wishvel));
};

void() SV_WaterMove =
{
	local vector wishvel;
	local float wishspeed;
	local float addspeed;
	local float cspeed;
	local float newspeed;

	makevectors(self.v_angle);
	wishvel = (v_right * self.movevect_y) + (v_forward * self.movevect_x);
	if ((self.movevect == VEC_ORIGIN))
	{
		wishvel_z = wishvel_z - 60;
	}
	else
	{
		wishvel_z = wishvel_z + self.movevect_z;
	}
	wishspeed = vlen(wishvel);
	if ((wishspeed > sv_maxspeed))
	{
		wishvel = (sv_maxspeed / wishspeed) * wishvel;
		wishspeed = sv_maxspeed;
	}
	wishspeed = wishspeed * 0.7;
	cspeed = vlen(self.velocity);
	if (cspeed)
	{
		newspeed = cspeed - ((real_frametime * cspeed) * sv_friction);
		if ((newspeed < TE_SPIKE))
		{
			newspeed = TE_SPIKE;
		}
		self.velocity = (self.velocity * (newspeed / cspeed));
	}
	else
	{
		newspeed = TE_SPIKE;
	}
	if (!wishspeed)
	{
		return;
	}
	addspeed = wishspeed - newspeed;
	if ((addspeed <= TE_SPIKE))
	{
		return;
	}
	wishvel = normalize(wishvel);
	cspeed = (sv_accelerate * wishspeed) * real_frametime;
	if ((cspeed > addspeed))
	{
		cspeed = addspeed;
	}
	self.velocity = (self.velocity + (cspeed * wishvel));
};

void() SV_AirMove =
{
	local vector wishvel;
	local vector vangle;

	vangle = self.v_angle;
	vangle_z = TE_SPIKE;
	vangle_x = TE_SPIKE;
	makevectors(vangle);
	if (((time < self.teleport_time) && (self.movevect_x < TE_SPIKE)))
	{
		self.movevect_x = TE_SPIKE;
	}
	wishvel = (v_right * self.movevect_y) + (v_forward * self.movevect_x);
	if ((self.movetype != TE_EXPLOSION))
	{
		wishvel_z = self.movevect_z;
	}
	else
	{
		wishvel_z = TE_SPIKE;
	}
	if ((vlen(wishvel) > sv_maxspeed))
	{
		wishvel = normalize(wishvel) * sv_maxspeed;
	}
	if ((self.movetype == IT_SUPER_NAILGUN))
	{
		self.velocity = wishvel;
	}
	else
	{
		if ((self.flags & IT_NAILS))
		{
			SV_UserFriction();
			SV_Accelerate(wishvel);
		}
		else
		{
			SV_AirAccelerate(wishvel);
		}
	}
};

void() SV_ClientThink =
{
	local vector vangle;

	if ((self.movetype == TE_SPIKE))
	{
		return;
	}
	DropPunchAngle();
	if ((self.health <= TE_SPIKE))
	{
		return;
	}
	self.v_angle_z = TE_SPIKE;
	self.angles_z = (self.v_angle_z * IT_NAILGUN);
	vangle = self.v_angle + self.punchangle;
	if (!self.fixangle)
	{
		self.angles_x = (vangle_x / CONTENT_WATER);
		self.angles_y = vangle_y;
	}
	else
	{
		self.v_angle = self.angles;
		self.fixangle = TE_SPIKE;
	}
	if ((self.flags & IT_CELLS))
	{
		SV_WaterJump();
		return;
	}
	if (((self.waterlevel >= IT_SUPER_SHOTGUN) && (self.movetype != IT_SUPER_NAILGUN)))
	{
		SV_WaterMove();
		return;
	}
	SV_AirMove();
};

float() SV_RunThink =
{
	local float thinktime;
	local float bkuptime;

	thinktime = self.nextthink;
	bkuptime = time;
	if (((thinktime <= TE_SPIKE) || (thinktime > (time + real_frametime))))
	{
		return (IT_SHOTGUN);
	}
	if ((thinktime < time))
	{
		thinktime = time;
	}
	self.nextthink = TE_SPIKE;
	time = thinktime;
	other = world;
	makevectors(self.v_angle);
	self.think();
	time = bkuptime;
	return (IT_SHOTGUN);
};

void(float scale) SV_AddGravity =
{
	self.velocity_z = (self.velocity_z - ((scale * sv_gravity) * real_frametime));
};

float() SV_CheckWater =
{
	local vector point;
	local float cont;

	point_x = self.origin_x;
	point_y = self.origin_y;
	self.waterlevel = TE_SPIKE;
	self.watertype = CONTENT_EMPTY;
	point_z = (self.origin_z + self.mins_z) + IT_SHOTGUN;
	cont = pointcontents(point);
	if ((cont <= CONTENT_WATER))
	{
		self.watertype = cont;
		self.waterlevel = IT_SHOTGUN;
		point_z = self.origin_z + ((self.mins_z + self.maxs_z) * 0.5);
		cont = pointcontents(point);
		if ((cont <= CONTENT_WATER))
		{
			self.waterlevel = IT_SUPER_SHOTGUN;
			point_z = self.origin_z + self.view_ofs_z;
			cont = pointcontents(point);
			if ((cont <= CONTENT_WATER))
			{
				self.waterlevel = TE_EXPLOSION;
			}
		}
	}
	return ((self.waterlevel > IT_SHOTGUN));
};

void() RemoveThud =
{
	local entity oself;

	if ((other == world))
	{
		if ((self.flags & IT_NAILS))
		{
			self.flags = (self.flags - IT_NAILS);
		}
	}
	else
	{
		if (((other.solid == IT_NAILGUN) && (self.flags & IT_NAILS)))
		{
			self.flags = (self.flags - IT_NAILS);
		}
		if ((other == self.owner))
		{
			return;
		}
		if ((self.owner.solid == TE_SPIKE))
		{
			return;
		}
		oself = other;
		other = self.owner;
		self = oself;
		if ((self.solid == IT_NAILGUN))
		{
			if (self.touch)
			{
				self.touch();
			}
		}
	}
};

void() SV_CheckOnGround =
{
	local vector org;
	local vector v;
	local float currentflags;

	org = self.origin;
	currentflags = self.flags;
	self.flags = ((self.flags | IT_NAILS) | IT_ROCKETS);
	walkmove(TE_SPIKE, TE_SPIKE);
	self.flags = (currentflags | IT_NAILS);
	if (((org_x != self.origin_x) || (org_y != self.origin_y)))
	{
		org = self.origin;
	}
	else
	{
		self.origin = org;
	}
	v = org;
	v_z = (self.maxs_z + org_z) + IT_SHOTGUN;
	traceline(org, v, IT_SHOTGUN, self);
	if (((self.waterlevel == TE_EXPLOSION) && (self.movetype == TE_EXPLOSION)))
	{
		self.flags = (self.flags - IT_NAILS);
	}
	else
	{
		if (((trace_plane_normal_z <= 0.7) && (trace_fraction != IT_SHOTGUN)))
		{
			self.flags = (self.flags - IT_NAILS);
		}
		else
		{
			if (!droptofloor())
			{
				self.flags = (self.flags - IT_NAILS);
			}
			else
			{
				if (((org_z - self.origin_z) < IT_SUPER_SHOTGUN))
				{
					self.flags = (self.flags | IT_NAILS);
				}
				else
				{
					self.flags = (self.flags - IT_NAILS);
				}
			}
		}
	}
	setorigin(self, org);
};

float(vector dir) botCheckForStep =
{
	local vector currentorigin;
	local vector v;
	local float currentflags;
	local float yaw;
	local float stepdistance;
	local float movedistance;

	currentorigin = self.origin;
	currentflags = self.flags;
	self.flags = 1536;
	dir = normalize(dir);
	dir_z = TE_SPIKE;
	yaw = vectoyaw(dir);
	if (walkmove(yaw, TE_EXPLOSION))
	{
		if (droptofloor())
		{
			stepdistance = self.origin_z - currentorigin_z;
			v = self.origin - currentorigin;
			v_z = TE_SPIKE;
			movedistance = vlen(v);
			if ((((stepdistance > TE_SPIKE) && (stepdistance <= IT_GRENADE_LAUNCHER)) && (movedistance != TE_SPIKE)))
			{
				self.flags = (currentflags | IT_ROCKETS);
				return (IT_SHOTGUN);
			}
		}
	}
	self.flags = currentflags;
	v = currentorigin;
	v_z = self.origin_z;
	if ((vlen((v - self.origin)) <= IT_NAILGUN))
	{
		setorigin(self, currentorigin);
	}
	return (TE_SPIKE);
};

void(vector dir) BruteForceStep =
{
	local vector currentorigin;
	local float currentflags;
	local float i;
	local float len;

	currentorigin = self.origin;
	currentflags = self.flags;
	len = vlen(dir);
	if ((len > IT_GRENADE_LAUNCHER))
	{
		dir = normalize(dir) * IT_GRENADE_LAUNCHER;
	}
	setorigin(self, (currentorigin + dir));
	while (((i < 18) && !walkmove(TE_SPIKE, TE_SPIKE)))
	{
		self.origin_z = (currentorigin_z + i);
		i = i + IT_SUPER_SHOTGUN;
	}
	self.flags = currentflags;
	if ((i >= 18))
	{
		setorigin(self, currentorigin);
	}
};

void() PostPhysics =
{
	local vector obstr;
	local vector org;
	local float back;
	local float dst;
	local float cflags;

	self = self.owner;
	self.velocity = ((self.velocity - self.phys_obj.dest1) + self.phys_obj.velocity);
	if ((self.phys_obj.dest2 == self.origin))
	{
		setorigin(self, self.phys_obj.origin);
		if ((self.movetype == TE_EXPLOSION))
		{
			if ((self.phys_obj.dest1_x || self.phys_obj.dest1_y))
			{
				if (((self.flags & IT_NAILS) || (self.waterlevel <= IT_SUPER_SHOTGUN)))
				{
					obstr = self.phys_obj.movedir - self.origin;
					obstr_z = TE_SPIKE;
					if ((vlen(obstr) > 0.1))
					{
						dst = vlen(obstr);
						back = vectoyaw(obstr);
						cflags = self.flags;
						self.flags = (self.flags | IT_ROCKETS);
						if (walkmove(back, dst))
						{
							self.flags = cflags;
							self.phys_obj.dest1_z = TE_SPIKE;
							self.velocity = ((self.velocity + self.phys_obj.dest1) - self.phys_obj.velocity);
						}
						else
						{
							if ((dst > IT_SHOTGUN))
							{
								frik_obstructed(obstr, TE_SPIKE);
							}
							org = self.origin;
							self.flags = cflags;
							obstr = self.phys_obj.dest1;
							obstr_x = TE_SPIKE;
							if (!botCheckForStep(obstr))
							{
								obstr = self.phys_obj.dest1;
								obstr_y = TE_SPIKE;
								if (!botCheckForStep(obstr))
								{
									BruteForceStep(self.phys_obj.dest1);
								}
							}
						}
					}
				}
			}
		}
	}
	SV_CheckOnGround();
	PlayerPostThink();
	BotAI();
	self.dmg_save = TE_SPIKE;
	self.dmg_take = TE_SPIKE;
};

void() SV_FlyMove =
{

	if ((self.phys_obj == world))
	{
		self.phys_obj = find(world, classname, /*2228i*/"phys_obj");
		while ((self.phys_obj.owner != self))
		{
			self.phys_obj = find(self.phys_obj, classname, /*2228i*/"phys_obj");
			if ((self.phys_obj == world))
			{
				error(/*4943i*/"No physics entity spawned!\nMake sure BotInit was called\n");
			}
		}
	}
	setmodel(self.phys_obj, string_null);
	self.phys_obj.movetype = IT_NAILGUN;
	self.phys_obj.solid = IT_SHOTGUN;
	self.phys_obj.touch = RemoveThud;
	setsize(self.phys_obj, self.mins, self.maxs);
	self.phys_obj.origin = self.origin;
	self.phys_obj.dest2 = self.origin;
	self.phys_obj.watertype = TE_SPIKE;
	self.phys_obj.movedir = (self.origin + (real_frametime * self.velocity));
	self.phys_obj.velocity = self.velocity;
	self.phys_obj.dest1 = self.velocity;
	self.phys_obj.velocity_z = (self.phys_obj.velocity_z + (sv_gravity * real_frametime));
	self.phys_obj.flags = TE_SPIKE;
	self.phys_obj.think = PostPhysics;
	self.phys_obj.nextthink = time;
};

void() SV_Physics_Toss =
{
	if (!SV_RunThink())
	{
		return;
	}
	if ((self.flags & IT_NAILS))
	{
		self.velocity = VEC_ORIGIN;
		BotAI();
		return;
	}
	if ((self.movetype != TE_LIGHTNING1))
	{
		SV_AddGravity(IT_SHOTGUN);
	}
	self.angles = (self.angles + (real_frametime * self.avelocity));
	SV_FlyMove();
};

void() SV_Physics_Client =
{
	PlayerPreThink();
	if ((self.movetype == TE_SPIKE))
	{
		if (!SV_RunThink())
		{
			return;
		}
		PlayerPostThink();
		BotAI();
	}
	else
	{
		if (((self.movetype == TE_EXPLOSION) || (self.movetype == IT_NAILGUN)))
		{
			if (!SV_RunThink())
			{
				return;
			}
			if ((!SV_CheckWater() && !(self.flags & IT_CELLS)))
			{
				SV_AddGravity(IT_SHOTGUN);
			}
			SV_FlyMove();
		}
		else
		{
			if (((self.movetype == TE_LIGHTNING2) || (self.movetype == TE_LAVASPLASH)))
			{
				SV_Physics_Toss();
			}
			else
			{
				if ((self.movetype == TE_LIGHTNING1))
				{
					if (!SV_RunThink())
					{
						return;
					}
					SV_FlyMove();
				}
				else
				{
					if ((self.movetype == IT_SUPER_NAILGUN))
					{
						if (!SV_RunThink())
						{
							return;
						}
						self.origin = (self.origin + (real_frametime * self.velocity));
						PlayerPostThink();
						BotAI();
					}
					else
					{
						error(/*5027i*/"SV_Physics_Client: Bad Movetype (BOT)");
					}
				}
			}
		}
	}
};
