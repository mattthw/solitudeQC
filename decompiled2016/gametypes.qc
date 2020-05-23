//Decompiled code. Please respect the original copyright.
void() Start_Weapon;

void() Setup_Gametype =
{
#error Corrupt Function: Setup_Gametype
#if 0
	local entity spot;
	local float wtemp;

	Slowmo_Deactivate();
	setmodel(self, /*19073i*/"progs/eyes.mdl");
	modelindex_eyes = self.modelindex;
	setmodel(self, /*18876i*/"progs/plyr.mdl");
	modelindex_dead = self.modelindex;
	setmodel(self, /*18891i*/"progs/player.mdl");
	modelindex_playernail = self.modelindex;
	setmodel(self, /*18908i*/"progs/player_shot.mdl");
	modelindex_playershot = self.modelindex;
	setmodel(self, /*18930i*/"progs/player_snail.mdl");
	modelindex_playersnail = self.modelindex;
	setmodel(self, /*18953i*/"progs/player_sshot.mdl");
	modelindex_playersshot = self.modelindex;
	setmodel(self, /*18976i*/"progs/player_needler.mdl");
	modelindex_playerneedler = self.modelindex;
	setmodel(self, /*19001i*/"progs/player_rocket.mdl");
	modelindex_playerrocket = self.modelindex;
	setmodel(self, /*19025i*/"progs/player_sniper.mdl");
	modelindex_playersniper = self.modelindex;
	setmodel(self, /*19049i*/"progs/player_plasma.mdl");
	modelindex_playerplasma = self.modelindex;
	setmodel(self, /*18891i*/"progs/player.mdl");
	modelindex_playerbr = self.modelindex;
	if ((self.ishuman == IT_SHOTGUN))
	{
		stuffcmd(self, "r_drawviewmodel 1\n");
	}
	do_tail
	{
		self.classname = "player";
		self.health = 130;
		self.takedamage = IT_SUPER_SHOTGUN;
		self.solid = TE_EXPLOSION;
		self.movetype = TE_EXPLOSION;
		self.max_health = 130;
		self.flags = IT_SUPER_NAILGUN;
		self.air_finished = (time + 12);
		self.waterdmg = IT_SUPER_SHOTGUN;
		self.effects = TE_SPIKE;
		self.suicide_time = (time + TE_EXPLOSION);
		self.weaponstate = TE_SPIKE;
		DecodeLevelParms();
		wtemp = self.weapon;
		self.weapon = TE_SPIKE;
		W_WeaponSwitch(wtemp);
		self.attack_finished = time;
		self.th_pain = player_pain;
		self.th_die = PlayerDie;
		self.deadflag = TE_SPIKE;
		spot = SelectSpawnPoint();
		Start_Weapon();
		self.origin = (spot.origin + '0 0 1');
		self.angles = spot.angles;
		self.fixangle = IT_SHOTGUN;
		setsize(self, VEC_HULL_MIN, VEC_HULL_MAX);
		self.view_ofs = '0 0 22';
		self.velocity = VEC_ORIGIN;
		player_stand1();
		makevectors(self.angles);
		spawn_tfog((self.origin + (v_forward * 20)));
		spawn_tdeath(self.origin, self);
		rj = cvar(/*24379i*/"rj");
		self.needles = TE_SPIKE;
		self.pfov = 90;
		Set_FOV(self.pfov);
		self.weaponheat = TE_SPIKE;
		stuffcmd(self, "chase_active 0\n");
		NadeCounter(self);
	}
	else
	{
		do
		{
			self.classname = "player";
			self.health = 130;
			self.takedamage = IT_SUPER_SHOTGUN;
			self.solid = TE_EXPLOSION;
			self.movetype = TE_EXPLOSION;
			self.max_health = 130;
			self.flags = IT_SUPER_NAILGUN;
			self.air_finished = (time + 12);
			self.waterdmg = IT_SUPER_SHOTGUN;
			self.effects = TE_SPIKE;
			self.suicide_time = (time + TE_EXPLOSION);
			self.weaponstate = TE_SPIKE;
			DecodeLevelParms();
			wtemp = self.weapon;
			self.weapon = TE_SPIKE;
			W_WeaponSwitch(wtemp);
			self.attack_finished = time;
			self.th_pain = player_pain;
			self.th_die = PlayerDie;
			self.deadflag = TE_SPIKE;
			spot = SelectSpawnPoint();
			Start_Weapon();
			self.origin = (spot.origin + '0 0 1');
			self.angles = spot.angles;
			self.fixangle = IT_SHOTGUN;
			setsize(self, VEC_HULL_MIN, VEC_HULL_MAX);
			self.view_ofs = '0 0 22';
			self.velocity = VEC_ORIGIN;
			player_stand1();
			makevectors(self.angles);
			spawn_tfog((self.origin + (v_forward * 20)));
			spawn_tdeath(self.origin, self);
			rj = cvar(/*24379i*/"rj");
			self.needles = TE_SPIKE;
			self.pfov = 90;
			Set_FOV(self.pfov);
			self.weaponheat = TE_SPIKE;
			stuffcmd(self, "chase_active 0\n");
			NadeCounter(self);
		}
		else
		{
			do
			{
				self.classname = "player";
				self.health = SVC_INTERMISSION;
				self.takedamage = IT_SUPER_SHOTGUN;
				self.solid = TE_EXPLOSION;
				self.movetype = TE_EXPLOSION;
				self.max_health = SVC_INTERMISSION;
				self.flags = IT_SUPER_NAILGUN;
				self.air_finished = (time + 12);
				self.waterdmg = IT_SUPER_SHOTGUN;
				self.effects = TE_SPIKE;
				self.suicide_time = (time + TE_EXPLOSION);
				self.weaponstate = TE_SPIKE;
				DecodeLevelParms();
				wtemp = self.weapon;
				self.weapon = TE_SPIKE;
				self.slowmo = TE_LIGHTNING1;
				MAX_SLOWMO = IT_SUPER_NAILGUN;
				self.slowmo_flags = TE_SPIKE;
				W_WeaponSwitch(wtemp);
				self.attack_finished = time;
				self.th_pain = player_pain;
				self.th_die = PlayerDie;
				self.deadflag = TE_SPIKE;
				spot = SelectSpawnPoint();
				Start_Weapon();
				self.origin = (spot.origin + '0 0 1');
				self.angles = spot.angles;
				self.fixangle = IT_SHOTGUN;
				setsize(self, VEC_HULL_MIN, VEC_HULL_MAX);
				self.view_ofs = '0 0 22';
				self.velocity = VEC_ORIGIN;
				player_stand1();
				makevectors(self.angles);
				spawn_tfog((self.origin + (v_forward * 20)));
				spawn_tdeath(self.origin, self);
				rj = cvar(/*24379i*/"rj");
				self.needles = TE_SPIKE;
				self.pfov = 90;
				Set_FOV(self.pfov);
				self.weaponheat = TE_SPIKE;
				stuffcmd(self, "chase_active 0\n");
				self.nade_lives = TE_SPIKE;
				self.plasma_lives = TE_SPIKE;
				NadeCounter(self);
				Update_Slowmo(self);
				localcmd(/*24398i*/"fraglimit 50\n");
			}
			else
			{

			} while ((deathmatch == IT_SHOTGUN));

		} while ((deathmatch == IT_SUPER_SHOTGUN));

	} while ((deathmatch == TE_EXPLOSION));
}
}
}
#endif
};

