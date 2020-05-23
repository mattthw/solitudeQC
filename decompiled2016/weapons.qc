//Decompiled code. Please respect the original copyright.
vector puff_org;
void() player_run;
void() SuperDamageSound;
void() player_reload1;
void() player_stand1;
void() Setup_Gametype;
void(entity client) Update_Slowmo;
void(entity client) Slowmo;
void(entity client, float howmuch) Add_Slowmo;
void(entity client, float howmuch) Firefight_Scoring;
void(float wtype, float ttype) ThrowWeapon;

void() W_Precache =
{
	precache_sound(/*11280i*/"weapons/r_exp3.wav");
	precache_sound(/*13926i*/"weapons/uzi.wav");
	precache_sound(/*13942i*/"weapons/sgun1.wav");
	precache_sound(/*13960i*/"weapons/grenade.wav");
	precache_sound(/*13980i*/"weapons/pistol.wav");
	precache_sound(/*13635i*/"weapons/bounce.wav");
	precache_sound(/*13999i*/"weapons/sniper.wav");
	precache_sound(/*14018i*/"weapons/shottie.wav");
	precache_sound(/*14038i*/"weapons/needler.wav");
	precache_sound(/*14058i*/"weapons/ar1.wav");
	precache_model(/*14074i*/"progs/PL_BULL.spr");
	precache_model(/*11069i*/"sprites/s_smoke2.spr");
	precache_model(/*10790i*/"progs/needler_dust.spr");
	precache_model(/*14092i*/"progs/plasma_glow.spr");
	precache_model(/*14114i*/"progs/plasma.mdl");
	precache_sound(/*14131i*/"weapons/ppist.wav");
	precache_sound(/*13459i*/"weapons/grenpick.wav");
	precache_sound(/*14149i*/"weapons/br_fire.wav");
	precache_sound(/*14169i*/"weapons/w_drop1.wav");
	precache_sound(/*14189i*/"weapons/w_drop2.wav");
	precache_sound(/*14209i*/"weapons/w_drop3.wav");
	precache_sound(/*14229i*/"steps/boot1.wav");
	precache_sound(/*14245i*/"steps/boot2.wav");
	precache_sound(/*14261i*/"steps/boot3.wav");
	precache_sound(/*14277i*/"steps/boot4.wav");
	precache_sound(/*14293i*/"slayer.wav");
	precache_model(/*14304i*/"progs/v_shotgun.mdl");
	precache_model(/*14324i*/"progs/v_rocket.mdl");
	precache_model(/*14343i*/"progs/v_uzi.mdl");
	precache_model(/*14359i*/"progs/v_sniper.mdl");
	precache_model(/*14378i*/"progs/v_plpist.mdl");
	precache_model(/*14397i*/"progs/v_needle.mdl");
	precache_model(/*14416i*/"progs/v_plrifle.mdl");
	precache_model(/*14436i*/"progs/v_nail.mdl");
	precache_model(/*14453i*/"progs/v_skull.mdl");
	precache_model(/*14471i*/"progs/v_br.mdl");
	precache_sound(/*14486i*/"weapons/reload/pistol.wav");
	precache_sound(/*14512i*/"weapons/reload/needler.wav");
	precache_sound(/*14539i*/"weapons/reload/ar.wav");
	precache_sound(/*14561i*/"weapons/reload/sniper.wav");
	precache_sound(/*14587i*/"weapons/reload/uzi.wav");
	precache_sound(/*14610i*/"weapons/reload/rocket.wav");
	precache_sound(/*14636i*/"weapons/reload/shottie.wav");
	precache_sound(/*14663i*/"weapons/melee/needler.wav");
	precache_sound(/*14689i*/"weapons/melee/pistol.wav");
	precache_model(/*13501i*/"progs/fraggren.mdl");
	precache_model(/*13530i*/"progs/plasgren.mdl");
	precache_model(/*11028i*/"sprites/plasma_explosion.spr");
	precache_sound(/*13727i*/"weapons/plasma_blow.wav");
	precache_sound(/*14714i*/"weapons/plasma_throw.wav");
	precache_sound(/*13395i*/"weapons/pbounce.wav");
	if ((deathmatch == TE_EXPLOSION))
	{
		precache_model(/*14739i*/"progs/bullet.mdl");
	}
	precache_model(/*14756i*/"progs/sniperbullet.mdl");
	precache_model(/*14779i*/"progs/needproy.mdl");
	precache_model(/*14798i*/"progs/Bigneedproy.mdl");
	precache_model(/*14820i*/"progs/needpro2.mdl");
	precache_model(/*14839i*/"sprites/muzzleflash.spr");
	precache_model(/*14863i*/"sprites/muzzleflash1.spr");
	precache_model(/*14888i*/"sprites/muzzleflash2.spr");
	precache_model(/*14913i*/"sprites/pistolmuzzleflash.spr");
	precache_model(/*14943i*/"sprites/muzzleN.spr");
	precache_sound(/*14963i*/"weapons/zoom.wav");
	precache_sound(/*14980i*/"weapons/zoom2.wav");
	precache_sound(/*14998i*/"weapons/nb.wav");
	precache_sound(/*15013i*/"weapons/crystal.wav");
	precache_sound(/*15033i*/"weapons/equip/ar.wav");
	precache_sound(/*15054i*/"weapons/equip/needler.wav");
	precache_sound(/*15080i*/"weapons/equip/rocket.wav");
	precache_sound(/*15105i*/"weapons/equip/pistol.wav");
	precache_sound(/*15130i*/"weapons/equip/shotgun.wav");
	precache_sound(/*15156i*/"weapons/equip/sniper.wav");
	precache_sound(/*15181i*/"weapons/equip/ppist.wav");
	precache_sound(/*15205i*/"weapons/equip/smg.wav");
	precache_sound(/*15227i*/"weapons/equip/br.wav");
	precache_model(/*15248i*/"progs/g_shot.mdl");
	precache_model(/*15265i*/"progs/g_pistol.mdl");
	precache_model(/*15284i*/"progs/g_nail.mdl");
	precache_model(/*15301i*/"progs/g_uzi.mdl");
	precache_model(/*15317i*/"progs/g_rocket.mdl");
	precache_model(/*15336i*/"progs/g_sniper.mdl");
	precache_model(/*15355i*/"progs/g_needler.mdl");
	precache_model(/*15375i*/"progs/g_plpist.mdl");
};

void() muzzleflash_think =
{
	self.frame = (self.frame + IT_SHOTGUN);
	self.think = SUB_Remove;
	self.nextthink = (time + 0.02);
};

void() muzzleflash2 =
{
	local entity muzzle;

	muzzle = spawn();
	muzzle.owner = self;
	muzzle.solid = TE_SPIKE;
	setmodel(muzzle, /*14863i*/"sprites/muzzleflash1.spr");
	setorigin(muzzle, (((self.origin + (v_forward * SVC_FOUNDSECRET)) + (v_right * TE_LIGHTNING2)) + '0 0 19'));
	muzzle.think = muzzleflash_think;
	muzzle.nextthink = (time + 0.01);
};

void() muzzleflash_think1 =
{
	self.frame = (self.frame + IT_SHOTGUN);
	self.think = SUB_Remove;
	self.nextthink = (time + 0.01);
};

void() muzzleflash3 =
{
	local entity muzzle;

	muzzle = spawn();
	muzzle.owner = self;
	muzzle.solid = TE_SPIKE;
	muzzle.movetype = TE_SPIKE;
	setmodel(muzzle, /*14839i*/"sprites/muzzleflash.spr");
	setorigin(muzzle, (((self.origin + (v_forward * 35)) + (v_right * TE_LIGHTNING1)) + '0 0 15'));
	muzzle.think = muzzleflash_think1;
	muzzle.nextthink = (time + 0.01);
};

void() muzzleflash_think2 =
{
	self.frame = (self.frame + IT_SHOTGUN);
	self.think = SUB_Remove;
	self.nextthink = (time + 0.02);
};

void() muzzleflash4 =
{
	local entity muzzle;

	muzzle = spawn();
	muzzle.owner = self;
	muzzle.solid = TE_SPIKE;
	muzzle.movetype = TE_SPIKE;
	setmodel(muzzle, /*14888i*/"sprites/muzzleflash2.spr");
	setorigin(muzzle, (((self.origin + (v_forward * 55)) + (v_right * TE_LAVASPLASH)) + '0 0 13'));
	muzzle.think = muzzleflash_think1;
	muzzle.nextthink = (time + 0.01);
};

void() muzzleflash5 =
{
	local entity muzzle;

	muzzle = spawn();
	muzzle.owner = self;
	muzzle.solid = TE_SPIKE;
	muzzle.movetype = TE_SPIKE;
	setmodel(muzzle, /*14913i*/"sprites/pistolmuzzleflash.spr");
	setorigin(muzzle, (((self.origin + (v_forward * SVC_INTERMISSION)) + (v_right * IT_SUPER_NAILGUN)) + '0 0 20'));
	muzzle.think = muzzleflash_think2;
	muzzle.nextthink = (time + 0.01);
};

void() muzzleflash_think3 =
{
	self.frame = (self.frame + IT_SHOTGUN);
	self.think = SUB_Remove;
	self.nextthink = (time + 0.01);
};

void() muzzleflash_think6 =
{
	self.frame = (self.frame + IT_SUPER_SHOTGUN);
	self.think = SUB_Remove;
	self.nextthink = (time + 0.02);
};

void() muzzleflash6 =
{
	local entity muzzle;

	muzzle = spawn();
	muzzle.owner = self;
	muzzle.solid = TE_SPIKE;
	muzzle.movetype = TE_SPIKE;
	setmodel(muzzle, /*14943i*/"sprites/muzzleN.spr");
	setorigin(muzzle, (((self.origin + (v_forward * 35)) + (v_right * TE_LAVASPLASH)) + '0 0 17'));
	muzzle.think = muzzleflash_think6;
	muzzle.nextthink = (time + 0.01);
};

void() muzzleflash7 =
{
	local entity muzzle;

	muzzle = spawn();
	muzzle.owner = self;
	muzzle.solid = TE_SPIKE;
	muzzle.movetype = TE_SPIKE;
	setmodel(muzzle, /*14839i*/"sprites/muzzleflash.spr");
	setorigin(muzzle, (((self.origin + (v_forward * 45)) + (v_right * IT_SUPER_SHOTGUN)) + '0 0 17'));
	muzzle.think = muzzleflash_think1;
	muzzle.nextthink = (time + 0.01);
};
void() W_UpdateWeapon;

void(entity ent) W_UpdateAmmoCounts =
{
#error Corrupt Function: W_UpdateAmmoCounts
#if 0
	do_tail
	{
		ent.currentammo = ent.ammo_shells;
		ent.armorvalue = ent.exshells;
	}
	else
	{
		do
		{
			ent.currentammo = ent.ammo_shells;
			ent.armorvalue = ent.exshells;
		}
		else
		{
			do
			{
				ent.currentammo = ent.ammo_shells2;
				ent.armorvalue = ent.exshells2;
			}
			else
			{
				do
				{
					ent.currentammo = ent.ammo_nails;
					ent.armorvalue = ent.exnails;
				}
				else
				{
					do
					{
						ent.currentammo = ent.ammo_hshells;
						ent.armorvalue = ent.exhshells;
					}
					else
					{
						do
						{
							ent.currentammo = ent.ammo_rockets;
							ent.armorvalue = ent.exrockets;
						}
						else
						{
							do
							{
								ent.currentammo = ent.ammo_sniper;
								ent.armorvalue = ent.exsniper;
							}
							else
							{
								do
								{
									ent.currentammo = ent.ammo_ppistol;
									ent.armorvalue = ent.exppistol;
								}
								else
								{
									do
									{
										ent.currentammo = ent.ammo_sword;
										ent.armorvalue = ent.exsword;
									}
									else
									{
										do
										{
											ent.currentammo = ent.ammo_needler;
											ent.armorvalue = ent.exneedler;
										}
										else
										{
											do
											{
												ent.currentammo = ent.ammo_prifle;
												ent.armorvalue = ent.exprifle;
											}
											else
											{
												do
												{
													ent.currentammo = ent.ammo_br;
													ent.armorvalue = ent.exbr;
												}
												else
												{
													do
													{
														ent.currentammo = 12;
													}
													else
													{

													} while ((ent.weapon == IT_SHOTGUN));

												} while ((ent.weapon == IT_SKULL));

											} while ((ent.weapon == IT_SUPER_SHOTGUN));

										} while ((ent.weapon == IT_NAILGUN));

									} while ((ent.weapon == IT_SUPER_NAILGUN));

								} while ((ent.weapon == IT_ROCKET_LAUNCHER));

							} while ((ent.weapon == IT_GRENADE_LAUNCHER));

						} while ((ent.weapon == IT_LIGHTNING));

					} while ((ent.weapon == IT_AXE));

				} while ((ent.weapon == IT_EXTRA_WEAPON));

			} while ((ent.weapon == IT_EXTRA_WEAPON2));

		} while ((ent.weapon == IT_BR));
	} while(1);
}
}
}
}
}
}
}
}
}
}
}
}
}
#endif
};

