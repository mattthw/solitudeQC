//Decompiled code. Please respect the original copyright.
void() knight_stand2;

void() knight_stand1 = [ 0, knight_stand2 ]
{
	ai_stand();
};
void() knight_stand3;

void() knight_stand2 = [ 1, knight_stand3 ]
{
	ai_stand();
};
void() knight_stand4;

void() knight_stand3 = [ 2, knight_stand4 ]
{
	ai_stand();
};
void() knight_stand5;

void() knight_stand4 = [ 3, knight_stand5 ]
{
	ai_stand();
};
void() knight_stand6;

void() knight_stand5 = [ 4, knight_stand6 ]
{
	ai_stand();
};
void() knight_stand7;

void() knight_stand6 = [ 5, knight_stand7 ]
{
	ai_stand();
};
void() knight_stand8;

void() knight_stand7 = [ 6, knight_stand8 ]
{
	ai_stand();
};
void() knight_stand9;

void() knight_stand8 = [ 7, knight_stand9 ]
{
	ai_stand();
};

void() knight_stand9 = [ 8, knight_stand1 ]
{
	ai_stand();
};
void() knight_walk2;

void() knight_walk1 = [ 53, knight_walk2 ]
{
	if ((random() < 0.2))
	{
		sound(self, IT_SUPER_SHOTGUN, "knight/idle.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
	}
	ai_walk(TE_EXPLOSION);
};
void() knight_walk3;

void() knight_walk2 = [ 54, knight_walk3 ]
{
	ai_walk(IT_SUPER_SHOTGUN);
};
void() knight_walk4;

void() knight_walk3 = [ 55, knight_walk4 ]
{
	ai_walk(TE_EXPLOSION);
};
void() knight_walk5;

void() knight_walk4 = [ 56, knight_walk5 ]
{
	ai_walk(IT_NAILGUN);
};
void() knight_walk6;

void() knight_walk5 = [ 57, knight_walk6 ]
{
	ai_walk(TE_EXPLOSION);
};
void() knight_walk7;

void() knight_walk6 = [ 58, knight_walk7 ]
{
	ai_walk(TE_EXPLOSION);
};
void() knight_walk8;

void() knight_walk7 = [ 59, knight_walk8 ]
{
	ai_walk(TE_EXPLOSION);
};
void() knight_walk9;

void() knight_walk8 = [ 60, knight_walk9 ]
{
	ai_walk(IT_NAILGUN);
};
void() knight_walk10;

void() knight_walk9 = [ 61, knight_walk10 ]
{
	ai_walk(TE_EXPLOSION);
};
void() knight_walk11;

void() knight_walk10 = [ 62, knight_walk11 ]
{
	ai_walk(TE_EXPLOSION);
};
void() knight_walk12;

void() knight_walk11 = [ 63, knight_walk12 ]
{
	ai_walk(IT_SUPER_SHOTGUN);
};
void() knight_walk13;

void() knight_walk12 = [ 64, knight_walk13 ]
{
	ai_walk(TE_EXPLOSION);
};
void() knight_walk14;

void() knight_walk13 = [ 65, knight_walk14 ]
{
	ai_walk(IT_NAILGUN);
};

void() knight_walk14 = [ 66, knight_walk1 ]
{
	ai_walk(TE_EXPLOSION);
};
void() knight_run2;

void() knight_run1 = [ 9, knight_run2 ]
{
	if ((random() < 0.2))
	{
		sound(self, IT_SUPER_SHOTGUN, "knight/idle.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
	}
	ai_run(IT_GRENADE_LAUNCHER);
};
void() knight_run3;

void() knight_run2 = [ 10, knight_run3 ]
{
	ai_run(20);
};
void() knight_run4;

void() knight_run3 = [ 11, knight_run4 ]
{
	ai_run(13);
};
void() knight_run5;

void() knight_run4 = [ 12, knight_run5 ]
{
	ai_run(TE_WIZSPIKE);
};
void() knight_run6;

void() knight_run5 = [ 13, knight_run6 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};
void() knight_run7;

void() knight_run6 = [ 14, knight_run7 ]
{
	ai_run(20);
};
void() knight_run8;

void() knight_run7 = [ 15, knight_run8 ]
{
	ai_run(SVC_UPDATEFRAGS);
};

void() knight_run8 = [ 16, knight_run1 ]
{
	ai_run(TE_LIGHTNING2);
};
void() knight_runatk2;

void() knight_runatk1 = [ 17, knight_runatk2 ]
{
	if ((random() > 0.5))
	{
		sound(self, IT_SHOTGUN, "knight/sword2.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	else
	{
		sound(self, IT_SHOTGUN, "knight/sword1.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	ai_charge(20);
};
void() knight_runatk3;

void() knight_runatk2 = [ 18, knight_runatk3 ]
{
	ai_charge_side();
};
void() knight_runatk4;

void() knight_runatk3 = [ 19, knight_runatk4 ]
{
	ai_charge_side();
};
void() knight_runatk5;

void() knight_runatk4 = [ 20, knight_runatk5 ]
{
	ai_charge_side();
};
void() knight_runatk6;

void() knight_runatk5 = [ 21, knight_runatk6 ]
{
	ai_melee_side(IT_ROCKET_LAUNCHER);
};
void() knight_runatk7;

void() knight_runatk6 = [ 22, knight_runatk7 ]
{
	ai_melee_side(IT_ROCKET_LAUNCHER);
};
void() knight_runatk8;

void() knight_runatk7 = [ 23, knight_runatk8 ]
{
	ai_melee_side(IT_ROCKET_LAUNCHER);
};
void() knight_runatk9;

void() knight_runatk8 = [ 24, knight_runatk9 ]
{
	ai_melee_side(IT_ROCKET_LAUNCHER);
};
void() knight_runatk10;

void() knight_runatk9 = [ 25, knight_runatk10 ]
{
	ai_melee_side(IT_ROCKET_LAUNCHER);
};
void() knight_runatk11;

void() knight_runatk10 = [ 26, knight_runatk11 ]
{
	ai_charge_side();
};

void() knight_runatk11 = [ 27, knight_run1 ]
{
	ai_charge(TE_LAVASPLASH);
};
void() knight_atk2;

void() knight_atk1 = [ 43, knight_atk2 ]
{
	sound(self, IT_SHOTGUN, "knight/sword1.wav", IT_SHOTGUN, IT_SHOTGUN);
	ai_charge(TE_SPIKE);
};
void() knight_atk3;

void() knight_atk2 = [ 44, knight_atk3 ]
{
	ai_charge(TE_WIZSPIKE);
};
void() knight_atk4;

void() knight_atk3 = [ 45, knight_atk4 ]
{
	ai_charge(IT_NAILGUN);
};
void() knight_atk5;

void() knight_atk4 = [ 46, knight_atk5 ]
{
	ai_charge(TE_SPIKE);
};
void() knight_atk6;

void() knight_atk5 = [ 47, knight_atk6 ]
{
	ai_charge(TE_EXPLOSION);
};
void() knight_atk7;

void() knight_atk6 = [ 48, knight_atk7 ]
{
	ai_charge(IT_NAILGUN);
	ai_melee(IT_ROCKET_LAUNCHER);
};
void() knight_atk8;

void() knight_atk7 = [ 49, knight_atk8 ]
{
	ai_charge(IT_SHOTGUN);
	ai_melee(IT_ROCKET_LAUNCHER);
};
void() knight_atk9;

void() knight_atk8 = [ 50, knight_atk9 ]
{
	ai_charge(TE_EXPLOSION);
	ai_melee(IT_ROCKET_LAUNCHER);
};
void() knight_atk10;

void() knight_atk9 = [ 51, knight_atk10 ]
{
	ai_charge(IT_SHOTGUN);
};

void() knight_atk10 = [ 52, knight_run1 ]
{
	ai_charge(TE_LIGHTNING1);
};
void() knight_pain2;

void() knight_pain1 = [ 28, knight_pain2 ]
{
};
void() knight_pain3;

void() knight_pain2 = [ 29, knight_pain3 ]
{
};

void() knight_pain3 = [ 30, knight_run1 ]
{
};
void() knight_painb2;

void() knight_painb1 = [ 31, knight_painb2 ]
{
	ai_painforward(TE_SPIKE);
};
void() knight_painb3;

void() knight_painb2 = [ 32, knight_painb3 ]
{
	ai_painforward(TE_EXPLOSION);
};
void() knight_painb4;

void() knight_painb3 = [ 33, knight_painb4 ]
{
};
void() knight_painb5;

void() knight_painb4 = [ 34, knight_painb5 ]
{
};
void() knight_painb6;

void() knight_painb5 = [ 35, knight_painb6 ]
{
	ai_painforward(IT_SUPER_SHOTGUN);
};
void() knight_painb7;

void() knight_painb6 = [ 36, knight_painb7 ]
{
	ai_painforward(IT_NAILGUN);
};
void() knight_painb8;

void() knight_painb7 = [ 37, knight_painb8 ]
{
	ai_painforward(IT_SUPER_SHOTGUN);
};
void() knight_painb9;

void() knight_painb8 = [ 38, knight_painb9 ]
{
	ai_painforward(TE_LIGHTNING1);
};
void() knight_painb10;

void() knight_painb9 = [ 39, knight_painb10 ]
{
	ai_painforward(TE_LIGHTNING1);
};
void() knight_painb11;

void() knight_painb10 = [ 40, knight_painb11 ]
{
	ai_painforward(TE_SPIKE);
};

void() knight_painb11 = [ 41, knight_run1 ]
{
};

void(entity attacker, float damage) knight_pain =
{
	local float r;

	if ((self.pain_finished > time))
	{
		return;
	}
	r = random();
	sound(self, IT_SUPER_SHOTGUN, "knight/khurt.wav", IT_SHOTGUN, IT_SHOTGUN);
	self.pain_finished = (time + IT_SHOTGUN);
	if ((r < 0.85))
	{
		knight_pain1();
	}
	else
	{
		knight_painb1();
	}
};
void() knight_die2;

void() knight_die1 = [ 76, knight_die2 ]
{
};
void() knight_die3;

void() knight_die2 = [ 77, knight_die3 ]
{
};
void() knight_die4;

void() knight_die3 = [ 78, knight_die4 ]
{
	self.solid = TE_SPIKE;
};
void() knight_die5;

void() knight_die4 = [ 79, knight_die5 ]
{
};
void() knight_die6;

void() knight_die5 = [ 80, knight_die6 ]
{
};
void() knight_die7;

void() knight_die6 = [ 81, knight_die7 ]
{
};
void() knight_die8;

void() knight_die7 = [ 82, knight_die8 ]
{
};
void() knight_die9;

void() knight_die8 = [ 83, knight_die9 ]
{
};
void() knight_die10;

void() knight_die9 = [ 84, knight_die10 ]
{
};

void() knight_die10 = [ 85, knight_die10 ]
{
};
void() knight_dieb2;

void() knight_dieb1 = [ 86, knight_dieb2 ]
{
};
void() knight_dieb3;

void() knight_dieb2 = [ 87, knight_dieb3 ]
{
};
void() knight_dieb4;

void() knight_dieb3 = [ 88, knight_dieb4 ]
{
	self.solid = TE_SPIKE;
};
void() knight_dieb5;

void() knight_dieb4 = [ 89, knight_dieb5 ]
{
};
void() knight_dieb6;

void() knight_dieb5 = [ 90, knight_dieb6 ]
{
};
void() knight_dieb7;

void() knight_dieb6 = [ 91, knight_dieb7 ]
{
};
void() knight_dieb8;

void() knight_dieb7 = [ 92, knight_dieb8 ]
{
};
void() knight_dieb9;

void() knight_dieb8 = [ 93, knight_dieb9 ]
{
};
void() knight_dieb10;

void() knight_dieb9 = [ 94, knight_dieb10 ]
{
};
void() knight_dieb11;

void() knight_dieb10 = [ 95, knight_dieb11 ]
{
};

void() knight_dieb11 = [ 96, knight_dieb11 ]
{
};

void() knight_die =
{
	sound(self, IT_SUPER_SHOTGUN, "knight/kdeath.wav", IT_SHOTGUN, IT_SHOTGUN);
	if ((random() < 0.5))
	{
		knight_die1();
	}
	else
	{
		knight_dieb1();
	}
};

void() knight_attack =
{
	local float len;

	len = vlen(((self.enemy.origin + self.enemy.view_ofs) - (self.origin + self.view_ofs)));
	if ((len < 80))
	{
		knight_atk1();
	}
	else
	{
		knight_runatk1();
	}
};

void() monster_knight =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	precache_model(/*39005i*/"progs/knight.mdl");
	precache_sound(/*38962i*/"knight/kdeath.wav");
	precache_sound(/*38667i*/"knight/khurt.wav");
	precache_sound(/*30085i*/"knight/ksight.wav");
	precache_sound(/*38166i*/"knight/sword1.wav");
	precache_sound(/*38148i*/"knight/sword2.wav");
	precache_sound(/*37849i*/"knight/idle.wav");
	self.solid = TE_EXPLOSION;
	self.movetype = IT_NAILGUN;
	setmodel(self, /*39005i*/"progs/knight.mdl");
	setsize(self, VEC_HULL_MIN, '16 16 40');
	self.health = 75;
	self.th_stand = knight_stand1;
	self.th_walk = knight_walk1;
	self.th_run = knight_run1;
	self.th_melee = knight_attack;
	self.th_pain = knight_pain;
	self.th_die = knight_die;
	walkmonster_start();
};
