//Decompiled code. Please respect the original copyright.

void() Slowmo_Deactivate =
{
	localcmd(/*17131i*/"cl_overlay 0\n");
	localcmd(/*17145i*/"cl_activate 0\n");
	localcmd(/*17160i*/"host_framerate 0\n");
};

void(entity client) Update_Slowmo =
{

	stuffcmd(client, "cl_slowmo ");
	stuffcmd(client, ftos(client.slowmo));
	stuffcmd(client, " \n");
};

void() Slowmo_think =
{
	self.owner.slowmo = self.health;
	if (((self.owner.health < IT_SHOTGUN) || (SLOWMO_TOGGLE == TE_SPIKE)))
	{
		SLOWMO_TOGGLE = TE_SPIKE;
		Slowmo_Deactivate();
		remove(self);
		return;
	}
	if ((SLOWMO_TOGGLE == IT_SHOTGUN))
	{
		localcmd(/*24206i*/"cl_overlay 1\n");
		localcmd(/*24220i*/"cl_activate 1\n");
		localcmd(/*24235i*/"host_framerate 0.008\n");
	}
	self.health = (self.health - IT_SHOTGUN);
	Update_Slowmo(self.owner);
	if ((self.health < TE_SPIKE))
	{
		SLOWMO_TOGGLE = TE_SPIKE;
		Slowmo_Deactivate();
		remove(self);
		return;
	}
	if (((SLOWMO_TOGGLE == IT_SHOTGUN) && (self.health > TE_SPIKE)))
	{
		localcmd(/*24257i*/"play misc/talk.wav\n");
	}
	self.nextthink = (time + IT_SHOTGUN);
};

void(entity client) Slowmo =
{
	local entity slowmo_timer;

	slowmo_timer = spawn();
	slowmo_timer.health = client.slowmo;
	slowmo_timer.owner = client;
	slowmo_timer.think = Slowmo_think;
	slowmo_timer.nextthink = (time + TE_SPIKE);
};

void(entity client) Setup_Slowmo =
{
	Slowmo(client);
	client.slowmo_flags = TE_SPIKE;
};

void(entity client, float howmuch) Add_Slowmo =
{
	if (((deathmatch != TE_EXPLOSION) || (client.slowmo > IT_SUPER_NAILGUN)))
	{
		return;
	}
	if ((client.slowmo < IT_SUPER_NAILGUN))
	{
		client.slowmo = (client.slowmo + howmuch);
	}
	Update_Slowmo(client);
};
