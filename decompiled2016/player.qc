//Decompiled code. Please respect the original copyright.
void() Update_Lives;
void() bubble_bob;

float(float anim_type, float endframe) Player_GetFrame =
{
#error Corrupt Function: Player_GetFrame
#if 0

}
else
{
	if (endframe)
	{
		return (TE_SPIKE);
	}
	return (TE_SPIKE);
}
else
{
	do
	{
		if (endframe)
		{
			return (TE_WIZSPIKE);
		}
		return (IT_SHOTGUN);
	}
	else
	{
		do
		{
			if (endframe)
			{
				return (TE_TELEPORT);
			}
			return (TE_TELEPORT);
		}
		else
		{
			do
			{
				if (endframe)
				{
					return (18);
				}
				return (12);
			}
			else
			{
				do
				{
					if (endframe)
					{
						return (24);
					}
					return (19);
				}
				else
				{
					do
					{
						if (endframe)
						{
							return (25);
						}
						return (IT_ROCKET_LAUNCHER);
					}
					else
					{
						do
						{
							if (endframe)
							{
								return (42);
							}
							return (SVC_SELLSCREEN);
						}
						else
						{
							do
							{
								if (endframe)
								{
									return (48);
								}
								return (42);
							}
							else
							{
								do
								{
									if (endframe)
									{
										return (53);
									}
									return (49);
								}
								else
								{
									do
									{
										if (endframe)
										{
											return (53);
										}
										return (49);
									}
									else
									{
										do
										{
											if (endframe)
											{
												return (53);
											}
											return (49);
										}
										else
										{
											do
											{
												return (TE_SPIKE);
											}
											else
											{
											}

										} while ((anim_type == IT_SHOTGUN));

									} while ((anim_type == IT_SUPER_SHOTGUN));

								} while ((anim_type == TE_EXPLOSION));

							} while ((anim_type == IT_NAILGUN));

						} while ((anim_type == TE_LIGHTNING1));

					} while ((anim_type == TE_LIGHTNING2));

				} while ((anim_type == TE_WIZSPIKE));

			} while ((anim_type == IT_SUPER_NAILGUN));

		} while ((anim_type == TE_LIGHTNING3));

	} while ((anim_type == TE_LAVASPLASH));
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
return (TE_SPIKE);
#endif
};

void(entity t_plyr, float t_frame) startwframe =
{
	if ((t_plyr.weaponframe < t_frame))
	{
		t_plyr.weaponframe = t_frame;
	}
};

void() steps =
{
	local float r;

	if ((vlen(self.velocity) > 137))
	{
		if (((self.walkframe == IT_SHOTGUN) || (self.walkframe == IT_NAILGUN)))
		{
			if ((checkbottom(self) == IT_SHOTGUN))
			{
				if ((self.waterlevel == TE_SPIKE))
				{
					r = rint((random() * TE_EXPLOSION));
					if ((r == IT_SHOTGUN))
					{
						sound(self, TE_SPIKE, "steps/boot1.wav", 0.5, IT_SHOTGUN);
					}
					else
					{
						if ((r == IT_SUPER_SHOTGUN))
						{
							sound(self, TE_SPIKE, "steps/boot2.wav", 0.5, IT_SHOTGUN);
						}
						else
						{
							if ((r == TE_EXPLOSION))
							{
								sound(self, TE_SPIKE, "steps/boot3.wav", 0.5, IT_SHOTGUN);
							}
							else
							{
								if ((r == IT_NAILGUN))
								{
									sound(self, TE_SPIKE, "steps/boot4.wav", 0.5, IT_SHOTGUN);
								}
							}
						}
					}
				}
			}
		}
	}
};

void() player_stand1 = [ 0, player_stand1 ]
{
	player_run();
};

void() player_run = [ 0, player_run ]
{
	local float ftype;

	steps();
	if (self.button0)
	{
		if ((vlen(self.velocity) < 20))
		{
			ftype = TE_EXPLOSION;
		}
		else
		{
			ftype = TE_LIGHTNING1;
		}
	}
	if ((vlen(self.velocity) < 150))
	{
		ftype = IT_SHOTGUN;
	}
	else
	{
		ftype = IT_SHOTGUN;
	}
	if (!(self.flags & IT_NAILS))
	{
		ftype = IT_SUPER_SHOTGUN;
	}
	if ((!self.velocity_x && !self.velocity_y))
	{
		ftype = TE_SPIKE;
	}
	self.frame = Player_GetFrame(ftype, TE_SPIKE);
	if (((self.frame + self.walkframe) > Player_GetFrame(ftype, IT_SHOTGUN)))
	{
		self.walkframe = TE_SPIKE;
	}
	self.frame = (self.frame + self.walkframe);
	self.walkframe = (self.walkframe + IT_SHOTGUN);
};
void() player_shot2;

void() player_shot1 = [ 113, player_shot2 ]
{
	self.weaponframe = IT_SHOTGUN;
};
void() player_shot3;

void() player_shot2 = [ 114, player_shot3 ]
{
	self.weaponframe = IT_SUPER_SHOTGUN;
};
void() player_shot4;

