//Decompiled code. Please respect the original copyright.
void() info_elite_think;
void() Check_Round;

void() Enemy_Fire_PPist =
{
	local vector dir;
	local entity en;
	local float r;

	r = random();
	ai_face();
	en = self.enemy;
	dir = en.origin - (en.velocity * 0.2);
	dir = normalize((dir - self.origin));
	W_FirePPistol(self.weaponheat);
};

void() Enemy_Fire_Needler =
{
	local vector dir;
	local entity en;

	ai_face();
	en = self.enemy;
	dir = en.origin - (en.velocity * 0.2);
	dir = normalize((dir - self.origin));
	W_FireNeedler();
};

void() Enemy_Fire_Nade =
{
	local entity missile;

	sound(self, IT_SHOTGUN, "weapons/plasma_throw.wav", IT_SHOTGUN, IT_SHOTGUN);
	missile = spawn();
	missile.owner = self;
	missile.movetype = TE_LAVASPLASH;
	missile.solid = IT_SUPER_SHOTGUN;
	missile.effects = IT_ROCKET_LAUNCHER;
	missile.classname = "missile";
	makevectors(self.angles);
	missile.velocity = normalize((self.enemy.origin - self.origin));
	missile.velocity = (missile.velocity * 400);
	missile.velocity_z = 200;
	missile.avelocity = '300 300 300';
	missile.angles = vectoangles(missile.velocity);
	missile.selnade = self.selnade;
	missile.touch = GrenadeBounce;
	setmodel(missile, /*13530i*/"progs/plasgren.mdl");
	setsize(missile, VEC_ORIGIN, VEC_ORIGIN);
	setorigin(missile, self.origin);
};

void() laugh =
{
	local float r;

	r = random();
	if ((self.attack_finished > time))
	{
		return;
	}
	if ((r <= 0.025))
	{
		sound(self, TE_SPIKE, "elite/laugh1.wav", IT_SHOTGUN, IT_SHOTGUN);
		self.attack_finished = (time + TE_LIGHTNING1);
	}
	else
	{
		if ((r <= 0.05))
		{
			sound(self, TE_SPIKE, "elite/laugh2.wav", IT_SHOTGUN, IT_SHOTGUN);
			self.attack_finished = (time + TE_LIGHTNING1);
		}
		else
		{
		}
	}
};

void() elite_stand1 = [ 0, elite_stand1 ]
{
	ai_stand();
};

void() elite_stand2 = [ 1, elite_stand2 ]
{
	ai_stand();
};

void() elite_stand3 = [ 2, elite_stand3 ]
{
	ai_stand();
};

void() elite_stand4 = [ 3, elite_stand4 ]
{
	ai_stand();
};

void() elite_stand5 = [ 4, elite_stand5 ]
{
	ai_stand();
};

void() elite_stand6 = [ 5, elite_stand6 ]
{
	ai_stand();
};

void() elite_stand7 = [ 6, elite_stand7 ]
{
	ai_stand();
	laugh();
};

void() elite_stand8 = [ 7, elite_stand8 ]
{
	ai_stand();
};

void() elite_stand9 = [ 8, elite_stand9 ]
{
	ai_stand();
};

void() elite_stand10 = [ 9, elite_stand10 ]
{
	ai_stand();
};

void() elite_stand11 = [ 10, elite_stand11 ]
{
	ai_stand();
};

void() elite_stand12 = [ 11, elite_stand1 ]
{
	ai_stand();
};
void() elite_walk2;

void() elite_walk1 = [ 12, elite_walk2 ]
{
	ai_walk((TE_EXPLOSION + round));
};
void() elite_walk3;

void() elite_walk2 = [ 13, elite_walk3 ]
{
	ai_walk((IT_SUPER_SHOTGUN + round));
};
void() elite_walk4;

void() elite_walk3 = [ 14, elite_walk4 ]
{
	ai_walk(IT_SUPER_SHOTGUN);
};
void() elite_walk5;

void() elite_walk4 = [ 15, elite_walk5 ]
{
	ai_walk((IT_SUPER_SHOTGUN + round));
};
void() elite_walk6;

void() elite_walk5 = [ 16, elite_walk6 ]
{
	ai_walk((IT_SUPER_SHOTGUN + round));
};

void() elite_walk6 = [ 17, elite_walk1 ]
{
	ai_walk(TE_LIGHTNING1);
	if ((random() < 0.1))
	{
		sound(self, IT_SUPER_SHOTGUN, "elite/ogdrag.wav", IT_SHOTGUN, IT_SUPER_SHOTGUN);
	}
};
void() elite_run2;

void() elite_run1 = [ 18, elite_run2 ]
{
	ai_run((18 + round));
};
void() elite_run3;

void() elite_run2 = [ 19, elite_run3 ]
{
	ai_run((15 + round));
};
void() elite_run4;

void() elite_run3 = [ 20, elite_run4 ]
{
	ai_run((15 + round));
};
void() elite_run5;

void() elite_run4 = [ 21, elite_run5 ]
{
	ai_run((15 + round));
};
void() elite_run6;

