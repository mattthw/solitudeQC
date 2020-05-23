//Decompiled code. Please respect the original copyright.

void() bot_jump =
{
	self.button2 = IT_SHOTGUN;
};

float(entity e) bot_can_rj =
{
	if ((e.b_skill == TE_SPIKE))
	{
		return (TE_SPIKE);
	}
	if ((e.items & 4194304))
	{
		return (TE_SPIKE);
	}
	if (!((e.items & IT_ROCKET_LAUNCHER) && (e.ammo_rockets > TE_SPIKE)))
	{
		return (TE_SPIKE);
	}
	if ((e.items & 1048576))
	{
		return (IT_SHOTGUN);
	}
	if ((e.health > 50))
	{
		return (IT_SHOTGUN);
	}
	else
	{
		return (TE_SPIKE);
	}
};

float(float flag) frik_recognize_plat =
{

	if (((self.classname != "waypoint") && !(self.flags & IT_NAILS)))
	{
		return (TE_SPIKE);
	}
	traceline(self.origin, (self.origin - '0 0 64'), IT_SHOTGUN, self);
	if ((trace_ent != world))
	{
		if (flag)
		{
			if ((self.keys & IT_SHOTGUN))
			{
				if ((trace_ent.velocity_z > TE_SPIKE))
				{
					self.keys = (self.keys & 960);
				}
			}
			else
			{
				if ((self.keys & IT_SUPER_SHOTGUN))
				{
					if ((trace_ent.velocity_z < TE_SPIKE))
					{
						self.keys = (self.keys & 960);
					}
				}
			}
		}
		return (IT_SHOTGUN);
	}
	else
	{
		return (TE_SPIKE);
	}
};

float(vector sdir) frik_KeysForDir =
{
	local vector keydir;
	local float outkeys;
	local float tang;

	outkeys = TE_SPIKE;
	if ((sdir_x || sdir_y))
	{
		keydir = vectoangles(sdir);
		tang = angcomp(keydir_y, self.v_angle_y);
		if (((tang <= 150) && (tang >= SVC_INTERMISSION)))
		{
			outkeys = outkeys + IT_NAILGUN;
		}
		else
		{
			if (((tang >= -150) && (tang <= -30)))
			{
				outkeys = outkeys + IT_SUPER_NAILGUN;
			}
		}
		if ((fabs(tang) <= 60))
		{
			outkeys = outkeys + IT_GRENADE_LAUNCHER;
		}
		else
		{
			if ((fabs(tang) >= 120))
			{
				outkeys = outkeys + IT_ROCKET_LAUNCHER;
			}
		}
	}
	if ((sdir_z > TE_SPIKE))
	{
		outkeys = outkeys + IT_SHOTGUN;
	}
	else
	{
		if ((sdir_z < TE_SPIKE))
		{
			outkeys = outkeys + IT_SUPER_SHOTGUN;
		}
	}
	return (outkeys);
};

void(vector whichway, float danger) frik_obstructed =
{
	local float dist;
	local vector disway;
	local vector org;

	if ((self.b_aiflags & IT_EXTRA_WEAPON))
	{
		return;
	}
	org = realorigin(self.target1);
	if (danger)
	{
		self.b_aiflags = (self.b_aiflags | IT_SUPER_NAILGUN);
		self.keys = frik_KeysForDir((VEC_ORIGIN - whichway));
	}
	if ((self.b_aiflags & IT_ROCKET_LAUNCHER))
	{
		return;
	}
	if (self.target1)
	{
		if ((self.b_aiflags & IT_SHOTGUN))
		{
			if (!(self.b_aiflags & IT_SUPER_NAILGUN))
			{
				self.b_aiflags = (self.b_aiflags - IT_SHOTGUN);
				return;
			}
			else
			{
				if (!danger)
				{
					return;
				}
			}
		}
		self.obs_dir = whichway;
		disway_x = whichway_y * CONTENT_EMPTY;
		disway_y = whichway_x;
		dist = vlen((org - (self.origin + disway)));
		disway_x = whichway_y;
		disway_y = whichway_x * CONTENT_EMPTY;
		self.wallhug = (vlen((org - (self.origin + disway))) > dist);
		self.b_aiflags = (self.b_aiflags | IT_SHOTGUN);
	}
	else
	{
		disway_x = whichway_y * CONTENT_EMPTY;
		disway_y = whichway_x;
		dist = vlen((disway - self.obs_dir));
		disway_x = whichway_y;
		disway_y = whichway_x * CONTENT_EMPTY;
		self.wallhug = (vlen((disway - self.obs_dir)) < dist);
		self.obs_dir = whichway;
		self.b_aiflags = (self.b_aiflags | IT_SHOTGUN);
	}
};

