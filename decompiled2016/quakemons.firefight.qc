//Decompiled code. Please respect the original copyright.
void() normal_elite;
void() normal_grunt;
void() red_elite;
void() white_elite;

void() Spawn_enemy =
{
	local float r;

	r = floor((random() * TE_LIGHTNING1));
	ROUND_NEW = TE_SPIKE;
	if ((r == IT_SHOTGUN))
	{
		normal_elite();
	}
	else
	{
		if ((r == IT_SUPER_SHOTGUN))
		{
			normal_grunt();
		}
		else
		{
			if ((r == TE_EXPLOSION))
			{
				if ((round < TE_LIGHTNING1))
				{
				}
				else
				{
					red_elite();
				}
			}
			else
			{
				if ((r == IT_NAILGUN))
				{
					if ((round < TE_WIZSPIKE))
					{
					}
					else
					{
						white_elite();
					}
				}
				else
				{
					if ((r == TE_LIGHTNING1))
					{
						normal_grunt();
					}
				}
			}
		}
	}
};

void() Firefight_settings =
{
	CATCH = TE_SPIKE;
	F_LIVES = TE_LAVASPLASH;
	Check_Round();
	Update_Lives();
	localcmd(/*51330i*/"timelimit 60\n");
};

void() Update_Lives =
{
	localcmd(/*51363i*/"cl_life ");
	localcmd(ftos(F_LIVES));
	localcmd(/*23586i*/" \n");
};

void() Update_Rounds =
{
	localcmd(/*51385i*/"cl_round ");
	localcmd(ftos(round));
	localcmd(/*23586i*/" \n");
};

void() Catch_On =
{
	CATCH = IT_SHOTGUN;
	localcmd(/*51409i*/"cl_round 100\n");
};

void(entity client, float howmuch) Firefight_Scoring =
{
	client.frags = (client.frags + howmuch);
};

void() Check_Round =
{
	local float r;

	r = random();
	if ((round_kills == MAX_MONS))
	{
		if ((r < 0.1))
		{
			F_LIVES = F_LIVES + IT_SHOTGUN;
			Update_Lives();
		}
		ROUND_NEW = IT_SHOTGUN;
		round = round + IT_SHOTGUN;
		Update_Rounds();
		MAX_MONS = MAX_MONS + IT_SUPER_SHOTGUN;
		TOTAL_MONS = TE_SPIKE;
		round_kills = TE_SPIKE;
	}
};

void() normal_elite =
{
	local entity oldself;

	if ((self.enemy != world))
	{
		if ((self.enemy.health <= TE_SPIKE))
		{
			self.enemy = world;
		}
	}
	if ((self.enemy == world))
	{
		oldself = self;
		self = spawn();
		self.classname = "Needle-spikes";
		setorigin(self, oldself.origin);
		self.origin_z = (self.origin_z + IT_SUPER_SHOTGUN);
		self.solid = TE_EXPLOSION;
		self.classname = "elite";
		self.movetype = IT_NAILGUN;
		setmodel(self, /*51468i*/"progs/elite.mdl");
		self.skin = IT_SHOTGUN;
		self.weapon = IT_LIGHTNING;
		setsize(self, VEC_HULL_MIN, VEC_HULL_MAX);
		self.health = 150;
		self.elite = TE_SPIKE;
		self.selnade = IT_SHOTGUN;
		self.th_stand = elite_stand1;
		self.th_walk = elite_walk1;
		self.th_run = elite_run1;
		self.th_die = elite_death;
		self.th_melee = elite_smash1;
		self.th_missile = elite_attack;
		self.th_pain = elite_pain;
		if ((oldself.target != string_null))
		{
			self.target = oldself.target;
		}
		walkmonster_start();
		oldself.enemy = self;
		self = oldself;
		TOTAL_MONS = TOTAL_MONS + IT_SHOTGUN;
	}
};