void() elite_run5 = [ 22, elite_run6 ]
{
	ai_run((15 + round));
};

void() elite_run6 = [ 23, elite_run1 ]
{
	ai_run((15 + round));
};
void() elite_swing2;

void() elite_swing1 = [ 24, elite_swing2 ]
{
	ai_charge(TE_TELEPORT);
	sound(self, IT_SUPER_SHOTGUN, "elite/ogsawatk.wav", IT_SHOTGUN, IT_SHOTGUN);
};
void() elite_swing3;

void() elite_swing2 = [ 25, elite_swing3 ]
{
	ai_charge(IT_SHOTGUN);
};
void() elite_swing4;

void() elite_swing3 = [ 26, elite_swing4 ]
{
	ai_charge(IT_NAILGUN);
};
void() elite_swing5;

void() elite_swing4 = [ 27, elite_swing5 ]
{
	ai_charge(13);
};
void() elite_swing6;

void() elite_swing5 = [ 28, elite_swing6 ]
{
	ai_charge(TE_LIGHTNING3);
	ai_melee(29);
};
void() elite_swing7;

void() elite_swing6 = [ 29, elite_swing7 ]
{
};
void() elite_swing8;

void() elite_swing7 = [ 30, elite_swing8 ]
{
};
void() elite_swing9;

void() elite_swing8 = [ 31, elite_swing9 ]
{
};
void() elite_swing10;

void() elite_swing9 = [ 32, elite_swing10 ]
{
};
void() elite_swing11;

void() elite_swing10 = [ 33, elite_swing11 ]
{
};
void() elite_swing12;

void() elite_swing11 = [ 34, elite_swing12 ]
{
};

void() elite_swing12 = [ 35, elite_run1 ]
{
	ai_charge(TE_EXPLOSION);
};
void() elite_smash2;

void() elite_smash1 = [ 36, elite_smash2 ]
{
	ai_charge(TE_LIGHTNING2);
	sound(self, IT_SUPER_SHOTGUN, "elite/ogsawatk.wav", IT_SHOTGUN, IT_SHOTGUN);
};
void() elite_smash3;

void() elite_smash2 = [ 37, elite_smash3 ]
{
	ai_charge(TE_SPIKE);
};
void() elite_smash4;

void() elite_smash3 = [ 38, elite_smash4 ]
{
	ai_charge(TE_SPIKE);
};
void() elite_smash5;

void() elite_smash4 = [ 39, elite_smash5 ]
{
	ai_charge(IT_SHOTGUN);
};
void() elite_smash6;

void() elite_smash5 = [ 40, elite_smash6 ]
{
	ai_charge(IT_NAILGUN);
	ai_melee(29);
};
void() elite_smash7;

void() elite_smash6 = [ 41, elite_smash7 ]
{
	ai_charge(IT_NAILGUN);
};
void() elite_smash8;

void() elite_smash7 = [ 42, elite_smash8 ]
{
	ai_charge(IT_NAILGUN);
};
void() elite_smash9;

void() elite_smash8 = [ 43, elite_smash9 ]
{
	ai_charge(TE_LAVASPLASH);
};
void() elite_smash10;

void() elite_smash9 = [ 44, elite_smash10 ]
{
	ai_charge(13);
};
void() elite_smash11;

void() elite_smash10 = [ 45, elite_smash11 ]
{
};
void() elite_smash12;

void() elite_smash11 = [ 46, elite_smash12 ]
{
	ai_charge(IT_SUPER_SHOTGUN);
	self.nextthink = ((time + 0.1) + (random() * 0.1));
};

void() elite_smash12 = [ 47, elite_run1 ]
{
	ai_charge(TE_SPIKE);
};
void() elite_nade2;

void() elite_nade1 = [ 48, elite_nade2 ]
{
	ai_face();
};
void() elite_nade3;

void() elite_nade2 = [ 49, elite_nade3 ]
{
	ai_face();
};
void() elite_nade4;

void() elite_nade3 = [ 50, elite_nade4 ]
{
	ai_face();
	Enemy_Fire_Nade();
};
void() elite_nade5;

void() elite_nade4 = [ 51, elite_nade5 ]
{
	ai_face();
};
void() elite_nade6;

void() elite_nade5 = [ 52, elite_nade6 ]
{
	ai_face();
};
void() elite_nade7;

void() elite_nade6 = [ 53, elite_nade7 ]
{
	ai_face();
};
void() elite_nade8;

void() elite_nade7 = [ 54, elite_nade8 ]
{
	ai_face();
};
void() elite_nade9;

void() elite_nade8 = [ 55, elite_nade9 ]
{
	ai_face();
};
void() elite_nade10;

void() elite_nade9 = [ 56, elite_nade10 ]
{
	ai_face();
};

void() elite_nade10 = [ 57, elite_run1 ]
{
	ai_face();
};
void() elite_nail2;

void() elite_nail1 = [ 18, elite_nail2 ]
{
	ai_face();
};
void() elite_nail3;

