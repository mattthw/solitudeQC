//Decompiled code. Please respect the original copyright.
void() Demon_JumpTouch;
void(float side) Demon_Melee;
void() demon1_stand2;

void() demon1_stand1 = [ 0, demon1_stand2 ]
{
	ai_stand();
};
void() demon1_stand3;

void() demon1_stand2 = [ 1, demon1_stand3 ]
{
	ai_stand();
};
void() demon1_stand4;

void() demon1_stand3 = [ 2, demon1_stand4 ]
{
	ai_stand();
};
void() demon1_stand5;

void() demon1_stand4 = [ 3, demon1_stand5 ]
{
	ai_stand();
};
void() demon1_stand6;

void() demon1_stand5 = [ 4, demon1_stand6 ]
{
	ai_stand();
};
void() demon1_stand7;

void() demon1_stand6 = [ 5, demon1_stand7 ]
{
	ai_stand();
};
void() demon1_stand8;

void() demon1_stand7 = [ 6, demon1_stand8 ]
{
	ai_stand();
};
void() demon1_stand9;

void() demon1_stand8 = [ 7, demon1_stand9 ]
{
	ai_stand();
};
void() demon1_stand10;

void() demon1_stand9 = [ 8, demon1_stand10 ]
{
	ai_stand();
};
void() demon1_stand11;

void() demon1_stand10 = [ 9, demon1_stand11 ]
{
	ai_stand();
};
void() demon1_stand12;

void() demon1_stand11 = [ 10, demon1_stand12 ]
{
	ai_stand();
};
void() demon1_stand13;

void() demon1_stand12 = [ 11, demon1_stand13 ]
{
	ai_stand();
};

void() demon1_stand13 = [ 12, demon1_stand1 ]
{
	ai_stand();
};
void() demon1_walk2;

