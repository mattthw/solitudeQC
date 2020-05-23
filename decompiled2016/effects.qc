//Decompiled code. Please respect the original copyright.
float ef_red;
float ef_pent /* = 8 */;
float ef_blue;
float ef_quad /* = 8 */;

void(float msg, vector org) WriteVector =
{
	WriteCoord(msg, org_x);
	WriteCoord(msg, org_y);
	WriteCoord(msg, org_z);
};

void(vector org, float effect) _EFF_PointEffect =
{
	WriteByte(TE_SPIKE, SVC_TEMPENTITY);
	WriteByte(TE_SPIKE, effect);
	WriteVector(TE_SPIKE, org);
};

void(entity ent, vector org, vector org2, float effect) _EFF_BeamEffect =
{
	WriteByte(TE_SPIKE, SVC_TEMPENTITY);
	WriteByte(TE_SPIKE, effect);
	WriteEntity(TE_SPIKE, ent);
	WriteVector(TE_SPIKE, org);
	WriteVector(TE_SPIKE, org2);
};

void(vector org, float damage, float effect) _EFF_CountEffect =
{
	WriteByte(TE_SPIKE, SVC_TEMPENTITY);
	WriteByte(TE_SPIKE, effect);
	WriteByte(TE_SPIKE, damage);
	WriteVector(TE_SPIKE, org);
};

void(vector org, float damage) _SpawnBlood_TEBlood =
{
	te_blood(org, VEC_ORIGIN, (damage * IT_SUPER_SHOTGUN));
};

void(vector org, float damage) _SpawnBlood =
{

	particle(org, VEC_ORIGIN, 73, (damage * IT_SUPER_SHOTGUN));
};

void() s_smokee6 = [ 5, SUB_Remove ]
{
};

void() s_smokee5 = [ 4, s_smokee6 ]
{
};

void() s_smokee4 = [ 3, s_smokee5 ]
{
};

void() s_smokee3 = [ 2, s_smokee4 ]
{
};

void() s_smokee2 = [ 1, s_smokee3 ]
{
};

void() s_smokee1 = [ 0, s_smokee2 ]
{
};

void() s_needle3 = [ 2, SUB_Remove ]
{
};

void() s_needle2 = [ 1, s_needle3 ]
{
};

void() s_needle1 = [ 0, s_needle2 ]
{
};

void(vector org) createpinkdust =
{
	local entity s;

	s = self;
	self = spawn();
	self.movetype = TE_SPIKE;
	self.velocity = VEC_ORIGIN;
	self.touch = SUB_Null;
	setmodel(self, /*10790i*/"progs/needler_dust.spr");
	setorigin(self, org);
	self.solid = TE_SPIKE;
	s_needle1();
	self = s;
};

void() s_plasma19 = [ 18, SUB_Remove ]
{
};

void() s_plasma18 = [ 17, s_plasma19 ]
{
};

void() s_plasma17 = [ 16, s_plasma18 ]
{
};

void() s_plasma16 = [ 15, s_plasma17 ]
{
};

void() s_plasma15 = [ 14, s_plasma16 ]
{
};

void() s_plasma14 = [ 13, s_plasma15 ]
{
};

void() s_plasma13 = [ 12, s_plasma14 ]
{
};

void() s_plasma12 = [ 11, s_plasma13 ]
{
};

void() s_plasma11 = [ 10, s_plasma12 ]
{
};

void() s_plasma10 = [ 9, s_plasma11 ]
{
};

void() s_plasma9 = [ 8, s_plasma10 ]
{
};

void() s_plasma8 = [ 7, s_plasma9 ]
{
};

void() s_plasma7 = [ 6, s_plasma8 ]
{
};

void() s_plasma6 = [ 5, s_plasma7 ]
{
};

void() s_plasma5 = [ 4, s_plasma6 ]
{
};

void() s_plasma4 = [ 3, s_plasma5 ]
{
};

void() s_plasma3 = [ 2, s_plasma4 ]
{
};

void() s_plasma2 = [ 1, s_plasma3 ]
{
};

void() s_plasma1 = [ 0, s_plasma2 ]
{
};

