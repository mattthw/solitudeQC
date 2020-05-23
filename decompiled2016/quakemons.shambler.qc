//Decompiled code. Please respect the original copyright.

void(float chrg, float damage, float side, float crnd) ShamClaw =
{
	local vector delta;
	local float ldmg;

	if (!self.enemy)
	{
		return;
	}
	ai_charge(chrg);
	delta = self.enemy.origin - self.origin;
	if ((vlen(delta) > 100))
	{
		return;
	}
	ldmg = ((random() + random()) + random()) * damage;
	T_Damage(self.enemy, self, self, ldmg, 35);
	sound(self, IT_SUPER_SHOTGUN, "shambler/smack.wav", IT_SHOTGUN, IT_SHOTGUN);
	if (side)
	{
		makevectors(self.angles);
		SpawnMeatSpray((self.origin + (v_forward * IT_GRENADE_LAUNCHER)), ((((IT_SUPER_SHOTGUN * (random() + -0.5)) * crnd) + side) * v_right));
	}
};
void() sham_stand2;

void() sham_stand1 = [ 0, sham_stand2 ]
{
	ai_stand();
};
void() sham_stand3;

void() sham_stand2 = [ 1, sham_stand3 ]
{
	ai_stand();
};
void() sham_stand4;

void() sham_stand3 = [ 2, sham_stand4 ]
{
	ai_stand();
};
void() sham_stand5;

void() sham_stand4 = [ 3, sham_stand5 ]
{
	ai_stand();
};
void() sham_stand6;

void() sham_stand5 = [ 4, sham_stand6 ]
{
	ai_stand();
};
void() sham_stand7;

void() sham_stand6 = [ 5, sham_stand7 ]
{
	ai_stand();
};
void() sham_stand8;

void() sham_stand7 = [ 6, sham_stand8 ]
{
	ai_stand();
};
void() sham_stand9;

void() sham_stand8 = [ 7, sham_stand9 ]
{
	ai_stand();
};
void() sham_stand10;

void() sham_stand9 = [ 8, sham_stand10 ]
{
	ai_stand();
};
void() sham_stand11;

void() sham_stand10 = [ 9, sham_stand11 ]
{
	ai_stand();
};
void() sham_stand12;

void() sham_stand11 = [ 10, sham_stand12 ]
{
	ai_stand();
};
void() sham_stand13;

void() sham_stand12 = [ 11, sham_stand13 ]
{
	ai_stand();
};
void() sham_stand14;

void() sham_stand13 = [ 12, sham_stand14 ]
{
	ai_stand();
};
void() sham_stand15;

void() sham_stand14 = [ 13, sham_stand15 ]
{
	ai_stand();
};
void() sham_stand16;

void() sham_stand15 = [ 14, sham_stand16 ]
{
	ai_stand();
};
void() sham_stand17;

void() sham_stand16 = [ 15, sham_stand17 ]
{
	ai_stand();
};

void() sham_stand17 = [ 16, sham_stand1 ]
{
	ai_stand();
};
void() sham_walk2;

void() sham_walk1 = [ 17, sham_walk2 ]
{
	ai_walk(TE_LAVASPLASH);
};
void() sham_walk3;

void() sham_walk2 = [ 18, sham_walk3 ]
{
	ai_walk(TE_LIGHTNING3);
};
void() sham_walk4;

void() sham_walk3 = [ 19, sham_walk4 ]
{
	ai_walk(TE_LIGHTNING3);
};
void() sham_walk5;

void() sham_walk4 = [ 20, sham_walk5 ]
{
	ai_walk(TE_LIGHTNING1);
};
void() sham_walk6;

void() sham_walk5 = [ 21, sham_walk6 ]
{
	ai_walk(TE_LIGHTNING2);
};
void() sham_walk7;

void() sham_walk6 = [ 22, sham_walk7 ]
{
	ai_walk(12);
};
void() sham_walk8;

void() sham_walk7 = [ 23, sham_walk8 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};
void() sham_walk9;

void() sham_walk8 = [ 24, sham_walk9 ]
{
	ai_walk(TE_EXPLOSION);
};
void() sham_walk10;

void() sham_walk9 = [ 25, sham_walk10 ]
{
	ai_walk(13);
};
void() sham_walk11;

void() sham_walk10 = [ 26, sham_walk11 ]
{
	ai_walk(TE_LIGHTNING3);
};
void() sham_walk12;