float(float t_wep) W_BulletDamage =
{
#error Corrupt Function: W_BulletDamage
#if 0

	do_tail
	{
		if ((trace_endpos_z > (trace_ent.origin_z + 20)))
		{
			return (200);
		}
		return (70);
	}
	else
	{
		do
		{
			if ((trace_endpos_z > (trace_ent.origin_z + 20)))
			{
				return (40);
			}
			return (15);
		}
		else
		{
			do
			{
				return (1.5);
			}
			else
			{
				do
				{
					return (6.5);
				}
				else
				{
					do
					{
						return (15);
					}
					else
					{
						do
						{
							return (20);
						}
						else
						{
							do
							{
								return (IT_NAILGUN);
							}
							else
							{

							} while ((t_wep == IT_GRENADE_LAUNCHER));

						} while ((t_wep == IT_SHOTGUN));

					} while ((t_wep == IT_SUPER_NAILGUN));

				} while ((t_wep == IT_NAILGUN));

			} while ((t_wep == IT_SUPER_SHOTGUN));

		} while ((t_wep == IT_BR));
	} while(1);
}
}
}
}
}
}
}
return (IT_NAILGUN);
#endif
};

float(float wep, float cliptype) W_GetMaxClip =
{
#error Corrupt Function: W_GetMaxClip
#if 0

	do_tail
	{
		if (cliptype)
		{
			return (12);
		}
		else
		{
			return (90);
		}
	}
	else
	{
		do
		{
			if (cliptype)
			{
				return (12);
			}
			else
			{
				return (90);
			}
		}
		else
		{
			do
			{
				if (cliptype)
				{
					return (TE_LIGHTNING2);
				}
				else
				{
					return (SVC_INTERMISSION);
				}
			}
			else
			{
				do
				{
					if (cliptype)
					{
						return (IT_ROCKET_LAUNCHER);
					}
					else
					{
						return (560);
					}
				}
				else
				{
					do
					{
						if (cliptype)
						{
							return (60);
						}
						else
						{
							return (560);
						}
					}
					else
					{
						do
						{
							if (cliptype)
							{
								return (IT_SUPER_SHOTGUN);
							}
							else
							{
								return (TE_LIGHTNING2);
							}
						}
						else
						{
							do
							{
								if (cliptype)
								{
									return (IT_NAILGUN);
								}
								else
								{
									return (20);
								}
							}
							else
							{
								do
								{
									if (cliptype)
									{
										return (100);
									}
									else
									{
										return (90);
									}
								}
								else
								{
									do
									{
										if (cliptype)
										{
											return (TE_SPIKE);
										}
										else
										{
											return (TE_SPIKE);
										}
									}
									else
									{
										do
										{
											if (cliptype)
											{
												return (20);
											}
											else
											{
												return (80);
											}
										}
										else
										{
											do
											{
												if (cliptype)
												{
													return (100);
												}
												else
												{
													return (90);
												}
											}
											else
											{
												do
												{
													if (cliptype)
													{
														return (36);
													}
													else
													{
														return (108);
													}
												}
												else
												{
													do
													{
														if (cliptype)
														{
															return (IT_SHOTGUN);
														}
														else
														{
															return (90);
														}
													}
													else
													{

													} while ((wep == IT_SHOTGUN));

												} while ((wep == IT_SKULL));

											} while ((wep == IT_SUPER_SHOTGUN));

										} while ((wep == IT_NAILGUN));

									} while ((wep == IT_SUPER_NAILGUN));

								} while ((wep == IT_ROCKET_LAUNCHER));

							} while ((wep == IT_GRENADE_LAUNCHER));

						} while ((wep == IT_LIGHTNING));

					} while ((wep == IT_AXE));

				} while ((wep == IT_EXTRA_WEAPON));

			} while ((wep == IT_EXTRA_WEAPON2));

		} while ((wep == IT_BR));
	} while(1);
}
}
}
}
}
}
}
}
}
}
}
}
}
return (IT_SHOTGUN);
#endif
};

float(entity ent) W_CanFire =
{
#error Corrupt Function: W_CanFire
#if 0
	do_tail
	{
		return (IT_SHOTGUN);
	}
	else
	{
		do
		{
			if ((ent.ammo_shells <= TE_SPIKE))
			{
				return (TE_SPIKE);
			}
		}
		else
		{
			do
			{
				if ((ent.ammo_shells <= TE_SPIKE))
				{
					return (IT_SHOTGUN);
				}
			}
			else
			{
				do
				{
					if ((ent.ammo_shells2 <= TE_SPIKE))
					{
						return (TE_SPIKE);
					}
				}
				else
				{
					do
					{
						if ((ent.ammo_nails <= TE_SPIKE))
						{
							return (TE_SPIKE);
						}
					}
					else
					{
						do
						{
							if ((ent.ammo_hshells <= TE_SPIKE))
							{
								return (TE_SPIKE);
							}
						}
						else
						{
							do
							{
								if ((ent.ammo_rockets <= TE_SPIKE))
								{
									return (TE_SPIKE);
								}
							}
							else
							{
								do
								{
									if ((ent.ammo_sniper <= TE_SPIKE))
									{
										return (TE_SPIKE);
									}
								}
								else
								{
									do
									{
										if ((ent.ammo_ppistol <= TE_SPIKE))
										{
											return (TE_SPIKE);
										}
									}
									else
									{
										do
										{
											if ((ent.ammo_sword <= TE_SPIKE))
											{
												return (TE_SPIKE);
											}
										}
										else
										{
											do
											{
												if ((ent.ammo_needler <= TE_SPIKE))
												{
													return (TE_SPIKE);
												}
											}
											else
											{
												do
												{
													if ((ent.ammo_prifle <= TE_SPIKE))
													{
														return (TE_SPIKE);
													}
												}
												else
												{
													do
													{
														if ((ent.ammo_br <= TE_SPIKE))
														{
															return (TE_SPIKE);
														}
													}
													else
													{
														do
														{
															return (IT_SHOTGUN);
														}
														else
														{

														} while ((ent.weapon == IT_AXE));

													} while ((ent.weapon == IT_SHOTGUN));

												} while ((ent.weapon == IT_SKULL));

											} while ((ent.weapon == IT_SUPER_SHOTGUN));

										} while ((ent.weapon == IT_NAILGUN));

									} while ((ent.weapon == IT_SUPER_NAILGUN));

								} while ((ent.weapon == IT_ROCKET_LAUNCHER));

							} while ((ent.weapon == IT_GRENADE_LAUNCHER));

						} while ((ent.weapon == IT_LIGHTNING));

					} while ((ent.weapon == IT_AXE));

				} while ((ent.weapon == IT_EXTRA_WEAPON));

			} while ((ent.weapon == IT_EXTRA_WEAPON2));

		} while ((ent.weapon == IT_BR));
	} while(1);
}
}
}
}
}
}
}
}
}
}
}
}
}
}
return (IT_SHOTGUN);
#endif
};

void() Draw_Scope =
{
	if ((self.pfov < 90))
	{
		stuffcmd(self, "cl_scope 1\n");
		stuffcmd(self, "r_drawviewmodel 0\n");
	}
	else
	{
		stuffcmd(self, "cl_scope 0\n");
		stuffcmd(self, "r_drawviewmodel 1\n");
	}
};

void(float famt) Set_FOV =
{

	stuffcmd(self, "fov ");
	stuffcmd(self, ftos(famt));
	stuffcmd(self, "\n");
	Draw_Scope();
};

void() WeaponZoom =
{
#error Corrupt Function: WeaponZoom
#if 0
	local float tozoom;

	if ((self.health < IT_SHOTGUN))
	{
		return;
	}
	do_tail
	{
		if ((self.pfov < 90))
		{
			tozoom = 15;
			sound(self, TE_SPIKE, "weapons/zoom.wav", IT_SHOTGUN, IT_SHOTGUN);
		}
		else
		{
			tozoom = 45;
			sound(self, TE_SPIKE, "weapons/zoom2.wav", IT_SHOTGUN, IT_SHOTGUN);
		}
	}
	else
	{
		do
		{
			tozoom = 45;
			sound(self, TE_SPIKE, "weapons/zoom2.wav", IT_SHOTGUN, IT_SHOTGUN);
		}
		else
		{
			do
			{
				tozoom = 45;
				sound(self, TE_SPIKE, "weapons/zoom2.wav", IT_SHOTGUN, IT_SHOTGUN);
			}
			else
			{
				do
				{
					tozoom = 45;
					sound(self, TE_SPIKE, "weapons/zoom2.wav", IT_SHOTGUN, IT_SHOTGUN);
				}
				else
				{
					do
					{
						tozoom = 90;
					}
					else
					{

					} while ((self.weapon == IT_GRENADE_LAUNCHER));

				} while ((self.weapon == IT_SHOTGUN));

			} while ((self.weapon == IT_BR));

		} while ((self.weapon == IT_ROCKET_LAUNCHER));
	} while(1);
}
}
}
}
}
if ((self.pfov == tozoom))
{
tozoom = 90;
}
self.pfov = tozoom;
Set_FOV(tozoom);
#endif
};

void(float lunge) W_FireSword =
{
	local vector source;
	local vector org;

	makevectors(self.v_angle);
	source = self.origin + '0 0 16';
	traceline(source, (source + (v_forward * IT_LIGHTNING)), TE_SPIKE, self);
	if ((trace_fraction == IT_SHOTGUN))
	{
		return;
	}
	org = trace_endpos - (v_forward * IT_NAILGUN);
	if (trace_ent.takedamage)
	{
		SpawnBlood(org, 20);
		if (lunge)
		{
			T_Damage(trace_ent, self, self, 150, IT_SHOTGUN);
		}
		else
		{
			T_Damage(trace_ent, self, self, 75, IT_SHOTGUN);
		}
	}
	else
	{
		sound(self, IT_SHOTGUN, "player/axhit2.wav", IT_SHOTGUN, IT_SHOTGUN);
		TE_gunshot(org);
	}
};

void(vector org, vector vel) SpawnMeatSpray =
{
	local entity missile;

	missile = spawn();
	missile.owner = self;
	missile.movetype = TE_LAVASPLASH;
	missile.solid = TE_SPIKE;
	makevectors(self.angles);
	missile.velocity = vel;
	missile.velocity_z = ((missile.velocity_z + 250) + (50 * random()));
	missile.avelocity = '3000 1000 2000';
	missile.nextthink = (time + IT_SHOTGUN);
	missile.think = SUB_Remove;
	setmodel(missile, /*15761i*/"progs/zom_gib.mdl");
	setsize(missile, VEC_ORIGIN, VEC_ORIGIN);
	setorigin(missile, org);
};
entity multi_ent;
float multi_damage;
float multi_mod;
vector blood_org;
float blood_count;
float puff_count;

void() ClearMultiDamage =
{
	multi_ent = world;
	multi_damage = TE_SPIKE;
	blood_count = TE_SPIKE;
	puff_count = TE_SPIKE;
	multi_mod = TE_SPIKE;
};

void() ApplyMultiDamage =
{
	if (!multi_ent)
	{
		return;
	}
	T_Damage(multi_ent, self, self, multi_damage, multi_mod);
};

void(entity hit, float damage, float mod) AddMultiDamage =
{
	if (!hit)
	{
		return;
	}
	if (((hit != multi_ent) || (mod != multi_mod)))
	{
		ApplyMultiDamage();
		multi_damage = damage;
		multi_ent = hit;
	}
	else
	{
		multi_damage = multi_damage + damage;
	}
};

void() Multi_Finish =
{
	if (puff_count)
	{
		TE_gunshot(puff_org);
	}
	if (blood_count)
	{
		SpawnBlood(blood_org, blood_count);
	}
};