void() frik_obstacles =
{
	local vector start;
	local vector stop;
	local vector ang;
	local float test;
	local float conts;
	local float dist;
	local float hgt;

	if (!(self.flags & IT_NAILS))
	{
		return;
	}
	if ((self.b_aiflags & IT_EXTRA_WEAPON))
	{
		return;
	}
	ang = normalize(self.velocity);
	ang_z = TE_SPIKE;
	start = self.origin + (ang * IT_ROCKET_LAUNCHER);
	start_z = self.origin_z + self.maxs_z;
	stop = start;
	stop_z = self.origin_z + self.mins_z;
	traceline(start, (stop - '0 0 256'), IT_SHOTGUN, self);
	if ((trace_allsolid || trace_startsolid))
	{
		return;
	}
	hgt = trace_endpos_z - stop_z;
	if ((hgt > 18))
	{
		bot_jump();
		return;
	}
	if ((hgt >= TE_SPIKE))
	{
		return;
	}
	conts = pointcontents((trace_endpos + '0 0 4'));
	start = stop - '0 0 8';
	stop = start + (ang * IT_SHELLS);
	traceline(start, stop, IT_SHOTGUN, self);
	test = vlen((trace_endpos - start));
	if ((test <= 20))
	{
		return;
	}
	ang_x = self.velocity_y * CONTENT_EMPTY;
	ang_y = self.velocity_x;
	ang = normalize(ang);
	traceline((start - (ang * TE_LAVASPLASH)), (start + (ang * TE_LAVASPLASH)), IT_SHOTGUN, self);
	if (((trace_fraction != IT_SHOTGUN) || trace_startsolid))
	{
		return;
	}
	ang = self.velocity;
	ang_z = TE_SPIKE;
	dist = (540 / sv_gravity) * vlen(ang);
	if ((test > dist))
	{
		if ((conts < CONTENT_WATER))
		{
			frik_obstructed(ang, IT_SHOTGUN);
			return;
		}
		else
		{
			if (self.target1)
			{
				stop = realorigin(self.target1);
				if (((stop_z - self.origin_z) < -32))
				{
					return;
				}
			}
			frik_obstructed(ang, TE_SPIKE);
			return;
		}
	}
	else
	{
		ang = normalize(ang);
		traceline(self.origin, (self.origin + (ang * (test + 20))), IT_SHOTGUN, self);
		if ((trace_fraction != IT_SHOTGUN))
		{
			if ((conts < CONTENT_WATER))
			{
				frik_obstructed(ang, IT_SHOTGUN);
				return;
			}
			else
			{
				if (self.target1)
				{
					stop = realorigin(self.target1);
					if (((stop_z - self.origin_z) < -32))
					{
						return;
					}
				}
				frik_obstructed(ang, TE_SPIKE);
				return;
			}
		}
		if (self.target1)
		{
			test = vlen((self.target1.origin - (ang + self.origin)));
			if ((test > vlen((self.target1.origin - self.origin))))
			{
				if ((conts < CONTENT_WATER))
				{
					frik_obstructed(ang, IT_SHOTGUN);
					return;
				}
				else
				{
					frik_obstructed(ang, TE_SPIKE);
					return;
				}
			}
		}
	}
	if ((hgt < -18))
	{
		if ((conts < CONTENT_WATER))
		{
			frik_obstructed(ang, IT_SHOTGUN);
			return;
		}
		if (self.target1)
		{
			stop = realorigin(self.target1);
			if (((stop_z - self.origin_z) < -32))
			{
				return;
			}
		}
		bot_jump();
	}
};

