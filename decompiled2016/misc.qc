//Decompiled code. Please respect the original copyright.

void() info_notnull =
{
};

void() light_use =
{
	if ((self.spawnflags & IT_SHOTGUN))
	{
		lightstyle(self.style, /*19245i*/"m");
		self.spawnflags = (self.spawnflags - IT_SHOTGUN);
	}
	else
	{
		lightstyle(self.style, /*19575i*/"a");
		self.spawnflags = (self.spawnflags | IT_SHOTGUN);
	}
};

void() light =
{
	if (!self.targetname)
	{
		remove(self);
		return;
	}
	if ((self.style >= IT_ROCKET_LAUNCHER))
	{
		self.use = light_use;
		if ((self.spawnflags & IT_SHOTGUN))
		{
			lightstyle(self.style, /*19575i*/"a");
		}
		else
		{
			lightstyle(self.style, /*19245i*/"m");
		}
	}
};

void() light_fluoro =
{
	if ((self.style >= IT_ROCKET_LAUNCHER))
	{
		self.use = light_use;
		if ((self.spawnflags & IT_SHOTGUN))
		{
			lightstyle(self.style, /*19575i*/"a");
		}
		else
		{
			lightstyle(self.style, /*19245i*/"m");
		}
	}
	precache_sound(/*28447i*/"ambience/fl_hum1.wav");
	ambientsound(self.origin, /*28447i*/"ambience/fl_hum1.wav", 0.5, TE_EXPLOSION);
};

void() light_fluorospark =
{
	if (!self.style)
	{
		self.style = TE_LAVASPLASH;
	}
	precache_sound(/*28481i*/"ambience/buzz1.wav");
	ambientsound(self.origin, /*28481i*/"ambience/buzz1.wav", 0.5, TE_EXPLOSION);
};

void() light_globe =
{
	precache_model(/*2237i*/"progs/s_light.spr");
	setmodel(self, /*2237i*/"progs/s_light.spr");
	self.alpha = 0.5;
	makestatic(self);
};

void() FireAmbient =
{
	precache_sound(/*28530i*/"ambience/fire1.wav");
	ambientsound(self.origin, /*28530i*/"ambience/fire1.wav", 0.5, TE_EXPLOSION);
};

void() light_torch_small_walltorch =
{
	precache_model(/*28561i*/"progs/flame.mdl");
	setmodel(self, /*28561i*/"progs/flame.mdl");
	FireAmbient();
	makestatic(self);
};

void() light_flame_large_yellow =
{
	precache_model(/*28605i*/"progs/flame2.mdl");
	setmodel(self, /*28605i*/"progs/flame2.mdl");
	self.frame = IT_SHOTGUN;
	self.alpha = 0.5;
	FireAmbient();
	makestatic(self);
};

void() light_flame_small_yellow =
{
	precache_model(/*28605i*/"progs/flame2.mdl");
	setmodel(self, /*28605i*/"progs/flame2.mdl");
	self.alpha = 0.5;
	FireAmbient();
	makestatic(self);
};

void() light_flame_small_white =
{
	precache_model(/*28605i*/"progs/flame2.mdl");
	setmodel(self, /*28605i*/"progs/flame2.mdl");
	self.alpha = 0.5;
	FireAmbient();
	makestatic(self);
};

void() fire_fly =
{
	local vector vel;

	vel_x = (random() * 100) - 50;
	vel_y = (random() * 100) - 50;
	vel_z = self.speed + (random() * 200);
	PRJ_FireProjectile(world, "progs/lavaball.mdl", self.origin, vel, TE_SPIKE, 20, 21, TE_LIGHTNING1);
	newmis.movetype = TE_LAVASPLASH;
	newmis.alpha = 0.9;
	self.nextthink = ((time + (random() * TE_LIGHTNING1)) + TE_EXPLOSION);
	self.think = fire_fly;
};

void() misc_fireball =
{
	precache_model(/*19190i*/"progs/lavaball.mdl");
	self.classname = "fireball";
	self.nextthink = ((time + 0.1) + (random() * 4.9));
	self.think = fire_fly;
	if (!self.speed)
	{
		self.speed = 1000;
	}
};

