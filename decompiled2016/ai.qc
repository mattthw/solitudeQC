//Decompiled code. Please respect the original copyright.
void() t_movetarget;
entity sight_entity;
float sight_entity_time;

float(float v) anglemod =
{
	while ((v >= 360))
	{
		v = v - 360;
	}
	while ((v < TE_SPIKE))
	{
		v = v + 360;
	}
	return (v);
};

void() movetarget_f =
{
	if (!self.targetname)
	{
		objerror(/*29945i*/"monster_movetarget: no targetname");
	}
	self.solid = IT_SHOTGUN;
	self.touch = t_movetarget;
	setsize(self, '-8 -8 -8', '8 8 8');
};

void() path_corner =
{
	movetarget_f();
};

void() t_movetarget =
{
	local entity temp;

	if ((other.movetarget != self))
	{
		return;
	}
	if (other.enemy)
	{
		return;
	}
	temp = self;
	self = other;
	other = temp;
	self.movetarget = find(world, targetname, other.target);
	self.goalentity = find(world, targetname, other.target);
	self.ideal_yaw = vectoyaw((self.goalentity.origin - self.origin));
	if (!self.movetarget)
	{
		self.pausetime = (time + 999999);
		self.th_stand();
		return;
	}
};

float(entity targ) range =
{
	local vector spot1;
	local vector spot2;
	local float r;

	spot1 = self.origin + self.view_ofs;
	spot2 = targ.origin + targ.view_ofs;
	r = vlen((spot1 - spot2));
	if ((r < 120))
	{
		return (TE_SPIKE);
	}
	if ((r < 500))
	{
		return (IT_SHOTGUN);
	}
	if ((r < 1000))
	{
		return (IT_SUPER_SHOTGUN);
	}
	return (TE_EXPLOSION);
};

float(entity targ) visible =
{
	local vector spot1;
	local vector spot2;

	spot1 = self.origin + self.view_ofs;
	spot2 = targ.origin + targ.view_ofs;
	traceline(spot1, spot2, IT_SHOTGUN, self);
	if ((trace_inopen && trace_inwater))
	{
		return (TE_SPIKE);
	}
	if ((trace_fraction == IT_SHOTGUN))
	{
		return (IT_SHOTGUN);
	}
	return (TE_SPIKE);
};

float(entity targ) infront =
{
	local vector vec;
	local float dot;

	makevectors(self.angles);
	vec = normalize((targ.origin - self.origin));
	dot = vec * v_forward;
	if ((dot > 0.3))
	{
		return (IT_SHOTGUN);
	}
	return (TE_SPIKE);
};

void() HuntTarget =
{

	self.goalentity = self.enemy;
	self.think = self.th_run;
	self.ideal_yaw = vectoyaw((self.enemy.origin - self.origin));
	self.nextthink = (time + 0.1);
	SUB_AttackFinished(IT_SHOTGUN);
};

