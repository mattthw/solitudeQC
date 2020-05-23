//Decompiled code. Please respect the original copyright.

void() enforcer_fire =
{
	local vector org;
	local vector vec;

	muzzleflash();
	makevectors(self.angles);
	org = ((self.origin + (v_forward * SVC_INTERMISSION)) + (v_right * 8.5)) + '0 0 16';
	vec = normalize((self.enemy.origin - self.origin)) * 600;
	sound(self, IT_SUPER_SHOTGUN, "enforcer/enfire.wav", IT_SHOTGUN, IT_SHOTGUN);
	PRJ_FireProjectile(self, "progs/laser.mdl", org, vec, IT_SUPER_NAILGUN, 15, SVC_FOUNDSECRET, TE_LIGHTNING1);
	newmis.effects = (newmis.effects | IT_SUPER_NAILGUN);
	newmis.alpha = 0.5;
};
void() enf_stand2;

void() enf_stand1 = [ 0, enf_stand2 ]
{
	ai_stand();
};
void() enf_stand3;

void() enf_stand2 = [ 1, enf_stand3 ]
{
	ai_stand();
};
void() enf_stand4;

void() enf_stand3 = [ 2, enf_stand4 ]
{
	ai_stand();
};
void() enf_stand5;

void() enf_stand4 = [ 3, enf_stand5 ]
{
	ai_stand();
};
void() enf_stand6;

void() enf_stand5 = [ 4, enf_stand6 ]
{
	ai_stand();
};
void() enf_stand7;

void() enf_stand6 = [ 5, enf_stand7 ]
{
	ai_stand();
};

void() enf_stand7 = [ 6, enf_stand1 ]
{
	ai_stand();
};
void() enf_walk2;