void(vector org) plasmaexplo =
{
	local entity s;
	local float r;

	r = random();
	s = self;
	self = spawn();
	self.movetype = TE_SPIKE;
	self.velocity = VEC_ORIGIN;
	self.touch = SUB_Null;
	setmodel(self, /*11028i*/"sprites/plasma_explosion.spr");
	setorigin(self, org);
	self.solid = TE_SPIKE;
	s_plasma1();
	self = s;
};

void(vector org) pistolsmoke =
{
	local entity s;

	s = self;
	self = spawn();
	self.movetype = TE_LIGHTNING1;
	self.velocity = v_forward;
	self.velocity = (self.velocity * 80);
	self.touch = SUB_Null;
	setmodel(self, /*11069i*/"sprites/s_smoke2.spr");
	setorigin(self, ((org + (v_forward * 15)) + '0 0 12'));
	self.solid = TE_SPIKE;
	s_smokee1();
	self = s;
};

void() s_explode14 = [ 13, SUB_Remove ]
{
};

void() s_explode13 = [ 12, s_explode14 ]
{
};

void() s_explode12 = [ 11, s_explode13 ]
{
};

void() s_explode11 = [ 10, s_explode12 ]
{
};

void() s_explode10 = [ 9, s_explode11 ]
{
};

void() s_explode9 = [ 8, s_explode10 ]
{
};

void() s_explode8 = [ 7, s_explode9 ]
{
};

void() s_explode7 = [ 6, s_explode8 ]
{
};

void() s_explode6 = [ 5, s_explode7 ]
{
};

void() s_explode5 = [ 4, s_explode6 ]
{
};

void() s_explode4 = [ 3, s_explode5 ]
{
};

void() s_explode3 = [ 2, s_explode4 ]
{
};

void() s_explode2 = [ 1, s_explode3 ]
{
};

void() s_explode1 = [ 0, s_explode2 ]
{
};

void(vector org) CreateExplosion =
{
	local entity s;
	local float r;

	r = random();
	s = self;
	self = spawn();
	self.movetype = TE_SPIKE;
	self.velocity = VEC_ORIGIN;
	self.touch = SUB_Null;
	setmodel(self, /*11261i*/"progs/s_explod.spr");
	setorigin(self, org);
	self.solid = TE_SPIKE;
	sound(self, IT_SHOTGUN, "weapons/r_exp3.wav", IT_SHOTGUN, IT_SHOTGUN);
	s_explode1();
	self = s;
};

void(vector org) _TE_explosion =
{
	_EFF_PointEffect(org, TE_EXPLOSION);
	CreateExplosion(org);
};

void(vector org) _TE_gunshot =
{
	_EFF_PointEffect(org, IT_SUPER_SHOTGUN);
};

void(vector org) _TE_spike =
{
	_EFF_PointEffect(org, TE_SPIKE);
};

void(vector org) _TE_knightspike =
{
	_EFF_PointEffect(org, IT_SUPER_NAILGUN);
};

void(vector org) _TE_wizspike =
{
	_EFF_PointEffect(org, TE_WIZSPIKE);
};

void(vector org) _TE_superspike =
{
	_EFF_PointEffect(org, IT_SHOTGUN);
};

void(vector org) _TE_teleport =
{
	_EFF_PointEffect(org, TE_TELEPORT);
};

void(vector org) _TE_lavasplash =
{
	_EFF_PointEffect(org, TE_LAVASPLASH);
};

void(vector org) _TE_tarexplosion =
{
	_EFF_PointEffect(org, IT_NAILGUN);
};

void(entity ent, vector start, vector end) _TE_lightning1 =
{
	_EFF_BeamEffect(ent, start, end, TE_LIGHTNING1);
};

void(entity ent, vector start, vector end) _TE_lightning2 =
{
	_EFF_BeamEffect(ent, start, end, TE_LIGHTNING2);
};

void(entity ent, vector start, vector end) _TE_lightning3 =
{
	_EFF_BeamEffect(ent, start, end, TE_LIGHTNING3);
};