void(float damage, vector dir, float mod) TraceAttack =
{
	local vector vel;
	local vector org;

	vel = normalize(((dir + (v_up * (IT_SUPER_SHOTGUN * (random() + -0.5)))) + (v_right * (IT_SUPER_SHOTGUN * (random() + -0.5)))));
	vel = vel + (IT_SUPER_SHOTGUN * trace_plane_normal);
	vel = vel * 200;
	org = trace_endpos - (dir * IT_NAILGUN);
	if ((trace_ent.takedamage && (trace_ent.health <= SVC_INTERMISSION)))
	{
		blood_count = blood_count + IT_SHOTGUN;
		blood_org = org;
		AddMultiDamage(trace_ent, damage, mod);
	}
	else
	{
		if ((trace_ent.health > SVC_INTERMISSION))
		{
			particle(org, VEC_ORIGIN, 109, TE_LIGHTNING2);
			puff_org = org;
			AddMultiDamage(trace_ent, damage, mod);
		}
		else
		{
			if (!trace_ent.takedamage)
			{
				particle(org, VEC_ORIGIN, TE_TELEPORT, IT_SUPER_NAILGUN);
				puff_org = org;
			}
			else
			{
				puff_count = puff_count + IT_SHOTGUN;
			}
		}
	}
};

void(float shotcount, vector dir, vector spread, float mod) FireBullets =
{
	local vector direction;
	local vector src;

	makevectors(self.v_angle);
	src = self.origin + (v_forward * TE_LAVASPLASH);
	src_z = self.absmin_z + (self.size_z * 0.7);
	ClearMultiDamage();
	traceline(src, (src + (dir * IT_CELLS)), TE_SPIKE, self);
	puff_org = trace_endpos - (dir * IT_NAILGUN);
	while ((shotcount > TE_SPIKE))
	{
		direction = (dir + (((IT_SUPER_SHOTGUN * (random() + -0.5)) * spread_x) * v_right)) + (((IT_SUPER_SHOTGUN * (random() + -0.5)) * spread_y) * v_up);
		traceline(src, (src + (direction * IT_CELLS)), TE_SPIKE, self);
		if ((trace_fraction != IT_SHOTGUN))
		{
			TraceAttack(W_BulletDamage(self.weapon), direction, mod);
		}
		shotcount = shotcount - IT_SHOTGUN;
	}
	ApplyMultiDamage();
	Multi_Finish();
};

void() Rocket_Explode0 =
{

	self.velocity = VEC_ORIGIN;
	if ((pointcontents(self.origin) == CONTENT_SKY))
	{
		remove(self);
		return;
	}
	T_RadiusDamage(self, self.owner, 180, 180, world, TE_WIZSPIKE);
	self.origin = (self.origin - (15 * normalize(self.velocity)));
	CreateExplosion(self.origin);
	remove(self);
};

void() remove_bullet =
{
	remove(self);
};

void(vector org) Pistol_Touch =
{
	local vector p_a;
	local vector p_b;
	local float zdif;

	self.velocity = VEC_ORIGIN;
	if ((pointcontents(self.origin) == CONTENT_SKY))
	{
		remove_bullet();
		return;
	}
	if (other.takedamage)
	{
		p_a_z = self.origin_z;
		p_b_z = other.origin_z;
		zdif = vlen((p_a - p_b));
		if ((zdif > 20))
		{
			T_Damage(other, self, self.owner, 50, 666);
		}
		else
		{
			spawn_touchblood(IT_SUPER_NAILGUN);
			T_Damage(other, self, self.owner, TE_LIGHTNING2, 666);
		}
	}
	else
	{
		particle(self.origin, VEC_ORIGIN, TE_LIGHTNING2, TE_LAVASPLASH);
		puff_org = self.origin;
	}
	self.model = "";
	self.nextthink = (time + IT_SHOTGUN);
	self.think = remove_bullet;
};

void() W_FirePistol =
{
#error Corrupt Function: W_FirePistol
#if 0
	local vector dir;
	local entity missile;

	sound(self, IT_SHOTGUN, "weapons/pistol.wav", IT_SHOTGUN, IT_SHOTGUN);
	VK_smallkick(self);
	self.ammo_shells = (self.ammo_shells - IT_SHOTGUN);
	W_UpdateAmmoCounts(self);
	do_tail
	{
		dir = aim(self, 1000);
		pistolsmoke(self.origin);
		missile = spawn();
		missile.owner = self;
		missile.movetype = TE_LIGHTNING3;
		missile.solid = IT_SUPER_SHOTGUN;
		missile.classname = "Pistol";
		makevectors(self.v_angle);
		missile.velocity = aim(self, 1000);
		missile.velocity = v_forward;
		missile.velocity = (missile.velocity * 4000);
		missile.angles = vectoangles(missile.velocity);
		missile.touch = Pistol_Touch;
		setmodel(missile, /*14739i*/"progs/bullet.mdl");
		setsize(missile, VEC_ORIGIN, VEC_ORIGIN);
		setorigin(missile, ((self.origin + (v_forward * IT_SUPER_NAILGUN)) + '0 0 16'));
	}
	else
	{
		do
		{
			dir = aim(self, 100000);
			pistolsmoke(self.origin);
			FireBullets(IT_SHOTGUN, dir, VEC_ORIGIN, 666);
		}
		else
		{

		} while ((deathmatch == TE_EXPLOSION));
	} while(1);
}
}
#endif
};

void() W_FireBR =
{
	local vector dir;

	sound(self, IT_SHOTGUN, "weapons/br_fire.wav", IT_SHOTGUN, IT_SHOTGUN);
	VK_smallkick(self);
	self.ammo_br = (self.ammo_br - TE_EXPLOSION);
	W_UpdateAmmoCounts(self);
	pistolsmoke(self.origin);
	dir = aim(self, 100000);
	FireBullets(IT_SHOTGUN, dir, VEC_ORIGIN, 666);
	FireBullets(IT_SHOTGUN, dir, VEC_ORIGIN, 666);
	FireBullets(IT_SHOTGUN, dir, VEC_ORIGIN, 666);
};

void() W_FireSkull =
{
	local vector dir;

	sound(self, IT_SHOTGUN, "weapons/oddball.wav", IT_SHOTGUN, IT_SHOTGUN);
	VK_smallkick(self);
	self.ammo_shells = (self.ammo_shells - IT_SHOTGUN);
	W_UpdateAmmoCounts(self);
	dir = aim(self, 100000);
	FireBullets(IT_SHOTGUN, dir, VEC_ORIGIN, 666);
};

void() Cooldown_Think =
{
	local entity oself;

	oself = self;
	if (((self.owner == world) || (self.owner.classname != "player")))
	{
		remove(self);
		return;
	}
	if ((self.owner.items & IT_LIGHTNING))
	{
		if ((self.owner.exppistol > TE_SPIKE))
		{
			self.owner.exppistol = (self.owner.exppistol - IT_SHOTGUN);
			W_UpdateAmmoCounts(self.owner);
		}
	}
	if ((self.owner.items & IT_EXTRA_WEAPON2))
	{
		if ((self.owner.exprifle > TE_SPIKE))
		{
			self.owner.exprifle = (self.owner.exprifle - IT_SHOTGUN);
			W_UpdateAmmoCounts(self.owner);
		}
	}
	self.nextthink = (time + 0.05);
};

void(float t_weap, float w_heat) W_AddHeat =
{
#error Corrupt Function: W_AddHeat
#if 0
	if ((self.pp_cooldown == world))
	{
		self.pp_cooldown = spawn();
		self.pp_cooldown.owner = self;
		self.pp_cooldown.weapon = t_weap;
		self.pp_cooldown.think = Cooldown_Think;
		self.pp_cooldown.nextthink = (time + 0.05);
	}
	do_tail
	{
		self.exppistol = (self.exppistol + w_heat);
	}
	else
	{
		do
		{
			self.exprifle = (self.exprifle + w_heat);
		}
		else
		{

		} while ((t_weap == IT_LIGHTNING));

	} while ((t_weap == IT_EXTRA_WEAPON2));
}
}
#endif
};

void() Glow_Touch =
{
	self.velocity = VEC_ORIGIN;
	self.think = SUB_Remove;
	self.nextthink = (time + 0.3);
	self.touch = SUB_Null;
	self.nextthink = (time + 0.15);
};

void() W_FireGlow =
{
	local entity plasma;

	plasma = spawn();
	plasma.owner = self;
	plasma.movetype = TE_LIGHTNING3;
	plasma.solid = IT_SUPER_SHOTGUN;
	if ((self.classname != "player"))
	{
		plasma.velocity = normalize((self.enemy.origin - self.origin));
		plasma.velocity = (plasma.velocity * 2000);
		plasma.angles = vectoangles(plasma.velocity);
	}
	else
	{
		makevectors(self.v_angle);
		plasma.velocity = v_forward;
		plasma.velocity = (plasma.velocity * 3000);
		plasma.angles = vectoangles(plasma.velocity);
	}
	plasma.touch = Glow_Touch;
	setmodel(plasma, /*14092i*/"progs/plasma_glow.spr");
	setsize(plasma, VEC_ORIGIN, VEC_ORIGIN);
	setorigin(plasma, (((self.origin + (v_forward * IT_SUPER_NAILGUN)) + (v_right * IT_SHOTGUN)) + '0 0 16'));
};

void() Plasma_Diffuse =
{
	self.velocity = VEC_ORIGIN;
	self.think = SUB_Remove;
	self.nextthink = (time + 0.3);
	self.touch = SUB_Null;
	if (other.takedamage)
	{
		if ((other.health >= SVC_INTERMISSION))
		{
			particle(self.origin, VEC_ORIGIN, 109, TE_LIGHTNING2);
		}
		else
		{
			spawn_touchblood(IT_SUPER_NAILGUN);
		}
	}
	T_Damage(other, self, self.owner, (TE_LAVASPLASH * self.health), 666);
	self.nextthink = (time + 0.15);
};

void(float w_heat) W_FirePPistol =
{
	local entity plasma;
	local float ptake;
	local vector dir;

	muzzleflash4();
	sound(self, IT_SHOTGUN, "weapons/ppist.wav", IT_SHOTGUN, IT_SHOTGUN);
	VK_smallkick(self);
	if ((w_heat < TE_EXPLOSION))
	{
		ptake = IT_SHOTGUN;
	}
	else
	{
		if ((w_heat < TE_WIZSPIKE))
		{
			ptake = IT_SUPER_SHOTGUN;
		}
		else
		{
			if ((w_heat < 12))
			{
				ptake = TE_EXPLOSION;
			}
			else
			{
				if ((w_heat < 15))
				{
					ptake = IT_NAILGUN;
				}
				else
				{
					ptake = TE_LIGHTNING2;
				}
			}
		}
	}
	self.ammo_ppistol = (self.ammo_ppistol - ptake);
	if ((self.ammo_ppistol < TE_SPIKE))
	{
		self.ammo_ppistol = TE_SPIKE;
	}
	W_UpdateAmmoCounts(self);
	plasma = spawn();
	plasma.health = ptake;
	plasma.owner = self;
	plasma.movetype = TE_LIGHTNING3;
	plasma.solid = IT_SUPER_SHOTGUN;
	plasma.effects = IT_EXTRA_WEAPON;
	plasma.classname = "missile";
	if ((self.classname != "player"))
	{
		plasma.velocity = normalize((self.enemy.origin - self.origin));
		plasma.velocity = (plasma.velocity * 2000);
		plasma.angles = vectoangles(plasma.velocity);
	}
	else
	{
		makevectors(self.v_angle);
		plasma.velocity = v_forward;
		plasma.velocity = (plasma.velocity * 3000);
		plasma.angles = vectoangles(plasma.velocity);
	}
	plasma.touch = Plasma_Diffuse;
	plasma.nextthink = (time + TE_LIGHTNING1);
	plasma.think = Plasma_Diffuse;
	setmodel(plasma, /*14114i*/"progs/plasma.mdl");
	W_FireGlow();
	setsize(plasma, VEC_ORIGIN, VEC_ORIGIN);
	setorigin(plasma, ((self.origin + (v_forward * IT_SUPER_NAILGUN)) + '0 0 16'));
	FireBullets(IT_SHOTGUN, dir, '0.01 0.01 0', 666);
	if ((ptake > TE_LIGHTNING1))
	{
		ptake = TE_LAVASPLASH;
	}
	W_AddHeat(self.weapon, (ptake * TE_LAVASPLASH));
};

