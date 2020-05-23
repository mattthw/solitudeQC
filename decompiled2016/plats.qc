//Decompiled code. Please respect the original copyright.
void() plat_center_touch;
void() plat_outside_touch;
void() plat_trigger_use;
void() plat_go_up;
void() plat_go_down;
void() plat_crush;

void() plat_spawn_inside_trigger =
{
	local entity trigger;
	local vector tmin;
	local vector tmax;

	trigger = spawn();
	trigger.touch = plat_center_touch;
	trigger.movetype = TE_SPIKE;
	trigger.solid = IT_SHOTGUN;
	trigger.enemy = self;
	tmin = self.mins + '25 25 0';
	tmax = self.maxs - '25 25 -8';
	tmin_z = tmax_z - ((self.pos1_z - self.pos2_z) + IT_SUPER_NAILGUN);
	if ((self.spawnflags & IT_SHOTGUN))
	{
		tmax_z = tmin_z + IT_SUPER_NAILGUN;
	}
	if ((self.size_x <= 50))
	{
		tmin_x = (self.mins_x + self.maxs_x) / IT_SUPER_SHOTGUN;
		tmax_x = tmin_x + IT_SHOTGUN;
	}
	if ((self.size_y <= 50))
	{
		tmin_y = (self.mins_y + self.maxs_y) / IT_SUPER_SHOTGUN;
		tmax_y = tmin_y + IT_SHOTGUN;
	}
	setsize(trigger, tmin, tmax);
};

void() plat_hit_top =
{
	sound(self, (chan_no_phs_add | IT_SUPER_SHOTGUN), self.noise1, IT_SHOTGUN, IT_SHOTGUN);
	self.state = TE_SPIKE;
	self.think = plat_go_down;
	self.nextthink = (self.ltime + TE_EXPLOSION);
};

void() plat_hit_bottom =
{
	sound(self, (chan_no_phs_add | IT_SUPER_SHOTGUN), self.noise1, IT_SHOTGUN, IT_SHOTGUN);
	self.state = IT_SHOTGUN;
};

void() plat_go_down =
{
	sound(self, IT_SUPER_SHOTGUN, self.noise, IT_SHOTGUN, IT_SHOTGUN);
	self.state = TE_EXPLOSION;
	SUB_CalcMove(self.pos2, self.speed, plat_hit_bottom);
};

void() plat_go_up =
{
	sound(self, IT_SUPER_SHOTGUN, self.noise, IT_SHOTGUN, IT_SHOTGUN);
	self.state = IT_SUPER_SHOTGUN;
	SUB_CalcMove(self.pos1, self.speed, plat_hit_top);
};

void() plat_center_touch =
{
	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= TE_SPIKE))
	{
		return;
	}
	self = self.enemy;
	if ((self.state == IT_SHOTGUN))
	{
		plat_go_up();
	}
	else
	{
		if ((self.state == TE_SPIKE))
		{
			self.nextthink = (self.ltime + IT_SHOTGUN);
		}
	}
};

void() plat_outside_touch =
{
	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= TE_SPIKE))
	{
		return;
	}
	self = self.enemy;
	if ((self.state == TE_SPIKE))
	{
		plat_go_down();
	}
};

void() plat_trigger_use =
{
	if (self.think)
	{
		return;
	}
	plat_go_down();
};

void() plat_crush =
{
	T_Damage(other, self, self, IT_SHOTGUN, 15);
	if ((self.state == IT_SUPER_SHOTGUN))
	{
		plat_go_down();
	}
	else
	{
		if ((self.state == TE_EXPLOSION))
		{
			plat_go_up();
		}
		else
		{
			objerror(/*28056i*/"plat_crush: bad self.state\n");
		}
	}
};

void() plat_use =
{
	self.use = SUB_Null;
	if ((self.state != IT_SUPER_SHOTGUN))
	{
		objerror(/*28095i*/"plat_use: not in up state");
	}
	plat_go_down();
};

