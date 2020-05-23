//Decompiled code. Please respect the original copyright.

float(float pweapons) GetPlayerWeapons =
{
	local float i;

	if ((pweapons & IT_SHOTGUN))
	{
		i = i + IT_SHOTGUN;
	}
	if ((pweapons & IT_SKULL))
	{
		i = i + IT_SHOTGUN;
	}
	if ((pweapons & IT_SUPER_SHOTGUN))
	{
		i = i + IT_SHOTGUN;
	}
	if ((pweapons & IT_NAILGUN))
	{
		i = i + IT_SHOTGUN;
	}
	if ((pweapons & IT_SUPER_NAILGUN))
	{
		i = i + IT_SHOTGUN;
	}
	if ((pweapons & IT_ROCKET_LAUNCHER))
	{
		i = i + IT_SHOTGUN;
	}
	if ((pweapons & IT_GRENADE_LAUNCHER))
	{
		i = i + IT_SHOTGUN;
	}
	if ((pweapons & IT_LIGHTNING))
	{
		i = i + IT_SHOTGUN;
	}
	if ((pweapons & IT_AXE))
	{
		i = i + IT_SHOTGUN;
	}
	if ((pweapons & IT_EXTRA_WEAPON))
	{
		i = i + IT_SHOTGUN;
	}
	if ((pweapons & IT_EXTRA_WEAPON2))
	{
		i = i + IT_SHOTGUN;
	}
	if ((pweapons & IT_BR))
	{
		i = i + IT_SHOTGUN;
	}
	return (i);
};

float(entity t_plyr, float t_wep, float cliptype) GetAmmoCount =
{
	local float oldweapon;
	local float rtval;

	oldweapon = t_plyr.weapon;
	t_plyr.weapon = t_wep;
	W_UpdateAmmoCounts(t_plyr);
	if (cliptype)
	{
		rtval = t_plyr.currentammo;
	}
	else
	{
		rtval = t_plyr.armorvalue;
	}
	t_plyr.weapon = oldweapon;
	W_UpdateAmmoCounts(t_plyr);
	return (rtval);
};

