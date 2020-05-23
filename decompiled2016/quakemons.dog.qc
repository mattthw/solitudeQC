//Decompiled code. Please respect the original copyright.
void() dog_leap1;
void() dog_run1;

void() dog_bite =
{
	local vector delta;
	local float ldmg;

	if (!self.enemy)
	{
		return;
	}
	ai_charge(TE_LAVASPLASH);
	if (!CanDamage(self.enemy, self))
	{
		return;
	}
	delta = self.enemy.origin - self.origin;
	if ((vlen(delta) > 100))
	{
		return;
	}
	ldmg = ((random() + random()) + random()) * IT_SUPER_NAILGUN;
	T_Damage(self.enemy, self, self, ldmg, 26);
};

void() Dog_JumpTouch =
{
	local float ldmg;

	if ((self.health <= TE_SPIKE))
	{
		return;
	}
	if (other.takedamage)
	{
		if ((vlen(self.velocity) > 300))
		{
			ldmg = TE_LAVASPLASH + (TE_LAVASPLASH * random());
			T_Damage(other, self, self, ldmg, 26);
		}
	}
	if (!checkbottom(self))
	{
		if ((self.flags & IT_NAILS))
		{
			self.touch = SUB_Null;
			self.think = dog_leap1;
			self.nextthink = (time + 0.1);
		}
		return;
	}
	self.touch = SUB_Null;
	self.think = dog_run1;
	self.nextthink = (time + 0.1);
};
void() dog_stand2;

void() dog_stand1 = [ 69, dog_stand2 ]
{
	ai_stand();
};
void() dog_stand3;

void() dog_stand2 = [ 70, dog_stand3 ]
{
	ai_stand();
};
void() dog_stand4;

void() dog_stand3 = [ 71, dog_stand4 ]
{
	ai_stand();
};
void() dog_stand5;

void() dog_stand4 = [ 72, dog_stand5 ]
{
	ai_stand();
};
void() dog_stand6;

void() dog_stand5 = [ 73, dog_stand6 ]
{
	ai_stand();
};
void() dog_stand7;

void() dog_stand6 = [ 74, dog_stand7 ]
{
	ai_stand();
};
void() dog_stand8;

void() dog_stand7 = [ 75, dog_stand8 ]
{
	ai_stand();
};
void() dog_stand9;

void() dog_stand8 = [ 76, dog_stand9 ]
{
	ai_stand();
};

void() dog_stand9 = [ 77, dog_stand1 ]
{
	ai_stand();
};
void() dog_walk2;