void() Start_Weapon =
{
#error Corrupt Function: Start_Weapon
#if 0

	do_tail
	{
		self.items = TE_LIGHTNING1;
		self.ammo_nails = W_GetMaxClip(self.weapon, IT_NAILGUN);
		self.exnails = 560;
		self.ammo_shells = 12;
		self.exshells = 60;
		self.currentammo = W_GetMaxClip(self.weapon, IT_NAILGUN);
		self.weapon = IT_NAILGUN;
		W_UpdateWeapon();
		W_UpdateAmmoCounts(self);
	}
	else
	{
		do
		{
			self.items = IT_SUPER_NAILGUN;
			self.ammo_hshells = 60;
			self.exhshells = 320;
			self.weapon = IT_SUPER_NAILGUN;
			W_UpdateWeapon();
			W_UpdateAmmoCounts(self);
		}
		else
		{
			do
			{
				self.items = IT_SHOTGUN;
				self.ammo_shells = 12;
				self.exshells = 9999999;
				self.weapon = IT_SHOTGUN;
				W_UpdateWeapon();
				W_UpdateAmmoCounts(self);
			}
			else
			{

			} while ((deathmatch == IT_SHOTGUN));

		} while ((deathmatch == IT_SUPER_SHOTGUN));

	} while ((deathmatch == TE_EXPLOSION));
}
}
}
#endif
};