void() player_shot3 = [ 115, player_shot4 ]
{
	self.weaponframe = TE_EXPLOSION;
};

void() player_shot4 = [ 116, player_run ]
{
	self.weaponframe = TE_SPIKE;
};
void() player_shot6;

void() player_shot5 = [ 117, player_shot6 ]
{
	self.weaponframe = TE_LIGHTNING1;
};

void() player_shot6 = [ 118, player_run ]
{
	self.weaponframe = TE_LIGHTNING2;
};

void() player_pistol_reload =
{
	local float amt;

	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe == 29))
	{
		player_run();
		amt = 12 - self.ammo_shells;
		if ((self.exshells < amt))
		{
			amt = self.exshells;
		}
		self.exshells = (self.exshells - amt);
		self.ammo_shells = (self.ammo_shells + amt);
		self.armorvalue = self.exshells;
		W_SetCurrentAmmo();
		return;
	}
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_skull_reload =
{
	local float amt;

	self.weaponframe = (self.weaponframe + IT_SKULL);
	if ((self.weaponframe == 29))
	{
		player_run();
		amt = 12 - self.ammo_shells;
		if ((self.exshells < amt))
		{
			amt = self.exshells;
		}
		self.exshells = (self.exshells - amt);
		self.ammo_shells = (self.ammo_shells + amt);
		self.armorvalue = self.exshells;
		W_SetCurrentAmmo();
		return;
	}
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_shotgun_reload =
{

	if ((self.button0 && (self.currentammo > TE_SPIKE)))
	{
		player_run();
		return;
	}
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe == SVC_UPDATECOLORS))
	{
		self.exshells2 = (self.exshells2 - IT_SHOTGUN);
		self.ammo_shells2 = (self.ammo_shells2 + IT_SHOTGUN);
		self.armorvalue = self.exshells2;
		W_UpdateAmmoCounts(self);
		if (((self.currentammo == W_GetMaxClip(self.weapon, IT_SHOTGUN)) || (self.armorvalue == TE_SPIKE)))
		{
			self.weaponframe = 18;
		}
		else
		{
			self.weaponframe = 13;
		}
	}
	else
	{
		if ((self.weaponframe > SVC_UPDATECOLORS))
		{
			if ((self.weaponframe > 20))
			{
				player_run();
				W_SetCurrentAmmo();
				return;
			}
		}
	}
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_uzi_reload =
{
	local float amt;

	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe > 19))
	{
		player_run();
		amt = W_GetMaxClip(self.weapon, IT_SHOTGUN) - self.ammo_hshells;
		if ((self.exhshells < amt))
		{
			amt = self.exhshells;
		}
		self.exhshells = (self.exhshells - amt);
		self.ammo_hshells = (self.ammo_hshells + amt);
		self.armorvalue = self.exhshells;
		W_SetCurrentAmmo();
		return;
	}
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_rl_reload =
{
	local float amt;

	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe > 50))
	{
		player_run();
		amt = W_GetMaxClip(self.weapon, IT_SHOTGUN) - self.ammo_rockets;
		if ((self.exrockets < amt))
		{
			amt = self.exrockets;
		}
		self.exrockets = (self.exrockets - amt);
		self.ammo_rockets = (self.ammo_rockets + amt);
		self.armorvalue = self.exrockets;
		W_SetCurrentAmmo();
		return;
	}
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_ar_reload =
{
	local float amt;

	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe == 29))
	{
		player_run();
		amt = W_GetMaxClip(self.weapon, IT_SHOTGUN) - self.ammo_nails;
		if ((self.exnails < amt))
		{
			amt = self.exnails;
		}
		self.exnails = (self.exnails - amt);
		self.ammo_nails = (self.ammo_nails + amt);
		self.armorvalue = self.exnails;
		W_SetCurrentAmmo();
		return;
	}
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_br_reload =
{
	local float amt;

	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe == 29))
	{
		player_run();
		amt = W_GetMaxClip(self.weapon, IT_SHOTGUN) - self.ammo_br;
		if ((self.exbr < amt))
		{
			amt = self.exbr;
		}
		self.exbr = (self.exbr - amt);
		self.ammo_br = (self.ammo_br + amt);
		self.armorvalue = self.exbr;
		W_SetCurrentAmmo();
		return;
	}
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_sniper_reload =
{
	local float amt;

	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe > SVC_KILLEDMONSTER))
	{
		player_run();
		amt = W_GetMaxClip(self.weapon, IT_SHOTGUN) - self.ammo_sniper;
		if ((self.exsniper < amt))
		{
			amt = self.exsniper;
		}
		self.exsniper = (self.exsniper - amt);
		self.ammo_sniper = (self.ammo_sniper + amt);
		self.armorvalue = self.exsniper;
		W_SetCurrentAmmo();
		return;
	}
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_ppistol_reload =
{
	if ((self.weaponframe < 15))
	{
		self.weaponframe = 15;
	}
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe > 35))
	{
		player_run();
		self.exppistol = TE_SPIKE;
		self.weaponheat = TE_SPIKE;
		W_SetCurrentAmmo();
		return;
	}
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_needler_reload =
{
	local float amt;

	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe > 29))
	{
		player_run();
		amt = W_GetMaxClip(self.weapon, IT_SHOTGUN) - self.ammo_needler;
		if ((self.exneedler < amt))
		{
			amt = self.exneedler;
		}
		self.exneedler = (self.exneedler - amt);
		self.ammo_needler = (self.ammo_needler + amt);
		self.armorvalue = self.exneedler;
		W_SetCurrentAmmo();
		return;
	}
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_generic_reload =
{
	local float rld_amt;

	rld_amt = self.armorvalue;
	if (((Player_GetFrame(IT_SUPER_NAILGUN, TE_SPIKE) + self.fireframe) > Player_GetFrame(IT_SUPER_NAILGUN, IT_SHOTGUN)))
	{
		rld_amt = W_GetMaxClip(self.weapon, IT_SHOTGUN) - self.currentammo;
		if ((self.armorvalue < rld_amt))
		{
			rld_amt = self.armorvalue;
		}
		player_run();
		SetAmmoFor(self, self.weapon, IT_SHOTGUN, rld_amt);
		SetAmmoFor(self, self.weapon, TE_SPIKE, (CONTENT_EMPTY * rld_amt));
		W_SetCurrentAmmo();
		return;
	}
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_reload1 = [ 0, player_reload1 ]
{
#error Corrupt Function: player_reload1
#if 0

	if ((self.impulse == 29))
	{
		self.impulse = 29;
		return;
	}
	else
	{
		if ((self.impulse == SVC_FOUNDSECRET))
		{
			self.impulse = SVC_FOUNDSECRET;
			return;
		}
		else
		{
			if ((self.impulse == TE_LAVASPLASH))
			{
				self.impulse = TE_LAVASPLASH;
				return;
			}
			else
			{
				if ((self.impulse == SVC_KILLEDMONSTER))
				{
					self.impulse = SVC_KILLEDMONSTER;
				}
				else
				{
					if ((self.reload_time == CONTENT_EMPTY))
					{
						self.reload_time = IT_SHOTGUN;
						player_run();
						return;
					}
				}
			}
		}
	}
	self.reloading = IT_SHOTGUN;
	do_tail
	{
		player_pistol_reload();
	}
	else
	{
		do
		{
			player_skull_reload();
		}
		else
		{
			do
			{
				player_shotgun_reload();
			}
			else
			{
				do
				{
					player_ar_reload();
				}
				else
				{
					do
					{
						player_uzi_reload();
					}
					else
					{
						do
						{
							player_rl_reload();
						}
						else
						{
							do
							{
								player_sniper_reload();
							}
							else
							{
								do
								{
									player_ppistol_reload();
								}
								else
								{
									do
									{
										player_needler_reload();
									}
									else
									{
										do
										{
											player_br_reload();
										}
										else
										{
											do
											{
												player_generic_reload();
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

			} while ((self.weapon == IT_EXTRA_WEAPON));

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
self.reload_time = (time + 0.1);
self.frame = Player_GetFrame(IT_SUPER_NAILGUN, TE_SPIKE);
if (((self.frame + self.fireframe) > Player_GetFrame(IT_SUPER_NAILGUN, IT_SHOTGUN)))
{
if ((self.weaponframe == TE_SPIKE))
{
self.melee_time = TE_SPIKE;
self.donefire = TE_SPIKE;
self.fireframe = TE_SPIKE;
player_run();
return;
}
else
{
self.fireframe = TE_LIGHTNING1;
}
}
self.frame = (self.frame + self.fireframe);
self.fireframe = (self.fireframe + IT_SHOTGUN);
#endif
};

void() player_hshot = [ 103, player_hshot ]
{
	if (!W_CheckNoAmmo())
	{
		return;
	}
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe == TE_LAVASPLASH))
	{
		self.weaponframe = IT_SHOTGUN;
		player_run();
		return;
	}
	self.attack_finished = (time + 0.5);
};

void() Melee_Finished =
{
	self.donefire = IT_SHOTGUN;
	self.weaponframe = TE_SPIKE;
	player_run();
};

void() player_shot_melee =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 41))
	{
		Melee_Finished();
		return;
	}
	if ((self.weaponframe == SVC_SELLSCREEN))
	{
		W_Melee();
		sound(self, IT_SHOTGUN, "weapons/melee/pistol.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_skull_melee =
{
	self.weaponframe = (self.weaponframe + IT_SKULL);
	if ((self.weaponframe >= IT_GRENADE_LAUNCHER))
	{
		Melee_Finished();
		return;
	}
	if ((self.weaponframe == IT_SHOTGUN))
	{
		W_Melee();
		sound(self, IT_SHOTGUN, "weapons/melee/pistol.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_rl_melee =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe > 65))
	{
		Melee_Finished();
		return;
	}
	if ((self.weaponframe == 62))
	{
		W_Melee();
		sound(self, IT_SHOTGUN, "weapons/melee/pistol.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_hshot_melee =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 26))
	{
		Melee_Finished();
		return;
	}
	if ((self.weaponframe == SVC_TEMPENTITY))
	{
		W_Melee();
		sound(self, IT_SHOTGUN, "weapons/melee/pistol.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_shot2_melee =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= SVC_SELLSCREEN))
	{
		Melee_Finished();
		return;
	}
	if ((self.weaponframe == SVC_INTERMISSION))
	{
		W_Melee();
		sound(self, IT_SHOTGUN, "weapons/melee/pistol.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_nail_melee =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 34))
	{
		Melee_Finished();
		return;
	}
	if ((self.weaponframe == SVC_FINALE))
	{
		W_Melee();
		sound(self, IT_SHOTGUN, "weapons/melee/pistol.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_br_melee =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 34))
	{
		Melee_Finished();
		return;
	}
	if ((self.weaponframe == SVC_FINALE))
	{
		W_Melee();
		sound(self, IT_SHOTGUN, "weapons/melee/pistol.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_sniper_melee =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 34))
	{
		Melee_Finished();
		return;
	}
	if ((self.weaponframe == IT_ROCKET_LAUNCHER))
	{
		W_Melee();
		sound(self, IT_SHOTGUN, "weapons/melee/pistol.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_ppistol_melee =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 43))
	{
		Melee_Finished();
		return;
	}
	if ((self.weaponframe == 38))
	{
		W_Melee();
		sound(self, IT_SHOTGUN, "weapons/melee/pistol.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_prifle_melee =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 41))
	{
		Melee_Finished();
		return;
	}
	if ((self.weaponframe == 34))
	{
		W_Melee();
		sound(self, IT_SHOTGUN, "weapons/melee/pistol.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_needler_melee =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 47))
	{
		Melee_Finished();
		return;
	}
	if ((self.weaponframe == 34))
	{
		W_Melee();
		sound(self, IT_SHOTGUN, "weapons/melee/needler.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() Melee_Lunge =
{
	local vector source;

	makevectors(self.v_angle);
	source = self.origin + '0 0 16';
	traceline(source, (source + (v_forward * 80)), TE_SPIKE, self);
	if ((trace_ent.health > TE_SPIKE))
	{
		self.velocity = (v_forward * 320);
	}
};

void() player_melee = [ 0, player_melee ]
{
#error Corrupt Function: player_melee
#if 0
	local float ftype;

	ftype = TE_LIGHTNING3;
	if ((self.impulse == SVC_KILLEDMONSTER))
	{
		self.impulse = SVC_KILLEDMONSTER;
	}
	self.melee_time = (time + 0.6);
	do_tail
	{
		startwframe(self, SVC_FOUNDSECRET);
		Melee_Lunge();
		player_shot2_melee();
	}
	else
	{
		do
		{
			startwframe(self, SVC_INTERMISSION);
			Melee_Lunge();
			player_shot_melee();
		}
		else
		{
			do
			{
				startwframe(self, IT_SHOTGUN);
				Melee_Lunge();
				player_skull_melee();
			}
			else
			{
				do
				{
					startwframe(self, 29);
					Melee_Lunge();
					player_nail_melee();
				}
				else
				{
					do
					{
						startwframe(self, 21);
						Melee_Lunge();
						player_hshot_melee();
					}
					else
					{
						do
						{
							startwframe(self, 58);
							Melee_Lunge();
							player_rl_melee();
						}
						else
						{
							do
							{
								startwframe(self, 29);
								Melee_Lunge();
								player_sniper_melee();
							}
							else
							{
								do
								{
									startwframe(self, 36);
									Melee_Lunge();
									player_ppistol_melee();
								}
								else
								{
									do
									{
										startwframe(self, 29);
										Melee_Lunge();
										player_prifle_melee();
									}
									else
									{
										do
										{
											startwframe(self, SVC_INTERMISSION);
											Melee_Lunge();
											player_needler_melee();
										}
										else
										{
											do
											{
												startwframe(self, 29);
												Melee_Lunge();
												player_br_melee();
											}
											else
											{
												do
												{
													self.melee_time = TE_SPIKE;
													return;

												} while ((self.weapon == IT_SUPER_SHOTGUN));

											} while ((self.weapon == IT_SHOTGUN));

										} while ((self.weapon == IT_SKULL));

									} while ((self.weapon == IT_NAILGUN));

								} while ((self.weapon == IT_SUPER_NAILGUN));

							} while ((self.weapon == IT_ROCKET_LAUNCHER));

						} while ((self.weapon == IT_GRENADE_LAUNCHER));

					} while ((self.weapon == IT_LIGHTNING));

				} while ((self.weapon == IT_EXTRA_WEAPON2));

			} while ((self.weapon == IT_EXTRA_WEAPON));

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
self.frame = Player_GetFrame(ftype, TE_SPIKE);
if (((self.frame + self.fireframe) > Player_GetFrame(ftype, IT_SHOTGUN)))
{
if ((self.weaponframe == TE_SPIKE))
{
self.melee_time = TE_SPIKE;
self.donefire = TE_SPIKE;
self.fireframe = TE_SPIKE;
player_run();
}
else
{
self.frame = Player_GetFrame(ftype, IT_SHOTGUN);
}
return;
}
self.frame = (self.frame + self.fireframe);
self.fireframe = (self.fireframe + IT_SHOTGUN);
#endif
};

void() pre_player_melee =
{

	player_melee();
	self.weaponframe = TE_SPIKE;
	self.fireframe = IT_SHOTGUN;
	self.frame = Player_GetFrame(TE_LIGHTNING3, TE_SPIKE);
};

void() Throw_Finished =
{
	self.donefire = IT_SHOTGUN;
	self.weaponframe = TE_SPIKE;
	player_run();
};

void() player_shot_throw =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 51))
	{
		Throw_Finished();
		return;
	}
	if ((self.weaponframe == 47))
	{
		W_ThrowGrenade();
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_skull_throw =
{
	self.weaponframe = (self.weaponframe + IT_SKULL);
	if ((self.weaponframe >= IT_GRENADE_LAUNCHER))
	{
		Throw_Finished();
		return;
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_shot2_throw =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 41))
	{
		Throw_Finished();
		return;
	}
	if ((self.weaponframe == 39))
	{
		W_ThrowGrenade();
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_nail_throw =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 42))
	{
		Throw_Finished();
		return;
	}
	if ((self.weaponframe == 39))
	{
		W_ThrowGrenade();
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_br_throw =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 42))
	{
		Throw_Finished();
		return;
	}
	if ((self.weaponframe == 39))
	{
		W_ThrowGrenade();
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_uzi_throw =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= SVC_SELLSCREEN))
	{
		Throw_Finished();
		return;
	}
	if ((self.weaponframe == SVC_INTERMISSION))
	{
		W_ThrowGrenade();
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_sniper_throw =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 42))
	{
		Throw_Finished();
		return;
	}
	if ((self.weaponframe == 39))
	{
		W_ThrowGrenade();
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_rl_throw =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 58))
	{
		Throw_Finished();
		return;
	}
	if ((self.weaponframe == 55))
	{
		W_ThrowGrenade();
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_ppistol_throw =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 50))
	{
		Throw_Finished();
		return;
	}
	if ((self.weaponframe == 46))
	{
		W_ThrowGrenade();
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_prifle_throw =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 48))
	{
		Throw_Finished();
		return;
	}
	if ((self.weaponframe == 45))
	{
		W_ThrowGrenade();
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_needler_throw =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 56))
	{
		Throw_Finished();
		return;
	}
	if ((self.weaponframe == 52))
	{
		W_ThrowGrenade();
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_throw_grenade = [ 0, player_throw_grenade ]
{
#error Corrupt Function: player_throw_grenade
#if 0
	local float ftype;

	ftype = IT_NAILGUN;
	self.nade_time = (time + 0.8);
	if ((self.impulse == SVC_KILLEDMONSTER))
	{
		self.impulse = SVC_KILLEDMONSTER;
	}
	do_tail
	{
		startwframe(self, 44);
		player_shot_throw();
	}
	else
	{
		do
		{
			startwframe(self, 34);
			player_shot2_throw();
		}
		else
		{
			do
			{
				startwframe(self, 34);
				player_nail_throw();
			}
			else
			{
				do
				{
					startwframe(self, 26);
					player_uzi_throw();
				}
				else
				{
					do
					{
						startwframe(self, 51);
						player_rl_throw();
					}
					else
					{
						do
						{
							startwframe(self, 35);
							player_sniper_throw();
						}
						else
						{
							do
							{
								startwframe(self, 43);
								player_ppistol_throw();
							}
							else
							{
								do
								{
									startwframe(self, 41);
									player_prifle_throw();
								}
								else
								{
									do
									{
										startwframe(self, 48);
										player_needler_throw();
									}
									else
									{
										do
										{
											startwframe(self, 34);
											player_br_throw();
										}
										else
										{
											do
											{
												self.nade_time = TE_SPIKE;
												return;

											} while ((self.weapon == IT_SHOTGUN));

										} while ((self.weapon == IT_SUPER_SHOTGUN));

									} while ((self.weapon == IT_NAILGUN));

								} while ((self.weapon == IT_SUPER_NAILGUN));

							} while ((self.weapon == IT_ROCKET_LAUNCHER));

						} while ((self.weapon == IT_GRENADE_LAUNCHER));

					} while ((self.weapon == IT_LIGHTNING));

				} while ((self.weapon == IT_EXTRA_WEAPON2));

			} while ((self.weapon == IT_EXTRA_WEAPON));

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
self.frame = Player_GetFrame(ftype, TE_SPIKE);
if (((self.frame + self.fireframe) > Player_GetFrame(ftype, IT_SHOTGUN)))
{
if ((self.weaponframe == TE_SPIKE))
{
self.donefire = TE_SPIKE;
self.fireframe = TE_SPIKE;
player_run();
}
else
{
self.frame = Player_GetFrame(ftype, IT_SHOTGUN);
}
return;
}
self.frame = (self.frame + self.fireframe);
self.fireframe = (self.fireframe + IT_SHOTGUN);
#endif
};

void() pre_player_throw_grenade =
{

	player_throw_grenade();
	self.weaponframe = TE_SPIKE;
	self.fireframe = TE_SPIKE;
	self.frame = Player_GetFrame(IT_NAILGUN, TE_SPIKE);
};

void() player_nail2 = [ 103, player_nail2 ]
{
	if (!W_CheckNoAmmo())
	{
		return;
	}
	if (!self.button0)
	{
		player_run();
		return;
	}
	SuperDamageSound();
	W_FireNail2();
};

void() player_ar1 = [ 103, player_ar1 ]
{
	if (!W_CheckNoAmmo())
	{
		return;
	}
	if (!self.button0)
	{
		player_run();
		return;
	}
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe > TE_EXPLOSION))
	{
		self.weaponframe = IT_SHOTGUN;
	}
	SuperDamageSound();
};
void(float num_bubbles) DeathBubbles;

void() PainSound =
{
#error Corrupt Function: PainSound
#if 0
	if ((self.health < TE_SPIKE))
	{
		return;
	}
	if ((self.pain_finished > time))
	{
		return;
	}
}
else
{
	do
	{
		if ((self.health >= 40))
		{
			stuffcmd(self, "play player/hit1.wav\n");
		}
	}
	else
	{
	}
} while(1);
}
#endif
};

void() Player_PainAnimation =
{
	self.pain_time = (time + 0.4);
	PainSound();
};

void() player_pain =
{
	if ((self.weaponstate != TE_SPIKE))
	{
		return;
	}
	if ((self.invisible_finished > time))
	{
		return;
	}
	Player_PainAnimation();
};

void() DeathBubblesSpawn =
{
	local entity bubble;

	if ((self.owner.waterlevel != TE_EXPLOSION))
	{
		remove(self);
		return;
	}
	bubble = spawn();
	setmodel(bubble, /*2255i*/"progs/s_bubble.spr");
	setorigin(bubble, (self.owner.origin + '0 0 24'));
	bubble.movetype = IT_SUPER_NAILGUN;
	bubble.solid = TE_SPIKE;
	bubble.velocity = '0 0 15';
	bubble.nextthink = (time + 0.5);
	bubble.think = bubble_bob;
	bubble.classname = "bubble";
	bubble.frame = TE_SPIKE;
	bubble.bubble_state = TE_SPIKE;
	setsize(bubble, '-8 -8 -8', '8 8 8');
	self.nextthink = (time + 0.1);
	self.think = DeathBubblesSpawn;
	self.bubble_count = (self.bubble_count - IT_SHOTGUN);
	if ((self.bubble_count <= TE_SPIKE))
	{
		remove(self);
	}
};

void(float num_bubbles) DeathBubbles =
{
	local entity bubble_spawner;

	bubble_spawner = spawn();
	setorigin(bubble_spawner, self.origin);
	bubble_spawner.movetype = TE_SPIKE;
	bubble_spawner.solid = TE_SPIKE;
	bubble_spawner.nextthink = (time + 0.1);
	bubble_spawner.think = DeathBubblesSpawn;
	bubble_spawner.owner = self;
	bubble_spawner.bubble_count = num_bubbles;
};

void() PlayerDead =
{
	self.nextthink = CONTENT_EMPTY;
	self.deadflag = IT_SUPER_SHOTGUN;
	stuffcmd(self, "cl_scope 0\n");
	if ((deathmatch == IT_SUPER_SHOTGUN))
	{
		if (((F_LIVES < TE_SPIKE) && (self.owner.ishuman == TE_SPIKE)))
		{
			bot_count = bot_count - IT_SHOTGUN;
		}
		F_LIVES = F_LIVES - IT_SHOTGUN;
		Update_Lives();
	}
};

vector(float dm) VelocityForDamage =
{
	local vector v;

	if ((vlen(damage_inflictor.velocity) > TE_SPIKE))
	{
		v = 0.5 * damage_inflictor.velocity;
		v = v + (25 * normalize((self.origin - damage_inflictor.origin)));
		v_z = 100 + (240 * random());
		v_x = v_x + (200 * (IT_SUPER_SHOTGUN * (random() + -0.5)));
		v_y = v_y + (200 * (IT_SUPER_SHOTGUN * (random() + -0.5)));
	}
	else
	{
		v_x = 100 * (IT_SUPER_SHOTGUN * (random() + -0.5));
		v_y = 100 * (IT_SUPER_SHOTGUN * (random() + -0.5));
		v_z = 200 + (100 * random());
	}
	if ((dm > -50))
	{
		v = v * 0.7;
	}
	else
	{
		if ((dm > -200))
		{
			v = v * IT_SUPER_SHOTGUN;
		}
		else
		{
			v = v * TE_LAVASPLASH;
		}
	}
	return (v);
};

void(string gibname, float dm) ThrowGib =
{
	local entity new;

	new = spawn();
	new.origin = self.origin;
	setmodel(new, gibname);
	setsize(new, VEC_ORIGIN, VEC_ORIGIN);
	new.velocity = VelocityForDamage(dm);
	new.movetype = TE_LAVASPLASH;
	new.solid = TE_SPIKE;
	new.avelocity_x = (random() * 600);
	new.avelocity_y = (random() * 600);
	new.avelocity_z = (random() * 600);
	new.think = SUB_Remove;
	new.nextthink = ((time + TE_LAVASPLASH) + (random() * TE_LAVASPLASH));
	new.frame = TE_SPIKE;
	new.flags = TE_SPIKE;
};

void(string gibname, float dm) ThrowHead =
{

	setmodel(self, gibname);
	self.frame = TE_SPIKE;
	self.nextthink = CONTENT_EMPTY;
	self.movetype = TE_LAVASPLASH;
	self.takedamage = TE_SPIKE;
	self.solid = TE_SPIKE;
	self.view_ofs = '0 0 8';
	setsize(self, '-16 -16 0', '16 16 56');
	self.velocity = VelocityForDamage(dm);
	self.origin_z = (self.origin_z - 24);
	self.flags = (self.flags - (self.flags & IT_NAILS));
	self.avelocity = ((IT_SUPER_SHOTGUN * (random() + -0.5)) * '0 600 0');
};

void() PlayerDropStuff =
{
	local string s;
	local string t;

	if ((cvar(/*25551i*/"dq") != TE_SPIKE))
	{
		if ((self.super_damage_finished > time))
		{
			s = ftos(rint((self.super_damage_finished - time)));
			t = " lost a quad with ";
			if ((deathmatch == IT_NAILGUN))
			{
				t = " lost an OctaPower with ";
			}
			_bprint(self.netname, t, s, /*25598i*/" seconds remaining\n");
		}
	}
	if ((cvar(/*25618i*/"dr") != TE_SPIKE))
	{
		if ((self.invisible_finished > time))
		{
			s = ftos(rint((self.invisible_finished - time)));
			_bprint(self.netname, /*25621i*/" lost a ring with ", s, /*25598i*/" seconds remaining\n");
		}
	}
	ThrowWeapon(self.weapon, IT_SHOTGUN);
};

void() Player_RunDeath = [ 0, Player_RunDeath ]
{

	self.walkframe = (self.walkframe + IT_SHOTGUN);
	self.frame = ((Player_GetFrame(self.death_type, TE_SPIKE) - IT_SHOTGUN) + self.walkframe);
	if ((self.frame >= (Player_GetFrame(self.death_type, IT_SHOTGUN) - IT_SHOTGUN)))
	{
		PlayerDead();
		return;
	}
};

void() Player_AnimateDeath =
{
	local float i;
	local float dtype;

	i = random();
	if ((i < 0.5))
	{
		dtype = TE_LIGHTNING2;
	}
	else
	{
		dtype = TE_WIZSPIKE;
	}
	self.death_type = dtype;
	self.walkframe = TE_SPIKE;
	self.frame = (Player_GetFrame(self.death_type, TE_SPIKE) - IT_SHOTGUN);
	Player_RunDeath();
};

void() PlayerDie =
{
	self.modelindex = modelindex_dead;
	self.weaponmodel = "";
	stuffcmd(self, "chase_active 1\n");
	self.deadflag = IT_SHOTGUN;
	self.solid = TE_SPIKE;
	self.flags = (self.flags - (self.flags & IT_NAILS));
	self.movetype = TE_SPIKE;
	if ((self.velocity_z < TE_LAVASPLASH))
	{
		self.velocity_z = (self.velocity_z + (random() * 300));
	}
	self.angles_x = TE_SPIKE;
	self.angles_z = TE_SPIKE;
	Set_FOV(90);
	self.pfov = 90;
	ThrowWeapon(self.weapon, IT_SHOTGUN);
	Dead_Nades();
	if ((random() < 0.3))
	{
		sound(self, IT_SUPER_SHOTGUN, "player/death1.wav", 0.9, IT_SHOTGUN);
	}
	else
	{
		if ((random() < 0.6))
		{
			sound(self, IT_SUPER_SHOTGUN, "player/death2.wav", 0.9, IT_SHOTGUN);
		}
		else
		{
			sound(self, IT_SUPER_SHOTGUN, "player/death3.wav", 0.9, IT_SHOTGUN);
		}
	}
	self.setup_death = IT_SHOTGUN;
	Player_AnimateDeath();
};

void() set_suicide_frame =
{
	PlayerDie();
};

void() pull_finished =
{
	self.donefire = IT_SHOTGUN;
	self.weaponframe = TE_SPIKE;
	player_run();
};

void() player_generic_pull =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= IT_SHOTGUN))
	{
		pull_finished();
		return;
	}
	if ((self.weaponframe == IT_SUPER_SHOTGUN))
	{
		sound(self, IT_SHOTGUN, "weapons/equip/ppist.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_needler_pull =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 68))
	{
		pull_finished();
		return;
	}
	if ((self.weaponframe == 59))
	{
		sound(self, IT_SHOTGUN, "weapons/equip/needler.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_ppist_pull =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 56))
	{
		pull_finished();
		return;
	}
	if ((self.weaponframe == 51))
	{
		sound(self, IT_SHOTGUN, "weapons/equip/ppist.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_sniper_pull =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 53))
	{
		pull_finished();
		return;
	}
	if ((self.weaponframe == 46))
	{
		sound(self, IT_SHOTGUN, "weapons/equip/sniper.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_rl_pull =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 79))
	{
		pull_finished();
		return;
	}
	if ((self.weaponframe == 70))
	{
		sound(self, IT_SHOTGUN, "weapons/equip/rocket.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_uzi_pull =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 40))
	{
		pull_finished();
		return;
	}
	if ((self.weaponframe == 36))
	{
		sound(self, IT_SHOTGUN, "weapons/equip/smg.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_shotgun_pull =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 48))
	{
		pull_finished();
		return;
	}
	if ((self.weaponframe == 46))
	{
		sound(self, IT_SHOTGUN, "weapons/equip/shotgun.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_plrifle_pull =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 60))
	{
		pull_finished();
		return;
	}
	if ((self.weaponframe == 55))
	{
		sound(self, IT_SHOTGUN, "weapons/equip/ppist.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_ar_pull =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 55))
	{
		pull_finished();
		return;
	}
	if ((self.weaponframe == 46))
	{
		sound(self, IT_SHOTGUN, "weapons/equip/ar.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_br_pull =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 55))
	{
		pull_finished();
		return;
	}
	if ((self.weaponframe == 46))
	{
		sound(self, IT_SHOTGUN, "weapons/equip/br.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_shot_pull =
{
	self.weaponframe = (self.weaponframe + IT_SHOTGUN);
	if ((self.weaponframe >= 62))
	{
		pull_finished();
		return;
	}
	if ((self.weaponframe == 53))
	{
		sound(self, IT_SHOTGUN, "weapons/equip/pistol.wav", IT_SHOTGUN, IT_SHOTGUN);
	}
	SuperDamageSound();
	self.attack_finished = (time + 0.2);
	self.impulse = TE_SPIKE;
};

void() player_pull = [ 0, player_pull ]
{
#error Corrupt Function: player_pull
#if 0
	local float ftype;

	ftype = TE_LAVASPLASH;
	self = self;
	if ((self.impulse == 29))
	{
		self.impulse = 29;
		return;
	}
	else
	{
		if ((self.impulse == SVC_FOUNDSECRET))
		{
			self.impulse = SVC_FOUNDSECRET;
			return;
		}
		else
		{
			if ((self.impulse == SVC_KILLEDMONSTER))
			{
				self.impulse = SVC_KILLEDMONSTER;
			}
			else
			{
				if ((self.pull_time == CONTENT_EMPTY))
				{
					self.pull_time = (time + 0.6);
					player_run();
					return;
				}
			}
		}
	}
	do_tail
	{
		startwframe(self, 52);
		player_shot_pull();
	}
	else
	{
		do
		{
			startwframe(self, 41);
			player_shotgun_pull();
		}
		else
		{
			do
			{
				startwframe(self, 45);
				player_ar_pull();
			}
			else
			{
				do
				{
					startwframe(self, 34);
					player_uzi_pull();
				}
				else
				{
					do
					{
						startwframe(self, 69);
						player_rl_pull();
					}
					else
					{
						do
						{
							startwframe(self, 43);
							player_sniper_pull();
						}
						else
						{
							do
							{
								startwframe(self, 50);
								player_ppist_pull();
							}
							else
							{
								do
								{
									startwframe(self, 50);
									player_plrifle_pull();
								}
								else
								{
									do
									{
										startwframe(self, 58);
										player_needler_pull();
									}
									else
									{
										do
										{
											startwframe(self, 45);
											player_br_pull();
										}
										else
										{
											do
											{
												startwframe(self, IT_SHOTGUN);
												player_generic_pull();
											}
											else
											{

											} while ((self.weapon == IT_SHOTGUN));

										} while ((self.weapon == IT_SUPER_SHOTGUN));

									} while ((self.weapon == IT_NAILGUN));

								} while ((self.weapon == IT_SUPER_NAILGUN));

							} while ((self.weapon == IT_ROCKET_LAUNCHER));

						} while ((self.weapon == IT_GRENADE_LAUNCHER));

					} while ((self.weapon == IT_LIGHTNING));

				} while ((self.weapon == IT_EXTRA_WEAPON2));

			} while ((self.weapon == IT_EXTRA_WEAPON));

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
self.frame = Player_GetFrame(ftype, TE_SPIKE);
if (((self.frame + self.fireframe) > Player_GetFrame(ftype, IT_SHOTGUN)))
{
if ((self.weaponframe == TE_SPIKE))
{
self.melee_time = TE_SPIKE;
self.donefire = TE_SPIKE;
self.fireframe = TE_SPIKE;
player_run();
return;
}
else
{
self.fireframe = TE_LIGHTNING1;
}
}
self.frame = (self.frame + self.fireframe);
self.fireframe = (self.fireframe + IT_SHOTGUN);
#endif
};

void(entity client) pre_player_pull =
{

	other = self;
	player_pull();
	client.fireframe = TE_SPIKE;
	client.frame = Player_GetFrame(TE_LAVASPLASH, TE_SPIKE);
};