void() dog_walk1 = [ 78, dog_walk2 ]
{
	if ((random() < 0.2))
	{
		sound(self, IT_SUPER_SHOTGUN, "dog/idle.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
	}
	ai_walk(IT_SUPER_NAILGUN);
};
void() dog_walk3;

void() dog_walk2 = [ 79, dog_walk3 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};
void() dog_walk4;

void() dog_walk3 = [ 80, dog_walk4 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};
void() dog_walk5;

void() dog_walk4 = [ 81, dog_walk5 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};
void() dog_walk6;

void() dog_walk5 = [ 82, dog_walk6 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};
void() dog_walk7;

void() dog_walk6 = [ 83, dog_walk7 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};
void() dog_walk8;

void() dog_walk7 = [ 84, dog_walk8 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};

void() dog_walk8 = [ 85, dog_walk1 ]
{
	ai_walk(IT_SUPER_NAILGUN);
};
void() dog_run2;

void() dog_run1 = [ 48, dog_run2 ]
{
	if ((random() < 0.2))
	{
		sound(self, IT_SUPER_SHOTGUN, "dog/idle.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
	}
	ai_run(IT_GRENADE_LAUNCHER);
};
void() dog_run3;

void() dog_run2 = [ 49, dog_run3 ]
{
	ai_run(IT_ROCKET_LAUNCHER);
};
void() dog_run4;

void() dog_run3 = [ 50, dog_run4 ]
{
	ai_run(IT_ROCKET_LAUNCHER);
};
void() dog_run5;

void() dog_run4 = [ 51, dog_run5 ]
{
	ai_run(20);
};
void() dog_run6;

void() dog_run5 = [ 52, dog_run6 ]
{
	ai_run(IT_LIGHTNING);
};
void() dog_run7;

void() dog_run6 = [ 53, dog_run7 ]
{
	ai_run(IT_ROCKET_LAUNCHER);
};
void() dog_run8;

void() dog_run7 = [ 54, dog_run8 ]
{
	ai_run(IT_GRENADE_LAUNCHER);
};
void() dog_run9;

void() dog_run8 = [ 55, dog_run9 ]
{
	ai_run(IT_ROCKET_LAUNCHER);
};
void() dog_run10;

void() dog_run9 = [ 56, dog_run10 ]
{
	ai_run(IT_ROCKET_LAUNCHER);
};
void() dog_run11;

void() dog_run10 = [ 57, dog_run11 ]
{
	ai_run(20);
};
void() dog_run12;

void() dog_run11 = [ 58, dog_run12 ]
{
	ai_run(IT_LIGHTNING);
};

void() dog_run12 = [ 59, dog_run1 ]
{
	ai_run(IT_ROCKET_LAUNCHER);
};
void() dog_atta2;

void() dog_atta1 = [ 0, dog_atta2 ]
{
	ai_charge(TE_LAVASPLASH);
};
void() dog_atta3;

void() dog_atta2 = [ 1, dog_atta3 ]
{
	ai_charge(TE_LAVASPLASH);
};
void() dog_atta4;

void() dog_atta3 = [ 2, dog_atta4 ]
{
	ai_charge(TE_LAVASPLASH);
};
void() dog_atta5;

void() dog_atta4 = [ 3, dog_atta5 ]
{
	sound(self, IT_SUPER_SHOTGUN, "dog/dattack1.wav", IT_SHOTGUN, IT_SHOTGUN);
	dog_bite();
};
void() dog_atta6;

void() dog_atta5 = [ 4, dog_atta6 ]
{
	ai_charge(TE_LAVASPLASH);
};
void() dog_atta7;

void() dog_atta6 = [ 5, dog_atta7 ]
{
	ai_charge(TE_LAVASPLASH);
};
void() dog_atta8;

void() dog_atta7 = [ 6, dog_atta8 ]
{
	ai_charge(TE_LAVASPLASH);
};

void() dog_atta8 = [ 7, dog_run1 ]
{
	ai_charge(TE_LAVASPLASH);
};
void() dog_leap2;

void() dog_leap1 = [ 60, dog_leap2 ]
{
	ai_face();
};
void() dog_leap3;

void() dog_leap2 = [ 61, dog_leap3 ]
{
	ai_face();
	self.touch = Dog_JumpTouch;
	makevectors(self.angles);
	self.origin_z = (self.origin_z + IT_SHOTGUN);
	self.velocity = ((v_forward * 300) + '0 0 200');
	if ((self.flags & IT_NAILS))
	{
		self.flags = (self.flags - IT_NAILS);
	}
};
void() dog_leap4;

void() dog_leap3 = [ 62, dog_leap4 ]
{
};
void() dog_leap5;

void() dog_leap4 = [ 63, dog_leap5 ]
{
};
void() dog_leap6;

void() dog_leap5 = [ 64, dog_leap6 ]
{
};
void() dog_leap7;

void() dog_leap6 = [ 65, dog_leap7 ]
{
};
void() dog_leap8;

void() dog_leap7 = [ 66, dog_leap8 ]
{
};
void() dog_leap9;

void() dog_leap8 = [ 67, dog_leap9 ]
{
};

void() dog_leap9 = [ 68, dog_leap9 ]
{
};
void() dog_pain2;

void() dog_pain1 = [ 26, dog_pain2 ]
{
};
void() dog_pain3;

void() dog_pain2 = [ 27, dog_pain3 ]
{
};
void() dog_pain4;

void() dog_pain3 = [ 28, dog_pain4 ]
{
};
void() dog_pain5;

void() dog_pain4 = [ 29, dog_pain5 ]
{
};
void() dog_pain6;

void() dog_pain5 = [ 30, dog_pain6 ]
{
};

void() dog_pain6 = [ 31, dog_run1 ]
{
};
void() dog_painb2;

void() dog_painb1 = [ 32, dog_painb2 ]
{
};
void() dog_painb3;

void() dog_painb2 = [ 33, dog_painb3 ]
{
};
void() dog_painb4;

void() dog_painb3 = [ 34, dog_painb4 ]
{
	ai_pain(IT_NAILGUN);
};
void() dog_painb5;

void() dog_painb4 = [ 35, dog_painb5 ]
{
	ai_pain(12);
};
void() dog_painb6;

void() dog_painb5 = [ 36, dog_painb6 ]
{
	ai_pain(12);
};
void() dog_painb7;

void() dog_painb6 = [ 37, dog_painb7 ]
{
	ai_pain(IT_SUPER_SHOTGUN);
};
void() dog_painb8;

void() dog_painb7 = [ 38, dog_painb8 ]
{
};
void() dog_painb9;

void() dog_painb8 = [ 39, dog_painb9 ]
{
	ai_pain(IT_NAILGUN);
};
void() dog_painb10;

void() dog_painb9 = [ 40, dog_painb10 ]
{
};
void() dog_painb11;

void() dog_painb10 = [ 41, dog_painb11 ]
{
	ai_pain(TE_LAVASPLASH);
};
void() dog_painb12;

void() dog_painb11 = [ 42, dog_painb12 ]
{
};
void() dog_painb13;

void() dog_painb12 = [ 43, dog_painb13 ]
{
};
void() dog_painb14;

void() dog_painb13 = [ 44, dog_painb14 ]
{
};
void() dog_painb15;

void() dog_painb14 = [ 45, dog_painb15 ]
{
};
void() dog_painb16;

void() dog_painb15 = [ 46, dog_painb16 ]
{
};

void() dog_painb16 = [ 47, dog_run1 ]
{
};

void() dog_pain =
{
	sound(self, IT_SUPER_SHOTGUN, "dog/dpain1.wav", IT_SHOTGUN, IT_SHOTGUN);
	if ((random() > 0.5))
	{
		dog_pain1();
	}
	else
	{
		dog_painb1();
	}
};
void() dog_die2;

void() dog_die1 = [ 8, dog_die2 ]
{
};
void() dog_die3;

void() dog_die2 = [ 9, dog_die3 ]
{
};
void() dog_die4;

void() dog_die3 = [ 10, dog_die4 ]
{
};
void() dog_die5;

void() dog_die4 = [ 11, dog_die5 ]
{
};
void() dog_die6;

void() dog_die5 = [ 12, dog_die6 ]
{
};
void() dog_die7;

void() dog_die6 = [ 13, dog_die7 ]
{
};
void() dog_die8;

void() dog_die7 = [ 14, dog_die8 ]
{
};
void() dog_die9;

void() dog_die8 = [ 15, dog_die9 ]
{
};

void() dog_die9 = [ 16, dog_die9 ]
{
};
void() dog_dieb2;

void() dog_dieb1 = [ 17, dog_dieb2 ]
{
};
void() dog_dieb3;

void() dog_dieb2 = [ 18, dog_dieb3 ]
{
};
void() dog_dieb4;

void() dog_dieb3 = [ 19, dog_dieb4 ]
{
};
void() dog_dieb5;

void() dog_dieb4 = [ 20, dog_dieb5 ]
{
};
void() dog_dieb6;

void() dog_dieb5 = [ 21, dog_dieb6 ]
{
};
void() dog_dieb7;

void() dog_dieb6 = [ 22, dog_dieb7 ]
{
};
void() dog_dieb8;

void() dog_dieb7 = [ 23, dog_dieb8 ]
{
};
void() dog_dieb9;

void() dog_dieb8 = [ 24, dog_dieb9 ]
{
};

void() dog_dieb9 = [ 25, dog_dieb9 ]
{
};

void() dog_die =
{
	sound(self, IT_SUPER_SHOTGUN, "dog/ddeath.wav", IT_SHOTGUN, IT_SHOTGUN);
	self.solid = TE_SPIKE;
	if ((random() > 0.5))
	{
		dog_die1();
	}
	else
	{
		dog_dieb1();
	}
};

float(float enemy_range) CheckDogMelee =
{
	if ((enemy_range == TE_SPIKE))
	{
		self.attack_state = TE_EXPLOSION;
		return (IT_SHOTGUN);
	}
	return (TE_SPIKE);
};

float() CheckDogJump =
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
	if ((d < 80))
	{
		return (TE_SPIKE);
	}
	if ((d > 150))
	{
		return (TE_SPIKE);
	}
	return (IT_SHOTGUN);
};

float(float enemy_range) DogCheckAttack =
{
	if (CheckDogMelee(enemy_range))
	{
		self.attack_state = TE_EXPLOSION;
		return (IT_SHOTGUN);
	}
	if (CheckDogJump())
	{
		self.attack_state = IT_NAILGUN;
		return (IT_SHOTGUN);
	}
	return (TE_SPIKE);
};

void() monster_dog =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	precache_model(/*33273i*/"progs/dog.mdl");
	precache_sound(/*32613i*/"dog/dattack1.wav");
	precache_sound(/*33208i*/"dog/ddeath.wav");
	precache_sound(/*33013i*/"dog/dpain1.wav");
	precache_sound(/*30250i*/"dog/dsight.wav");
	precache_sound(/*32379i*/"dog/idle.wav");
	self.solid = TE_EXPLOSION;
	self.movetype = IT_NAILGUN;
	setmodel(self, /*33273i*/"progs/dog.mdl");
	setsize(self, VEC_HULL2_MIN, '32 32 40');
	self.health = 25;
	self.th_stand = dog_stand1;
	self.th_walk = dog_walk1;
	self.th_run = dog_run1;
	self.th_pain = dog_pain;
	self.th_die = dog_die;
	self.th_melee = dog_atta1;
	self.th_missile = dog_leap1;
	walkmonster_start();
};