void() barrel_explode =
{
	self.takedamage = TE_SPIKE;
	self.classname = "explo_box";
	T_RadiusDamage(self, self.enemy, 160, 200, self, 19);
	TE_explosion((self.origin + '0 0 32'));
	remove(self);
};

void() misc_explobox =
{
	local float oldz;

	self.solid = IT_SUPER_SHOTGUN;
	self.movetype = TE_SPIKE;
	precache_model(/*28753i*/"maps/b_explob.bsp");
	setmodel(self, /*28753i*/"maps/b_explob.bsp");
	setsize(self, VEC_ORIGIN, VEC_HULL2_MAX);
	precache_sound(/*11280i*/"weapons/r_exp3.wav");
	self.health = 20;
	self.th_die = barrel_explode;
	self.takedamage = IT_SUPER_SHOTGUN;
	self.origin_z = (self.origin_z + IT_SUPER_SHOTGUN);
	oldz = self.origin_z;
	droptofloor();
	if (((oldz - self.origin_z) > 250))
	{
		dprint(/*28771i*/"item fell out of level at ");
		dprint(vtos(self.origin));
		dprint(/*2101i*/"\n");
		remove(self);
	}
};

void() misc_explobox2 =
{
	local float oldz;

	self.solid = IT_SUPER_SHOTGUN;
	self.movetype = TE_SPIKE;
	precache_model2(/*28812i*/"maps/b_exbox2.bsp");
	setmodel(self, /*28812i*/"maps/b_exbox2.bsp");
	setsize(self, VEC_ORIGIN, '32 32 32');
	precache_sound(/*11280i*/"weapons/r_exp3.wav");
	self.health = 20;
	self.th_die = barrel_explode;
	self.takedamage = IT_SUPER_SHOTGUN;
	self.origin_z = (self.origin_z + IT_SUPER_SHOTGUN);
	oldz = self.origin_z;
	droptofloor();
	if (((oldz - self.origin_z) > 250))
	{
		dprint(/*28771i*/"item fell out of level at ");
		dprint(vtos(self.origin));
		dprint(/*2101i*/"\n");
		remove(self);
	}
};

void() spikeshooter_use =
{
	if ((self.spawnflags & IT_SUPER_SHOTGUN))
	{
		sound(self, IT_SUPER_SHOTGUN, "enforcer/enfire.wav", IT_SHOTGUN, IT_SHOTGUN);
		PRJ_FireProjectile(self, "progs/laser.mdl", self.origin, (self.movedir * 600), IT_SUPER_NAILGUN, 15, SVC_TEMPENTITY, TE_LIGHTNING1);
		newmis.alpha = 0.5;
	}
	else
	{
		sound(self, IT_SUPER_SHOTGUN, "weapons/spike2.wav", IT_SHOTGUN, IT_SHOTGUN);
		if ((self.spawnflags & IT_SHOTGUN))
		{
			PRJ_FireProjectile(self, "progs/s_spike.mdl", self.origin, (self.movedir * 500), IT_SUPER_SHOTGUN, 18, TE_LIGHTNING1, TE_LIGHTNING2);
		}
		else
		{
			PRJ_FireProjectile(self, "progs/spike.mdl", self.origin, (self.movedir * 500), IT_SHOTGUN, TE_LIGHTNING3, IT_NAILGUN, TE_LIGHTNING2);
		}
	}
};

void() shooter_think =
{
	spikeshooter_use();
	self.nextthink = (time + self.wait);
	newmis.velocity = (self.movedir * 500);
};

void() trap_spikeshooter =
{
	SetMovedir();
	self.use = spikeshooter_use;
	if ((self.spawnflags & IT_SUPER_SHOTGUN))
	{
		precache_model2(/*28865i*/"progs/laser.mdl");
		precache_sound2(/*28845i*/"enforcer/enfire.wav");
		precache_sound2(/*13706i*/"enforcer/enfstop.wav");
	}
	else
	{
		precache_sound(/*16605i*/"weapons/spike2.wav");
	}
};

void() trap_shooter =
{
	trap_spikeshooter();
	if ((self.wait == TE_SPIKE))
	{
		self.wait = IT_SHOTGUN;
	}
	self.nextthink = (time + self.wait);
	self.think = shooter_think;
};
var void() air_bubbles = SUB_Remove;

