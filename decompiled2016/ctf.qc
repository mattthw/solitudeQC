//Decompiled code. Please respect the original copyright.
.vector flag_base;
.float flag_base_y;
.float flag_base_z;
.entity flag_ent;
.float update_print;
.float flag_state;

vector(entity e) realorg =
{
	return (((e.absmin + e.absmax) * 0.5));
};

string(float whichteam) CTF_TeamString =
{

	if ((whichteam == SVC_UPDATEFRAGS))
	{
		return ("блуе");
	}
	else
	{
		return ("ред");
	}
};

void(float st) CTF_Flag_SetState =
{
	self.flag_state = st;
	if (((st == TE_SPIKE) || (st == IT_SHOTGUN)))
	{
		self.owner = world;
		self.solid = IT_SHOTGUN;
	}
	else
	{
		if ((st == IT_SUPER_SHOTGUN))
		{
			self.solid = TE_SPIKE;
		}
	}
};

void() CTF_Flag_SendToBase =
{
	if ((self.flag_state == IT_SHOTGUN))
	{
		bprint(CTF_TeamString(self.team));
		bprint(" flag was returned to base!\n");
	}
	setorigin(self, self.flag_base);
	CTF_Flag_SetState(TE_SPIKE);
};

void() CTF_Flag_Capture =
{
	local entity e;
	local entity oself;

	bprint(other.netname);
	bprint(" captured the ");
	bprint(CTF_TeamString(other.flag_ent.team));
	bprint(" flag!\n");
	centerprint(other, "\n");
	e = find(world, classname, /*1957i*/"player");
	while (e)
	{
		if ((e.team == other.team))
		{
			e.frags = (e.frags + TE_LAVASPLASH);
		}
		e = find(e, classname, /*1957i*/"player");
	}
	oself = self;
	self = other.flag_ent;
	CTF_Flag_SendToBase();
	self = oself;
	other.flag_ent = world;
};

void() CTF_Flag_Think =
{
	if ((self.flag_state == IT_SUPER_SHOTGUN))
	{
		makevectors(self.owner.v_angle);
		setorigin(self, (realorg(self.owner) + (v_forward * -14)));
		if ((self.owner.update_print < time))
		{
			centerprint(self.owner, " \n \n \n \n \n \n \n \n \nYou have the flag!\nReturn to your base.");
			self.owner.update_print = (time + 1.5);
		}
		self.think = CTF_Flag_Think;
		self.nextthink = time;
	}
	else
	{
		if ((self.flag_state == IT_SHOTGUN))
		{
			self.nextthink = (time + SVC_INTERMISSION);
			self.think = CTF_Flag_SendToBase;
		}
	}
};

void() CTF_Flag_Drop =
{
	local vector deviance;
	local entity oself;

	if (!self.flag_ent)
	{
		return;
	}
	bprint(self.netname);
	bprint(" has dropped the ");
	bprint(CTF_TeamString(self.flag_ent.team));
	bprint(" flag!\n");
	deviance_x = random() * 20;
	deviance_y = random() * 20;
	deviance_z = 200;
	self.flag_ent.velocity = ((self.flag_ent.velocity * 0.5) + deviance);
	oself = self;
	self = self.flag_ent;
	CTF_Flag_SetState(IT_SHOTGUN);
	self = oself;
	self.flag_ent.think = CTF_Flag_Think;
	self.flag_ent.nextthink = time;
	self.flag_ent = world;
};

void() CTF_Flag_Touch =
{
	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= TE_SPIKE))
	{
		return;
	}
	if ((other.team != self.team))
	{
		bprint(other.netname);
		bprint(" has picked up the ");
		bprint(CTF_TeamString(self.team));
		bprint(" flag!\n");
		self.owner = other;
		other.flag_ent = self;
		CTF_Flag_SetState(IT_SUPER_SHOTGUN);
		self.think = CTF_Flag_Think;
		self.nextthink = time;
	}
	else
	{
		if ((self.flag_state == IT_SHOTGUN))
		{
			bprint(other.netname);
			bprint(" returned the ");
			bprint(CTF_TeamString(other.team));
			bprint(" flag\n");
			CTF_Flag_SendToBase();
		}
		else
		{
			if ((self.flag_state == TE_SPIKE))
			{
				if (other.flag_ent)
				{
					CTF_Flag_Capture();
				}
			}
		}
	}
};

void() CTF_Flag_Finalise =
{
	self.movetype = TE_LIGHTNING2;
	CTF_Flag_SetState(TE_SPIKE);
};

void(float whichteam) CTF_Flag_Init =
{
	local string m;
	local string s;
	local vector v;
	local entity flag;

	flag = spawn();
	flag.touch = CTF_Flag_Touch;
	flag.flags = IT_SHELLS;
	flag.team = whichteam;
	if ((whichteam == SVC_UPDATEFRAGS))
	{
		m = "progs/b_s_key.mdl";
		s = "misc/basekey.wav";
		flag.items = IT_KEY1;
	}
	else
	{
		m = "progs/b_g_key.mdl";
		s = "misc/basekey.wav";
		flag.items = IT_KEY2;
	}
	precache_model(m);
	setmodel(flag, m);
	precache_sound(s);
	flag.noise = s;
	v = self.origin + '0 0 4';
	flag.flag_base = v;
	flag.owner = world;
	flag.team = whichteam;
	setsize(flag, VEC_HULL_MIN, VEC_HULL_MAX);
	setorigin(flag, v);
	flag.nextthink = (time + 0.2);
	flag.think = CTF_Flag_Finalise;
};

void() info_flag_blue =
{
	CTF_Flag_Init(SVC_UPDATEFRAGS);
};

void() info_flag_red =
{
	CTF_Flag_Init(TE_LIGHTNING1);
};