void() W_FireShotgun =
{
	local vector dir;

	sound(self, IT_SHOTGUN, "weapons/shottie.wav", IT_SHOTGUN, IT_SHOTGUN);
	muzzleflash3();
	self.punchangle_x = CONTENT_EMPTY;
	self.ammo_shells2 = (self.ammo_shells2 - IT_SHOTGUN);
	self.currentammo = (self.currentammo - IT_SHOTGUN);
	W_UpdateAmmoCounts(self);
	dir = aim(self, 100000);
	FireBullets(TE_LAVASPLASH, dir, '0.2 0.2 0', 666);
	pistolsmoke(((self.origin + (v_forward * 13)) + '0 0 14'));
};

void() W_FireAR =
{
	local vector dir;
	local float r;

	r = random();
	self.ammo_nails = (self.ammo_nails - IT_SHOTGUN);
	W_UpdateAmmoCounts(self);
	sound(self, IT_SHOTGUN, "weapons/ar1.wav", IT_SHOTGUN, IT_SHOTGUN);
	self.punchangle_x = CONTENT_SOLID;
	muzzleflash2();
	dir = aim(self, 100000);
	FireBullets(IT_SHOTGUN, dir, '0.05 0.05 0.02', 666);
};
void(float ox) W_FireSpikes;

void() W_FireUzi =
{
	local vector dir;

	muzzleflash3();
	sound(self, IT_SHOTGUN, "weapons/uzi.wav", IT_SHOTGUN, IT_SHOTGUN);
	self.ammo_hshells = (self.ammo_hshells - IT_SHOTGUN);
	W_UpdateAmmoCounts(self);
	self.punchangle_x = CONTENT_SOLID;
	muzzleflash3();
	dir = aim(self, 100000);
	FireBullets(IT_SHOTGUN, dir, '0.06 0.06 0.02', 666);
};

void() W_FireNail2 =
{
	local vector dir;

	self.punchangle_x = CONTENT_EMPTY;
	self.ammo_shells2 = (self.ammo_shells2 - IT_SHOTGUN);
	self.currentammo = (self.ammo_shells2 - IT_SHOTGUN);
	dir = aim(self, 100000);
	FireBullets(IT_SHOTGUN, dir, '0.07 0.07 0', 666);
};

void() W_FireSniper =
{
	local vector dir;

	sound(self, IT_SHOTGUN, "weapons/sniper.wav", IT_SHOTGUN, IT_SHOTGUN);
	VK_bigkick(self);
	self.ammo_sniper = (self.ammo_sniper - IT_SHOTGUN);
	W_UpdateAmmoCounts(self);
	muzzleflash2();
	dir = aim(self, 100000);
	pistolsmoke(((self.origin + (v_forward * 13)) + '0 0 14'));
	FireBullets(IT_SHOTGUN, dir, VEC_ORIGIN, 666);
};

void() NeedleExplode =
{
	self.enemy.needles = (self.enemy.needles - IT_SHOTGUN);
	T_Damage(self.enemy, self, self.owner, IT_NAILGUN, 666);
	sound(self, IT_SHOTGUN, "weapons/crystal.wav", IT_SHOTGUN, IT_SHOTGUN);
	particle(self.origin, '6 6 6', 149, 40);
	createpinkdust(self.origin);
	remove(self);
};

void() NeedlePreExplode =
{
	local vector m_height;

	m_height_x = self.armorvalue;
	if ((self.enemy.health <= TE_SPIKE))
	{
		remove(self);
		return;
	}
	if ((time > self.health))
	{
		NeedleExplode();
		return;
	}
	self.origin = (self.enemy.origin + m_height);
	self.nextthink = (time + 0.02);
};

void(entity f_plyr, entity t_plyr, float at_height) Add_Needle =
{
	local entity needle;
	local float f_p_height;

	f_p_height = at_height - t_plyr.origin_x;
	if ((other == world))
	{
		_bprint(/*16143i*/"Add_Needle: Cannot assign to world! FIX!!\n");
		return;
	}
	if ((other.health <= TE_SPIKE))
	{
		return;
	}
	t_plyr.needles = (t_plyr.needles + IT_SHOTGUN);
	if ((t_plyr.needles >= 12))
	{
		t_plyr.needles = (t_plyr.needles - TE_WIZSPIKE);
		sound(self, IT_SHOTGUN, "weapons/crystal.wav", IT_SHOTGUN, IT_SHOTGUN);
		particle(self.origin, '0 0 8', 149, 60);
		createpinkdust(self.origin);
		T_Damage(t_plyr, self, f_plyr, 150, 666);
		remove(self);
		return;
	}
	needle = spawn();
	needle.classname = "needle";
	needle.touch = SUB_Null;
	needle.solid = TE_SPIKE;
	needle.movetype = TE_LIGHTNING1;
	needle.effects = IT_LIGHTNING;
	needle.health = (time + TE_EXPLOSION);
	needle.armorvalue = f_p_height;
	needle.enemy = t_plyr;
	needle.owner = f_plyr;
	setmodel(needle, /*14820i*/"progs/needpro2.mdl");
	needle.think = NeedlePreExplode;
	needle.nextthink = time;
};

vector(entity proj) bounce_off_wall =
{
	local vector vec;
	local float backoff;
	local float change;

	makevectors(proj.angles);
	v_forward_z = v_forward_z * CONTENT_EMPTY;
	traceline(proj.origin, (proj.origin + (v_forward * IT_LIGHTNING)), TE_SPIKE, proj);
	if ((trace_fraction == IT_SHOTGUN))
	{
		return (proj.velocity);
	}
	proj.velocity = (v_forward * 500);
	backoff = proj.velocity * trace_plane_normal;
	backoff = backoff * 1.5;
	change = trace_plane_normal_x * backoff;
	vec_x = proj.velocity_x - change;
	if (((vec_x > -0.1) && (vec_x < 0.1)))
	{
		vec_x = TE_SPIKE;
	}
	change = trace_plane_normal_y * backoff;
	vec_y = proj.velocity_y - change;
	if (((vec_y > -0.1) && (vec_y < 0.1)))
	{
		vec_y = TE_SPIKE;
	}
	change = trace_plane_normal_z * backoff;
	vec_z = proj.velocity_z - change;
	if (((vec_z > -0.1) && (vec_z < 0.1)))
	{
		vec_z = TE_SPIKE;
	}
	sound(self, IT_SHOTGUN, "weapons/nb.wav", IT_SHOTGUN, IT_SHOTGUN);
	proj.angles = vectoangles(vec);
	proj.flags = (proj.flags - (proj.flags & IT_NAILS));
	return (vec);
};

void() bounce_a =
{

	self.velocity = bounce_off_wall(self);
	self.nextthink = (time + 0.2);
	self.think = NeedlerHome;
};

void() Bounce_Off_Walls =
{
	self.nextthink = time;
	self.think = bounce_a;
	if ((self.velocity == VEC_ORIGIN))
	{
		remove(self);
	}
};

