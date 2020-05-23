//Decompiled code. Please respect the original copyright.
void() shalrath_pain;
void() ShalMissile;

void() shal_stand = [ 23, shal_stand ]
{
	ai_stand();
};
void() shal_walk2;

void() shal_walk1 = [ 24, shal_walk2 ]
{
	if ((random() < 0.2))
	{
		sound(self, IT_SUPER_SHOTGUN, "shalrath/idle.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
	}
	ai_walk(TE_LIGHTNING2);
};
void() shal_walk3;

void() shal_walk2 = [ 25, shal_walk3 ]
{
	ai_walk(IT_NAILGUN);
};
void() shal_walk4;

void() shal_walk3 = [ 26, shal_walk4 ]
{
	ai_walk(TE_SPIKE);
};
void() shal_walk5;

void() shal_walk4 = [ 27, shal_walk5 ]
{
	ai_walk(TE_SPIKE);
};
void() shal_walk6;

void() shal_walk5 = [ 28, shal_walk6 ]
{
	ai_walk(TE_SPIKE);
};
void() shal_walk7;

void() shal_walk6 = [ 29, shal_walk7 ]
{
	ai_walk(TE_SPIKE);
};
void() shal_walk8;

void() shal_walk7 = [ 30, shal_walk8 ]
{
	ai_walk(TE_LIGHTNING1);
};
void() shal_walk9;

void() shal_walk8 = [ 31, shal_walk9 ]
{
	ai_walk(TE_LIGHTNING2);
};
void() shal_walk10;

void() shal_walk9 = [ 32, shal_walk10 ]
{
	ai_walk(TE_LIGHTNING1);
};
void() shal_walk11;

void() shal_walk10 = [ 33, shal_walk11 ]
{
	ai_walk(TE_SPIKE);
};
void() shal_walk12;

void() shal_walk11 = [ 34, shal_walk12 ]
{
	ai_walk(IT_NAILGUN);
};

void() shal_walk12 = [ 23, shal_walk1 ]
{
	ai_walk(TE_LIGHTNING1);
};
void() shal_run2;

void() shal_run1 = [ 24, shal_run2 ]
{
	if ((random() < 0.2))
	{
		sound(self, IT_SUPER_SHOTGUN, "shalrath/idle.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
	}
	ai_run(TE_LIGHTNING2);
};
void() shal_run3;

void() shal_run2 = [ 25, shal_run3 ]
{
	ai_run(IT_NAILGUN);
};
void() shal_run4;

void() shal_run3 = [ 26, shal_run4 ]
{
	ai_run(TE_SPIKE);
};
void() shal_run5;

void() shal_run4 = [ 27, shal_run5 ]
{
	ai_run(TE_SPIKE);
};
void() shal_run6;

void() shal_run5 = [ 28, shal_run6 ]
{
	ai_run(TE_SPIKE);
};
void() shal_run7;

void() shal_run6 = [ 29, shal_run7 ]
{
	ai_run(TE_SPIKE);
};
void() shal_run8;

void() shal_run7 = [ 30, shal_run8 ]
{
	ai_run(TE_LIGHTNING1);
};
void() shal_run9;

void() shal_run8 = [ 31, shal_run9 ]
{
	ai_run(TE_LIGHTNING2);
};
void() shal_run10;

void() shal_run9 = [ 32, shal_run10 ]
{
	ai_run(TE_LIGHTNING1);
};
void() shal_run11;

void() shal_run10 = [ 33, shal_run11 ]
{
	ai_run(TE_SPIKE);
};
void() shal_run12;

void() shal_run11 = [ 34, shal_run12 ]
{
	ai_run(IT_NAILGUN);
};

void() shal_run12 = [ 23, shal_run1 ]
{
	ai_run(TE_LIGHTNING1);
};
void() shal_attack2;

void() shal_attack1 = [ 0, shal_attack2 ]
{
	sound(self, IT_SUPER_SHOTGUN, "shalrath/attack.wav", IT_SHOTGUN, IT_SHOTGUN);
	ai_face();
};
void() shal_attack3;

void() shal_attack2 = [ 1, shal_attack3 ]
{
	ai_face();
};
void() shal_attack4;

void() shal_attack3 = [ 2, shal_attack4 ]
{
	ai_face();
};
void() shal_attack5;

void() shal_attack4 = [ 3, shal_attack5 ]
{
	ai_face();
};
void() shal_attack6;

void() shal_attack5 = [ 4, shal_attack6 ]
{
	ai_face();
};
void() shal_attack7;

void() shal_attack6 = [ 5, shal_attack7 ]
{
	ai_face();
};
void() shal_attack8;

void() shal_attack7 = [ 6, shal_attack8 ]
{
	ai_face();
};
void() shal_attack9;

void() shal_attack8 = [ 7, shal_attack9 ]
{
	ai_face();
};
void() shal_attack10;

void() shal_attack9 = [ 8, shal_attack10 ]
{
	ShalMissile();
};
void() shal_attack11;

void() shal_attack10 = [ 9, shal_attack11 ]
{
	ai_face();
};

void() shal_attack11 = [ 10, shal_run1 ]
{
};
void() shal_pain2;

void() shal_pain1 = [ 11, shal_pain2 ]
{
};
void() shal_pain3;

void() shal_pain2 = [ 12, shal_pain3 ]
{
};
void() shal_pain4;

void() shal_pain3 = [ 13, shal_pain4 ]
{
};
void() shal_pain5;

void() shal_pain4 = [ 14, shal_pain5 ]
{
};

void() shal_pain5 = [ 15, shal_run1 ]
{
};
void() shal_death2;

void() shal_death1 = [ 16, shal_death2 ]
{
};
void() shal_death3;

void() shal_death2 = [ 17, shal_death3 ]
{
};
void() shal_death4;

void() shal_death3 = [ 18, shal_death4 ]
{
};
void() shal_death5;

void() shal_death4 = [ 19, shal_death5 ]
{
};
void() shal_death6;

void() shal_death5 = [ 20, shal_death6 ]
{
};
void() shal_death7;

void() shal_death6 = [ 21, shal_death7 ]
{
};

void() shal_death7 = [ 22, shal_death7 ]
{
};

void() shalrath_pain =
{
	if ((self.pain_finished > time))
	{
		return;
	}
	sound(self, IT_SUPER_SHOTGUN, "shalrath/pain.wav", IT_SHOTGUN, IT_SHOTGUN);
	shal_pain1();
	self.pain_finished = (time + TE_EXPLOSION);
};

void() shalrath_die =
{
	sound(self, IT_SUPER_SHOTGUN, "shalrath/death.wav", IT_SHOTGUN, IT_SHOTGUN);
	shal_death1();
	self.solid = TE_SPIKE;
};
float() ShalMissileTouch;
void() ShalHome;

void() ShalMissile =
{
	local vector dir;
	local float dist;
	local float flytime;

	dir = normalize(((self.enemy.origin + '0 0 10') - self.origin));
	dist = vlen((self.enemy.origin - self.origin));
	flytime = dist * 0.002;
	if ((flytime < 0.1))
	{
		flytime = 0.1;
	}
	muzzleflash();
	sound(self, IT_SHOTGUN, "shalrath/attack2.wav", IT_SHOTGUN, IT_SHOTGUN);
	PRJ_FireProjectile(self, "progs/v_spike.mdl", (self.origin + '0 0 10'), (dir * 400), TE_LIGHTNING2, TE_SPIKE, TE_SPIKE, SVC_INTERMISSION);
	PRJ_SetRadiusDamage(40, 80, 34);
	PRJ_SetThink(ShalHome, flytime, 0.2);
	PRJ_SetTouch(ShalMissileTouch);
	newmis.avelocity = '300 300 300';
	newmis.enemy = self.enemy;
};

void() ShalHome =
{
	local vector dir;
	local vector vtemp;

	vtemp = self.enemy.origin + '0 0 10';
	if ((self.enemy.health < IT_SHOTGUN))
	{
		remove(self);
		return;
	}
	dir = normalize((vtemp - self.origin));
	if ((skill > IT_SUPER_SHOTGUN))
	{
		self.velocity = (dir * 350);
	}
	else
	{
		self.velocity = (dir * 250);
	}
};

float() ShalMissileTouch =
{
	if ((other.classname == "monster_zombie"))
	{
		T_Damage(other, self, self, 110, 34);
	}
	return (TE_SPIKE);
};

void() monster_shalrath =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	precache_model2(/*42098i*/"progs/shalrath.mdl");
	precache_model2(/*42042i*/"progs/v_spike.mdl");
	precache_sound2(/*41653i*/"shalrath/attack.wav");
	precache_sound2(/*42021i*/"shalrath/attack2.wav");
	precache_sound2(/*41989i*/"shalrath/death.wav");
	precache_sound2(/*41377i*/"shalrath/idle.wav");
	precache_sound2(/*41957i*/"shalrath/pain.wav");
	precache_sound2(/*30450i*/"shalrath/sight.wav");
	self.solid = TE_EXPLOSION;
	self.movetype = IT_NAILGUN;
	setmodel(self, /*42098i*/"progs/shalrath.mdl");
	setsize(self, VEC_HULL2_MIN, VEC_HULL2_MAX);
	self.health = 400;
	self.th_stand = shal_stand;
	self.th_walk = shal_walk1;
	self.th_run = shal_run1;
	self.th_die = shalrath_die;
	self.th_pain = shalrath_pain;
	self.th_missile = shal_attack1;
	self.think = walkmonster_start;
	self.nextthink = ((time + 0.1) + (random() * 0.1));
};