void(vector org) TE_lightningblood =
{

	particle(org, '0 0 100', 225, 120);
};
var void(vector org, float damage) SpawnBlood = _SpawnBlood;
var void(vector org) TE_explosion = _TE_explosion;
var void(vector org) TE_gunshot = _TE_gunshot;
var void(vector org) TE_spike = _TE_spike;
var void(vector org) TE_knightspike = _TE_knightspike;
var void(vector org) TE_wizspike = _TE_wizspike;
var void(vector org) TE_superspike = _TE_superspike;
var void(vector org) TE_teleport = _TE_teleport;
var void(vector org) TE_lavasplash = _TE_lavasplash;
var void(vector org) TE_tarexplosion = _TE_tarexplosion;
var void(entity ent, vector start, vector end) TE_lightning1 = _TE_lightning1;
var void(entity ent, vector start, vector end) TE_lightning2 = _TE_lightning2;
var void(entity ent, vector start, vector end) TE_lightning3 = _TE_lightning3;

void() EFF_SetEffects =
{
	if ((eng_support & IT_GRENADE_LAUNCHER))
	{
		ef_pent = IT_EXTRA_WEAPON;
		ef_red = IT_EXTRA_WEAPON;
	}
	if ((eng_support & IT_ROCKET_LAUNCHER))
	{
		ef_blue = IT_LIGHTNING;
		ef_quad = IT_LIGHTNING;
	}
	if ((eng_support & IT_NAILGUN))
	{
		TE_explosion = _te_explosion;
		TE_gunshot = _te_gunshot;
		TE_spike = _te_spike;
		TE_knightspike = _te_knightspike;
		TE_wizspike = _te_wizspike;
		TE_superspike = _te_superspike;
		TE_teleport = _te_teleport;
		TE_lavasplash = _te_lavasplash;
		TE_tarexplosion = _te_tarexplosion;
		TE_lightning1 = _te_lightning1;
		TE_lightning2 = _te_lightning2;
		TE_lightning3 = _te_lightning3;
	}
	if ((eng_support & IT_SUPER_NAILGUN))
	{
		SpawnBlood = _SpawnBlood_TEBlood;
	}
};

void(entity ent) VK_smallkick =
{
	self.punchangle_x = CONTENT_SOLID;
};

void(entity ent) VK_bigkick =
{
	self.punchangle_x = CONTENT_SLIME;
};

void(entity ent) VK_hugekick =
{

	self.punchangle_x = -8;
};

void() muzzleflash =
{
};

void(float damage) spawn_touchblood =
{
	local vector vel;

	vel = normalize(self.velocity);
	vel = normalize(((vel + (v_up * (random() - 0.5))) + (v_right * (random() - 0.5))));
	vel = vel + (IT_SUPER_SHOTGUN * trace_plane_normal);
	vel = vel * 0.4;
	SpawnBlood((self.origin + vel), damage);
};

void(entity client) NadeCounter =
{

	other = self;
	if ((client.selnade == TE_SPIKE))
	{
		stuffcmd(client, "cl_plasmanade 2\n");
		if ((client.nade_lives == IT_NAILGUN))
		{
			stuffcmd(client, "cl_nadenum 5\n");
		}
		if ((client.nade_lives == TE_EXPLOSION))
		{
			stuffcmd(client, "cl_nadenum 4\n");
		}
		if ((client.nade_lives == IT_SUPER_SHOTGUN))
		{
			stuffcmd(client, "cl_nadenum 3\n");
		}
		if ((client.nade_lives == IT_SHOTGUN))
		{
			stuffcmd(client, "cl_nadenum 2\n");
		}
		if ((client.nade_lives == TE_SPIKE))
		{
			stuffcmd(client, "cl_nadenum 1\n");
		}
	}
	else
	{
		if ((client.selnade == IT_SHOTGUN))
		{
			stuffcmd(client, "cl_plasmanade 1\n");
			if ((client.plasma_lives == IT_NAILGUN))
			{
				stuffcmd(client, "cl_nadenum 5\n");
			}
			if ((client.plasma_lives == TE_EXPLOSION))
			{
				stuffcmd(client, "cl_nadenum 4\n");
			}
			if ((client.plasma_lives == IT_SUPER_SHOTGUN))
			{
				stuffcmd(client, "cl_nadenum 3\n");
			}
			if ((client.plasma_lives == IT_SHOTGUN))
			{
				stuffcmd(client, "cl_nadenum 2\n");
			}
			if ((client.plasma_lives == TE_SPIKE))
			{
				stuffcmd(client, "cl_nadenum 1\n");
			}
		}
	}
};