void() make_bubbles =
{
	local entity bubble;

	bubble = spawn();
	setmodel(bubble, /*2255i*/"progs/s_bubble.spr");
	setorigin(bubble, self.origin);
	bubble.movetype = IT_SUPER_NAILGUN;
	bubble.solid = TE_SPIKE;
	bubble.velocity = '0 0 15';
	bubble.nextthink = (time + 0.5);
	bubble.think = bubble_bob;
	bubble.classname = "bubble";
	bubble.frame = TE_SPIKE;
	bubble.bubble_state = TE_SPIKE;
	bubble.alpha = 0.4;
	setsize(bubble, '-8 -8 -8', '8 8 8');
	self.nextthink = ((time + random()) + 0.5);
	self.think = make_bubbles;
};

void() bubble_split =
{
	local entity bubble;

	bubble = spawn();
	setmodel(bubble, /*2255i*/"progs/s_bubble.spr");
	setorigin(bubble, self.origin);
	bubble.movetype = IT_SUPER_NAILGUN;
	bubble.solid = TE_SPIKE;
	bubble.velocity = self.velocity;
	bubble.nextthink = (time + 0.5);
	bubble.think = bubble_bob;
	bubble.classname = "bubble";
	bubble.frame = IT_SHOTGUN;
	bubble.bubble_state = TE_LAVASPLASH;
	setsize(bubble, '-8 -8 -8', '8 8 8');
	self.frame = IT_SHOTGUN;
	self.bubble_state = TE_LAVASPLASH;
	if ((self.waterlevel != TE_EXPLOSION))
	{
		remove(self);
	}
};

void() bubble_bob =
{
	local float rnd1;
	local float rnd2;
	local float rnd3;

	self.bubble_state = (self.bubble_state + IT_SHOTGUN);
	if ((self.bubble_state == IT_NAILGUN))
	{
		bubble_split();
	}
	if ((self.bubble_state == 20))
	{
		remove(self);
	}
	rnd1 = self.velocity_x + (-10 + (random() * 20));
	rnd2 = self.velocity_y + (-10 + (random() * 20));
	rnd3 = (self.velocity_z + TE_LAVASPLASH) + (random() * TE_LAVASPLASH);
	if ((rnd1 > TE_LAVASPLASH))
	{
		rnd1 = TE_LIGHTNING1;
	}
	if ((rnd1 < -10))
	{
		rnd1 = CONTENT_LAVA;
	}
	if ((rnd2 > TE_LAVASPLASH))
	{
		rnd2 = TE_LIGHTNING1;
	}
	if ((rnd2 < -10))
	{
		rnd2 = CONTENT_LAVA;
	}
	if ((rnd3 < TE_LAVASPLASH))
	{
		rnd3 = 15;
	}
	if ((rnd3 > SVC_INTERMISSION))
	{
		rnd3 = 25;
	}
	self.velocity_x = rnd1;
	self.velocity_y = rnd2;
	self.velocity_z = rnd3;
	self.nextthink = (time + 0.5);
	self.think = bubble_bob;
};
var void() viewthing = SUB_Remove;

void() func_wall_use =
{
	self.frame = (IT_SHOTGUN - self.frame);
};

void() func_wall =
{
	self.angles = VEC_ORIGIN;
	self.movetype = TE_WIZSPIKE;
	self.solid = IT_NAILGUN;
	self.use = func_wall_use;
	setmodel(self, self.model);
};

void() func_illusionary =
{
	self.angles = VEC_ORIGIN;
	self.movetype = TE_SPIKE;
	self.solid = TE_SPIKE;
	setmodel(self, self.model);
	makestatic(self);
};

void() func_episodegate =
{
	if (!(serverflags & self.spawnflags))
	{
		return;
	}
	self.angles = VEC_ORIGIN;
	self.movetype = TE_WIZSPIKE;
	self.solid = IT_NAILGUN;
	self.use = func_wall_use;
	setmodel(self, self.model);
};

void() func_bossgate =
{
	if (((serverflags & 15) == 15))
	{
		remove(self);
		return;
	}
	self.angles = VEC_ORIGIN;
	self.movetype = TE_WIZSPIKE;
	self.solid = IT_NAILGUN;
	self.use = func_wall_use;
	setmodel(self, self.model);
};
