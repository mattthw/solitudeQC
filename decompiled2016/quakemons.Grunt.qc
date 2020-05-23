//Decompiled code. Please respect the original copyright.

void() laughs =
{
	local float r;

	r = random();
	if ((self.attack_finished > time))
	{
		return;
	}
	if ((r <= 0.025))
	{
		sound(self, TE_SPIKE, "soldier/laugh1.wav", 0.8, IT_SHOTGUN);
		self.attack_finished = (time + TE_LIGHTNING1);
	}
	else
	{
		if ((r <= 0.05))
		{
			sound(self, TE_SPIKE, "soldier/laugh2.wav", 0.8, IT_SHOTGUN);
			self.attack_finished = (time + TE_LIGHTNING1);
		}
		else
		{
		}
	}
};

void() g_attack =
{
	local float r;

	r = random();
	if ((self.attack_finished > time))
	{
		return;
	}
	if ((r <= 0.005))
	{
		sound(self, TE_SPIKE, "soldier/unstoppable.wav", 0.9, IT_SHOTGUN);
		self.attack_finished = (time + TE_LIGHTNING1);
	}
	else
	{
		if ((r <= 0.01))
		{
			sound(self, TE_SPIKE, "soldier/kill_it.wav", 0.9, IT_SHOTGUN);
			self.attack_finished = (time + TE_LIGHTNING1);
		}
		else
		{
		}
	}
};
void() grunt_stand2;

void() grunt_stand1 = [ 0, grunt_stand2 ]
{
	ai_stand();
};
void() grunt_stand3;

void() grunt_stand2 = [ 1, grunt_stand3 ]
{
	ai_stand();
};
void() grunt_stand4;

void() grunt_stand3 = [ 2, grunt_stand4 ]
{
	ai_stand();
};
void() grunt_stand5;

void() grunt_stand4 = [ 3, grunt_stand5 ]
{
	ai_stand();
};
void() grunt_stand6;

void() grunt_stand5 = [ 4, grunt_stand6 ]
{
	ai_stand();
};
void() grunt_stand7;

void() grunt_stand6 = [ 5, grunt_stand7 ]
{
	ai_stand();
	laughs();
};
void() grunt_stand8;

void() grunt_stand7 = [ 6, grunt_stand8 ]
{
	ai_stand();
};

void() grunt_stand8 = [ 7, grunt_stand1 ]
{
	ai_stand();
};
void() grunt_walk2;

void() grunt_walk1 = [ 38, grunt_walk2 ]
{
	ai_walk(IT_SHOTGUN);
};
void() grunt_walk3;

void() grunt_walk2 = [ 39, grunt_walk3 ]
{
	ai_walk((IT_SHOTGUN + round));
};
void() grunt_walk4;

void() grunt_walk3 = [ 40, grunt_walk4 ]
{
	ai_walk((IT_SHOTGUN + round));
};
void() grunt_walk5;

void() grunt_walk4 = [ 41, grunt_walk5 ]
{
	ai_walk((IT_SHOTGUN + round));
};
void() grunt_walk6;

void() grunt_walk5 = [ 42, grunt_walk6 ]
{
	ai_walk((IT_SUPER_SHOTGUN + round));
};
void() grunt_walk7;

void() grunt_walk6 = [ 43, grunt_walk7 ]
{
	ai_walk((TE_EXPLOSION + round));
};
void() grunt_walk8;

void() grunt_walk7 = [ 44, grunt_walk8 ]
{
	ai_walk((IT_NAILGUN + round));
};
void() grunt_walk9;

void() grunt_walk8 = [ 45, grunt_walk9 ]
{
	ai_walk((IT_NAILGUN + round));
};
void() grunt_walk10;

void() grunt_walk9 = [ 46, grunt_walk10 ]
{
	ai_walk((IT_SUPER_SHOTGUN + round));
};
void() grunt_walk11;

void() grunt_walk10 = [ 47, grunt_walk11 ]
{
	ai_walk((IT_SUPER_SHOTGUN + round));
};
void() grunt_walk12;

void() grunt_walk11 = [ 48, grunt_walk12 ]
{
	ai_walk((IT_SUPER_SHOTGUN + round));
};
void() grunt_walk13;