void() elite_nail2 = [ 19, elite_nail3 ]
{
	ai_face();
};
void() elite_nail4;

void() elite_nail3 = [ 19, elite_nail4 ]
{
	ai_face();
};
void() elite_nail5;

void() elite_nail4 = [ 20, elite_nail5 ]
{
	ai_face();
	if (((self.elite == TE_SPIKE) || (self.elite == IT_SUPER_SHOTGUN)))
	{
		Enemy_Fire_PPist();
	}
	if ((self.elite == IT_SHOTGUN))
	{
		Enemy_Fire_Needler();
	}
};
void() elite_nail6;

void() elite_nail5 = [ 21, elite_nail6 ]
{
	ai_face();
};
void() elite_nail7;

void() elite_nail6 = [ 22, elite_nail7 ]
{
	ai_face();
};

void() elite_nail7 = [ 23, elite_run1 ]
{
	ai_face();
};
void() elite_pain2;

void() elite_pain1 = [ 58, elite_pain2 ]
{
	ai_pain(TE_EXPLOSION);
};
void() elite_pain3;

void() elite_pain2 = [ 59, elite_pain3 ]
{
};
void() elite_pain4;

void() elite_pain3 = [ 60, elite_pain4 ]
{
};

void() elite_pain4 = [ 61, elite_run1 ]
{
};
void() elite_bdie2;

void() elite_bdie1 = [ 62, elite_bdie2 ]
{
};
void() elite_bdie3;

void() elite_bdie2 = [ 63, elite_bdie3 ]
{
};
void() elite_bdie4;

void() elite_bdie3 = [ 64, elite_bdie4 ]
{
	self.solid = TE_SPIKE;
};
void() elite_bdie5;

void() elite_bdie4 = [ 65, elite_bdie5 ]
{
};
void() elite_bdie6;

void() elite_bdie5 = [ 66, elite_bdie6 ]
{
};
void() elite_bdie7;

void() elite_bdie6 = [ 67, elite_bdie7 ]
{
};
void() elite_bdie8;

void() elite_bdie7 = [ 68, elite_bdie8 ]
{
};

void() elite_bdie8 = [ 69, elite_bdie8 ]
{
	self.think = SUB_Remove;
	self.nextthink = (time + TE_LIGHTNING1);
	round_kills = round_kills + IT_SHOTGUN;
	Check_Round();
};
void() elite_dieb2;

void() elite_dieb1 = [ 70, elite_dieb2 ]
{
};
void() elite_dieb3;

void() elite_dieb2 = [ 71, elite_dieb3 ]
{
};
void() elite_dieb4;

void() elite_dieb3 = [ 72, elite_dieb4 ]
{
	self.solid = TE_SPIKE;
};
void() elite_dieb5;

void() elite_dieb4 = [ 73, elite_dieb5 ]
{
};
void() elite_dieb6;

void() elite_dieb5 = [ 74, elite_dieb6 ]
{
};
void() elite_dieb7;

void() elite_dieb6 = [ 75, elite_dieb7 ]
{
};
void() elite_dieb8;

void() elite_dieb7 = [ 76, elite_dieb8 ]
{
};

void() elite_dieb8 = [ 77, elite_dieb8 ]
{
	self.think = SUB_Remove;
	self.nextthink = (time + TE_LIGHTNING1);
	round_kills = round_kills + IT_SHOTGUN;
	Check_Round();
	if ((self.weapon == IT_LIGHTNING))
	{
		ThrowWeapon(IT_LIGHTNING, TE_SPIKE);
	}
	else
	{
		ThrowWeapon(IT_EXTRA_WEAPON, TE_SPIKE);
	}
};

void(float enemy_range) elite_attack =
{
	local float r;

	r = random();
	if ((CATCH == IT_SHOTGUN))
	{
		if ((r <= 0.5))
		{
			elite_nade1();
		}
		else
		{
			elite_nail1();
		}
	}
	else
	{
		if (((r <= 0.15) && (enemy_range <= IT_SUPER_SHOTGUN)))
		{
			elite_nade1();
		}
		else
		{
			elite_nail1();
		}
	}
};

void() elite_death =
{
	if ((random() > 0.5))
	{
		elite_bdie1();
	}
	else
	{
		elite_dieb1();
	}
	if ((random() > 0.3))
	{
		sound(self, IT_SUPER_SHOTGUN, "elite/ogdth.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	else
	{
		if ((random() > 0.6))
		{
			sound(self, IT_SUPER_SHOTGUN, "elite/ogdth2.wav", IT_SHOTGUN, IT_SHOTGUN);
		}
		else
		{
			sound(self, IT_SUPER_SHOTGUN, "elite/ogdth3.wav", IT_SHOTGUN, IT_SHOTGUN);
		}
	}
};

void() elite_pain =
{
	if ((self.pain_finished > time))
	{
		return;
	}
	sound(self, IT_SUPER_SHOTGUN, "elite/ogpain1.wav", IT_SHOTGUN, IT_SHOTGUN);
	elite_pain1();
	self.pain_finished = (time + 1.5);
};