void() demon1_walk1 = [ 13, demon1_walk2 ]
{
	if ((random() < 0.2))
	{
		sound(self, IT_SUPER_SHOTGUN, "demon/idle1.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
	}
	ai_walk(IT_SUPER_NAILGUN);
};
void() demon1_walk3;

void() demon1_walk2 = [ 14, demon1_walk3 ]
{
	ai_walk(TE_LIGHTNING2);
};
void() demon1_walk4;

void() demon1_walk3 = [ 15, demon1_walk4 ]
{
	ai_walk(TE_LIGHTNING2);
};
void() demon1_walk5;

void() demon1_walk4 = [ 16, demon1_walk5 ]
{
	ai_walk(TE_WIZSPIKE);
};
void() demon1_walk6;

void() demon1_walk5 = [ 17, demon1_walk6 ]
{
	ai_walk(IT_NAILGUN);
};
void() demon1_walk7;

void() demon1_walk6 = [ 18, demon1_walk7 ]
{
	ai_walk(TE_LIGHTNING2);
};
void() demon1_walk8;

void() demon1_walk7 = [ 19, demon1_walk8 ]
{
	ai_walk(TE_LAVASPLASH);
};

void() demon1_walk8 = [ 20, demon1_walk1 ]
{
	ai_walk(TE_LAVASPLASH);
};
void() demon1_run2;

void() demon1_run1 = [ 21, demon1_run2 ]
{
	if ((random() < 0.2))
	{
		sound(self, IT_SUPER_SHOTGUN, "demon/idle1.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
	}
	ai_run(20);
};
void() demon1_run3;

void() demon1_run2 = [ 22, demon1_run3 ]
{
	ai_run(15);
};
void() demon1_run4;

void() demon1_run3 = [ 23, demon1_run4 ]
{
	ai_run(36);
};
void() demon1_run5;

void() demon1_run4 = [ 24, demon1_run5 ]
{
	ai_run(20);
};
void() demon1_run6;

void() demon1_run5 = [ 25, demon1_run6 ]
{
	ai_run(15);
};

void() demon1_run6 = [ 26, demon1_run1 ]
{
	ai_run(36);
};
void() demon1_jump2;

void() demon1_jump1 = [ 27, demon1_jump2 ]
{
	ai_face();
};
void() demon1_jump3;

void() demon1_jump2 = [ 28, demon1_jump3 ]
{
	ai_face();
};
void() demon1_jump4;

void() demon1_jump3 = [ 29, demon1_jump4 ]
{
	ai_face();
};
void() demon1_jump5;

void() demon1_jump4 = [ 30, demon1_jump5 ]
{
	ai_face();
	self.touch = Demon_JumpTouch;
	makevectors(self.angles);
	self.origin_z = (self.origin_z + IT_SHOTGUN);
	self.velocity = ((v_forward * 600) + '0 0 250');
	if ((self.flags & IT_NAILS))
	{
		self.flags = (self.flags - IT_NAILS);
	}
};
void() demon1_jump6;

void() demon1_jump5 = [ 31, demon1_jump6 ]
{
};
void() demon1_jump7;

void() demon1_jump6 = [ 32, demon1_jump7 ]
{
};
void() demon1_jump8;

void() demon1_jump7 = [ 33, demon1_jump8 ]
{
};
void() demon1_jump9;

void() demon1_jump8 = [ 34, demon1_jump9 ]
{
};
void() demon1_jump10;

void() demon1_jump9 = [ 35, demon1_jump10 ]
{
};

void() demon1_jump10 = [ 36, demon1_jump1 ]
{
	self.nextthink = (time + TE_EXPLOSION);
};
void() demon1_jump12;

void() demon1_jump11 = [ 37, demon1_jump12 ]
{
};

void() demon1_jump12 = [ 38, demon1_run1 ]
{
};
void() demon1_atta2;

void() demon1_atta1 = [ 54, demon1_atta2 ]
{
	ai_charge(IT_NAILGUN);
};
void() demon1_atta3;

void() demon1_atta2 = [ 55, demon1_atta3 ]
{
	ai_charge(TE_SPIKE);
};
void() demon1_atta4;

void() demon1_atta3 = [ 56, demon1_atta4 ]
{
	ai_charge(TE_SPIKE);
};
void() demon1_atta5;

void() demon1_atta4 = [ 57, demon1_atta5 ]
{
	ai_charge(IT_SHOTGUN);
};
void() demon1_atta6;

void() demon1_atta5 = [ 58, demon1_atta6 ]
{
	ai_charge(IT_SUPER_SHOTGUN);
	Demon_Melee(200);
};
void() demon1_atta7;

void() demon1_atta6 = [ 59, demon1_atta7 ]
{
	ai_charge(IT_SHOTGUN);
};
void() demon1_atta8;

void() demon1_atta7 = [ 60, demon1_atta8 ]
{
	ai_charge(TE_LIGHTNING2);
};
void() demon1_atta9;

void() demon1_atta8 = [ 61, demon1_atta9 ]
{
	ai_charge(IT_SUPER_NAILGUN);
};
void() demon1_atta10;

void() demon1_atta9 = [ 62, demon1_atta10 ]
{
	ai_charge(IT_NAILGUN);
};
void() demon1_atta11;

void() demon1_atta10 = [ 63, demon1_atta11 ]
{
	ai_charge(IT_SUPER_SHOTGUN);
};
void() demon1_atta12;

void() demon1_atta11 = [ 64, demon1_atta12 ]
{
	Demon_Melee(-200);
};
void() demon1_atta13;

void() demon1_atta12 = [ 65, demon1_atta13 ]
{
	ai_charge(TE_LIGHTNING1);
};
void() demon1_atta14;

void() demon1_atta13 = [ 66, demon1_atta14 ]
{
	ai_charge(IT_SUPER_NAILGUN);
};
void() demon1_atta15;

void() demon1_atta14 = [ 67, demon1_atta15 ]
{
	ai_charge(IT_NAILGUN);
};

void() demon1_atta15 = [ 68, demon1_run1 ]
{
	ai_charge(IT_NAILGUN);
};
void() demon1_pain2;

void() demon1_pain1 = [ 39, demon1_pain2 ]
{
};
void() demon1_pain3;

void() demon1_pain2 = [ 40, demon1_pain3 ]
{
};
void() demon1_pain4;

void() demon1_pain3 = [ 41, demon1_pain4 ]
{
};
void() demon1_pain5;

void() demon1_pain4 = [ 42, demon1_pain5 ]
{
};
void() demon1_pain6;

void() demon1_pain5 = [ 43, demon1_pain6 ]
{
};

void() demon1_pain6 = [ 44, demon1_run1 ]
{
};

void(entity attacker, float damage) demon1_pain =
{

	if ((self.touch == Demon_JumpTouch))
	{
		return;
	}
	if ((self.pain_finished > time))
	{
		return;
	}
	self.pain_finished = (time + IT_SHOTGUN);
	sound(self, IT_SUPER_SHOTGUN, "demon/dpain1.wav", IT_SHOTGUN, IT_SHOTGUN);
	if (((random() * 200) > damage))
	{
		return;
	}
	demon1_pain1();
};
void() demon1_die2;

void() demon1_die1 = [ 45, demon1_die2 ]
{
	sound(self, IT_SUPER_SHOTGUN, "demon/ddeath.wav", IT_SHOTGUN, IT_SHOTGUN);
};
void() demon1_die3;

void() demon1_die2 = [ 46, demon1_die3 ]
{
};
void() demon1_die4;

void() demon1_die3 = [ 47, demon1_die4 ]
{
};
void() demon1_die5;

void() demon1_die4 = [ 48, demon1_die5 ]
{
};
void() demon1_die6;

void() demon1_die5 = [ 49, demon1_die6 ]
{
};
void() demon1_die7;

void() demon1_die6 = [ 50, demon1_die7 ]
{
	self.solid = TE_SPIKE;
};
void() demon1_die8;

void() demon1_die7 = [ 51, demon1_die8 ]
{
};
void() demon1_die9;

void() demon1_die8 = [ 52, demon1_die9 ]
{
};

void() demon1_die9 = [ 53, demon1_die9 ]
{
};

void() demon_die =
{
	demon1_die1();
};

void() Demon_MeleeAttack =
{
	demon1_atta1();
};

void() monster_demon1 =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	precache_model(/*37564i*/"progs/demon.mdl");
	precache_sound(/*37411i*/"demon/ddeath.wav");
	precache_sound(/*37580i*/"demon/dhit2.wav");
	precache_sound(/*37596i*/"demon/djump.wav");
	precache_sound(/*37382i*/"demon/dpain1.wav");
	precache_sound(/*36752i*/"demon/idle1.wav");
	precache_sound(/*30155i*/"demon/sight2.wav");
	self.solid = TE_EXPLOSION;
	self.movetype = IT_NAILGUN;
	setmodel(self, /*37564i*/"progs/demon.mdl");
	setsize(self, VEC_HULL2_MIN, VEC_HULL2_MAX);
	self.health = 300;
	self.th_stand = demon1_stand1;
	self.th_walk = demon1_walk1;
	self.th_run = demon1_run1;
	self.th_die = demon_die;
	self.th_melee = Demon_MeleeAttack;
	self.th_missile = demon1_jump1;
	self.th_pain = demon1_pain;
	walkmonster_start();
};

float(float enemy_range) CheckDemonMelee =
{
	if ((enemy_range == TE_SPIKE))
	{
		self.attack_state = TE_EXPLOSION;
		return (IT_SHOTGUN);
	}
	return (TE_SPIKE);
};

float() CheckDemonJump =
{
	local vector dist;
	local float d;

	if (((self.origin_z + self.mins_z) > ((self.enemy.origin_z + self.enemy.mins_z) + (0.75 * self.enemy.size_z))))
	{
		return (TE_SPIKE);
	}
	if (((self.origin_z + self.maxs_z) < ((self.enemy.origin_z + self.enemy.mins_z) + (0.25 * self.enemy.size_z))))
	{
		return (TE_SPIKE);
	}
	dist = self.enemy.origin - self.origin;
	dist_z = TE_SPIKE;
	d = vlen(dist);
	if ((d < 100))
	{
		return (TE_SPIKE);
	}
	if ((d > 200))
	{
		if ((random() < 0.9))
		{
			return (TE_SPIKE);
		}
	}
	return (IT_SHOTGUN);
};

float(float enemy_range) DemonCheckAttack =
{
	if (CheckDemonMelee(enemy_range))
	{
		self.attack_state = TE_EXPLOSION;
		return (IT_SHOTGUN);
	}
	if (CheckDemonJump())
	{
		self.attack_state = IT_NAILGUN;
		sound(self, IT_SUPER_SHOTGUN, "demon/djump.wav", IT_SHOTGUN, IT_SHOTGUN);
		return (IT_SHOTGUN);
	}
	return (TE_SPIKE);
};

void(float side) Demon_Melee =
{
	local float ldmg;
	local vector delta;

	ai_face();
	walkmove(self.ideal_yaw, 12);
	delta = self.enemy.origin - self.origin;
	if ((vlen(delta) > 100))
	{
		return;
	}
	if (!CanDamage(self.enemy, self))
	{
		return;
	}
	sound(self, IT_SHOTGUN, "demon/dhit2.wav", IT_SHOTGUN, IT_SHOTGUN);
	ldmg = TE_LAVASPLASH + (TE_LIGHTNING1 * random());
	T_Damage(self.enemy, self, self, ldmg, SVC_FINALE);
	makevectors(self.angles);
	SpawnMeatSpray((self.origin + (v_forward * IT_GRENADE_LAUNCHER)), (side * v_right));
};

void() Demon_JumpTouch =
{
	local float ldmg;

	if ((self.health <= TE_SPIKE))
	{
		return;
	}
	if (other.takedamage)
	{
		if ((vlen(self.velocity) > 400))
		{
			ldmg = 40 + (TE_LAVASPLASH * random());
			T_Damage(other, self, self, ldmg, SVC_FINALE);
		}
	}
	if (!checkbottom(self))
	{
		if ((self.flags & IT_NAILS))
		{
			self.touch = SUB_Null;
			self.think = demon1_jump1;
			self.nextthink = (time + 0.1);
		}
		return;
	}
	self.touch = SUB_Null;
	self.think = demon1_jump11;
	self.nextthink = (time + 0.1);
};
