//Decompiled code. Please respect the original copyright.
void() wiz_run1;
void() wiz_side1;

float(float enemy_range) WizardCheckAttack =
{
	local vector spot1;
	local vector spot2;
	local entity targ;
	local float chance;

	if ((time < self.attack_finished))
	{
		return (TE_SPIKE);
	}
	if ((enemy_range == TE_EXPLOSION))
	{
		if ((self.attack_state != IT_SHOTGUN))
		{
			self.attack_state = IT_SHOTGUN;
			wiz_run1();
		}
		return (TE_SPIKE);
	}
	targ = self.enemy;
	spot1 = self.origin + self.view_ofs;
	spot2 = targ.origin + targ.view_ofs;
	traceline(spot1, spot2, TE_SPIKE, self);
	if ((trace_ent != targ))
	{
		if ((self.attack_state != IT_SHOTGUN))
		{
			self.attack_state = IT_SHOTGUN;
			wiz_run1();
		}
		return (TE_SPIKE);
	}
	if ((enemy_range == TE_SPIKE))
	{
		chance = 0.9;
	}
	else
	{
		if ((enemy_range == IT_SHOTGUN))
		{
			chance = 0.6;
		}
		else
		{
			if ((enemy_range == IT_SUPER_SHOTGUN))
			{
				chance = 0.2;
			}
			else
			{
				chance = TE_SPIKE;
			}
		}
	}
	if ((random() < chance))
	{
		self.attack_state = IT_NAILGUN;
		return (IT_SHOTGUN);
	}
	if ((enemy_range == IT_SUPER_SHOTGUN))
	{
		if ((self.attack_state != IT_SHOTGUN))
		{
			self.attack_state = IT_SHOTGUN;
			wiz_run1();
		}
	}
	else
	{
		if ((self.attack_state != IT_SUPER_SHOTGUN))
		{
			self.attack_state = IT_SUPER_SHOTGUN;
			wiz_side1();
		}
	}
	return (TE_SPIKE);
};

void() WizardAttackFinished =
{

	if (((range(self.enemy) >= IT_SUPER_SHOTGUN) || !visible(self.enemy)))
	{
		self.attack_state = IT_SHOTGUN;
		self.think = wiz_run1;
	}
	else
	{
		self.attack_state = IT_SUPER_SHOTGUN;
		self.think = wiz_side1;
	}
};

void(float side) Wiz_FastFire =
{
	local vector org;
	local vector vec;

	muzzleflash();
	sound(self, IT_SHOTGUN, "wizard/wattack.wav", IT_SHOTGUN, IT_SHOTGUN);
	makevectors(self.angles);
	org = ((self.origin + '0 0 30') + (v_forward * SVC_UPDATEFRAGS)) + ((v_right * side) * SVC_UPDATEFRAGS);
	vec = normalize(((self.enemy.origin - ((v_right * side) * 13)) - org)) * 600;
	PRJ_FireProjectile(self, "progs/w_spike.mdl", org, vec, TE_EXPLOSION, TE_LIGHTNING3, SVC_INTERMISSION, TE_LIGHTNING2);
};

