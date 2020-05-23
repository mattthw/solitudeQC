//Decompiled code. Please respect the original copyright.
.float medal_count;

void() Medal_think =
{
	if ((self.owner.medal_count > IT_SHOTGUN))
	{
		self.owner.medal_count = (self.owner.medal_count - IT_SHOTGUN);
		remove(self);
		return;
	}
	if ((self.owner.health < IT_SHOTGUN))
	{
		stuffcmd(self.owner, "cl_killmedals 0\n");
		self.owner.medal_count = (self.owner.medal_count - IT_SHOTGUN);
		remove(self);
		return;
	}
	self.health = (self.health - IT_SHOTGUN);
	if ((self.health < TE_SPIKE))
	{
		stuffcmd(self.owner, "cl_killmedals 0\n");
		self.owner.medal_count = (self.owner.medal_count - IT_SHOTGUN);
		remove(self);
		return;
	}
	self.nextthink = (time + IT_SHOTGUN);
};

void(entity client) Medal =
{
	local entity medal_timer;

	client.medal_count = (client.medal_count + IT_SHOTGUN);
	medal_timer = spawn();
	medal_timer.health = IT_NAILGUN;
	medal_timer.owner = client;
	medal_timer.think = Medal_think;
	medal_timer.nextthink = (time + TE_SPIKE);
};