void() Needler_Touch =
{
	if (((other.takedamage != TE_SPIKE) && (other.health > TE_SPIKE)))
	{
		T_Damage(other, self, self.owner, TE_WIZSPIKE, 666);
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

void() NeedlerHome =
{
	local vector dir;
	local vector vtemp;
	local vector wantdir;
	local entity te;
	local float maxmove;

	maxmove = 60;
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
		te = findradius(self.origin, 200);
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

void() W_FireNeedler =
{
	local entity fshell;
	local float r;
	local vector spread;

	r = random();
	muzzleflash6();
	sound(self, IT_SHOTGUN, "weapons/needler.wav", IT_SHOTGUN, IT_SHOTGUN);
	spread = '0.04 0.04 0';
	VK_smallkick(self);
	self.needler_heat = (self.needler_heat + IT_SHOTGUN);
	self.ammo_needler = (self.ammo_needler - IT_SHOTGUN);
	W_UpdateAmmoCounts(self);
	fshell = spawn();
	fshell.owner = self;
	fshell.movetype = TE_LIGHTNING3;
	fshell.solid = IT_SUPER_SHOTGUN;
	fshell.effects = IT_LIGHTNING;
	fshell.classname = "missile";
	if ((self.classname != "player"))
	{
		fshell.velocity = normalize((self.enemy.origin - self.origin));
		fshell.velocity = (fshell.velocity * 550);
		fshell.angles = vectoangles(fshell.velocity);
	}
	else
	{
		makevectors(self.v_angle);
		fshell.velocity = ((v_forward + (((IT_SUPER_SHOTGUN * (random() + -0.5)) * spread_x) * v_right)) + (((IT_SUPER_SHOTGUN * (random() + -0.5)) * spread_y) * v_up));
		fshell.velocity = (fshell.velocity * 550);
		fshell.angles = vectoangles(fshell.velocity);
	}
	fshell.touch = Needler_Touch;
	fshell.armorvalue = (time + 15);
	fshell.nextthink = (time + 0.2);
	fshell.think = NeedlerHome;
	fshell.lives = IT_SHOTGUN;
	setmodel(fshell, /*14779i*/"progs/needproy.mdl");
	setsize(fshell, VEC_ORIGIN, VEC_ORIGIN);
	setorigin(fshell, ((self.origin + (v_forward * IT_SUPER_NAILGUN)) + '0 0 16'));
	if ((pointcontents(self.origin) == CONTENT_SKY))
	{
		remove(self);
		return;
	}
};

void() W_FirePlasmaRifle =
{
	local entity plasma;
	local vector spread;
	local vector dir;
	local vector jitter;

	spread = '0.02 0.02 0';
	self.prifle_heat = (self.prifle_heat + IT_SHOTGUN);
	sound(self, IT_SHOTGUN, "weapons/PR_fire.wav", IT_SHOTGUN, IT_SHOTGUN);
	self.ammo_prifle = (self.ammo_prifle - IT_SHOTGUN);
	W_UpdateAmmoCounts(self);
	plasma = spawn();
	plasma.health = IT_SHOTGUN;
	plasma.owner = self;
	plasma.movetype = TE_LIGHTNING3;
	plasma.solid = IT_SUPER_SHOTGUN;
	makevectors(self.v_angle);
	traceline(self.origin, (self.origin + (v_forward * 700000000)), IT_SHOTGUN, self);
	jitter_x = ((IT_SUPER_SHOTGUN * (random() + -0.5)) * spread_x) * vlen((trace_endpos - self.origin));
	jitter_y = ((IT_SUPER_SHOTGUN * (random() + -0.5)) * spread_y) * vlen((trace_endpos - self.origin));
	dir = normalize((((self.origin + '0 0 -17') + (v_right * TE_LAVASPLASH)) - (trace_endpos + jitter)));
	plasma.velocity = (dir * CONTENT_EMPTY);
	plasma.velocity = (plasma.velocity * 6000);
	plasma.angles = vectoangles(plasma.velocity);
	plasma.touch = Plasma_Diffuse;
	plasma.nextthink = (time + TE_LIGHTNING1);
	plasma.think = Plasma_Diffuse;
	setmodel(plasma, /*14074i*/"progs/PL_BULL.spr");
	setsize(plasma, VEC_ORIGIN, VEC_ORIGIN);
	setorigin(plasma, ((self.origin + '0 0 5') + (v_right * TE_LAVASPLASH)));
	W_AddHeat(self.weapon, TE_LIGHTNING1);
};

float(vector veca, vector vecb) crossproduct =
{
	local float result;

	result = (veca_x * vecb_y) - (vecb_x * veca_y);
	return (result);
};

void() W_Melee =
{
	local vector source;
	local vector org;
	local vector def;

	makevectors(self.v_angle);
	source = self.origin + '0 0 16';
	traceline(source, (source + (v_forward * IT_LIGHTNING)), TE_SPIKE, self);
	if ((trace_fraction == IT_SHOTGUN))
	{
		self.punchangle_x = CONTENT_SOLID;
		return;
	}
	self.punchangle_x = CONTENT_SOLID;
	org = trace_endpos - (v_forward * IT_NAILGUN);
	makevectors(trace_ent.v_angle);
	def = v_right;
	if (trace_ent.takedamage)
	{
		trace_ent.axhitme = IT_SHOTGUN;
		SpawnBlood(org, 20);
		makevectors(self.v_angle);
		if ((crossproduct(def, v_forward) > TE_SPIKE))
		{
			T_Damage(trace_ent, self, self, 100, 666);
		}
		else
		{
			T_Damage(trace_ent, self, self, 50, 666);
		}
	}
};

void() W_FireRocket =
{
	local entity missile;

	self.ammo_rockets = (self.ammo_rockets - IT_SHOTGUN);
	W_UpdateAmmoCounts(self);
	muzzleflash3();
	sound(self, IT_SHOTGUN, "weapons/sgun1.wav", IT_SHOTGUN, IT_SHOTGUN);
	self.punchangle_x = CONTENT_SOLID;
	missile = spawn();
	missile.owner = self;
	missile.movetype = TE_LIGHTNING3;
	missile.solid = IT_SUPER_SHOTGUN;
	missile.classname = "Rocket";
	makevectors(self.v_angle);
	missile.velocity = aim(self, 1000);
	missile.velocity = (missile.velocity * 1000);
	missile.angles = vectoangles(missile.velocity);
	missile.touch = Rocket_Explode0;
	missile.nextthink = (time + TE_LIGHTNING1);
	missile.think = SUB_Remove;
	setmodel(missile, /*16352i*/"progs/missile.mdl");
	setsize(missile, VEC_ORIGIN, VEC_ORIGIN);
	setorigin(missile, ((self.origin + (v_forward * IT_SUPER_NAILGUN)) + '0 0 16'));
};

void(entity from, float damage, float lmod) LightningHit =
{
	TE_lightningblood(trace_endpos);
	T_Damage(trace_ent, from, from, damage, lmod);
};

void(vector p1, vector p2, entity from, float damage, float lmod) LightningDamage =
{
	local entity e1;
	local entity e2;
	local vector f;

	f = p2 - p1;
	f = normalize(f);
	f_x = TE_SPIKE - f_y;
	f_y = f_x;
	f_z = TE_SPIKE;
	f = f * IT_GRENADE_LAUNCHER;
	e2 = world;
	e1 = world;
	traceline(p1, p2, TE_SPIKE, self);
	if (trace_ent.takedamage)
	{
		LightningHit(from, damage, lmod);
	}
	e1 = trace_ent;
	traceline((p1 + f), (p2 + f), TE_SPIKE, self);
	if (((trace_ent != e1) && trace_ent.takedamage))
	{
		LightningHit(from, damage, lmod);
	}
	e2 = trace_ent;
	traceline((p1 - f), (p2 - f), TE_SPIKE, self);
	if ((((trace_ent != e1) && (trace_ent != e2)) && trace_ent.takedamage))
	{
		LightningHit(from, damage, lmod);
	}
};

void() W_FireLightning =
{
	local vector org;
	local float cells;
	local float expmod;

	if ((self.ammo_cells_real < IT_SHOTGUN))
	{
		W_WeaponSwitch(W_BestWeapon());
		return;
	}
	if ((self.waterlevel > IT_SHOTGUN))
	{
		if ((deathmatch > TE_EXPLOSION))
		{
			if ((random() <= 0.5))
			{
				T_Damage(self, self, self.owner, 4000, 24);
				return;
			}
		}
		cells = self.ammo_cells_real;
		self.ammo_cells_real = TE_SPIKE;
		W_WeaponSwitch(W_BestWeapon());
		expmod = TE_LAVASPLASH;
		if ((self.watertype == CONTENT_SLIME))
		{
			expmod = TE_TELEPORT;
		}
		else
		{
			if ((self.watertype == CONTENT_LAVA))
			{
				expmod = 12;
			}
		}
		T_RadiusDamage(self, self, (35 * cells), (40 + (35 * cells)), world, expmod);
		return;
	}
	if ((self.lightning_sound < time))
	{
		sound(self, IT_SHOTGUN, "weapons/lhit.wav", IT_SHOTGUN, IT_SHOTGUN);
		self.lightning_sound = (time + 0.6);
	}
	VK_smallkick(self);
	if ((deathmatch != IT_NAILGUN))
	{
		self.ammo_cells_real = (self.ammo_cells_real - IT_SHOTGUN);
		W_UpdateAmmoCounts(self);
	}
	org = self.origin + '0 0 16';
	traceline(org, (org + (v_forward * 600)), IT_SHOTGUN, self);
	TE_lightning2(self, org, trace_endpos);
	LightningDamage(self.origin, (trace_endpos + (v_forward * IT_NAILGUN)), self, SVC_INTERMISSION, TE_LIGHTNING3);
};

void() GrenadeExplode =
{
	if ((self.selnade == TE_SPIKE))
	{
		CreateExplosion(self.origin);
	}
	else
	{
		plasmaexplo(self.origin);
		sound(self, IT_SHOTGUN, "weapons/plasma_blow.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	T_RadiusDamage(self, self.owner, 190, 160, world, 666);
	remove(self);
};

void() Stick =
{
	if (((self.enemy != world) && (self.enemy.health > IT_SHOTGUN)))
	{
		self.think = Stick;
		self.touch = Stick;
		self.effects = IT_ROCKET_LAUNCHER;
		self.origin = self.enemy.origin;
	}
	else
	{
		GrenadeExplode();
		return;
	}
	self.exshells = (self.exshells + IT_SHOTGUN);
	if ((self.exshells > 15))
	{
		GrenadeExplode();
		return;
	}
	self.nextthink = (time + 0.1);
};

void() StickyTouch =
{
	if (((other == self.owner) || (other == world)))
	{
		return;
	}
	self.exshells = TE_SPIKE;
	self.movetype = IT_SUPER_NAILGUN;
	self.think = Stick;
	self.touch = Stick;
	self.nextthink = (time + 0.1);
	self.avelocity = VEC_ORIGIN;
	self.velocity = VEC_ORIGIN;
	self.enemy = other;
};

float(entity p1, entity p2) Get_ZDiff =
{
	local vector p_a;
	local vector p_b;
	local float zdif;

	p_a_z = p1.origin_z;
	p_b_z = p2.origin_z;
	zdif = vlen((p_a - p_b));
	return (zdif);
};

void() StickyNade_Stick =
{
	local vector zd;

	if (((self.enemy != world) && (self.enemy.health > TE_SPIKE)))
	{
		zd_z = self.armorvalue;
		self.origin = (self.enemy.origin + zd);
	}
	if ((self.weapon < time))
	{
		GrenadeExplode();
		return;
	}
	self.nextthink = (time + 0.1);
};

void() GrenadeBounce =
{
	local vector spot1;
	local vector spot2;

	if ((self.selnade == IT_SHOTGUN))
	{
		if ((pointcontents(self.origin) == CONTENT_SKY))
		{
			remove(self);
			return;
		}
		if (other.takedamage)
		{
			if ((other.origin != VEC_ORIGIN))
			{
				self.armorvalue = Get_ZDiff(self, other);
				self.weapon = self.nextthink;
				self.think = StickyNade_Stick;
				self.enemy = other;
				self.nextthink = time;
			}
			else
			{
				sound(self, IT_SHOTGUN, "effects/bodyhit2.wav", IT_SHOTGUN, IT_SHOTGUN);
			}
			return;
		}
		if (other.speed)
		{
			sound(self, IT_SHOTGUN, "weapons/bounce.wav", IT_SHOTGUN, IT_SHOTGUN);
			return;
		}
		else
		{
			if ((self.selnade == TE_SPIKE))
			{
				sound(self, IT_SHOTGUN, "weapons/bounce.wav", IT_SHOTGUN, IT_SHOTGUN);
			}
			else
			{
				sound(self, IT_SHOTGUN, "weapons/pbounce.wav", IT_SHOTGUN, IT_SHOTGUN);
			}
			self.movetype = TE_SPIKE;
			self.solid = IT_SUPER_SHOTGUN;
			spot1 = self.origin - (normalize(self.velocity) * 20);
			spot2 = self.origin + (normalize(self.velocity) * 20);
			traceline(spot1, spot2, TE_SPIKE, self);
			self.angles = (vectoangles(trace_plane_normal) + '90 0 0');
			setorigin(self, (self.origin + (trace_plane_normal * TE_LIGHTNING2)));
		}
	}
	else
	{
		sound(self, IT_SHOTGUN, "weapons/bounce.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	if ((self.velocity == VEC_ORIGIN))
	{
		self.avelocity = VEC_ORIGIN;
	}
	self.nextthink = (time + 1.5);
	self.think = GrenadeExplode;
};

void() W_ThrowGrenade =
{
	local entity missile;
	local float vel_up;

	if ((self.selnade == TE_SPIKE))
	{
		sound(self, IT_SHOTGUN, "weapons/grenade.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	else
	{
		sound(self, IT_SHOTGUN, "weapons/plasma_throw.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	missile = spawn();
	missile.owner = self;
	missile.movetype = TE_LAVASPLASH;
	missile.solid = IT_SUPER_SHOTGUN;
	missile.classname = "missile";
	makevectors(self.v_angle);
	if ((self.v_angle_x <= -70))
	{
		vel_up = 180 + (self.v_angle_x * IT_SUPER_SHOTGUN);
	}
	else
	{
		vel_up = 180;
	}
	missile.velocity = (((v_forward * 320) + (v_up * vel_up)) + (v_right * TE_LIGHTNING1));
	missile.avelocity = '300 300 300';
	missile.angles = vectoangles(missile.velocity);
	missile.selnade = self.selnade;
	missile.touch = GrenadeBounce;
	if ((self.selnade == IT_SHOTGUN))
	{
		missile.effects = IT_ROCKET_LAUNCHER;
		setmodel(missile, /*13530i*/"progs/plasgren.mdl");
	}
	else
	{
		missile.effects = IT_SUPER_NAILGUN;
		setmodel(missile, /*13501i*/"progs/fraggren.mdl");
	}
	setsize(missile, VEC_ORIGIN, VEC_ORIGIN);
	setorigin(missile, ((self.origin + '0 0 16') + (v_right * CONTENT_SKY)));
};

void(float ox) W_FireSpikes =
{

	if ((self.ammo_nails_real < IT_SHOTGUN))
	{
		W_WeaponSwitch(W_BestWeapon());
		return;
	}
	sound(self, IT_SHOTGUN, "weapons/rocket1i.wav", IT_SHOTGUN, IT_SHOTGUN);
	if ((deathmatch != IT_NAILGUN))
	{
		self.ammo_nails_real = (self.ammo_nails_real - IT_SHOTGUN);
		W_UpdateAmmoCounts(self);
	}
	VK_smallkick(self);
	PRJ_FireProjectile(self, "progs/spike.mdl", ((self.origin + '0 0 16') + (v_right * ox)), (aim(self, 1000) * 1000), IT_SHOTGUN, TE_LIGHTNING3, IT_NAILGUN, TE_LIGHTNING2);
};

void() W_FireSuperSpikes22 =
{

	if ((self.ammo_nails_real < IT_SUPER_SHOTGUN))
	{
		W_FireSpikes(TE_SPIKE);
		return;
	}
	sound(self, IT_SHOTGUN, "weapons/spike2.wav", IT_SHOTGUN, IT_SHOTGUN);
	if ((deathmatch != IT_NAILGUN))
	{
		self.ammo_hshells = (self.ammo_hshells - IT_SUPER_SHOTGUN);
		W_UpdateAmmoCounts(self);
	}
	VK_smallkick(self);
	PRJ_FireProjectile(self, "progs/s_spike.mdl", (self.origin + '0 0 16'), (aim(self, 1000) * 1000), IT_SUPER_SHOTGUN, 18, TE_LIGHTNING1, TE_LIGHTNING2);
};

float(float wep) W_HasAmmo =
{
	do_tail
	{
		return ((self.ammo_shells_real >= IT_SHOTGUN));
		do
		{
			return ((self.ammo_shells_real >= IT_SUPER_SHOTGUN));
			do
			{
				return ((self.ammo_nails_real >= IT_SHOTGUN));
				do
				{
					return ((self.ammo_nails_real >= IT_SUPER_SHOTGUN));
					do
					{
						do
						{
							return ((self.ammo_rockets_real >= IT_SHOTGUN));
							do
							{
								return ((self.ammo_cells_real >= IT_SHOTGUN));

							} while ((wep == IT_SHOTGUN));

						} while ((wep == IT_SUPER_SHOTGUN));

					} while ((wep == IT_NAILGUN));

				} while ((wep == IT_SUPER_NAILGUN));

			} while ((wep == IT_GRENADE_LAUNCHER));

		} while ((wep == IT_ROCKET_LAUNCHER));

	} while ((wep == IT_LIGHTNING));
	return (IT_SHOTGUN);
};

void() W_UpdateWeapon =
{
#error Corrupt Function: W_UpdateWeapon
#if 0
	player_run();
	self.items = (self.items - (self.items & 3840));
	do_tail
	{
		self.weaponmodel = "progs/v_shot.mdl";
		self.items = (self.items | IT_SHELLS);
		self.ammo_type = IT_SHOTGUN;
	}
	else
	{
		do
		{
			self.weaponmodel = "progs/v_skull.mdl";
			self.items = (self.items | IT_SHELLS);
			self.ammo_type = IT_SHOTGUN;
		}
		else
		{
			do
			{
				self.weaponmodel = "progs/v_shot2.mdl";
				self.items = (self.items | IT_SHELLS);
				self.ammo_type = IT_SHOTGUN;
			}
			else
			{
				do
				{
					self.weaponmodel = "progs/v_nail.mdl";
					self.items = (self.items | IT_NAILS);
					self.ammo_type = IT_SUPER_SHOTGUN;
				}
				else
				{
					do
					{
						self.weaponmodel = "progs/v_uzi.mdl";
						self.items = (self.items | IT_NAILS);
						self.ammo_type = IT_SUPER_SHOTGUN;
					}
					else
					{
						do
						{
							self.weaponmodel = "progs/v_sniper.mdl";
							self.items = (self.items | IT_SHELLS);
							self.ammo_type = IT_SHOTGUN;
						}
						else
						{
							do
							{
								self.weaponmodel = "progs/v_rocket.mdl";
								self.items = (self.items | IT_ROCKETS);
								self.ammo_type = TE_EXPLOSION;
							}
							else
							{
								do
								{
									self.weaponmodel = "progs/v_plpist.mdl";
									self.items = (self.items | IT_CELLS);
									self.ammo_type = IT_NAILGUN;
								}
								else
								{
									do
									{
										self.weaponmodel = "progs/v_axe.mdl";
										self.items = (self.items | IT_CELLS);
										self.ammo_type = IT_NAILGUN;
									}
									else
									{
										do
										{
											self.weaponmodel = "progs/v_needle.mdl";
											self.items = (self.items | IT_CELLS);
											self.ammo_type = IT_NAILGUN;
										}
										else
										{
											do
											{
												self.weaponmodel = "progs/v_plrifle.mdl";
												self.items = (self.items | IT_CELLS);
												self.ammo_type = IT_NAILGUN;
											}
											else
											{
												do
												{
													self.weaponmodel = "progs/v_br.mdl";
													self.items = (self.items | IT_CELLS);
													self.ammo_type = IT_NAILGUN;
												}
												else
												{
													do
													{
														self.weaponmodel = "";
													}
													else
													{

													} while ((self.weapon == IT_SHOTGUN));

												} while ((self.weapon == IT_SKULL));

											} while ((self.weapon == IT_SUPER_SHOTGUN));

										} while ((self.weapon == IT_NAILGUN));

									} while ((self.weapon == IT_SUPER_NAILGUN));

								} while ((self.weapon == IT_GRENADE_LAUNCHER));

							} while ((self.weapon == IT_ROCKET_LAUNCHER));

						} while ((self.weapon == IT_LIGHTNING));

					} while ((self.weapon == IT_AXE));

				} while ((self.weapon == IT_EXTRA_WEAPON));

			} while ((self.weapon == IT_EXTRA_WEAPON2));

		} while ((self.weapon == IT_BR));
	} while(1);
}
}
}
}
}
}
}
}
}
}
}
}
}
self.weaponframe = TE_SPIKE;
#endif
};