void() frik_dodge_obstruction =
{
	local vector way;
	local vector org;
	local float oflags;
	local float yaw;

	if (!(self.b_aiflags & IT_SHOTGUN))
	{
		return;
	}
	if (((self.b_aiflags & 160) || !(self.flags & IT_NAILS)))
	{
		self.b_aiflags = (self.b_aiflags - IT_SHOTGUN);
		return;
	}
	oflags = self.flags;
	org = self.origin;
	yaw = vectoyaw(self.obs_dir);
	if (walkmove(yaw, IT_ROCKET_LAUNCHER))
	{
		self.b_aiflags = (self.b_aiflags - IT_SHOTGUN);
	}
	else
	{
		if ((self.b_aiflags & IT_SUPER_NAILGUN))
		{
			way = VEC_ORIGIN - self.obs_dir;
		}
		else
		{
			if (self.wallhug)
			{
				way_x = self.obs_dir_y * CONTENT_EMPTY;
				way_y = self.obs_dir_x;
			}
			else
			{
				way_x = self.obs_dir_y;
				way_y = self.obs_dir_x * CONTENT_EMPTY;
			}
		}
		self.keys = ((self.keys & 960) + frik_KeysForDir(way));
	}
	self.origin = org;
	self.flags = oflags;
};

void() frik_movetogoal =
{
	local vector way;
	local float g;

	if ((self.target1 == world))
	{
		makevectors(self.v_angle);
		frik_walkmove(v_forward);
		return;
	}
	way = realorigin(self.target1) - self.origin;
	if ((vlen(way) < 25))
	{
		self.keys = (self.keys & 960);
		return;
	}
	way = normalize(way);
	self.keys = ((self.keys & 960) + frik_KeysForDir(way));
	frik_dodge_obstruction();
	frik_recognize_plat(IT_SHOTGUN);
	if ((self.b_aiflags & IT_ROCKET_LAUNCHER))
	{
		g = angcomp(self.v_angle_x, self.b_angle_x);
		if ((fabs(g) > TE_LAVASPLASH))
		{
			self.keys = (self.keys & 960);
		}
		g = angcomp(self.v_angle_y, self.b_angle_y);
		if ((fabs(g) > TE_LAVASPLASH))
		{
			self.keys = (self.keys & 960);
		}
	}
};

float(vector weird) frik_walkmove =
{

	self.keys = ((self.keys & 960) + frik_KeysForDir(weird));
	frik_dodge_obstruction();
	frik_recognize_plat(IT_SHOTGUN);
	if ((self.b_aiflags & IT_SHOTGUN))
	{
		return (TE_SPIKE);
	}
	else
	{
		return (IT_SHOTGUN);
	}
};

void() frik_bot_roam =
{
	local vector org;
	local vector ang;
	local vector org1;
	local float loopcount;
	local float flag;
	local float dist;

	loopcount = 26;
	flag = TE_SPIKE;
	while (((loopcount > TE_SPIKE) && !flag))
	{
		loopcount = loopcount - IT_SHOTGUN;
		org = self.origin + self.view_ofs;
		ang = self.angles;
		ang_y = frik_anglemod(((ang_y - 90) + (random() * 180)));
		ang_x = TE_SPIKE;
		makevectors(ang);
		traceline(org, (org + (v_forward * 2300)), IT_SHOTGUN, self);
		if ((trace_fraction != IT_SHOTGUN))
		{
			org1 = trace_endpos;
			ang = normalize(trace_plane_normal);
			ang_z = TE_SPIKE;
			traceline(org1, (org1 + (ang * 2300)), IT_SHOTGUN, self);
			if (((trace_fraction != IT_SHOTGUN) && (vlen((trace_endpos - org1)) >= IT_LIGHTNING)))
			{
				org = trace_endpos;
				traceline(org, (self.origin + self.view_ofs), IT_SHOTGUN, self);
				if ((trace_fraction != IT_SHOTGUN))
				{
					dist = vlen((org1 - org)) / IT_SUPER_SHOTGUN;
					org = org1 + (ang * dist);
					traceline(org, (org - '0 0 48'), IT_SHOTGUN, self);
					if ((trace_fraction != IT_SHOTGUN))
					{
						SpawnTempWaypoint(org);
						flag = IT_SHOTGUN;
					}
				}
			}
		}
	}
	self.b_angle_y = (self.v_angle_y + TE_LAVASPLASH);
	frik_walkmove(v_forward);
};