void() grunt_walk12 = [ 49, grunt_walk13 ]
{
	ai_walk((IT_SHOTGUN + round));
};
void() grunt_walk14;

void() grunt_walk13 = [ 50, grunt_walk14 ]
{
	ai_walk((TE_SPIKE + round));
};
void() grunt_walk15;

void() grunt_walk14 = [ 51, grunt_walk15 ]
{
	ai_walk((IT_SHOTGUN + round));
};
void() grunt_walk16;

void() grunt_walk15 = [ 52, grunt_walk16 ]
{
	ai_walk((IT_SHOTGUN + round));
};
void() grunt_walk17;

void() grunt_walk16 = [ 53, grunt_walk17 ]
{
	ai_walk((IT_SHOTGUN + round));
};
void() grunt_walk18;

void() grunt_walk17 = [ 54, grunt_walk18 ]
{
	ai_walk((TE_EXPLOSION + round));
};
void() grunt_walk19;

void() grunt_walk18 = [ 55, grunt_walk19 ]
{
	ai_walk((TE_EXPLOSION + round));
};
void() grunt_walk20;

void() grunt_walk19 = [ 56, grunt_walk20 ]
{
	ai_walk((TE_EXPLOSION + round));
};
void() grunt_walk21;

void() grunt_walk20 = [ 57, grunt_walk21 ]
{
	ai_walk((TE_EXPLOSION + round));
};
void() grunt_walk22;

void() grunt_walk21 = [ 58, grunt_walk22 ]
{
	ai_walk((IT_SUPER_SHOTGUN + round));
};
void() grunt_walk23;

void() grunt_walk22 = [ 59, grunt_walk23 ]
{
	ai_walk((IT_SHOTGUN + round));
};
void() grunt_walk24;

void() grunt_walk23 = [ 60, grunt_walk24 ]
{
	ai_walk((IT_SHOTGUN + round));
};

void() grunt_walk24 = [ 61, grunt_walk1 ]
{
	ai_walk((IT_SHOTGUN + round));
};
void() grunt_run2;

