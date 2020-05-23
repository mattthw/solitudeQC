//Decompiled code. Please respect the original copyright.

void() func_model =
{
	precache_model(self.model);
	setmodel(self, self.model);
	setorigin(self, self.origin);
	self.movetype = TE_SPIKE;
	self.solid = IT_SUPER_SHOTGUN;
	setsize(self, '-8 -8 -8', '8 8 8');
};