void(float weap) W_WeaponSwitch =
{

	if ((((self.weaponmodel != "") && (self.weaponframe > TE_SPIKE)) && (self.weaponframe < IT_NAILGUN)))
	{
		return;
	}
	if ((self.weapon != weap))
	{
		self.weapon = weap;
		W_UpdateWeapon();
	}
	W_UpdateAmmoCounts(self);
	self.pfov = 90;
	Set_FOV(90);
};

float() W_BestWeapon =
{
#error Corrupt Function: W_BestWeapon
#if 0
	local float fl;

	if ((cvar(/*16755i*/"nobest") == TE_SPIKE))
	{
		return (self.weapon);
	}
	if ((self.waterlevel <= IT_SHOTGUN))
	{
		fl = IT_LIGHTNING;
	}
	else
	{
		fl = IT_SUPER_NAILGUN;
	}
	do
	{
		if (((self.items & fl) && W_HasAmmo(fl)))
		{
			return (fl);
		}
		do_tail
		{
			fl = IT_LIGHTNING;
		}
		else
		{
			do
			{
				fl = IT_SUPER_NAILGUN;
			}
			else
			{
				do
				{
					fl = IT_SUPER_SHOTGUN;
				}
				else
				{
					do
					{
						fl = IT_NAILGUN;
					}
					else
					{
						do
						{
							fl = IT_SHOTGUN;
						}
						else
						{
							do
							{
								do
								{
									return (IT_AXE);

								} while ((fl == IT_SKULL));

							} while ((fl == IT_LIGHTNING));

						} while ((fl == IT_SUPER_NAILGUN));

					} while ((fl == IT_SUPER_SHOTGUN));

				} while ((fl == IT_NAILGUN));

			} while ((fl == IT_SHOTGUN));
		} while(1);
	}
}
}
}
}
} while(1);
#endif
};

float() W_CheckNoAmmo =
{
	if ((self.currentammo > TE_SPIKE))
	{
		return (IT_SHOTGUN);
	}
	if ((self.weapon == IT_AXE))
	{
		return (IT_SHOTGUN);
	}
	W_WeaponSwitch(W_BestWeapon());
	return (TE_SPIKE);
};
void() player_shot1;
void() player_hshot;
void() player_hshot_melee;
void() player_uzi_reload;
void() player_shot_melee;
void() player_shot2_melee;
void() player_nail_melee;
void() player_shot_throw;
void() player_shot2_throw;
void() player_nail_throw;
void() player_rl_reload;
void() player_rl_throw;
void() player_rl_melee;
void() player_uzi_throw;
void() player_sniper_melee;
void() player_sniper_throw;
void() player_nail2;

void() W_Attack =
{
#error Corrupt Function: W_Attack
#if 0
	local float r;
	local float heat_multi;
	local float i;
	local vector source;

	if (!W_CanFire(self))
	{
		if ((self.currentammo == TE_SPIKE))
		{
			if ((self.reload_time > time))
			{
				return;
			}
			reload();
			if ((self.needler_heat > TE_SPIKE))
			{
				self.needler_heat = TE_SPIKE;
			}
			if ((self.prifle_heat > TE_SPIKE))
			{
				self.prifle_heat = TE_SPIKE;
			}
		}
		return;
	}
	makevectors(self.v_angle);
	self.show_hostile = (time + IT_SHOTGUN);
	if ((self.weaponstate == TE_SPIKE))
	{
		self.delay = (time + 0.1);
	}
	do_tail
	{
		muzzleflash();
		self.weaponframe = IT_SHOTGUN;
		self.wepanim = IT_SHOTGUN;
		self.weaponframe_time = (time + 0.1);
	}
	else
	{
		do
		{
			muzzleflash();
			self.weaponframe = IT_SHOTGUN;
			self.wepanim = IT_SHOTGUN;
		}
		else
		{
			do
			{
				muzzleflash();
				self.weaponframe = IT_SHOTGUN;
				self.wepanim = IT_SHOTGUN;
			}
			else
			{
				do
				{
					self.weaponframe = IT_SHOTGUN;
					player_nail2();
					do
					{
						do
						{
							self.weaponframe = IT_SHOTGUN;
							muzzleflash();
						}
						else
						{
							do
							{
								heat_multi = IT_SHOTGUN;
								i = TE_SPIKE;
								while ((i < IT_SUPER_NAILGUN))
								{
									i = i + IT_SHOTGUN;
									if ((self.weaponheat < (i * heat_multi)))
									{
										self.weaponframe = (IT_NAILGUN + i);
									}
									else
									{
									}
								}
								self.weaponheat = (self.weaponheat + IT_SHOTGUN);
								if ((i >= IT_SUPER_NAILGUN))
								{
									if ((self.weaponframe > 13))
									{
										self.weaponframe = 12;
									}
									else
									{
										self.weaponframe = (self.weaponframe + IT_SHOTGUN);
									}
								}
								if ((self.weaponheat > SVC_UPDATEFRAGS))
								{
									self.weaponheat = 15;
								}
								if ((!self.button0 || (self.weaponheat > 15)))
								{
									muzzleflash();
									W_FirePPistol(self.weaponheat);
									self.weaponheat = TE_SPIKE;
									self.weaponframe_time = (time + 0.1);
									if ((self.exppistol >= 100))
									{
										self.wepanim = TE_SPIKE;
										self.exppistol = 99;
										W_UpdateAmmoCounts(self);
										self.weaponframe = IT_GRENADE_LAUNCHER;
										player_reload1();
									}
									else
									{
										self.weaponframe = IT_SHOTGUN;
										self.wepanim = IT_SHOTGUN;
									}
								}
								else
								{
									self.weaponframe_time = (time + 0.2);
								}
							}
							else
							{
								do
								{
									makevectors(self.v_angle);
									source = self.origin + '0 0 16';
									traceline(source, (source + (v_forward * 120)), TE_SPIKE, self);
									if (((trace_ent.classname == "player") && (trace_ent.health > TE_SPIKE)))
									{
										self.weaponframe = TE_LIGHTNING3;
										self.velocity = (v_forward * 620);
									}
									else
									{
										r = random();
										if ((r < 0.5))
										{
											self.weaponframe = 19;
										}
										else
										{
											self.weaponframe = 26;
										}
									}
									self.wepanim = IT_SHOTGUN;
									self.weaponframe_time = (time + 0.1);
								}
								else
								{
									do
									{
										if ((self.exprifle >= 100))
										{
											self.wepanim = TE_SPIKE;
											self.exprifle = 99;
											W_UpdateAmmoCounts(self);
											self.weaponframe = IT_SHOTGUN;
											player_reload1();
											sound(self, TE_SPIKE, "weapons/Plsama Rifle/PR_overheat.wav", IT_SHOTGUN, IT_SHOTGUN);
										}
										self.weaponframe = IT_SHOTGUN;
										self.wepanim = IT_SHOTGUN;
										self.weaponframe_time = (time + 0.065);
									}
									else
									{
										do
										{
											muzzleflash();
											self.weaponframe = IT_SHOTGUN;
											self.wepanim = IT_SHOTGUN;
											self.weaponframe_time = (time + 0.1);
										}
										else
										{
											do
											{
												muzzleflash();
												self.weaponframe = IT_SHOTGUN;
												self.wepanim = IT_SHOTGUN;
												self.weaponframe_time = (time + 0.1);
											}
											else
											{
												do
												{
													muzzleflash();
													self.weaponframe = IT_SHOTGUN;
													self.wepanim = IT_SHOTGUN;
													self.weaponframe_time = (time + 0.1);
												}
												else
												{
													do
													{
														muzzleflash();
														self.weaponframe = IT_SHOTGUN;
														self.wepanim = IT_SHOTGUN;
														self.weaponframe_time = (time + 0.1);
													}
													else
													{

													} while ((self.weapon == IT_SHOTGUN));

												} while ((self.weapon == IT_SKULL));

											} while ((self.weapon == IT_NAILGUN));

										} while ((self.weapon == IT_SUPER_NAILGUN));

									} while ((self.weapon == IT_GRENADE_LAUNCHER));

								} while ((self.weapon == IT_ROCKET_LAUNCHER));

							} while ((self.weapon == IT_LIGHTNING));

						} while ((self.weapon == IT_AXE));

					} while ((self.weapon == IT_EXTRA_WEAPON2));

				} while ((self.weapon == IT_SHOTGUN));

			} while ((self.weapon == IT_SKULL));

		} while ((self.weapon == IT_BR));
	} while(1);
}
}
}
}
}
}
}
}
}
}
}
SuperDamageSound();
do_tail
{
W_FirePistol();
r = 0.3;
}
else
{
do
{
W_FireSkull();
r = 0.3;
}
else
{
do
{
W_FireShotgun();
r = IT_SHOTGUN;
}
else
{
do
{
W_FireAR();
r = 0.11;
}
else
{
do
{
W_FireRocket();
r = 1.6;
}
else
{
do
{
W_FireUzi();
r = 0.06;
}
else
{
do
{
W_FireSniper();
r = 0.8;
}
else
{
do
{
r = 0.15;
}
else
{
do
{
W_FireBR();
r = 0.5;
}
else
{
do
{
r = 0.6;
}
else
{
do
{
	W_FireNeedler();
	if ((self.needler_heat > TE_LAVASPLASH))
	{
		r = 0.07;
	}
	else
	{
		if ((self.needler_heat > TE_LIGHTNING1))
		{
			r = 0.12;
		}
		else
		{
			r = 0.17;
		}
	}
}
else
{
	do
	{
		W_FirePlasmaRifle();
		if ((self.prifle_heat > IT_SUPER_NAILGUN))
		{
			r = 0.4;
		}
		else
		{
			if ((self.prifle_heat > TE_EXPLOSION))
			{
				r = 0.25;
			}
			else
			{
				r = 0.2;
			}
		}
	}
	else
	{

	} while ((self.weapon == IT_SHOTGUN));

} while ((self.weapon == IT_SKULL));

} while ((self.weapon == IT_SUPER_SHOTGUN));

} while ((self.weapon == IT_NAILGUN));

} while ((self.weapon == IT_ROCKET_LAUNCHER));

} while ((self.weapon == IT_SUPER_NAILGUN));

} while ((self.weapon == IT_GRENADE_LAUNCHER));

} while ((self.weapon == IT_LIGHTNING));

} while ((self.weapon == IT_BR));

} while ((self.weapon == IT_AXE));

} while ((self.weapon == IT_EXTRA_WEAPON));

} while ((self.weapon == IT_EXTRA_WEAPON2));
}
}
}
}
}
}
}
}
}
}
}
}
if ((self.weaponstate == TE_SPIKE))
{
self.weaponstate = IT_SHOTGUN;
}
if ((self.attack_finished <= time))
{
self.attack_finished = (self.attack_finished + r);
}
if ((self.ishuman != IT_SHOTGUN))
{
if ((self.currentammo <= TE_SPIKE))
{
reload();
self.currentammo = IT_SHOTGUN;
return;
}
}
#endif
};

