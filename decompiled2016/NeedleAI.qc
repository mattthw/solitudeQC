//Decompiled code. Please respect the original copyright.

void() MarioHome =
{
	local vector dir;
	local vector vtemp;
	local vector wantdir;
	local entity te;
	local float maxmove;

	maxmove = 85;
	if (((self.enemy != world) && (self.enemy.health > TE_SPIKE)))
	{
		vtemp = self.enemy.origin + '0 0 10';
		dir = normalize((vtemp - self.origin));
		wantdir = dir * 550;
		wantdir_x = wantdir_x - self.velocity_x;
		if ((wantdir_x > maxmove))
		{
			wantdir_x = maxmove;
		}
		if ((wantdir_x < (TE_SPIKE - maxmove)))
		{
			wantdir_x = TE_SPIKE - maxmove;
		}
		wantdir_y = wantdir_y - self.velocity_y;
		if ((wantdir_y > maxmove))
		{
			wantdir_y = maxmove;
		}
		if ((wantdir_y < (TE_SPIKE - maxmove)))
		{
			wantdir_y = TE_SPIKE - maxmove;
		}
		wantdir_z = wantdir_z - self.velocity_z;
		if ((wantdir_z > maxmove))
		{
			wantdir_z = maxmove;
		}
		if ((wantdir_z < (TE_SPIKE - maxmove)))
		{
			wantdir_z = TE_SPIKE - maxmove;
		}
		self.velocity = (wantdir + self.velocity);
	}
	else
	{
		te = findradius(self.origin, 950);
		while (te)
		{
			if (((((te.classname == "player") || (te.flags & IT_ROCKET_LAUNCHER)) && (te.health > TE_SPIKE)) && (te != self.owner)))
			{
				self.enemy = te;
			}
			te = te.chain;
		}
	}
	self.angles = vectoangles(self.velocity);
	self.nextthink = (time + 0.5);
	self.think = NeedlerHome;
};

void() Mario_Touch =
{
	if (((other.takedamage != TE_SPIKE) && (other.health > TE_SPIKE)))
	{
		T_Damage(other, self, self.owner, 20, 666);
		Add_Needle(self.owner, other, self.origin_x);
	}
	else
	{
		if ((self.lives > TE_SPIKE))
		{
			Bounce_Off_Walls();
			self.lives = (self.lives - IT_SHOTGUN);
			return;
		}
	}
	remove(self);
};

void() dust =
{
	self.enemy.kill_amount = (self.enemy.kill_amount + IT_SHOTGUN);
	self.enemy.frags = (self.enemy.frags + IT_SHOTGUN);
	self.enemy.needles = (self.enemy.needles - IT_SHOTGUN);
	T_Damage(self.enemy, self, self.owner, IT_NAILGUN, 666);
	sound(self, IT_SHOTGUN, "weapons/crystal.wav", IT_SHOTGUN, IT_SHOTGUN);
	createpinkdust(self.origin);
	remove(self);
};
void() misc_marion;

void() W_FireMario =
{
	local entity fshell;
	local vector spread;

	muzzleflash6();
	sound(self, IT_SHOTGUN, "weapons/bigneedler.wav", IT_SHOTGUN, IT_SHOTGUN);
	spread = '3.6 3.6 0.1';
	fshell = spawn();
	fshell.owner = self;
	fshell.health = 15;
	fshell.classname = "Needle-spikes";
	fshell.movetype = TE_LIGHTNING3;
	fshell.effects = IT_LIGHTNING;
	fshell.solid = IT_SUPER_SHOTGUN;
	fshell.takedamage = IT_SUPER_SHOTGUN;
	fshell.th_die = dust;
	makevectors(self.v_angle);
	fshell.velocity = ((v_forward + (((IT_SUPER_SHOTGUN * (random() + -0.5)) * spread_x) * v_right)) + (((IT_SUPER_SHOTGUN * (random() + -0.5)) * spread_y) * v_up));
	fshell.velocity = (fshell.velocity * 6550);
	fshell.angles = vectoangles(fshell.velocity);
	fshell.touch = Mario_Touch;
	fshell.armorvalue = (time + 100000000);
	fshell.nextthink = (time + 0.2);
	fshell.think = MarioHome;
	fshell.lives = 100000000;
	self.think = W_FireMario;
	self.nextthink = (time + 1.5);
	setmodel(fshell, /*14798i*/"progs/Bigneedproy.mdl");
	setsize(fshell, '-15 -15 -15', '15 15 15');
	setorigin(fshell, ((self.origin + (v_forward * IT_SUPER_NAILGUN)) + '0 0 16'));
};

void() misc_marion =
{
	local entity mario;

	mario = spawn();
	mario.solid = TE_EXPLOSION;
	mario.movetype = TE_SPIKE;
	mario.classname = "Mario";
	setsize(mario, '-25 -25 -10', '25 25 50');
	setorigin(mario, self.origin);
	mario.think = W_FireMario;
	mario.nextthink = (time + IT_SHOTGUN);
};