void() Wiz_idlesound =
{
	local float wr;

	if ((self.wizardidle < time))
	{
		wr = random();
		if ((wr > 0.9))
		{
			sound(self, IT_SUPER_SHOTGUN, "wizard/widle1.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
		}
		else
		{
			if ((wr < 0.3))
			{
				sound(self, IT_SUPER_SHOTGUN, "wizard/widle2.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
			}
		}
		self.wizardidle = (time + IT_SUPER_SHOTGUN);
	}
	return;
};
void() wiz_stand2;

void() wiz_stand1 = [ 0, wiz_stand2 ]
{
	ai_stand();
};
void() wiz_stand3;

void() wiz_stand2 = [ 1, wiz_stand3 ]
{
	ai_stand();
};
void() wiz_stand4;

void() wiz_stand3 = [ 2, wiz_stand4 ]
{
	ai_stand();
};
void() wiz_stand5;

void() wiz_stand4 = [ 3, wiz_stand5 ]
{
	ai_stand();
};
void() wiz_stand6;

void() wiz_stand5 = [ 4, wiz_stand6 ]
{
	ai_stand();
};
void() wiz_stand7;

void() wiz_stand6 = [ 5, wiz_stand7 ]
{
	ai_stand();
};
void() wiz_stand8;

void() wiz_stand7 = [ 6, wiz_stand8 ]
{
	ai_stand();
};

void() wiz_stand8 = [ 7, wiz_stand1 ]
{
	ai_stand();
};
void() wiz_walk2;

void() wiz_walk1 = [ 0, wiz_walk2 ]
{
	ai_walk(IT_SUPER_NAILGUN);
	Wiz_idlesound();
};
void() wiz_walk3;

void() wiz_walk2 = [ 1, wiz_walk3 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};
void() wiz_walk4;

void() wiz_walk3 = [ 2, wiz_walk4 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};
void() wiz_walk5;

void() wiz_walk4 = [ 3, wiz_walk5 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};
void() wiz_walk6;

void() wiz_walk5 = [ 4, wiz_walk6 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};
void() wiz_walk7;

void() wiz_walk6 = [ 5, wiz_walk7 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};
void() wiz_walk8;

void() wiz_walk7 = [ 6, wiz_walk8 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};

void() wiz_walk8 = [ 7, wiz_walk1 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};
void() wiz_side2;

void() wiz_side1 = [ 0, wiz_side2 ]
{
	ai_run(IT_SUPER_NAILGUN);
	Wiz_idlesound();
};
void() wiz_side3;

void() wiz_side2 = [ 1, wiz_side3 ]
{
	ai_run(IT_SUPER_NAILGUN);
};
void() wiz_side4;

void() wiz_side3 = [ 2, wiz_side4 ]
{
	ai_run(IT_SUPER_NAILGUN);
};
void() wiz_side5;

void() wiz_side4 = [ 3, wiz_side5 ]
{
	ai_run(IT_SUPER_NAILGUN);
};
void() wiz_side6;

void() wiz_side5 = [ 4, wiz_side6 ]
{
	ai_run(IT_SUPER_NAILGUN);
};
void() wiz_side7;

void() wiz_side6 = [ 5, wiz_side7 ]
{
	ai_run(IT_SUPER_NAILGUN);
};
void() wiz_side8;

void() wiz_side7 = [ 6, wiz_side8 ]
{
	ai_run(IT_SUPER_NAILGUN);
};

void() wiz_side8 = [ 7, wiz_side1 ]
{
	ai_run(IT_SUPER_NAILGUN);
};
void() wiz_run2;

void() wiz_run1 = [ 15, wiz_run2 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
	Wiz_idlesound();
};
void() wiz_run3;

void() wiz_run2 = [ 16, wiz_run3 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};
void() wiz_run4;

void() wiz_run3 = [ 17, wiz_run4 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};
void() wiz_run5;

void() wiz_run4 = [ 18, wiz_run5 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};
void() wiz_run6;

void() wiz_run5 = [ 19, wiz_run6 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};
void() wiz_run7;

void() wiz_run6 = [ 20, wiz_run7 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};
void() wiz_run8;

void() wiz_run7 = [ 21, wiz_run8 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};
void() wiz_run9;

void() wiz_run8 = [ 22, wiz_run9 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};
void() wiz_run10;

void() wiz_run9 = [ 23, wiz_run10 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};
void() wiz_run11;

void() wiz_run10 = [ 24, wiz_run11 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};
void() wiz_run12;

void() wiz_run11 = [ 25, wiz_run12 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};
void() wiz_run13;

void() wiz_run12 = [ 26, wiz_run13 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};
void() wiz_run14;

void() wiz_run13 = [ 27, wiz_run14 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};

void() wiz_run14 = [ 28, wiz_run1 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};
void() wiz_fast2;

void() wiz_fast1 = [ 29, wiz_fast2 ]
{
	ai_face();
};
void() wiz_fast3;

void() wiz_fast2 = [ 30, wiz_fast3 ]
{
	ai_face();
};
void() wiz_fast4;

void() wiz_fast3 = [ 31, wiz_fast4 ]
{
	ai_face();
};
void() wiz_fast5;

void() wiz_fast4 = [ 32, wiz_fast5 ]
{
	ai_face();
	Wiz_FastFire(CONTENT_EMPTY);
};
void() wiz_fast6;

void() wiz_fast5 = [ 33, wiz_fast6 ]
{
	ai_face();
};
void() wiz_fast7;

void() wiz_fast6 = [ 34, wiz_fast7 ]
{
	ai_face();
};
void() wiz_fast8;

void() wiz_fast7 = [ 33, wiz_fast8 ]
{
	ai_face();
};
void() wiz_fast9;

void() wiz_fast8 = [ 32, wiz_fast9 ]
{
	ai_face();
};
void() wiz_fast10;

void() wiz_fast9 = [ 31, wiz_fast10 ]
{
	ai_face();
	Wiz_FastFire(IT_SHOTGUN);
};

void() wiz_fast10 = [ 30, wiz_run1 ]
{
	ai_face();
	SUB_AttackFinished(IT_SUPER_SHOTGUN);
	WizardAttackFinished();
};
void() wiz_pain2;

void() wiz_pain1 = [ 42, wiz_pain2 ]
{
};
void() wiz_pain3;

void() wiz_pain2 = [ 43, wiz_pain3 ]
{
};
void() wiz_pain4;

void() wiz_pain3 = [ 44, wiz_pain4 ]
{
};

void() wiz_pain4 = [ 45, wiz_run1 ]
{
};
void() wiz_death2;

void() wiz_death1 = [ 46, wiz_death2 ]
{
	self.velocity_x = (-200 + (400 * random()));
	self.velocity_y = (-200 + (400 * random()));
	self.velocity_z = (100 + (100 * random()));
	self.flags = (self.flags - (self.flags & IT_NAILS));
	sound(self, IT_SUPER_SHOTGUN, "wizard/wdeath.wav", IT_SHOTGUN, IT_SHOTGUN);
};
void() wiz_death3;

void() wiz_death2 = [ 47, wiz_death3 ]
{
};
void() wiz_death4;

void() wiz_death3 = [ 48, wiz_death4 ]
{
	self.solid = TE_SPIKE;
};
void() wiz_death5;

void() wiz_death4 = [ 49, wiz_death5 ]
{
};
void() wiz_death6;

void() wiz_death5 = [ 50, wiz_death6 ]
{
};
void() wiz_death7;

void() wiz_death6 = [ 51, wiz_death7 ]
{
};
void() wiz_death8;

void() wiz_death7 = [ 52, wiz_death8 ]
{
};

void() wiz_death8 = [ 53, wiz_death8 ]
{
};

void() wiz_die =
{
	wiz_death1();
};

void(entity attacker, float damage) Wiz_Pain =
{

	sound(self, IT_SUPER_SHOTGUN, "wizard/wpain.wav", IT_SHOTGUN, IT_SHOTGUN);
	if (((random() * 70) > damage))
	{
		return;
	}
	wiz_pain1();
};

void() monster_wizard =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	precache_model(/*36500i*/"progs/wizard.mdl");
	precache_model(/*35759i*/"progs/w_spike.mdl");
	precache_sound(/*36517i*/"wizard/hit.wav");
	precache_sound(/*35740i*/"wizard/wattack.wav");
	precache_sound(/*36360i*/"wizard/wdeath.wav");
	precache_sound(/*35790i*/"wizard/widle1.wav");
	precache_sound(/*35808i*/"wizard/widle2.wav");
	precache_sound(/*36474i*/"wizard/wpain.wav");
	precache_sound(/*30187i*/"wizard/wsight.wav");
	self.solid = TE_EXPLOSION;
	self.movetype = IT_NAILGUN;
	setmodel(self, /*36500i*/"progs/wizard.mdl");
	setsize(self, VEC_HULL_MIN, '16 16 40');
	self.health = 80;
	self.th_stand = wiz_stand1;
	self.th_walk = wiz_walk1;
	self.th_run = wiz_run1;
	self.th_missile = wiz_fast1;
	self.th_pain = Wiz_Pain;
	self.th_die = wiz_die;
	flymonster_start();
};