void() W_ChangeWeapon =
{
#error Corrupt Function: W_ChangeWeapon
#if 0
	local float fl;

	do_tail
	{
		fl = IT_AXE;
	}
	else
	{
		do
		{
			fl = IT_SHOTGUN;
		}
		else
		{
			do
			{
				fl = IT_SUPER_SHOTGUN;
			}
			else
			{
				do
				{
					fl = IT_NAILGUN;
				}
				else
				{
					do
					{
						fl = IT_SUPER_NAILGUN;
					}
					else
					{
						do
						{
							fl = IT_GRENADE_LAUNCHER;
						}
						else
						{
							do
							{
								fl = IT_ROCKET_LAUNCHER;
							}
							else
							{
								do
								{
									fl = IT_LIGHTNING;
								}
								else
								{

								} while ((self.impulse == IT_SHOTGUN));

							} while ((self.impulse == IT_SUPER_SHOTGUN));

						} while ((self.impulse == TE_EXPLOSION));

					} while ((self.impulse == IT_NAILGUN));

				} while ((self.impulse == TE_LIGHTNING1));

			} while ((self.impulse == TE_LIGHTNING2));

		} while ((self.impulse == TE_WIZSPIKE));

	} while ((self.impulse == IT_SUPER_NAILGUN));
}
}
}
}
}
}
}
}
if (!(self.items & fl))
{
_sprint(self, /*16835i*/"no weapon.\n");
return;
}
W_WeaponSwitch(fl);
#endif
};

void() CheatCommand =
{
	if ((deathmatch || coop))
	{
		return;
	}
	bprint("Impulse 9 disabled. Use Impulses 14 through 26 to spawn all weapons.\n");
};

void() CycleWeaponCommand =
{
#error Corrupt Function: CycleWeaponCommand
#if 0
	local float w;

	w = self.weapon;
	do
	{
		do_tail
		{
			w = IT_AXE;
		}
		else
		{
			do
			{
				w = IT_SHOTGUN;
			}
			else
			{
				do
				{
					w = IT_SUPER_SHOTGUN;
				}
				else
				{
					do
					{
						w = IT_NAILGUN;
					}
					else
					{
						do
						{
							w = IT_SUPER_NAILGUN;
						}
						else
						{
							do
							{
								w = IT_GRENADE_LAUNCHER;
							}
							else
							{
								do
								{
									w = IT_ROCKET_LAUNCHER;
								}
								else
								{
									do
									{
										w = IT_EXTRA_WEAPON;
									}
									else
									{
										do
										{
											w = IT_EXTRA_WEAPON2;
										}
										else
										{
											do
											{
												w = IT_BR;
											}
											else
											{
												do
												{
													w = IT_SKULL;
												}
												else
												{
													do
													{
														w = IT_LIGHTNING;
													}
													else
													{

													} while ((w == IT_LIGHTNING));

												} while ((w == IT_AXE));

											} while ((w == IT_SHOTGUN));

										} while ((w == IT_SUPER_SHOTGUN));

									} while ((w == IT_NAILGUN));

								} while ((w == IT_SUPER_NAILGUN));

							} while ((w == IT_GRENADE_LAUNCHER));

						} while ((w == IT_ROCKET_LAUNCHER));

					} while ((w == IT_EXTRA_WEAPON));

				} while ((w == IT_EXTRA_WEAPON2));

			} while ((w == IT_BR));

		} while ((w == IT_SKULL));
	}
}
}
}
}
}
}
}
}
}
}
}
if ((self.items & w))
{
W_WeaponSwitch(w);
return;
}
} while(1);
#endif
};

void() CycleWeaponReverseCommand =
{
#error Corrupt Function: CycleWeaponReverseCommand
#if 0
	local float w;

	w = self.weapon;
	do
	{
		do_tail
		{
			w = IT_ROCKET_LAUNCHER;
		}
		else
		{
			do
			{
				w = IT_GRENADE_LAUNCHER;
			}
			else
			{
				do
				{
					w = IT_SUPER_NAILGUN;
				}
				else
				{
					do
					{
						w = IT_NAILGUN;
					}
					else
					{
						do
						{
							w = IT_SUPER_SHOTGUN;
						}
						else
						{
							do
							{
								w = IT_SHOTGUN;
							}
							else
							{
								do
								{
									w = IT_AXE;
								}
								else
								{
									do
									{
										w = IT_LIGHTNING;
									}
									else
									{

									} while ((w == IT_LIGHTNING));

								} while ((w == IT_ROCKET_LAUNCHER));

							} while ((w == IT_GRENADE_LAUNCHER));

						} while ((w == IT_SUPER_NAILGUN));

					} while ((w == IT_NAILGUN));

				} while ((w == IT_SUPER_SHOTGUN));

			} while ((w == IT_SHOTGUN));

		} while ((w == IT_AXE));
	}
}
}
}
}
}
}
}
if (((self.items & w) && W_HasAmmo(w)))
{
W_WeaponSwitch(w);
return;
}
} while(1);
#endif
};

void() ServerflagsCommand =
{
	if ((deathmatch || coop))
	{
		return;
	}
	serverflags = (serverflags * IT_SUPER_SHOTGUN) + IT_SHOTGUN;
};

void() Heal =
{
	if ((self.health >= (self.max_health - TE_LAVASPLASH)))
	{
		particle(self.origin, '0 0 15', 110, TE_LAVASPLASH);
	}
	else
	{
		particle(self.origin, '0 0 10', 110, IT_SHOTGUN);
	}
	self.health = (self.health + 0.5);
};

void() reload =
{
#error Corrupt Function: reload
#if 0

	if ((self.reload_time > time))
	{
		return;
	}
	if (((self.weapon == IT_SUPER_SHOTGUN) && (self.weaponframe != TE_SPIKE)))
	{
		return;
	}
	if (((self.armorvalue > TE_SPIKE) && (self.currentammo != W_GetMaxClip(self.weapon, IT_SHOTGUN))))
	{
		do_tail
		{
			sound(self, TE_WIZSPIKE, "weapons/reload/pistol.wav", IT_SHOTGUN, IT_SHOTGUN);
			self.weaponframe = IT_SUPER_NAILGUN;
		}
		else
		{
			do
			{
				sound(self, TE_WIZSPIKE, "weapons/reload/shottie.wav", IT_SHOTGUN, IT_SHOTGUN);
				self.weaponframe = TE_LAVASPLASH;
			}
			else
			{
				do
				{
					sound(self, TE_WIZSPIKE, "weapons/reload/ar.wav", IT_SHOTGUN, IT_SHOTGUN);
					self.weaponframe = TE_LIGHTNING2;
				}
				else
				{
					do
					{
						sound(self, TE_WIZSPIKE, "weapons/reload/sniper.wav", IT_SHOTGUN, IT_SHOTGUN);
						self.weaponframe = TE_WIZSPIKE;
					}
					else
					{
						do
						{
							sound(self, TE_WIZSPIKE, "weapons/reload/rocket.wav", IT_SHOTGUN, IT_SHOTGUN);
							self.weaponframe = TE_TELEPORT;
						}
						else
						{
							do
							{
								sound(self, TE_WIZSPIKE, "weapons/reload/needler.wav", IT_SHOTGUN, IT_SHOTGUN);
								self.weaponframe = TE_LIGHTNING1;
							}
							else
							{
								do
								{
									sound(self, TE_WIZSPIKE, "weapons/reload/pistol.wav", IT_SHOTGUN, IT_SHOTGUN);
									self.weaponframe = TE_LIGHTNING1;
								}
								else
								{
									do
									{
										return;
										do
										{
											sound(self, TE_WIZSPIKE, "weapons/reload/uzi.wav", IT_SHOTGUN, IT_SHOTGUN);
											self.weaponframe = IT_NAILGUN;
										}
										else
										{

										} while ((self.weapon == IT_SHOTGUN));

									} while ((self.weapon == IT_SUPER_SHOTGUN));

								} while ((self.weapon == IT_NAILGUN));

							} while ((self.weapon == IT_GRENADE_LAUNCHER));

						} while ((self.weapon == IT_ROCKET_LAUNCHER));

					} while ((self.weapon == IT_EXTRA_WEAPON));

				} while ((self.weapon == IT_BR));

			} while ((self.weapon == IT_LIGHTNING));
		} while(1);
	}
}
}
}
}
}
}
}
self.pfov = 90;
Set_FOV(90);
self.attack_finished = (time + 0.2);
player_reload1();
}
#endif
};

void() bot_cam_think =
{
	msg_entity = self;
	WriteByte(IT_SHOTGUN, TE_LIGHTNING1);
	WriteEntity(IT_SHOTGUN, self.goalentity);
	WriteByte(IT_SHOTGUN, TE_LAVASPLASH);
	WriteAngle(IT_SHOTGUN, self.goalentity.angles_x);
	WriteAngle(IT_SHOTGUN, self.goalentity.angles_y);
	WriteAngle(IT_SHOTGUN, self.goalentity.angles_z);
	self.angles = self.goalentity.angles;
	self.fixangle = IT_SHOTGUN;
	self.think = bot_cam_think;
	self.nextthink = (time + 0.01);
};

void() make_bot_cam =
{

	self.goalentity = find(self.goalentity, classname, /*1957i*/"player");
	if (((self.goalentity.classname != "player") || (self.goalentity.health <= TE_SPIKE)))
	{
		msg_entity = self;
		WriteByte(IT_SHOTGUN, TE_LIGHTNING1);
		WriteEntity(IT_SHOTGUN, self);
		WriteByte(IT_SHOTGUN, TE_LAVASPLASH);
		WriteAngle(IT_SHOTGUN, self.angles_x);
		WriteAngle(IT_SHOTGUN, self.angles_y);
		WriteAngle(IT_SHOTGUN, self.angles_z);
		bprint("Back into your body.\n");
		W_SetCurrentAmmo();
		player_stand1();
		return;
	}
	self.weaponmodel = "";
	self.think = bot_cam_think;
	self.nextthink = (time + 0.01);
	bprint("Looking through ");
	bprint(self.goalentity.netname);
	bprint("'s eyes.\n");
};