void() enf_walk1 = [ 7, enf_walk2 ]
{
	if ((random() < 0.2))
	{
		sound(self, IT_SUPER_SHOTGUN, "enforcer/idle1.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
	}
	ai_walk(IT_SUPER_SHOTGUN);
};
void() enf_walk3;

void() enf_walk2 = [ 8, enf_walk3 ]
{
	ai_walk(IT_NAILGUN);
};
void() enf_walk4;

void() enf_walk3 = [ 9, enf_walk4 ]
{
	ai_walk(IT_NAILGUN);
};
void() enf_walk5;

void() enf_walk4 = [ 10, enf_walk5 ]
{
	ai_walk(TE_EXPLOSION);
};
void() enf_walk6;

void() enf_walk5 = [ 11, enf_walk6 ]
{
	ai_walk(IT_SHOTGUN);
};
void() enf_walk7;

void() enf_walk6 = [ 12, enf_walk7 ]
{
	ai_walk(IT_SUPER_SHOTGUN);
};
void() enf_walk8;

void() enf_walk7 = [ 13, enf_walk8 ]
{
	ai_walk(IT_SUPER_SHOTGUN);
};
void() enf_walk9;

void() enf_walk8 = [ 14, enf_walk9 ]
{
	ai_walk(IT_SHOTGUN);
};
void() enf_walk10;

void() enf_walk9 = [ 15, enf_walk10 ]
{
	ai_walk(IT_SUPER_SHOTGUN);
};
void() enf_walk11;

void() enf_walk10 = [ 16, enf_walk11 ]
{
	ai_walk(IT_NAILGUN);
};
void() enf_walk12;

void() enf_walk11 = [ 17, enf_walk12 ]
{
	ai_walk(IT_NAILGUN);
};
void() enf_walk13;

void() enf_walk12 = [ 18, enf_walk13 ]
{
	ai_walk(IT_SHOTGUN);
};
void() enf_walk14;

void() enf_walk13 = [ 19, enf_walk14 ]
{
	ai_walk(IT_SUPER_SHOTGUN);
};
void() enf_walk15;

void() enf_walk14 = [ 20, enf_walk15 ]
{
	ai_walk(TE_EXPLOSION);
};
void() enf_walk16;

void() enf_walk15 = [ 21, enf_walk16 ]
{
	ai_walk(IT_NAILGUN);
};

void() enf_walk16 = [ 22, enf_walk1 ]
{
	ai_walk(IT_SUPER_SHOTGUN);
};
void() enf_run2;

void() enf_run1 = [ 23, enf_run2 ]
{
	if ((random() < 0.2))
	{
		sound(self, IT_SUPER_SHOTGUN, "enforcer/idle1.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
	}
	ai_run(18);
};
void() enf_run3;

void() enf_run2 = [ 24, enf_run3 ]
{
	ai_run(SVC_UPDATEFRAGS);
};
void() enf_run4;

void() enf_run3 = [ 25, enf_run4 ]
{
	ai_run(TE_WIZSPIKE);
};
void() enf_run5;

void() enf_run4 = [ 26, enf_run5 ]
{
	ai_run(12);
};
void() enf_run6;

void() enf_run5 = [ 27, enf_run6 ]
{
	ai_run(SVC_UPDATEFRAGS);
};
void() enf_run7;

void() enf_run6 = [ 28, enf_run7 ]
{
	ai_run(SVC_UPDATEFRAGS);
};
void() enf_run8;

void() enf_run7 = [ 29, enf_run8 ]
{
	ai_run(TE_WIZSPIKE);
};

void() enf_run8 = [ 30, enf_run1 ]
{
	ai_run(TE_TELEPORT);
};
void() enf_atk2;

void() enf_atk1 = [ 31, enf_atk2 ]
{
	ai_face();
};
void() enf_atk3;

void() enf_atk2 = [ 32, enf_atk3 ]
{
	ai_face();
};
void() enf_atk4;

void() enf_atk3 = [ 33, enf_atk4 ]
{
	ai_face();
};
void() enf_atk5;

void() enf_atk4 = [ 34, enf_atk5 ]
{
	ai_face();
};
void() enf_atk6;

void() enf_atk5 = [ 35, enf_atk6 ]
{
	ai_face();
};
void() enf_atk7;

void() enf_atk6 = [ 36, enf_atk7 ]
{
	enforcer_fire();
};
void() enf_atk8;

void() enf_atk7 = [ 37, enf_atk8 ]
{
	ai_face();
};
void() enf_atk9;

void() enf_atk8 = [ 38, enf_atk9 ]
{
	ai_face();
};
void() enf_atk10;

void() enf_atk9 = [ 35, enf_atk10 ]
{
	ai_face();
};
void() enf_atk11;

void() enf_atk10 = [ 36, enf_atk11 ]
{
	enforcer_fire();
};
void() enf_atk12;

void() enf_atk11 = [ 37, enf_atk12 ]
{
	ai_face();
};
void() enf_atk13;

void() enf_atk12 = [ 38, enf_atk13 ]
{
	ai_face();
};
void() enf_atk14;

void() enf_atk13 = [ 39, enf_atk14 ]
{
	ai_face();
};

void() enf_atk14 = [ 40, enf_run1 ]
{
	ai_face();
	SUB_CheckRefire(enf_atk1);
};
void() enf_paina2;

void() enf_paina1 = [ 66, enf_paina2 ]
{
};
void() enf_paina3;

void() enf_paina2 = [ 67, enf_paina3 ]
{
};
void() enf_paina4;

void() enf_paina3 = [ 68, enf_paina4 ]
{
};

void() enf_paina4 = [ 69, enf_run1 ]
{
};
void() enf_painb2;

void() enf_painb1 = [ 70, enf_painb2 ]
{
};
void() enf_painb3;

void() enf_painb2 = [ 71, enf_painb3 ]
{
};
void() enf_painb4;

void() enf_painb3 = [ 72, enf_painb4 ]
{
};
void() enf_painb5;

void() enf_painb4 = [ 73, enf_painb5 ]
{
};

void() enf_painb5 = [ 74, enf_run1 ]
{
};
void() enf_painc2;

void() enf_painc1 = [ 75, enf_painc2 ]
{
};
void() enf_painc3;

void() enf_painc2 = [ 76, enf_painc3 ]
{
};
void() enf_painc4;

void() enf_painc3 = [ 77, enf_painc4 ]
{
};
void() enf_painc5;

void() enf_painc4 = [ 78, enf_painc5 ]
{
};
void() enf_painc6;

void() enf_painc5 = [ 79, enf_painc6 ]
{
};
void() enf_painc7;

void() enf_painc6 = [ 80, enf_painc7 ]
{
};
void() enf_painc8;

void() enf_painc7 = [ 81, enf_painc8 ]
{
};

void() enf_painc8 = [ 82, enf_run1 ]
{
};
void() enf_paind2;

void() enf_paind1 = [ 83, enf_paind2 ]
{
};
void() enf_paind3;

void() enf_paind2 = [ 84, enf_paind3 ]
{
};
void() enf_paind4;

void() enf_paind3 = [ 85, enf_paind4 ]
{
};
void() enf_paind5;

void() enf_paind4 = [ 86, enf_paind5 ]
{
	ai_painforward(IT_SUPER_SHOTGUN);
};
void() enf_paind6;

void() enf_paind5 = [ 87, enf_paind6 ]
{
	ai_painforward(IT_SHOTGUN);
};
void() enf_paind7;

void() enf_paind6 = [ 88, enf_paind7 ]
{
};
void() enf_paind8;

void() enf_paind7 = [ 89, enf_paind8 ]
{
};
void() enf_paind9;

void() enf_paind8 = [ 90, enf_paind9 ]
{
};
void() enf_paind10;

void() enf_paind9 = [ 91, enf_paind10 ]
{
};
void() enf_paind11;

void() enf_paind10 = [ 92, enf_paind11 ]
{
};
void() enf_paind12;

void() enf_paind11 = [ 93, enf_paind12 ]
{
	ai_painforward(IT_SHOTGUN);
};
void() enf_paind13;

void() enf_paind12 = [ 94, enf_paind13 ]
{
	ai_painforward(IT_SHOTGUN);
};
void() enf_paind14;

void() enf_paind13 = [ 95, enf_paind14 ]
{
	ai_painforward(IT_SHOTGUN);
};
void() enf_paind15;

void() enf_paind14 = [ 96, enf_paind15 ]
{
};
void() enf_paind16;

void() enf_paind15 = [ 97, enf_paind16 ]
{
};
void() enf_paind17;

void() enf_paind16 = [ 98, enf_paind17 ]
{
	ai_pain(IT_SHOTGUN);
};
void() enf_paind18;

void() enf_paind17 = [ 99, enf_paind18 ]
{
	ai_pain(IT_SHOTGUN);
};
void() enf_paind19;

void() enf_paind18 = [ 100, enf_paind19 ]
{
};

void() enf_paind19 = [ 101, enf_run1 ]
{
};

void(entity attacker, float damage) enf_pain =
{
	local float r;

	if ((self.pain_finished > time))
	{
		return;
	}
	r = random();
	if ((r < 0.5))
	{
		sound(self, IT_SUPER_SHOTGUN, "enforcer/pain1.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	else
	{
		sound(self, IT_SUPER_SHOTGUN, "enforcer/pain2.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	self.pain_finished = (time + IT_SHOTGUN);
	if ((r < 0.2))
	{
		enf_paina1();
	}
	else
	{
		if ((r < 0.4))
		{
			enf_painb1();
		}
		else
		{
			if ((r < 0.7))
			{
				enf_painc1();
			}
			else
			{
				enf_paind1();
			}
		}
	}
};
void() enf_die2;

void() enf_die1 = [ 41, enf_die2 ]
{
};
void() enf_die3;

void() enf_die2 = [ 42, enf_die3 ]
{
};
void() enf_die4;

void() enf_die3 = [ 43, enf_die4 ]
{
	self.solid = TE_SPIKE;
	DropBackpack();
};
void() enf_die5;

void() enf_die4 = [ 44, enf_die5 ]
{
	ai_forward(SVC_UPDATEFRAGS);
};
void() enf_die6;

void() enf_die5 = [ 45, enf_die6 ]
{
	ai_forward(IT_SUPER_SHOTGUN);
};
void() enf_die7;

void() enf_die6 = [ 46, enf_die7 ]
{
};
void() enf_die8;

void() enf_die7 = [ 47, enf_die8 ]
{
};
void() enf_die9;

void() enf_die8 = [ 48, enf_die9 ]
{
};
void() enf_die10;

void() enf_die9 = [ 49, enf_die10 ]
{
	ai_forward(TE_EXPLOSION);
};
void() enf_die11;

void() enf_die10 = [ 50, enf_die11 ]
{
	ai_forward(TE_LIGHTNING1);
};
void() enf_die12;

void() enf_die11 = [ 51, enf_die12 ]
{
	ai_forward(TE_LIGHTNING1);
};
void() enf_die13;

void() enf_die12 = [ 52, enf_die13 ]
{
	ai_forward(TE_LIGHTNING1);
};
void() enf_die14;

void() enf_die13 = [ 53, enf_die14 ]
{
};

void() enf_die14 = [ 54, enf_die14 ]
{
};
void() enf_fdie2;

void() enf_fdie1 = [ 55, enf_fdie2 ]
{
};
void() enf_fdie3;

void() enf_fdie2 = [ 56, enf_fdie3 ]
{
};
void() enf_fdie4;

void() enf_fdie3 = [ 57, enf_fdie4 ]
{
	self.solid = TE_SPIKE;
	DropBackpack();
};
void() enf_fdie5;

void() enf_fdie4 = [ 58, enf_fdie5 ]
{
};
void() enf_fdie6;

void() enf_fdie5 = [ 59, enf_fdie6 ]
{
};
void() enf_fdie7;

void() enf_fdie6 = [ 60, enf_fdie7 ]
{
};
void() enf_fdie8;

void() enf_fdie7 = [ 61, enf_fdie8 ]
{
};
void() enf_fdie9;

void() enf_fdie8 = [ 62, enf_fdie9 ]
{
};
void() enf_fdie10;

void() enf_fdie9 = [ 63, enf_fdie10 ]
{
};
void() enf_fdie11;

void() enf_fdie10 = [ 64, enf_fdie11 ]
{
};

void() enf_fdie11 = [ 65, enf_fdie11 ]
{
};

void() enf_die =
{
	sound(self, IT_SUPER_SHOTGUN, "enforcer/death1.wav", IT_SHOTGUN, IT_SHOTGUN);
	if ((random() > 0.5))
	{
		enf_die1();
	}
	else
	{
		enf_fdie1();
	}
};

void() monster_enforcer =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	precache_model2(/*35645i*/"progs/enforcer.mdl");
	precache_model2(/*28865i*/"progs/laser.mdl");
	precache_sound2(/*35617i*/"enforcer/death1.wav");
	precache_sound2(/*28845i*/"enforcer/enfire.wav");
	precache_sound2(/*13706i*/"enforcer/enfstop.wav");
	precache_sound2(/*34532i*/"enforcer/idle1.wav");
	precache_sound2(/*35327i*/"enforcer/pain1.wav");
	precache_sound2(/*35346i*/"enforcer/pain2.wav");
	precache_sound2(/*30353i*/"enforcer/sight1.wav");
	precache_sound2(/*30373i*/"enforcer/sight2.wav");
	precache_sound2(/*30393i*/"enforcer/sight3.wav");
	precache_sound2(/*30413i*/"enforcer/sight4.wav");
	self.solid = TE_EXPLOSION;
	self.movetype = IT_NAILGUN;
	setmodel(self, /*35645i*/"progs/enforcer.mdl");
	setsize(self, VEC_HULL_MIN, '16 16 40');
	self.health = 80;
	self.th_stand = enf_stand1;
	self.th_walk = enf_walk1;
	self.th_run = enf_run1;
	self.th_pain = enf_pain;
	self.th_die = enf_die;
	self.th_missile = enf_atk1;
	self.ammo_cells_real = TE_LIGHTNING1;
	walkmonster_start();
};