void() grunt_run1 = [ 18, grunt_run2 ]
{
	if ((random() < 0.2))
	{
		sound(self, IT_SUPER_SHOTGUN, "soldier/idle.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
	}
	ai_run(TE_TELEPORT);
};
void() grunt_run3;

void() grunt_run2 = [ 19, grunt_run3 ]
{
	ai_run((15 + round));
};
void() grunt_run4;

void() grunt_run3 = [ 20, grunt_run4 ]
{
	ai_run((TE_LAVASPLASH + round));
};
void() grunt_run5;

void() grunt_run4 = [ 21, grunt_run5 ]
{
	ai_run((TE_LAVASPLASH + round));
};
void() grunt_run6;

void() grunt_run5 = [ 22, grunt_run6 ]
{
	ai_run((IT_SUPER_NAILGUN + round));
};
void() grunt_run7;

void() grunt_run6 = [ 23, grunt_run7 ]
{
	ai_run((15 + round));
};
void() grunt_run8;

void() grunt_run7 = [ 24, grunt_run8 ]
{
	ai_run((TE_LAVASPLASH + round));
};

void() grunt_run8 = [ 25, grunt_run1 ]
{
	ai_run((IT_SUPER_NAILGUN + round));
};
void() grunt_grenade2;

void() grunt_grenade1 = [ 9, grunt_grenade2 ]
{
	ai_face();
};
void() grunt_grenade3;

void() grunt_grenade2 = [ 10, grunt_grenade3 ]
{
	ai_face();
};
void() grunt_grenade4;

void() grunt_grenade3 = [ 11, grunt_grenade4 ]
{
	ai_face();
};
void() grunt_grenade5;

void() grunt_grenade4 = [ 12, grunt_grenade5 ]
{
	ai_face();
};
void() grunt_grenade6;

void() grunt_grenade5 = [ 13, grunt_grenade6 ]
{
	ai_face();
	Enemy_Fire_Nade();
};
void() grunt_grenade7;

void() grunt_grenade6 = [ 14, grunt_grenade7 ]
{
	ai_face();
};
void() grunt_grenade8;

void() grunt_grenade7 = [ 15, grunt_grenade8 ]
{
	ai_face();
};
void() grunt_grenade9;

void() grunt_grenade8 = [ 16, grunt_grenade9 ]
{
	ai_face();
};

void() grunt_grenade9 = [ 17, grunt_run1 ]
{
	ai_face();
};
void() grunt_atk2;

void() grunt_atk1 = [ 33, grunt_atk2 ]
{
	ai_face();
};
void() grunt_atk3;

void() grunt_atk2 = [ 34, grunt_atk3 ]
{
	ai_face();
	Enemy_Fire_PPist();
};
void() grunt_atk4;

void() grunt_atk3 = [ 35, grunt_atk4 ]
{
	ai_face();
};

void() grunt_atk4 = [ 36, grunt_run1 ]
{
	ai_face();
};
void() grunt_melee2;

void() grunt_melee1 = [ 26, grunt_melee2 ]
{
	ai_charge(IT_SHOTGUN);
};
void() grunt_melee3;

void() grunt_melee2 = [ 27, grunt_melee3 ]
{
	ai_charge(IT_SHOTGUN);
	ai_melee(SVC_KILLEDMONSTER);
};
void() grunt_melee4;

void() grunt_melee3 = [ 28, grunt_melee4 ]
{
	ai_charge(IT_NAILGUN);
};
void() grunt_melee5;

void() grunt_melee4 = [ 29, grunt_melee5 ]
{
	ai_charge(13);
};
void() grunt_melee6;

void() grunt_melee5 = [ 30, grunt_melee6 ]
{
	ai_charge(TE_LIGHTNING3);
};
void() grunt_melee7;

void() grunt_melee6 = [ 31, grunt_melee7 ]
{
};

void() grunt_melee7 = [ 32, grunt_run1 ]
{
};

void() grunt_pain1 = [ 0, grunt_run1 ]
{
	ai_painforward(IT_SUPER_NAILGUN);
	g_attack();
};

void() grunt_melee =
{
	grunt_melee1();
};

void(entity attacker, float damage) grunt_pain =
{

	if ((self.pain_finished > time))
	{
		return;
	}
	self.pain_finished = (time + IT_SHOTGUN);
	grunt_pain1();
	sound(self, IT_SUPER_SHOTGUN, "soldier/pain1.wav", IT_SHOTGUN, IT_SHOTGUN);
};

void(float enemy_range) grunt_attack =
{
	local float r;

	r = random();
	g_attack();
	if ((CATCH == IT_SHOTGUN))
	{
		if ((r <= 0.7))
		{
			grunt_grenade1();
		}
		else
		{
			grunt_atk1();
		}
	}
	else
	{
		if (((r <= 0.15) && (enemy_range <= IT_SUPER_SHOTGUN)))
		{
			grunt_grenade1();
		}
		else
		{
			grunt_atk1();
		}
	}
};

void() grunt_die1 = [ 37, grunt_die1 ]
{
	remove(self);
	round_kills = round_kills + IT_SHOTGUN;
	Check_Round();
};

void() grunt_die =
{
	sound(self, IT_SUPER_SHOTGUN, "soldier/death1.wav", IT_SHOTGUN, IT_SHOTGUN);
	grunt_die1();
};

void() monster_grunt =
{
	precache_model(/*34304i*/"progs/soldier.mdl");
	precache_model(/*34322i*/"progs/gib1.mdl");
	precache_model(/*34337i*/"progs/gib2.mdl");
	precache_model(/*34352i*/"progs/gib3.mdl");
	precache_sound(/*34275i*/"soldier/death1.wav");
	precache_sound(/*33823i*/"soldier/idle.wav");
	precache_sound(/*34222i*/"soldier/pain1.wav");
	precache_sound(/*34367i*/"soldier/pain2.wav");
	precache_sound(/*34385i*/"soldier/sattck1.wav");
	precache_sound(/*30469i*/"soldier/sight1.wav");
	self.solid = TE_EXPLOSION;
	self.movetype = IT_NAILGUN;
	setmodel(self, /*34304i*/"progs/soldier.mdl");
	setsize(self, VEC_HULL_MIN, '16 16 40');
	self.health = 130;
	self.th_stand = grunt_stand1;
	self.th_walk = grunt_walk1;
	self.th_run = grunt_run1;
	self.th_missile = grunt_atk1;
	self.th_pain = grunt_pain;
	self.th_die = grunt_die;
	walkmonster_start();
};