void(entity t_wep, float weptype) SetWeaponAmmo =
{
#error Corrupt Function: SetWeaponAmmo
#if 0
	local float stammo;

	stammo = W_GetMaxClip(weptype, IT_SHOTGUN);
	do_tail
	{
		t_wep.exshells = 24;
		t_wep.ammo_shells = stammo;
	}
	else
	{
		do
		{
			t_wep.exshells = TE_SPIKE;
			t_wep.ammo_shells = stammo;
		}
		else
		{
			do
			{
				t_wep.exshells2 = 20;
				t_wep.ammo_shells2 = stammo;
			}
			else
			{
				do
				{
					t_wep.exnails = 120;
					t_wep.ammo_nails = stammo;
				}
				else
				{
					do
					{
						t_wep.exhshells = 180;
						t_wep.ammo_hshells = stammo;
					}
					else
					{
						do
						{
							t_wep.exrockets = IT_SUPER_SHOTGUN;
							t_wep.ammo_rockets = stammo;
						}
						else
						{
							do
							{
								t_wep.exsniper = TE_LAVASPLASH;
								t_wep.ammo_sniper = stammo;
							}
							else
							{
								do
								{
									t_wep.exppistol = TE_SPIKE;
									t_wep.ammo_ppistol = stammo;
								}
								else
								{
									do
									{
										t_wep.exppistol = TE_SPIKE;
										t_wep.ammo_ppistol = stammo;
									}
									else
									{
										do
										{
											t_wep.exneedler = 90;
											t_wep.ammo_needler = stammo;
										}
										else
										{
											do
											{
												t_wep.exprifle = TE_SPIKE;
												t_wep.ammo_prifle = stammo;
											}
											else
											{
												do
												{
													t_wep.exbr = 108;
													t_wep.ammo_br = stammo;
												}
												else
												{
													do
													{
													}
													else
													{

													} while ((weptype == IT_SHOTGUN));

												} while ((weptype == IT_SKULL));

											} while ((weptype == IT_SUPER_SHOTGUN));

										} while ((weptype == IT_NAILGUN));

									} while ((weptype == IT_SUPER_NAILGUN));

								} while ((weptype == IT_ROCKET_LAUNCHER));

							} while ((weptype == IT_GRENADE_LAUNCHER));

						} while ((weptype == IT_LIGHTNING));

					} while ((weptype == IT_AXE));

				} while ((weptype == IT_EXTRA_WEAPON));

			} while ((weptype == IT_EXTRA_WEAPON2));

		} while ((weptype == IT_BR));
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

void(entity t_ent, float weptype, float cliptype, float newamt) SetAmmoFor =
{
#error Corrupt Function: SetAmmoFor
#if 0

	if (((GetAmmoCount(t_ent, weptype, cliptype) + newamt) > W_GetMaxClip(weptype, cliptype)))
	{
		newamt = W_GetMaxClip(weptype, cliptype) - GetAmmoCount(t_ent, weptype, cliptype);
		if ((newamt < TE_SPIKE))
		{
			newamt = TE_SPIKE;
		}
	}
	do_tail
	{
		if ((!cliptype || (cliptype > IT_SHOTGUN)))
		{
			t_ent.exshells = (t_ent.exshells + newamt);
		}
		if (cliptype)
		{
			t_ent.ammo_shells = (t_ent.ammo_shells + newamt);
		}
	}
	else
	{
		do
		{
			if ((!cliptype || (cliptype > IT_SHOTGUN)))
			{
				t_ent.exshells = (t_ent.exshells + newamt);
			}
			if (cliptype)
			{
				t_ent.ammo_shells = (t_ent.ammo_shells + newamt);
			}
		}
		else
		{
			do
			{
				if ((!cliptype || (cliptype > IT_SHOTGUN)))
				{
					t_ent.exshells2 = (t_ent.exshells2 + newamt);
				}
				if (cliptype)
				{
					t_ent.ammo_shells2 = (t_ent.ammo_shells2 + newamt);
				}
			}
			else
			{
				do
				{
					if ((!cliptype || (cliptype > IT_SHOTGUN)))
					{
						t_ent.exnails = (t_ent.exnails + newamt);
					}
					if (cliptype)
					{
						t_ent.ammo_nails = (t_ent.ammo_nails + newamt);
					}
				}
				else
				{
					do
					{
						if ((!cliptype || (cliptype > IT_SHOTGUN)))
						{
							t_ent.exhshells = (t_ent.exhshells + newamt);
						}
						if (cliptype)
						{
							t_ent.ammo_hshells = (t_ent.ammo_hshells + newamt);
						}
					}
					else
					{
						do
						{
							if ((!cliptype || (cliptype > IT_SHOTGUN)))
							{
								t_ent.exrockets = (t_ent.exrockets + newamt);
							}
							if (cliptype)
							{
								t_ent.ammo_rockets = (t_ent.ammo_rockets + newamt);
							}
						}
						else
						{
							do
							{
								if ((!cliptype || (cliptype > IT_SHOTGUN)))
								{
									t_ent.exsniper = (t_ent.exsniper + newamt);
								}
								if (cliptype)
								{
									t_ent.ammo_sniper = (t_ent.ammo_sniper + newamt);
								}
							}
							else
							{
								do
								{
									if ((!cliptype || (cliptype > IT_SHOTGUN)))
									{
										t_ent.exppistol = (t_ent.exppistol + newamt);
									}
									if (cliptype)
									{
										t_ent.ammo_ppistol = (t_ent.ammo_ppistol + newamt);
									}
								}
								else
								{
									do
									{
										if ((!cliptype || (cliptype > IT_SHOTGUN)))
										{
											t_ent.exsword = (t_ent.exsword + newamt);
										}
										if (cliptype)
										{
											t_ent.ammo_sword = (t_ent.ammo_sword + newamt);
										}
									}
									else
									{
										do
										{
											if ((!cliptype || (cliptype > IT_SHOTGUN)))
											{
												t_ent.exneedler = (t_ent.exneedler + newamt);
											}
											if (cliptype)
											{
												t_ent.ammo_needler = (t_ent.ammo_needler + newamt);
											}
										}
										else
										{
											do
											{
												if ((!cliptype || (cliptype > IT_SHOTGUN)))
												{
													t_ent.exprifle = (t_ent.exprifle + newamt);
												}
												if (cliptype)
												{
													t_ent.ammo_prifle = (t_ent.ammo_prifle + newamt);
												}
											}
											else
											{
												do
												{
													if ((!cliptype || (cliptype > IT_SHOTGUN)))
													{
														t_ent.exbr = (t_ent.exbr + newamt);
													}
													if (cliptype)
													{
														t_ent.ammo_br = (t_ent.ammo_br + newamt);
													}
												}
												else
												{
													do
													{
														_bprint(/*29109i*/"SetAmmoFor: invalid weapon type specified\n");
													}
													else
													{

													} while ((weptype == IT_SHOTGUN));

												} while ((weptype == IT_SKULL));

											} while ((weptype == IT_SUPER_SHOTGUN));

										} while ((weptype == IT_NAILGUN));

									} while ((weptype == IT_SUPER_NAILGUN));

								} while ((weptype == IT_ROCKET_LAUNCHER));

							} while ((weptype == IT_GRENADE_LAUNCHER));

						} while ((weptype == IT_LIGHTNING));

					} while ((weptype == IT_AXE));

				} while ((weptype == IT_EXTRA_WEAPON));

			} while ((weptype == IT_EXTRA_WEAPON2));

		} while ((weptype == IT_BR));
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

void(entity t_from, entity t_to, float wtype, float aremove) CopyAmmo =
{
	W_UpdateAmmoCounts(t_from);
	SetAmmoFor(t_to, wtype, TE_SPIKE, t_from.armorvalue);
	SetAmmoFor(t_to, wtype, IT_SHOTGUN, t_from.currentammo);
	if ((aremove == IT_SHOTGUN))
	{
		SetAmmoFor(t_from, wtype, TE_SPIKE, (CONTENT_EMPTY * t_from.armorvalue));
		SetAmmoFor(t_from, wtype, IT_SHOTGUN, (CONTENT_EMPTY * t_from.currentammo));
	}
};

void() weapon_becometouch =
{
	self.think = SUB_Remove;
	self.nextthink = (time + 15);
	self.touch = weapon_touch;
};

string(float wtype) weapon_getlaymodel =
{
#error Corrupt Function: weapon_getlaymodel
#if 0

	do_tail
	{
		return ("progs/g_shot.mdl");
	}
	else
	{
		do
		{
			return ("progs/g_pistol.mdl");
		}
		else
		{
			do
			{
				return ("progs/g_skull.mdl");
			}
			else
			{
				do
				{
					return ("progs/g_nail.mdl");
				}
				else
				{
					do
					{
						return ("progs/g_uzi.mdl");
					}
					else
					{
						do
						{
							return ("progs/g_rocket.mdl");
						}
						else
						{
							do
							{
								return ("progs/g_sniper.mdl");
							}
							else
							{
								do
								{
									return ("progs/g_plpist.mdl");
								}
								else
								{
									do
									{
										return ("progs/g_axe.mdl");
									}
									else
									{
										do
										{
											return ("progs/g_needler.mdl");
										}
										else
										{
											do
											{
												return ("progs/g_plrifl.mdl");
											}
											else
											{
												do
												{
													return ("progs/g_nail.mdl");
												}
												else
												{
													do
													{
														return ("progs/player.mdl");
													}
													else
													{

													} while ((wtype == IT_SUPER_SHOTGUN));

												} while ((wtype == IT_SHOTGUN));

											} while ((wtype == IT_SKULL));

										} while ((wtype == IT_NAILGUN));

									} while ((wtype == IT_SUPER_NAILGUN));

								} while ((wtype == IT_ROCKET_LAUNCHER));

							} while ((wtype == IT_GRENADE_LAUNCHER));

						} while ((wtype == IT_LIGHTNING));

					} while ((wtype == IT_AXE));

				} while ((wtype == IT_EXTRA_WEAPON));

			} while ((wtype == IT_EXTRA_WEAPON2));

		} while ((wtype == IT_BR));
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
float drop_time;

void() t_sound =
{
	local float r;

	if ((drop_time > time))
	{
		return;
	}
	if ((other.classname == "player"))
	{
		return;
	}
	r = floor((random() * TE_EXPLOSION));
	if ((r == TE_SPIKE))
	{
		sound(self, TE_SPIKE, "weapons/w_drop1.wav", 0.7, IT_SHOTGUN);
	}
	else
	{
		if ((r == IT_SHOTGUN))
		{
			sound(self, TE_SPIKE, "weapons/w_drop2.wav", 0.7, IT_SHOTGUN);
		}
		else
		{
			if ((r == IT_SUPER_SHOTGUN))
			{
				sound(self, TE_SPIKE, "weapons/w_drop3.wav", 0.7, IT_SHOTGUN);
			}
		}
	}
	drop_time = time + 0.1;
};

void(float wtype, float ttype) ThrowWeapon =
{
	local entity newthrow;

	newthrow = spawn();
	newthrow.origin = ((self.origin + '0 0 16') + (v_right * CONTENT_SKY));
	setmodel(newthrow, weapon_getlaymodel(wtype));
	setsize(newthrow, VEC_ORIGIN, VEC_ORIGIN);
	makevectors(self.v_angle);
	if (self.v_angle_x)
	{
		newthrow.velocity = ((((v_forward * 45) + (v_up * 200)) + (((IT_SUPER_SHOTGUN * (random() + -0.5)) * v_right) * TE_LAVASPLASH)) + (((IT_SUPER_SHOTGUN * (random() + -0.5)) * v_up) * TE_LAVASPLASH));
	}
	else
	{
		newthrow.velocity = aim(self, 10000);
		newthrow.velocity = (newthrow.velocity * 45);
		newthrow.velocity_z = 200;
	}
	newthrow.owner = self;
	newthrow.movetype = TE_LAVASPLASH;
	newthrow.solid = IT_SHOTGUN;
	newthrow.touch = t_sound;
	newthrow.classname = "weapon_pickup";
	newthrow.flags = IT_SHELLS;
	newthrow.gravity = TE_LIGHTNING1;
	newthrow.think = weapon_becometouch;
	newthrow.nextthink = (time + IT_SHOTGUN);
	newthrow.weapon = wtype;
	if ((ttype == IT_SHOTGUN))
	{
		CopyAmmo(self, newthrow, wtype, IT_SHOTGUN);
		newthrow.lives = IT_SHOTGUN;
	}
	else
	{
		SetWeaponAmmo(newthrow, wtype);
	}
};

void() weapon_activate =
{
	if ((self.lives == IT_SHOTGUN))
	{
		remove(self);
		return;
	}
	if (self.mdl)
	{
		setmodel(self, self.mdl);
	}
	self.touch = weapon_touch;
};

void() weapon_touch =
{
	local entity oself;
	local float addweapon;
	local float newweapon;

	oself = self;
	if (!(other.flags & IT_SUPER_NAILGUN))
	{
		return;
	}
	if ((other.ishuman != IT_SHOTGUN))
	{
		if ((other.attack_finished < time))
		{
			other.canpickup_time = (time + 0.1);
		}
	}
	self.mdl = self.model;
	if ((other.items & self.weapon))
	{
		if (((self.weapon & IT_LIGHTNING) || (self.weapon & IT_EXTRA_WEAPON2)))
		{
			if ((W_GetMaxClip(self.weapon, IT_SHOTGUN) <= GetAmmoCount(other, self.weapon, IT_SHOTGUN)))
			{
				return;
			}
		}
		if ((W_GetMaxClip(self.weapon, TE_SPIKE) <= GetAmmoCount(other, self.weapon, TE_SPIKE)))
		{
			return;
		}
		W_UpdateAmmoCounts(self);
		if (((self.weapon & IT_LIGHTNING) || (self.weapon & IT_EXTRA_WEAPON2)))
		{
			SetAmmoFor(other, self.weapon, IT_SHOTGUN, self.currentammo);
		}
		else
		{
			SetAmmoFor(other, self.weapon, TE_SPIKE, self.armorvalue);
		}
		W_UpdateAmmoCounts(other);
		if ((self.weapon_type == TE_SPIKE))
		{
			self.touch = SUB_Null;
			setmodel(self, string_null);
			self.nextthink = (time + SVC_INTERMISSION);
			self.think = weapon_activate;
			return;
		}
		else
		{
			self.weapon_type = IT_SHOTGUN;
			self.touch = SUB_Null;
			self.skin = TE_SPIKE;
			self.nextthink = (time + TE_LAVASPLASH);
			self.think = SUB_regen;
			return;
		}
	}
	if ((other.canpickup_time > time))
	{
		if (((other.weapon == self.weapon) || (GetPlayerWeapons(other.items) == IT_SUPER_SHOTGUN)))
		{
			addweapon = IT_SUPER_SHOTGUN;
		}
		else
		{
			addweapon = IT_SHOTGUN;
		}
		other.canpickup_time = TE_SPIKE;
	}
	else
	{
		if ((time > other.pickup_time))
		{
			other.pickup_time = (time + 0.5);
			return;
		}
	}
	if (((other.ishuman == IT_SHOTGUN) && (other.classname == "player")))
	{
		if ((icon_time > time))
		{
			stuffcmd(other, "cl_ww 0\n");
		}
		else
		{
			if ((time > icon_time))
			{
				icon_time = time + IT_SHOTGUN;
			}
			other.canpick = IT_SHOTGUN;
			return;
		}
		if ((self.weapon == IT_NAILGUN))
		{
			stuffcmd(other, "cl_ww 1\n");
		}
		else
		{
			if ((self.weapon == IT_LIGHTNING))
			{
				stuffcmd(other, "cl_ww 2\n");
			}
			else
			{
				if ((self.weapon == IT_SUPER_SHOTGUN))
				{
					stuffcmd(other, "cl_ww 3\n");
				}
				else
				{
					if ((self.weapon == IT_EXTRA_WEAPON))
					{
						stuffcmd(other, "cl_ww 4\n");
					}
					else
					{
						if ((self.weapon == IT_ROCKET_LAUNCHER))
						{
							stuffcmd(other, "cl_ww 5\n");
						}
						else
						{
							if ((self.weapon == IT_SHOTGUN))
							{
								stuffcmd(other, "cl_ww 6\n");
							}
							else
							{
								if ((self.weapon == IT_SUPER_NAILGUN))
								{
									stuffcmd(other, "cl_ww 7\n");
								}
								else
								{
									if ((self.weapon == IT_GRENADE_LAUNCHER))
									{
										stuffcmd(other, "cl_ww 8\n");
									}
									else
									{
										if ((self.weapon == IT_BR))
										{
											stuffcmd(other, "cl_ww 9\n");
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
	other.canpick = TE_SPIKE;
	if (addweapon)
	{
		other.attack_finished = (time + 0.1);
		if ((addweapon == IT_SHOTGUN))
		{
			other.items = (other.items | self.weapon);
			sprint(other, "New weapon added to your inv\n");
		}
		else
		{
			if ((addweapon == IT_SUPER_SHOTGUN))
			{
				newweapon = self.weapon;
				other.items = (other.items - other.weapon);
				other.items = (other.items | self.weapon);
				self = other;
				ThrowWeapon(self.weapon, IT_SHOTGUN);
				W_WeaponSwitch(newweapon);
				W_SetCurrentAmmo();
				pre_player_pull(other);
				self = oself;
			}
		}
		CopyAmmo(self, other, self.weapon, TE_SPIKE);
		W_UpdateAmmoCounts(other);
		if ((self.weapon_type == TE_SPIKE))
		{
			self.touch = SUB_Null;
			setmodel(self, string_null);
			self.nextthink = (time + SVC_INTERMISSION);
			self.think = weapon_activate;
			return;
		}
		else
		{
			self.weapon_type = IT_SHOTGUN;
			self.touch = SUB_Null;
			self.skin = TE_SPIKE;
			self.nextthink = (time + TE_LAVASPLASH);
			self.think = SUB_regen;
			return;
		}
	}
};

void() weapon_start =
{
	if (!self.weapon)
	{
		_bprint(/*29423i*/"weapon_start: weapon with no .weapon set!\n");
		remove(self);
	}
	if ((deathmatch >= IT_SUPER_SHOTGUN))
	{
		remove(self);
		return;
	}
	self.classname = "weapon_pickup";
	self.flags = IT_SHELLS;
	self.weapon_type = TE_SPIKE;
	precache_model(weapon_getlaymodel(self.weapon));
	setmodel(self, weapon_getlaymodel(self.weapon));
	self.gravity = TE_EXPLOSION;
	self.solid = IT_SHOTGUN;
	setsize(self, '-16 -16 0', '16 16 56');
	SetWeaponAmmo(self, self.weapon);
	self.touch = weapon_touch;
};

void() weapon_shotgun =
{
	self.weapon = IT_SHOTGUN;
	weapon_start();
};

void() weapon_pistol =
{
	weapon_shotgun();
};

void() weapon_skull =
{
	self.weapon = IT_SKULL;
	weapon_start();
};

void() weapon_supershotgun =
{
	self.weapon = IT_SUPER_SHOTGUN;
	weapon_start();
};

void() weapon_nailgun =
{
	self.weapon = IT_NAILGUN;
	weapon_start();
};

void() weapon_ar =
{
	weapon_nailgun();
};

void() weapon_supernailgun =
{
	self.weapon = IT_SUPER_NAILGUN;
	weapon_start();
};

void() weapon_uzi =
{
	weapon_supernailgun();
};

void() weapon_grenadelauncher =
{
	self.weapon = IT_LIGHTNING;
	weapon_start();
};

void() weapon_ppistol =
{
	weapon_grenadelauncher();
};

void() weapon_rocketlauncher =
{
	self.weapon = IT_ROCKET_LAUNCHER;
	weapon_start();
};

void() weapon_lightning =
{
	self.weapon = IT_GRENADE_LAUNCHER;
	weapon_start();
};

void() weapon_sniperrifle =
{
	weapon_lightning();
};

void() weapon_sword =
{
	self.weapon = IT_AXE;
	weapon_start();
};

void() weapon_plasmapistol =
{
	self.weapon = IT_LIGHTNING;
	weapon_start();
};

void() weapon_plasmarifle =
{
	self.weapon = IT_EXTRA_WEAPON2;
	weapon_start();
};

void() weapon_battlerifle =
{
	self.weapon = IT_BR;
	weapon_start();
};

void() weapon_needler =
{
	self.weapon = IT_EXTRA_WEAPON;
	weapon_start();
};
