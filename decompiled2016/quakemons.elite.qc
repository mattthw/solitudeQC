//Decompiled code. Please respect the original copyright.

void() info_elite_think =
{
	if ((TOTAL_MONS < MAX_MONS))
	{
		Spawn_enemy();
	}
	self.think = info_elite_think;
	self.nextthink = (time + TE_LIGHTNING1);
};

void() info_elite_start =
{
	if ((deathmatch != IT_SUPER_SHOTGUN))
	{
		remove(self);
		return;
	}
	precache_sound(/*23767i*/"firefight.wav");
	precache_model(/*51468i*/"progs/elite.mdl");
	precache_model(/*13566i*/"progs/pod.mdl");
	precache_sound(/*32149i*/"elite/ogdth.wav");
	precache_sound(/*32165i*/"elite/ogdth2.wav");
	precache_sound(/*32182i*/"elite/ogdth3.wav");
	precache_sound(/*32211i*/"elite/ogpain1.wav");
	precache_sound(/*31354i*/"elite/ogsawatk.wav");
	precache_sound(/*30050i*/"elite/elite_see.wav");
	precache_sound(/*31000i*/"elite/laugh1.wav");
	precache_sound(/*31017i*/"elite/laugh2.wav");
	precache_model(/*34304i*/"progs/soldier.mdl");
	precache_sound(/*34275i*/"soldier/death1.wav");
	precache_sound(/*33823i*/"soldier/idle.wav");
	precache_sound(/*34222i*/"soldier/pain1.wav");
	precache_sound(/*34367i*/"soldier/pain2.wav");
	precache_sound(/*30469i*/"soldier/sight1.wav");
	precache_sound(/*33318i*/"soldier/laugh1.wav");
	precache_sound(/*33337i*/"soldier/laugh2.wav");
	precache_sound(/*33363i*/"soldier/unstoppable.wav");
	precache_sound(/*51568i*/"soldier/kill_all.wav");
	Firefight_settings();
	self.enemy = world;
	self.think = info_elite_think;
	self.nextthink = (time + TE_LIGHTNING1);
};