void() SightSound =
{
#error Corrupt Function: SightSound
#if 0
	local float rsnd;
	local string s;

	do_tail
	{
		s = "elite/elite_see.wav";
	}
	else
	{
		do
		{
			s = "knight/ksight.wav";
		}
		else
		{
			do
			{
				s = "shambler/ssight.wav";
			}
			else
			{
				do
				{
					s = "demon/sight2.wav";
				}
				else
				{
					do
					{
						s = "wizard/wsight.wav";
					}
					else
					{
						do
						{
							s = "zombie/z_idle.wav";
						}
						else
						{
							do
							{
								s = "dog/dsight.wav";
							}
							else
							{
								do
								{
									s = "hknight/sight1.wav";
								}
								else
								{
									do
									{
										s = "blob/sight1.wav";
									}
									else
									{
										do
										{
											rsnd = random();
											if ((rsnd < 0.25))
											{
												s = "enforcer/sight1.wav";
											}
											else
											{
												if ((rsnd < 0.5))
												{
													s = "enforcer/sight2.wav";
												}
												else
												{
													if ((rsnd < 0.75))
													{
														s = "enforcer/sight3.wav";
													}
													else
													{
														s = "enforcer/sight4.wav";
													}
												}
											}
										}
										else
										{
											do
											{
												s = "shalrath/sight.wav";
											}
											else
											{
												do
												{
													s = "soldier/sight1.wav";
												}
												else
												{

												} while ((self.classname == "Needle-spikes"));

											} while ((self.classname == "monster_knight"));

										} while ((self.classname == "monster_shambler"));

									} while ((self.classname == "monster_demon1"));

								} while ((self.classname == "monster_wizard"));

							} while ((self.classname == "monster_zombie"));

						} while ((self.classname == "monster_dog"));

					} while ((self.classname == "monster_hell_knight"));

				} while ((self.classname == "monster_tarbaby"));

			} while ((self.classname == "monster_enforcer"));

		} while ((self.classname == "monster_shalrath"));
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
sound(self, IT_SUPER_SHOTGUN, s, IT_SHOTGUN, IT_SHOTGUN);
#endif
};

void() FoundTarget =
{
	if ((self.enemy.classname == "player"))
	{
		sight_entity = self;
		sight_entity_time = time;
	}
	self.show_hostile = (time + IT_SHOTGUN);
	SightSound();
	HuntTarget();
};

float() FindTarget =
{
	local entity client;

	if (((sight_entity_time >= (time - 0.1)) && !(self.spawnflags & TE_EXPLOSION)))
	{
		client = sight_entity;
		if ((client.enemy == self.enemy))
		{
			return (IT_SHOTGUN);
		}
	}
	else
	{
		client = checkclient();
		if (!client)
		{
			return (TE_SPIKE);
		}
	}
	if ((client == self.enemy))
	{
		return (TE_SPIKE);
	}
	if ((client.flags & IT_EXTRA_WEAPON))
	{
		return (TE_SPIKE);
	}
	if ((client.items & IT_INVISIBILITY))
	{
		return (TE_SPIKE);
	}
	self.enemy = client;
	if ((self.enemy.classname == "player"))
	{
		FoundTarget();
	}
	return (IT_SHOTGUN);
};

void(float dist) ai_forward =
{
	walkmove(self.angles_y, dist);
};

void(float dist) ai_back =
{
	walkmove((self.angles_y + 180), dist);
};

void(float dist) ai_pain =
{
	ai_back(dist);
};

void(float dist) ai_painforward =
{
	walkmove(self.ideal_yaw, dist);
};

void(float dist) ai_walk =
{
	movetogoal(dist);
};

void() ai_stand =
{
	if (FindTarget())
	{
		return;
	}
	if ((time > self.pausetime))
	{
		self.th_walk();
		return;
	}
};

void() ai_turn =
{
	if (FindTarget())
	{
		return;
	}
	ChangeYaw();
};

float() FacingIdeal =
{
	local float delta;

	delta = anglemod((self.angles_y - self.ideal_yaw));
	if (((delta > 45) && (delta < 315)))
	{
		return (TE_SPIKE);
	}
	return (IT_SHOTGUN);
};
float(float enemy_range) DogCheckAttack;
float(float enemy_range) WizardCheckAttack;
float(float enemy_range) DemonCheckAttack;

float(float enemy_range) CheckAnyAttack =
{

	do_tail
	{
		return (SoldierCheckAttack(enemy_range));
		do
		{
			return (OgreCheckAttack(enemy_range));
			do
			{
				return (ShamCheckAttack(enemy_range));
				do
				{
					return (DemonCheckAttack(enemy_range));
					do
					{
						return (DogCheckAttack(enemy_range));
						do
						{
							return (WizardCheckAttack(enemy_range));

						} while ((self.classname == "monster_army"));

					} while ((self.classname == "monster_elite"));

				} while ((self.classname == "monster_shambler"));

			} while ((self.classname == "monster_demon1"));

		} while ((self.classname == "monster_dog"));

	} while ((self.classname == "monster_wizard"));
	return (CheckAttack(enemy_range));
};

void(float enemy_yaw) ai_run_melee =
{
	self.ideal_yaw = enemy_yaw;
	ChangeYaw();
	if (FacingIdeal())
	{
		self.th_melee();
		self.attack_state = IT_SHOTGUN;
	}
};

void(float enemy_yaw) ai_run_missile =
{
	self.ideal_yaw = enemy_yaw;
	ChangeYaw();
	if (FacingIdeal())
	{
		self.th_missile();
		self.attack_state = IT_SHOTGUN;
	}
};

void(float enemy_yaw, float movedist) ai_run_slide =
{
	local float ofs;

	self.ideal_yaw = enemy_yaw;
	ChangeYaw();
	if (self.lefty)
	{
		ofs = 90;
	}
	else
	{
		ofs = -90;
	}
	if (walkmove((self.ideal_yaw + ofs), movedist))
	{
		return;
	}
	self.lefty = (IT_SHOTGUN - self.lefty);
	walkmove((self.ideal_yaw - ofs), movedist);
};

void(float dist) ai_run =
{
	local float enemy_vis;
	local float enemy_yaw;

	if ((self.enemy.health <= TE_SPIKE))
	{
		self.enemy = world;
		if ((self.oldenemy.health > TE_SPIKE))
		{
			self.enemy = self.oldenemy;
			HuntTarget();
		}
		else
		{
			if (self.movetarget)
			{
				self.th_walk();
			}
			else
			{
				self.th_stand();
			}
			return;
		}
	}
	self.show_hostile = (time + IT_SHOTGUN);
	enemy_vis = visible(self.enemy);
	if (enemy_vis)
	{
		self.search_time = (time + TE_LIGHTNING1);
	}
	if ((coop && (self.search_time < time)))
	{
		if (FindTarget())
		{
			return;
		}
	}
	enemy_yaw = vectoyaw((self.enemy.origin - self.origin));
	if ((self.attack_state == IT_NAILGUN))
	{
		ai_run_missile(enemy_yaw);
		return;
	}
	if ((self.attack_state == TE_EXPLOSION))
	{
		ai_run_melee(enemy_yaw);
		return;
	}
	if (!enemy_vis)
	{
		return;
	}
	if (CheckAnyAttack(range(self.enemy)))
	{
		return;
	}
	if ((self.attack_state == IT_SUPER_SHOTGUN))
	{
		ai_run_slide(enemy_yaw, dist);
		return;
	}
	movetogoal(dist);
};
