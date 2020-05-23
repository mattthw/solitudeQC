//Decompiled code. Please respect the original copyright.

void() monster_use =
{
	if (self.enemy)
	{
		return;
	}
	if ((self.health <= TE_SPIKE))
	{
		return;
	}
	if ((activator.items & IT_INVISIBILITY))
	{
		return;
	}
	if ((activator.flags & IT_EXTRA_WEAPON))
	{
		return;
	}
	if ((activator.flags & IT_SUPER_NAILGUN))
	{
		return;
	}
	self.enemy = activator;
	self.nextthink = (time + 0.1);
	self.think = FoundTarget;
};

void() monster_death_use =
{
	if ((self.flags & IT_SHOTGUN))
	{
		self.flags = (self.flags - IT_SHOTGUN);
	}
	if ((self.flags & IT_SUPER_SHOTGUN))
	{
		self.flags = (self.flags - IT_SUPER_SHOTGUN);
	}
	if (!self.target)
	{
		return;
	}
	activator = self.enemy;
	SUB_UseTargets();
};

void() walkmonster_start_go =
{

	self.origin_z = (self.origin_z + IT_SHOTGUN);
	droptofloor();
	if (!walkmove(TE_SPIKE, TE_SPIKE))
	{
		dprint(/*30720i*/"walkmonster in wall at: ");
		dprint(vtos(self.origin));
		dprint(/*2101i*/"\n");
	}
	self.takedamage = IT_SUPER_SHOTGUN;
	self.ideal_yaw = (self.angles * '0 1 0');
	if (!self.yaw_speed)
	{
		self.yaw_speed = 20;
	}
	self.view_ofs = '0 0 25';
	self.use = monster_use;
	self.flags = (self.flags | IT_ROCKET_LAUNCHER);
	if (self.target)
	{
		self.movetarget = find(world, targetname, self.target);
		self.goalentity = find(world, targetname, self.target);
		self.ideal_yaw = vectoyaw((self.goalentity.origin - self.origin));
		if (!self.movetarget)
		{
			dprint(/*30745i*/"Monster can't find target at ");
			dprint(vtos(self.origin));
			dprint(/*2101i*/"\n");
		}
		if ((self.movetarget.classname == "path_corner"))
		{
			self.th_walk();
		}
		else
		{
			self.pausetime = 100000000;
		}
		self.th_stand();
	}
	else
	{
		self.pausetime = 100000000;
		self.th_stand();
	}
	self.nextthink = ((time + 0.1) + (random() * 0.5));
};

void() walkmonster_start =
{
	self.nextthink = ((time + 0.1) + (random() * 0.5));
	self.think = walkmonster_start_go;
	total_monsters = total_monsters + IT_SHOTGUN;
};

void() flymonster_start_go =
{

	self.takedamage = IT_SUPER_SHOTGUN;
	self.ideal_yaw = (self.angles * '0 1 0');
	if (!self.yaw_speed)
	{
		self.yaw_speed = TE_LAVASPLASH;
	}
	self.view_ofs = '0 0 25';
	self.use = monster_use;
	self.flags = ((self.flags | IT_SHOTGUN) | IT_ROCKET_LAUNCHER);
	if (!walkmove(TE_SPIKE, TE_SPIKE))
	{
		dprint(/*30826i*/"flymonster in wall at: ");
		dprint(vtos(self.origin));
		dprint(/*2101i*/"\n");
	}
	if (self.target)
	{
		self.movetarget = find(world, targetname, self.target);
		self.goalentity = find(world, targetname, self.target);
		if (!self.movetarget)
		{
			dprint(/*30745i*/"Monster can't find target at ");
			dprint(vtos(self.origin));
			dprint(/*2101i*/"\n");
		}
		if ((self.movetarget.classname == "path_corner"))
		{
			self.th_walk();
		}
		else
		{
			self.pausetime = 100000000;
		}
		self.th_stand();
	}
	else
	{
		self.pausetime = 100000000;
		self.th_stand();
	}
};

void() flymonster_start =
{
	self.nextthink = ((time + 0.1) + (random() * 0.5));
	self.think = flymonster_start_go;
	total_monsters = total_monsters + IT_SHOTGUN;
};

void() swimmonster_start_go =
{

	if (deathmatch)
	{
		remove(self);
		return;
	}
	self.takedamage = IT_SUPER_SHOTGUN;
	self.ideal_yaw = (self.angles * '0 1 0');
	if (!self.yaw_speed)
	{
		self.yaw_speed = TE_LAVASPLASH;
	}
	self.view_ofs = '0 0 10';
	self.use = monster_use;
	self.flags = ((self.flags | IT_SUPER_SHOTGUN) | IT_ROCKET_LAUNCHER);
	if (self.target)
	{
		self.movetarget = find(world, targetname, self.target);
		self.goalentity = find(world, targetname, self.target);
		if (!self.movetarget)
		{
			dprint(/*30745i*/"Monster can't find target at ");
			dprint(vtos(self.origin));
			dprint(/*2101i*/"\n");
		}
		self.ideal_yaw = vectoyaw((self.goalentity.origin - self.origin));
		self.th_walk();
	}
	else
	{
		self.pausetime = 100000000;
		self.th_stand();
	}
	self.nextthink = ((time + 0.1) + (random() * 0.5));
};

void() swimmonster_start =
{
	self.nextthink = ((time + 0.1) + (random() * 0.5));
	self.think = swimmonster_start_go;
	total_monsters = total_monsters + IT_SHOTGUN;
};