void() func_plat =
{
	if (!self.t_length)
	{
		self.t_length = 80;
	}
	if (!self.t_width)
	{
		self.t_width = TE_LAVASPLASH;
	}
	if ((self.sounds == TE_SPIKE))
	{
		self.sounds = IT_SUPER_SHOTGUN;
	}
	if ((self.sounds == IT_SHOTGUN))
	{
		precache_sound(/*28130i*/"plats/plat1.wav");
		precache_sound(/*28146i*/"plats/plat2.wav");
		self.noise = "plats/plat1.wav";
		self.noise1 = "plats/plat2.wav";
	}
	else
	{
		if ((self.sounds == IT_SUPER_SHOTGUN))
		{
			precache_sound(/*28162i*/"plats/medplat1.wav");
			precache_sound(/*28181i*/"plats/medplat2.wav");
			self.noise = "plats/medplat1.wav";
			self.noise1 = "plats/medplat2.wav";
		}
	}
	self.mangle = self.angles;
	self.angles = VEC_ORIGIN;
	self.classname = "plat";
	self.solid = IT_NAILGUN;
	self.movetype = TE_WIZSPIKE;
	setorigin(self, self.origin);
	setmodel(self, self.model);
	setsize(self, self.mins, self.maxs);
	self.blocked = plat_crush;
	if (!self.speed)
	{
		self.speed = 150;
	}
	self.pos1 = self.origin;
	self.pos2 = self.origin;
	if (self.height)
	{
		self.pos2_z = (self.origin_z - self.height);
	}
	else
	{
		self.pos2_z = ((self.origin_z - self.size_z) + IT_SUPER_NAILGUN);
	}
	self.use = plat_trigger_use;
	plat_spawn_inside_trigger();
	if (self.targetname)
	{
		self.state = IT_SUPER_SHOTGUN;
		self.use = plat_use;
	}
	else
	{
		setorigin(self, self.pos2);
		self.state = IT_SHOTGUN;
	}
};
void() train_next;
void() func_train_find;

void() train_blocked =
{
	if ((time < self.attack_finished))
	{
		return;
	}
	self.attack_finished = (time + 0.5);
	T_Damage(other, self, self, self.dmg, 15);
};

void() train_use =
{
	if ((self.think != func_train_find))
	{
		return;
	}
	train_next();
};

void() train_wait =
{
	if (self.wait)
	{
		self.nextthink = (self.ltime + self.wait);
		sound(self, (chan_no_phs_add | IT_SUPER_SHOTGUN), self.noise, IT_SHOTGUN, IT_SHOTGUN);
	}
	else
	{
		self.nextthink = (self.ltime + 0.1);
	}
	self.think = train_next;
};

void() train_next =
{
	local entity targ;

	targ = find(world, targetname, self.target);
	self.target = targ.target;
	if (!self.target)
	{
		objerror(/*28245i*/"train_next: no next target");
	}
	if (targ.wait)
	{
		self.wait = targ.wait;
	}
	else
	{
		self.wait = TE_SPIKE;
	}
	sound(self, IT_SUPER_SHOTGUN, self.noise1, IT_SHOTGUN, IT_SHOTGUN);
	SUB_CalcMove((targ.origin - self.mins), self.speed, train_wait);
};

void() func_train_find =
{
	local entity targ;

	targ = find(world, targetname, self.target);
	self.target = targ.target;
	setorigin(self, (targ.origin - self.mins));
	if (!self.targetname)
	{
		self.nextthink = (self.ltime + 0.1);
		self.think = train_next;
	}
};

void() func_train =
{
	if (!self.speed)
	{
		self.speed = 100;
	}
	if (!self.target)
	{
		objerror(/*28299i*/"func_train without a target");
	}
	if (!self.dmg)
	{
		self.dmg = IT_SUPER_SHOTGUN;
	}
	if ((self.sounds == TE_SPIKE))
	{
		self.noise = "misc/null.wav";
		precache_sound(/*26469i*/"misc/null.wav");
		self.noise1 = "misc/null.wav";
		precache_sound(/*26469i*/"misc/null.wav");
	}
	if ((self.sounds == IT_SHOTGUN))
	{
		self.noise = "plats/train2.wav";
		precache_sound(/*28327i*/"plats/train2.wav");
		self.noise1 = "plats/train1.wav";
		precache_sound(/*28344i*/"plats/train1.wav");
	}
	self.cnt = IT_SHOTGUN;
	self.solid = IT_NAILGUN;
	self.movetype = TE_WIZSPIKE;
	self.blocked = train_blocked;
	self.use = train_use;
	self.classname = "train";
	setmodel(self, self.model);
	setsize(self, self.mins, self.maxs);
	setorigin(self, self.origin);
	self.nextthink = (self.ltime + 0.1);
	self.think = func_train_find;
};

void() misc_teleporttrain =
{
	if (!self.speed)
	{
		self.speed = 100;
	}
	if (!self.target)
	{
		objerror(/*28299i*/"func_train without a target");
	}
	self.cnt = IT_SHOTGUN;
	self.solid = TE_SPIKE;
	self.movetype = TE_WIZSPIKE;
	self.blocked = train_blocked;
	self.use = train_use;
	self.avelocity = '100 200 300';
	self.noise = "misc/null.wav";
	precache_sound(/*26469i*/"misc/null.wav");
	self.noise1 = "misc/null.wav";
	precache_sound(/*26469i*/"misc/null.wav");
	precache_model2(/*28372i*/"progs/teleport.mdl");
	setmodel(self, /*28372i*/"progs/teleport.mdl");
	setsize(self, self.mins, self.maxs);
	setorigin(self, self.origin);
	self.nextthink = (self.ltime + 0.1);
	self.think = func_train_find;
};