void() ImpulseCommands =
{
#error Corrupt Function: ImpulseCommands
#if 0

	if ((self.impulse == 203))
	{
		make_bot_cam();
	}
	do_tail
	{
		W_ChangeWeapon();
	}
	else
	{
		do
		{
			CheatCommand();
		}
		else
		{
			do
			{
				CycleWeaponCommand();
				pre_player_pull(self);
			}
			else
			{
				do
				{
					WeaponZoom();
				}
				else
				{
					do
					{
						ThrowWeapon(IT_NAILGUN, TE_SPIKE);
						do
						{
							W_UpdateAmmoCounts(self);
							if ((self.pickup_time > time))
							{
								self.canpickup_time = (time + 0.1);
								return;
							}
							if ((self.pickup_time > time))
							{
								self.canpickup_time = (time + 0.1);
								return;
							}
							self.pfov = 90;
							Set_FOV(90);
							reload();
						}
						else
						{
							do
							{
								self.pfov = 90;
								Set_FOV(90);
								pre_player_melee();
							}
							else
							{
								do
								{
									if ((deathmatch == TE_EXPLOSION))
									{
										self.impulse = TE_TELEPORT;
										return;
									}
									if ((self.selnade == IT_SHOTGUN))
									{
										if ((self.nade_lives <= TE_SPIKE))
										{
											return;
										}
										self.nade_lives = self.nade_lives;
										self.selnade = TE_SPIKE;
										NadeCounter(self);
										sound(self, IT_SHOTGUN, "weapons/grenpick.wav", IT_SHOTGUN, IT_SHOTGUN);
									}
									else
									{
										if ((self.selnade == TE_SPIKE))
										{
											if ((self.plasma_lives <= TE_SPIKE))
											{
												return;
											}
											self.plasma_lives = self.plasma_lives;
											self.selnade = IT_SHOTGUN;
											NadeCounter(self);
											sound(self, IT_SHOTGUN, "weapons/pbounce.wav", IT_SHOTGUN, IT_SHOTGUN);
										}
									}
								}
								else
								{
									do
									{
										if ((deathmatch == TE_EXPLOSION))
										{
											if ((self.ishuman == IT_SHOTGUN))
											{
												self.impulse = 39;
											}
											return;
										}
										if ((self.attack_finished > time))
										{
											return;
										}
										self.pfov = 90;
										Set_FOV(90);
										if (((self.selnade == TE_SPIKE) && (self.nade_lives == TE_SPIKE)))
										{
											self.impulse = SVC_KILLEDMONSTER;
											return;
										}
										else
										{
											if (((self.selnade == IT_SHOTGUN) && (self.plasma_lives == TE_SPIKE)))
											{
												self.impulse = SVC_KILLEDMONSTER;
												return;
											}
										}
										if ((self.selnade == TE_SPIKE))
										{
											if ((self.nade_lives != TE_SPIKE))
											{
												pre_player_throw_grenade();
												self.nade_lives = (self.nade_lives - IT_SHOTGUN);
												NadeCounter(self);
												return;
											}
											else
											{
												centerprint(self, "No Grenades\n");
											}
										}
										else
										{
											if ((self.plasma_lives != TE_SPIKE))
											{
												pre_player_throw_grenade();
												self.plasma_lives = (self.plasma_lives - IT_SHOTGUN);
												NadeCounter(self);
												return;
											}
											else
											{
												centerprint(self, "No Plasma Grenades\n");
											}
										}
										self.attack_finished = (time + IT_SUPER_SHOTGUN);
									}
									else
									{
										do
										{
											if ((SLOWMO_TOGGLE == TE_SPIKE))
											{
												SLOWMO_TOGGLE = IT_SHOTGUN;
												self.slowmo_flags = IT_SHOTGUN;
											}
											else
											{
												SLOWMO_TOGGLE = TE_SPIKE;
												localcmd(/*17131i*/"cl_overlay 0\n");
												localcmd(/*17145i*/"cl_activate 0\n");
												localcmd(/*17160i*/"host_framerate 0\n");
												Update_Slowmo(self);
												self.slowmo_flags = TE_SPIKE;
											}
										}
										else
										{

										} while (((self.impulse >= IT_SHOTGUN) && (self.impulse <= IT_SUPER_NAILGUN)));

									} while ((self.impulse == TE_LIGHTNING3));

								} while ((self.impulse == TE_LAVASPLASH));

							} while ((self.impulse == TE_TELEPORT));

						} while ((self.impulse == 55));

					} while ((self.impulse == 13));

				} while ((self.impulse == 29));

			} while ((self.impulse == SVC_KILLEDMONSTER));

		} while ((self.impulse == SVC_FOUNDSECRET));

	} while ((self.impulse == 39));
}
}
}
}
}
}
}
}
}
self.impulse = TE_SPIKE;
#endif
};

void() W_HandlePlayerFrame =
{
#error Corrupt Function: W_HandlePlayerFrame
#if 0

	if ((!self.weaponframe && !self.wepanim))
	{
		return;
	}
	if ((self.weaponframe_time >= time))
	{
		return;
	}
	do_tail
	{
		if ((self.weaponframe > TE_EXPLOSION))
		{
			return;
		}
		self.weaponframe = (self.weaponframe + IT_SHOTGUN);
		self.weaponframe_time = (time + 0.1);
		if ((self.weaponframe > TE_EXPLOSION))
		{
			self.weaponframe = TE_SPIKE;
		}
	}
	else
	{
		do
		{
			self.wepanim = TE_SPIKE;
			self.weaponframe = (self.weaponframe + IT_SHOTGUN);
			self.weaponframe_time = (time + 0.1);
			if ((self.weaponframe > IT_GRENADE_LAUNCHER))
			{
				self.weaponframe = TE_SPIKE;
			}
		}
		else
		{
			do
			{
				if ((self.weaponframe > TE_LIGHTNING3))
				{
					return;
				}
				self.weaponframe = (self.weaponframe + IT_SHOTGUN);
				self.weaponframe_time = (time + 0.1);
				if ((self.weaponframe > TE_LIGHTNING3))
				{
					self.weaponframe = TE_SPIKE;
				}
			}
			else
			{
				do
				{
					if ((self.weaponframe > TE_EXPLOSION))
					{
						return;
					}
					self.weaponframe = (self.weaponframe + IT_SHOTGUN);
					self.weaponframe_time = (time + 0.1);
					if ((self.weaponframe > TE_EXPLOSION))
					{
						self.weaponframe = TE_SPIKE;
					}
				}
				else
				{
					do
					{
						if ((self.weaponframe > TE_EXPLOSION))
						{
							return;
						}
						if ((self.currentammo == TE_SPIKE))
						{
							self.weaponframe = TE_SPIKE;
							return;
						}
						if ((self.weaponstate != TE_SPIKE))
						{
							self.weaponframe_time = (time + 0.1);
							self.weaponframe = (self.weaponframe + IT_SHOTGUN);
							if ((self.weaponframe > IT_SUPER_SHOTGUN))
							{
								self.weaponframe = IT_SHOTGUN;
							}
						}
						else
						{
							self.weaponframe = TE_SPIKE;
						}
					}
					else
					{
						do
						{
							if ((self.weaponframe > TE_TELEPORT))
							{
								return;
							}
							self.weaponframe = (self.weaponframe + IT_SHOTGUN);
							self.weaponframe_time = (time + 0.1);
							if ((self.weaponframe > TE_LAVASPLASH))
							{
								self.weaponframe = TE_SPIKE;
							}
						}
						else
						{
							do
							{
								if ((self.weaponframe > TE_EXPLOSION))
								{
									return;
								}
								self.weaponframe = (self.weaponframe + IT_SHOTGUN);
								self.weaponframe_time = (time + 0.1);
								if ((self.weaponframe > TE_EXPLOSION))
								{
									self.weaponframe = TE_SPIKE;
								}
							}
							else
							{
								do
								{
									if ((self.weaponframe > TE_EXPLOSION))
									{
										return;
									}
									self.weaponframe = (self.weaponframe + IT_SHOTGUN);
									self.weaponframe_time = (time + 0.1);
									if ((self.weaponframe > TE_EXPLOSION))
									{
										self.weaponframe = TE_SPIKE;
									}
								}
								else
								{
									do
									{
										if (((self.weaponframe > 18) && (self.weaponframe < 25)))
										{
											self.weaponframe = (self.weaponframe + IT_SHOTGUN);
											self.weaponframe_time = (time + 0.1);
											if ((self.weaponframe == 21))
											{
												W_FireSword(IT_SHOTGUN);
											}
											if ((self.weaponframe > 24))
											{
												self.weaponframe = TE_SPIKE;
											}
										}
										else
										{
											if (((self.weaponframe > 25) && (self.weaponframe < IT_ROCKET_LAUNCHER)))
											{
												self.weaponframe = (self.weaponframe + IT_SHOTGUN);
												self.weaponframe_time = (time + 0.1);
												if ((self.weaponframe == 29))
												{
													W_FireSword(TE_SPIKE);
												}
												if ((self.weaponframe > SVC_FINALE))
												{
													self.weaponframe = TE_SPIKE;
												}
											}
											else
											{
												self.weaponframe = (self.weaponframe + IT_SHOTGUN);
												self.weaponframe_time = (time + 0.1);
												if ((self.weaponframe == 15))
												{
													W_FireSword(TE_SPIKE);
												}
												if ((self.weaponframe > 18))
												{
													self.weaponframe = TE_SPIKE;
												}
											}
										}
									}
									else
									{
										do
										{
											if ((self.weaponframe > TE_EXPLOSION))
											{
												return;
											}
											self.weaponframe = (self.weaponframe + IT_SHOTGUN);
											self.weaponframe_time = (time + 0.1);
											if ((self.weaponframe > TE_EXPLOSION))
											{
												self.weaponframe = TE_SPIKE;
											}
										}
										else
										{
											do
											{
												if ((self.weaponframe > TE_EXPLOSION))
												{
													return;
												}
												self.weaponframe = (self.weaponframe + IT_SHOTGUN);
												self.weaponframe_time = (time + 0.1);
												if ((self.weaponframe > TE_EXPLOSION))
												{
													self.weaponframe = TE_SPIKE;
												}
											}
											else
											{
												do
												{
													if ((self.exprifle >= 100))
													{
														self.wepanim = TE_SPIKE;
														self.exprifle = 99;
														W_UpdateAmmoCounts(self);
														self.weaponframe = IT_SHOTGUN;
														player_reload1();
													}
													self.weaponframe = IT_SHOTGUN;
													self.wepanim = IT_SHOTGUN;
													self.weaponframe_time = (time + 0.065);
												}
												else
												{
													do
													{
														if ((self.weaponframe > IT_NAILGUN))
														{
															return;
														}
														self.weaponframe = (self.weaponframe + IT_SHOTGUN);
														self.weaponframe_time = (time + 0.1);
														if ((self.weaponframe > TE_LIGHTNING2))
														{
															self.weaponframe = TE_SPIKE;
														}
													}
													else
													{

													} while ((self.weapon == IT_SHOTGUN));

												} while ((self.weapon == IT_SKULL));

											} while ((self.weapon == IT_SUPER_SHOTGUN));

										} while ((self.weapon == IT_NAILGUN));

									} while ((self.weapon == IT_SUPER_NAILGUN));

								} while ((self.weapon == IT_ROCKET_LAUNCHER));

							} while ((self.weapon == IT_GRENADE_LAUNCHER));

						} while ((self.weapon == IT_LIGHTNING));

					} while ((self.weapon == IT_AXE));

				} while ((self.weapon == IT_EXTRA_WEAPON));

			} while ((self.weapon == IT_BR));

		} while ((self.weapon == IT_EXTRA_WEAPON2));
	} while(1);
}
}
}
}
}
}
}
}
}
}
}
}
}
self.wepanim = TE_SPIKE;
#endif
};

void() W_WeaponFrame =
{
	local float scount;

	W_HandlePlayerFrame();
	if ((self.health < self.ohealth))
	{
		self.regen = (time + TE_EXPLOSION);
	}
	self.ohealth = self.health;
	if ((((time > self.regen) && (self.health < self.max_health)) && (deathmatch != TE_EXPLOSION)))
	{
		Heal();
	}
	if ((time < self.attack_finished))
	{
		return;
	}
	if (self.impulse)
	{
		ImpulseCommands();
	}
	if (self.button0)
	{
		scount = TE_SPIKE;
		while ((self.attack_finished <= time))
		{
			if ((scount >= IT_NAILGUN))
			{
				self.attack_finished = time;
			}
			else
			{
				W_Attack();
				scount = scount + IT_SHOTGUN;
			}
		}
	}
	else
	{
		if ((self.weaponheat > TE_SPIKE))
		{
			W_Attack();
		}
		if ((self.needler_heat > TE_SPIKE))
		{
			self.needler_heat = TE_SPIKE;
		}
		if ((self.prifle_heat > TE_SPIKE))
		{
			self.prifle_heat = TE_SPIKE;
		}
		self.attack_finished = time;
		self.weaponstate = TE_SPIKE;
	}
};

void() SuperDamageSound =
{
	if ((self.super_damage_finished > time))
	{
		if ((self.super_sound < time))
		{
			self.super_sound = (time + IT_SHOTGUN);
			sound(self, IT_NAILGUN, "items/damage3.wav", IT_SHOTGUN, IT_SHOTGUN);
		}
	}
	return;
};

void() W_SetCurrentAmmo =
{
	self.weaponframe = TE_SPIKE;
	W_UpdateAmmoCounts(self);
	CheckModel();
};