void() sham_walk11 = [ 27, sham_walk12 ]
{
	ai_walk(TE_WIZSPIKE);
};

void() sham_walk12 = [ 28, sham_walk1 ]
{
	ai_walk(TE_WIZSPIKE);
	if ((random() > 0.8))
	{
		sound(self, IT_SUPER_SHOTGUN, "shambler/sidle.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
	}
};
void() sham_run2;

void() sham_run1 = [ 29, sham_run2 ]
{
	ai_run(20);
};
void() sham_run3;

void() sham_run2 = [ 30, sham_run3 ]
{
	ai_run(24);
};
void() sham_run4;

void() sham_run3 = [ 31, sham_run4 ]
{
	ai_run(20);
};
void() sham_run5;

void() sham_run4 = [ 32, sham_run5 ]
{
	ai_run(20);
};
void() sham_run6;

void() sham_run5 = [ 33, sham_run6 ]
{
	ai_run(24);
};

void() sham_run6 = [ 34, sham_run1 ]
{
	ai_run(20);
	if ((random() > 0.8))
	{
		sound(self, IT_SUPER_SHOTGUN, "shambler/sidle.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
	}
};
void() sham_smash2;

void() sham_smash1 = [ 35, sham_smash2 ]
{
	sound(self, IT_SUPER_SHOTGUN, "shambler/melee1.wav", IT_SHOTGUN, IT_SHOTGUN);
	ai_charge(IT_SUPER_SHOTGUN);
};
void() sham_smash3;

void() sham_smash2 = [ 36, sham_smash3 ]
{
	ai_charge(TE_LIGHTNING2);
};
void() sham_smash4;

void() sham_smash3 = [ 37, sham_smash4 ]
{
	ai_charge(TE_LIGHTNING2);
};
void() sham_smash5;

void() sham_smash4 = [ 38, sham_smash5 ]
{
	ai_charge(TE_LIGHTNING1);
};
void() sham_smash6;

void() sham_smash5 = [ 39, sham_smash6 ]
{
	ai_charge(IT_NAILGUN);
};
void() sham_smash7;

void() sham_smash6 = [ 40, sham_smash7 ]
{
	ai_charge(IT_SHOTGUN);
};
void() sham_smash8;

void() sham_smash7 = [ 41, sham_smash8 ]
{
	ai_charge(TE_SPIKE);
};
void() sham_smash9;

void() sham_smash8 = [ 42, sham_smash9 ]
{
	ai_charge(TE_SPIKE);
};
void() sham_smash10;

void() sham_smash9 = [ 43, sham_smash10 ]
{
	ai_charge(TE_SPIKE);
};
void() sham_smash11;

void() sham_smash10 = [ 44, sham_smash11 ]
{
	ShamClaw(TE_SPIKE, 40, TE_SPIKE, 100);
};
void() sham_smash12;

void() sham_smash11 = [ 45, sham_smash12 ]
{
	ai_charge(TE_LIGHTNING1);
};

void() sham_smash12 = [ 46, sham_run1 ]
{
	ai_charge(IT_NAILGUN);
};
void() sham_swingr1;
void() sham_swingl2;

void() sham_swingl1 = [ 56, sham_swingl2 ]
{
	sound(self, IT_SUPER_SHOTGUN, "shambler/melee2.wav", IT_SHOTGUN, IT_SHOTGUN);
	ai_charge(TE_LIGHTNING1);
};
void() sham_swingl3;

void() sham_swingl2 = [ 57, sham_swingl3 ]
{
	ai_charge(TE_EXPLOSION);
};
void() sham_swingl4;

void() sham_swingl3 = [ 58, sham_swingl4 ]
{
	ai_charge(TE_WIZSPIKE);
};
void() sham_swingl5;

void() sham_swingl4 = [ 59, sham_swingl5 ]
{
	ai_charge(TE_EXPLOSION);
};
void() sham_swingl6;

void() sham_swingl5 = [ 60, sham_swingl6 ]
{
	ai_charge(TE_WIZSPIKE);
};
void() sham_swingl7;

void() sham_swingl6 = [ 61, sham_swingl7 ]
{
	ai_charge(TE_LIGHTNING3);
};
void() sham_swingl8;

void() sham_swingl7 = [ 62, sham_swingl8 ]
{
	ai_charge(TE_LIGHTNING1);
	ShamClaw(TE_LAVASPLASH, 20, 250, TE_SPIKE);
};
void() sham_swingl9;

void() sham_swingl8 = [ 63, sham_swingl9 ]
{
	ai_charge(IT_NAILGUN);
};

void() sham_swingl9 = [ 64, sham_run1 ]
{
	ai_charge(IT_SUPER_NAILGUN);
	if ((random() < 0.5))
	{
		self.think = sham_swingr1;
	}
};
void() sham_swingr2;

void() sham_swingr1 = [ 47, sham_swingr2 ]
{
	sound(self, IT_SUPER_SHOTGUN, "shambler/melee1.wav", IT_SHOTGUN, IT_SHOTGUN);
	ai_charge(IT_SHOTGUN);
};
void() sham_swingr3;

void() sham_swingr2 = [ 48, sham_swingr3 ]
{
	ai_charge(IT_SUPER_NAILGUN);
};
void() sham_swingr4;

void() sham_swingr3 = [ 49, sham_swingr4 ]
{
	ai_charge(SVC_UPDATEFRAGS);
};
void() sham_swingr5;

void() sham_swingr4 = [ 50, sham_swingr5 ]
{
	ai_charge(TE_WIZSPIKE);
};
void() sham_swingr6;

void() sham_swingr5 = [ 51, sham_swingr6 ]
{
	ai_charge(TE_EXPLOSION);
};
void() sham_swingr7;

void() sham_swingr6 = [ 52, sham_swingr7 ]
{
	ai_charge(TE_LIGHTNING2);
};
void() sham_swingr8;

void() sham_swingr7 = [ 53, sham_swingr8 ]
{
	ai_charge(TE_LIGHTNING2);
	ShamClaw(TE_LAVASPLASH, 20, -250, TE_SPIKE);
};
void() sham_swingr9;

void() sham_swingr8 = [ 54, sham_swingr9 ]
{
	ai_charge(TE_EXPLOSION);
};

void() sham_swingr9 = [ 55, sham_run1 ]
{
	ai_charge(IT_SHOTGUN);
	ai_charge(TE_LAVASPLASH);
	if ((random() < 0.5))
	{
		self.think = sham_swingl1;
	}
};

void() sham_melee =
{
	local float chance;

	chance = random();
	if (((chance > 0.6) || (self.health == 600)))
	{
		sham_smash1();
	}
	else
	{
		if ((chance > 0.3))
		{
			sham_swingr1();
		}
		else
		{
			sham_swingl1();
		}
	}
};

void() CastLightning =
{
	local vector org;
	local vector dir;

	muzzleflash();
	ai_face();
	org = self.origin + '0 0 40';
	dir = (self.enemy.origin + '0 0 16') - org;
	dir = normalize(dir);
	traceline(org, (self.origin + (dir * 600)), IT_SHOTGUN, self);
	TE_lightning1(self, org, trace_endpos);
	LightningDamage(org, trace_endpos, self, TE_LAVASPLASH, 35);
};
void() sham_magic2;

void() sham_magic1 = [ 65, sham_magic2 ]
{
	ai_face();
	sound(self, IT_SHOTGUN, "shambler/sattck1.wav", IT_SHOTGUN, IT_SHOTGUN);
};
void() sham_magic3;

void() sham_magic2 = [ 66, sham_magic3 ]
{
	ai_face();
};

void() sham_magic3 = [ 67, sham_magic4 ]
{
	local void() sham_magic4 = bad type 32774;
	local entity o;

	ai_face();
	self.nextthink = (time + 0.2);
	muzzleflash();
	ai_face();
	self.owner = spawn();
	o = self.owner;
	setmodel(o, /*43101i*/"progs/s_light.mdl");
	setorigin(o, self.origin);
	o.angles = self.angles;
	o.nextthink = (time + 0.7);
	o.think = SUB_Remove;
};
void() sham_magic5;

void() sham_magic4 = [ 68, sham_magic5 ]
{
	self.effects = (self.effects | IT_SUPER_SHOTGUN);
	self.owner.frame = IT_SHOTGUN;
};
void() sham_magic6;

void() sham_magic5 = [ 69, sham_magic6 ]
{
	self.effects = (self.effects | IT_SUPER_SHOTGUN);
	self.owner.frame = IT_SUPER_SHOTGUN;
};
void() sham_magic9;

void() sham_magic6 = [ 70, sham_magic9 ]
{
	remove(self.owner);
	CastLightning();
	sound(self, IT_SHOTGUN, "shambler/sboom.wav", IT_SHOTGUN, IT_SHOTGUN);
};
void() sham_magic10;

void() sham_magic9 = [ 73, sham_magic10 ]
{
	CastLightning();
};
void() sham_magic11;

void() sham_magic10 = [ 74, sham_magic11 ]
{
	CastLightning();
};
void() sham_magic12;

void() sham_magic11 = [ 75, sham_magic12 ]
{
	if ((skill > IT_SUPER_SHOTGUN))
	{
		CastLightning();
	}
};

void() sham_magic12 = [ 76, sham_run1 ]
{
};
void() sham_pain2;

void() sham_pain1 = [ 77, sham_pain2 ]
{
};
void() sham_pain3;

void() sham_pain2 = [ 78, sham_pain3 ]
{
};
void() sham_pain4;

void() sham_pain3 = [ 79, sham_pain4 ]
{
};
void() sham_pain5;

void() sham_pain4 = [ 80, sham_pain5 ]
{
};
void() sham_pain6;

void() sham_pain5 = [ 81, sham_pain6 ]
{
};

void() sham_pain6 = [ 82, sham_run1 ]
{
};

void(entity attacker, float damage) sham_pain =
{

	sound(self, IT_SUPER_SHOTGUN, "shambler/shurt2.wav", IT_SHOTGUN, IT_SHOTGUN);
	if ((self.health <= TE_SPIKE))
	{
		return;
	}
	if (((random() * 400) > damage))
	{
		return;
	}
	if ((self.pain_finished > time))
	{
		return;
	}
	self.pain_finished = (time + IT_SUPER_SHOTGUN);
	sham_pain1();
};
void() sham_death2;

void() sham_death1 = [ 83, sham_death2 ]
{
};
void() sham_death3;

void() sham_death2 = [ 84, sham_death3 ]
{
};
void() sham_death4;

void() sham_death3 = [ 85, sham_death4 ]
{
	self.solid = TE_SPIKE;
};
void() sham_death5;

void() sham_death4 = [ 86, sham_death5 ]
{
};
void() sham_death6;

void() sham_death5 = [ 87, sham_death6 ]
{
};
void() sham_death7;

void() sham_death6 = [ 88, sham_death7 ]
{
};
void() sham_death8;

void() sham_death7 = [ 89, sham_death8 ]
{
};
void() sham_death9;

void() sham_death8 = [ 90, sham_death9 ]
{
};
void() sham_death10;

void() sham_death9 = [ 91, sham_death10 ]
{
};
void() sham_death11;

void() sham_death10 = [ 92, sham_death11 ]
{
};

void() sham_death11 = [ 93, sham_death11 ]
{
};

void() sham_die =
{
	sound(self, IT_SUPER_SHOTGUN, "shambler/sdeath.wav", IT_SHOTGUN, IT_SHOTGUN);
	sham_death1();
};

void() monster_shambler =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	precache_model(/*43496i*/"progs/shambler.mdl");
	precache_model(/*43101i*/"progs/s_light.mdl");
	precache_model(/*19143i*/"progs/bolt.mdl");
	precache_sound(/*43056i*/"shambler/sattck1.wav");
	precache_sound(/*43155i*/"shambler/sboom.wav");
	precache_sound(/*43467i*/"shambler/sdeath.wav");
	precache_sound(/*43303i*/"shambler/shurt2.wav");
	precache_sound(/*42519i*/"shambler/sidle.wav");
	precache_sound(/*30120i*/"shambler/ssight.wav");
	precache_sound(/*42610i*/"shambler/melee1.wav");
	precache_sound(/*42777i*/"shambler/melee2.wav");
	precache_sound(/*42156i*/"shambler/smack.wav");
	self.solid = TE_EXPLOSION;
	self.movetype = IT_NAILGUN;
	setmodel(self, /*43496i*/"progs/shambler.mdl");
	setsize(self, VEC_HULL2_MIN, VEC_HULL2_MAX);
	self.health = 600;
	self.th_stand = sham_stand1;
	self.th_walk = sham_walk1;
	self.th_run = sham_run1;
	self.th_die = sham_die;
	self.th_melee = sham_melee;
	self.th_missile = sham_magic1;
	self.th_pain = sham_pain;
	walkmonster_start();
};