void() red_elite =
{
	local entity oldself;

	if ((self.enemy != world))
	{
		if ((self.enemy.health <= TE_SPIKE))
		{
			self.enemy = world;
		}
	}
	if ((self.enemy == world))
	{
		oldself = self;
		self = spawn();
		self.classname = "Needle-spikes";
		setorigin(self, oldself.origin);
		self.origin_z = (self.origin_z + IT_SUPER_SHOTGUN);
		self.solid = TE_EXPLOSION;
		self.classname = "elite";
		self.movetype = IT_NAILGUN;
		setmodel(self, /*51468i*/"progs/elite.mdl");
		self.skin = TE_SPIKE;
		self.weapon = IT_EXTRA_WEAPON;
		setsize(self, VEC_HULL_MIN, VEC_HULL_MAX);
		self.health = 150;
		self.elite = IT_SHOTGUN;
		self.selnade = IT_SHOTGUN;
		self.th_stand = elite_stand1;
		self.th_walk = elite_walk1;
		self.th_run = elite_run1;
		self.th_die = elite_death;
		self.th_melee = elite_smash1;
		self.th_missile = elite_attack;
		self.th_pain = elite_pain;
		if ((oldself.target != string_null))
		{
			self.target = oldself.target;
		}
		walkmonster_start();
		oldself.enemy = self;
		self = oldself;
		TOTAL_MONS = TOTAL_MONS + IT_SHOTGUN;
	}
};

void() white_elite =
{
	local entity oldself;

	if ((self.enemy != world))
	{
		if ((self.enemy.health <= TE_SPIKE))
		{
			self.enemy = world;
		}
	}
	if ((self.enemy == world))
	{
		oldself = self;
		self = spawn();
		self.classname = "Needle-spikes";
		setorigin(self, oldself.origin);
		self.origin_z = (self.origin_z + IT_SUPER_SHOTGUN);
		self.solid = TE_EXPLOSION;
		self.classname = "elite";
		self.movetype = IT_NAILGUN;
		setmodel(self, /*51468i*/"progs/elite.mdl");
		self.skin = IT_SUPER_SHOTGUN;
		self.weapon = IT_LIGHTNING;
		setsize(self, VEC_HULL_MIN, VEC_HULL_MAX);
		self.health = 170;
		self.elite = TE_EXPLOSION;
		self.selnade = IT_SHOTGUN;
		self.th_stand = elite_stand1;
		self.th_walk = elite_walk1;
		self.th_run = elite_run1;
		self.th_die = elite_death;
		self.th_melee = elite_smash1;
		self.th_missile = elite_attack;
		self.th_pain = elite_pain;
		if ((oldself.target != string_null))
		{
			self.target = oldself.target;
		}
		walkmonster_start();
		oldself.enemy = self;
		self = oldself;
		TOTAL_MONS = TOTAL_MONS + IT_SHOTGUN;
	}
};

void() normal_grunt =
{
	local entity oldself;

	if ((self.enemy != world))
	{
		if ((self.enemy.health <= TE_SPIKE))
		{
			self.enemy = world;
		}
	}
	if ((self.enemy == world))
	{
		oldself = self;
		self = spawn();
		self.classname = "Needle-spikes";
		setorigin(self, oldself.origin);
		self.origin_z = (self.origin_z + IT_SUPER_SHOTGUN);
		self.solid = TE_EXPLOSION;
		self.movetype = IT_NAILGUN;
		setmodel(self, /*34304i*/"progs/soldier.mdl");
		self.elite = IT_SHOTGUN;
		self.weapon = IT_LIGHTNING;
		self.selnade = IT_SHOTGUN;
		setsize(self, VEC_HULL_MIN, VEC_HULL_MAX);
		self.health = 50;
		self.th_stand = grunt_stand1;
		self.th_walk = grunt_walk1;
		self.th_run = grunt_run1;
		self.th_missile = grunt_attack;
		self.th_pain = grunt_pain;
		self.th_die = grunt_die;
		self.th_melee = grunt_melee;
		if ((oldself.target != string_null))
		{
			self.target = oldself.target;
		}
		walkmonster_start();
		oldself.enemy = self;
		self = oldself;
		TOTAL_MONS = TOTAL_MONS + IT_SHOTGUN;
	}
};
