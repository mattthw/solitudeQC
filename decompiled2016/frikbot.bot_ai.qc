//Decompiled code. Please respect the original copyright.

float(entity scot) target_onstack =
{
	if ((scot == world))
	{
		return (TE_SPIKE);
	}
	else
	{
		if ((self.target1 == scot))
		{
			return (IT_SHOTGUN);
		}
		else
		{
			if ((self.target2 == scot))
			{
				return (IT_SUPER_SHOTGUN);
			}
			else
			{
				if ((self.target3 == scot))
				{
					return (TE_EXPLOSION);
				}
				else
				{
					if ((self.target4 == scot))
					{
						return (IT_NAILGUN);
					}
					else
					{
						return (TE_SPIKE);
					}
				}
			}
		}
	}
};

void(entity ent) target_add =
{
	if ((ent == world))
	{
		return;
	}
	if (target_onstack(ent))
	{
		return;
	}
	self.target4 = self.target3;
	self.target3 = self.target2;
	self.target2 = self.target1;
	self.target1 = ent;
	self.search_time = (time + TE_LIGHTNING1);
};

void(entity ent) target_drop =
{
	local float tg;

	tg = target_onstack(ent);
	if ((tg == IT_SHOTGUN))
	{
		self.target1 = self.target2;
		self.target2 = self.target3;
		self.target3 = self.target4;
		self.target4 = world;
	}
	else
	{
		if ((tg == IT_SUPER_SHOTGUN))
		{
			self.target1 = self.target3;
			self.target2 = self.target4;
			self.target4 = world;
			self.target3 = world;
		}
		else
		{
			if ((tg == TE_EXPLOSION))
			{
				self.target1 = self.target4;
				self.target4 = world;
				self.target3 = world;
				self.target2 = world;
			}
			else
			{
				if ((tg == IT_NAILGUN))
				{
					self.target4 = world;
					self.target3 = world;
					self.target2 = world;
					self.target1 = world;
				}
			}
		}
	}
	self.search_time = (time + TE_LIGHTNING1);
};

void(entity targ, float success) bot_lost =
{

	if (!targ)
	{
		return;
	}
	target_drop(targ);
	if ((targ.classname == "waypoint"))
	{
		targ.b_sound = (targ.b_sound - (targ.b_sound & ClientBitFlag(self.b_clientno)));
	}
	if (!success)
	{
		self.target4 = world;
		self.target3 = world;
		self.target2 = world;
		self.target1 = world;
		self.last_way = FindWayPoint(self.current_way);
		ClearMyRoute();
		self.b_aiflags = TE_SPIKE;
	}
	else
	{
		if ((targ.classname == "item_artifact_invisibility"))
		{
			if ((self.items & IT_INVISIBILITY))
			{
				bot_start_topic(TE_EXPLOSION);
			}
		}
		if ((targ.flags & IT_SHELLS))
		{
			if ((targ.model == string_null))
			{
				targ._last = world;
			}
			else
			{
				targ._last = self;
			}
		}
	}
	if ((targ.classname != "player"))
	{
		targ.search_time = (time + TE_LIGHTNING1);
	}
};

void(entity targ) bot_check_lost =
{
	local vector dist;

	dist = realorigin(targ) - self.origin;
	dist_z = TE_SPIKE;
	if ((targ == world))
	{
		return;
	}
	else
	{
		if ((targ.flags & IT_SHELLS))
		{
			if ((vlen((targ.origin - self.origin)) < IT_ROCKET_LAUNCHER))
			{
				bot_lost(targ, IT_SHOTGUN);
			}
			else
			{
				if ((targ.model == string_null))
				{
					bot_lost(targ, IT_SHOTGUN);
				}
			}
		}
		else
		{
			if ((targ.classname == "waypoint"))
			{
				if (!(self.b_aiflags & 24576))
				{
					if ((self.b_aiflags & IT_CELLS))
					{
						if ((vlen((targ.origin - self.origin)) < 48))
						{
							bot_lost(targ, IT_SHOTGUN);
						}
					}
					else
					{
						if ((self.b_aiflags & IT_ROCKET_LAUNCHER))
						{
							if ((vlen((targ.origin - self.origin)) < 24))
							{
								bot_lost(targ, IT_SHOTGUN);
							}
						}
						else
						{
							if ((vlen((targ.origin - self.origin)) < IT_ROCKET_LAUNCHER))
							{
								bot_lost(targ, IT_SHOTGUN);
							}
						}
					}
				}
			}
			else
			{
				if ((targ.classname == "temp_waypoint"))
				{
					if ((vlen((targ.origin - self.origin)) < IT_ROCKET_LAUNCHER))
					{
						bot_lost(targ, IT_SHOTGUN);
					}
				}
				else
				{
					if ((targ.classname == "player"))
					{
						if ((targ.health <= TE_SPIKE))
						{
							bot_lost(targ, IT_SHOTGUN);
						}
						else
						{
							if ((coop || (teamplay && (targ.team == self.team))))
							{
								if ((targ.target1.classname == "player"))
								{
									if (!targ.target1.ishuman)
									{
										bot_lost(targ, IT_SHOTGUN);
									}
								}
								else
								{
									if ((targ.teleport_time > time))
									{
										self.keys = (self.keys & 960);
									}
									else
									{
										if ((vlen((targ.origin - self.origin)) < IT_EXTRA_WEAPON))
										{
											if ((vlen((targ.origin - self.origin)) < 48))
											{
												frik_walkmove((self.origin - targ.origin));
											}
											else
											{
												self.keys = (self.keys & 960);
												bot_start_topic(IT_NAILGUN);
											}
											self.search_time = (time + TE_LIGHTNING1);
										}
										else
										{
											if (!fisible(targ))
											{
												bot_lost(targ, TE_SPIKE);
											}
										}
									}
								}
							}
							else
							{
								if ((waypoint_mode > TE_EXPLOSION))
								{
									if ((vlen((targ.origin - self.origin)) < IT_EXTRA_WEAPON))
									{
										bot_lost(targ, IT_SHOTGUN);
									}
								}
							}
						}
					}
					else
					{
						if ((targ.classname == "func_button"))
						{
							if (targ.frame)
							{
								bot_lost(targ, IT_SHOTGUN);
								if ((self.enemy == targ))
								{
									self.enemy = world;
								}
							}
						}
						else
						{
							if (((targ.movetype == TE_SPIKE) && (targ.solid == IT_SHOTGUN)))
							{
								if ((targ.nextthink >= time))
								{
									bot_lost(targ, IT_SHOTGUN);
								}
							}
						}
					}
				}
			}
		}
	}
	if (((targ.origin_z - self.origin_z) > IT_LIGHTNING))
	{
		dist = targ.origin - self.origin;
		dist_z = TE_SPIKE;
		if ((vlen(dist) < IT_ROCKET_LAUNCHER))
		{
			if ((self.flags & IT_NAILS))
			{
				if (!frik_recognize_plat(TE_SPIKE))
				{
					bot_lost(targ, TE_SPIKE);
				}
			}
		}
	}
	else
	{
		if ((targ.classname == "train"))
		{
			if (frik_recognize_plat(TE_SPIKE))
			{
				bot_lost(targ, IT_SHOTGUN);
			}
		}
	}
	if ((time > self.search_time))
	{
		bot_lost(targ, TE_SPIKE);
	}
};

void() bot_handle_ai =
{
	local entity newt;
	local vector v;

	if ((self.b_aiflags & IT_NAILGUN))
	{
		self.keys = (self.keys & 960);
	}
	if ((self.b_aiflags & IT_GRENADE_LAUNCHER))
	{
		b_temp3 = self;
		self = self.last_way;
		if (!frik_recognize_plat(TE_SPIKE))
		{
			newt = FindThing("door");
			self = b_temp3;
			if ((self.b_aiflags & IT_ARMOR3))
			{
				if (newt.nextthink)
				{
					self.keys = (self.keys & 960);
				}
				else
				{
					bot_lost(self.last_way, TE_SPIKE);
				}
			}
			else
			{
				if (newt.targetname)
				{
					newt = find(world, target, newt.targetname);
					if ((newt.health > TE_SPIKE))
					{
						self.enemy = newt;
						bot_weapon_switch(IT_SHOTGUN);
					}
					else
					{
						target_add(newt);
					}
				}
				self.b_aiflags = (self.b_aiflags - IT_GRENADE_LAUNCHER);
			}
		}
		else
		{
			self = b_temp3;
		}
	}
	if ((self.b_aiflags & IT_SHELLS))
	{
		if ((self.flags & IT_NAILS))
		{
			bot_jump();
			self.b_aiflags = (self.b_aiflags - IT_SHELLS);
		}
	}
	else
	{
		if ((self.b_aiflags & IT_AXE))
		{
			if ((self.weapon != IT_ROCKET_LAUNCHER))
			{
				self.impulse = TE_WIZSPIKE;
			}
			else
			{
				if ((self.flags & IT_NAILS))
				{
					self.b_aiflags = (self.b_aiflags - IT_AXE);
					if (bot_can_rj(self))
					{
						bot_jump();
						self.b_angle_x = 80;
						self.v_angle_x = 80;
						self.button0 = IT_SHOTGUN;
					}
					else
					{
						bot_lost(self.target1, TE_SPIKE);
					}
				}
			}
		}
	}
	if ((self.b_aiflags & IT_LIGHTNING))
	{
		if ((self.waterlevel > IT_SUPER_SHOTGUN))
		{
			self.keys = IT_SHOTGUN;
			self.button2 = IT_SHOTGUN;
		}
		else
		{
			self.b_aiflags = (self.b_aiflags - IT_LIGHTNING);
		}
	}
	if ((self.b_aiflags & IT_CELLS))
	{
		b_temp3 = self;
		self = self.last_way;
		if (!frik_recognize_plat(TE_SPIKE))
		{
			self = b_temp3;
			self.keys = (self.keys & 960);
		}
		else
		{
			self = b_temp3;
			if (frik_recognize_plat(TE_SPIKE))
			{
				v = (realorigin(trace_ent) + trace_ent.origin) - self.origin;
				v_z = TE_SPIKE;
				if ((vlen(v) < 24))
				{
					self.keys = (self.keys & 960);
				}
				else
				{
					self.b_aiflags = (self.b_aiflags | IT_ROCKET_LAUNCHER);
					self.keys = frik_KeysForDir(v);
				}
			}
		}
	}
	if ((self.b_aiflags & IT_ROCKETS))
	{
		newt = FindThing("plat");
		if ((newt.state != IT_SHOTGUN))
		{
			v = self.origin - realorigin(newt);
			v_z = TE_SPIKE;
			if ((vlen(v) > 96))
			{
				self.keys = (self.keys & 960);
			}
			else
			{
				frik_walkmove(v);
			}
		}
		else
		{
			self.b_aiflags = (self.b_aiflags - IT_ROCKETS);
		}
	}
	if ((self.b_aiflags & IT_NAILS))
	{
		if (((normalize((self.last_way.origin - self.origin)) * self.b_dir) > 0.4))
		{
			self.b_aiflags = (self.b_aiflags - IT_NAILS);
			bot_lost(self.target1, IT_SHOTGUN);
		}
	}
	if ((self.b_aiflags & IT_ARMOR1))
	{
		self.b_aiflags = (((self.b_aiflags | IT_NAILGUN) | IT_ROCKET_LAUNCHER) - IT_ARMOR1);
	}
	if ((self.b_aiflags & IT_ARMOR2))
	{
		self.b_aiflags = ((self.b_aiflags | IT_NAILGUN) - IT_ARMOR2);
	}
};

void() bot_path =
{
	local entity jj;
	local entity tele;

	bot_check_lost(self.target1);
	if (!self.target1)
	{
		self.keys = TE_SPIKE;
		return;
	}
	if (target_onstack(self.last_way))
	{
		return;
	}
	jj = FindRoute(self.last_way);
	if (!jj)
	{
		if ((self.target1.current_way != self.last_way))
		{
			if ((self.target1.classname != "temp_waypoint"))
			{
				if ((self.target1.classname != "player"))
				{
					bot_lost(self.target1, TE_SPIKE);
				}
			}
		}
		return;
	}
	self.b_aiflags = ((jj.b_aiflags & AI_READAHEAD_TYPES) | (self.last_way.b_aiflags & AI_POINT_TYPES));
	target_add(jj);
	if (self.last_way)
	{
		if ((CheckLinked(self.last_way, jj) == IT_SUPER_SHOTGUN))
		{
			tele = FindThing("trigger_teleport");
			target_add(tele);
		}
		traceline(self.last_way.origin, jj.origin, TE_SPIKE, self);
		if ((trace_fraction != IT_SHOTGUN))
		{
			if (((trace_ent.classname == "door") && !(self.b_aiflags & IT_ARMOR3)))
			{
				if (trace_ent.owner)
				{
					trace_ent = trace_ent.owner;
				}
				if (((trace_ent.health > TE_SPIKE) && (self.enemy == world)))
				{
					self.enemy = trace_ent;
					bot_weapon_switch(IT_SHOTGUN);
					self.b_aiflags = (self.b_aiflags | IT_EXTRA_WEAPON);
				}
				else
				{
					if (trace_ent.targetname)
					{
						tele = find(world, target, trace_ent.targetname);
						if ((tele.health > TE_SPIKE))
						{
							self.enemy = tele;
							bot_weapon_switch(IT_SHOTGUN);
						}
						else
						{
							target_add(tele);
							self.b_aiflags = (self.b_aiflags | IT_EXTRA_WEAPON);
							return;
						}
					}
				}
			}
			else
			{
				if ((trace_ent.classname == "func_wall"))
				{
					bot_lost(self.target1, TE_SPIKE);
					return;
				}
			}
		}
	}
	self.b_dir = normalize((jj.origin - self.last_way.origin));
	self.last_way = jj;
};

float(entity thing) priority_for_thing =
{
	local float thisp;

	thisp = TE_SPIKE;
	if ((((thing.flags & IT_SHELLS) && (thing.model != string_null)) && (thing.search_time < time)))
	{
		if ((thing._last != self))
		{
			thisp = 20;
		}
		if ((thing.classname == "item_artifact_super_damage"))
		{
			thisp = 65;
		}
		else
		{
			if ((thing.classname == "item_artifact_invulnerability"))
			{
				thisp = 65;
			}
			else
			{
				if ((thing.classname == "weapon_skull"))
				{
					thisp = 90;
				}
				else
				{
					if ((thing.classname == "item_health"))
					{
						if ((thing.spawnflags & IT_SUPER_SHOTGUN))
						{
							thisp = 55;
						}
						if ((self.health < 40))
						{
							thisp = thisp + 50;
						}
					}
					else
					{
						if ((thing.model == "progs/armor.mdl"))
						{
							if ((self.armorvalue < 200))
							{
								if ((thing.skin == IT_SUPER_SHOTGUN))
								{
									thisp = 60;
								}
								else
								{
									if ((self.armorvalue < 100))
									{
										thisp = thisp + 25;
									}
								}
							}
						}
						else
						{
							if ((thing.classname == "weapon_pickup"))
							{
								if (!(self.items & thing.weapon))
								{
									thisp = 75;
								}
							}
							else
							{
								if ((thing.classname == "weapon_supershotgun"))
								{
									if (!(self.items & IT_SUPER_SHOTGUN))
									{
										thisp = 25;
									}
								}
								else
								{
									if ((thing.classname == "weapon_nailgun"))
									{
										if (!(self.items & IT_NAILGUN))
										{
											thisp = SVC_INTERMISSION;
										}
									}
									else
									{
										if ((thing.classname == "weapon_supernailgun"))
										{
											if (!(self.items & IT_SUPER_NAILGUN))
											{
												thisp = 35;
											}
										}
										else
										{
											if ((thing.classname == "weapon_grenadelauncher"))
											{
												if (!(self.items & IT_GRENADE_LAUNCHER))
												{
													thisp = 45;
												}
											}
											else
											{
												if ((thing.classname == "weapon_rocketlauncher"))
												{
													if (!(self.items & IT_ROCKET_LAUNCHER))
													{
														thisp = 60;
													}
												}
												else
												{
													if ((thing.classname == "weapon_lightning"))
													{
														if (!(self.items & IT_LIGHTNING))
														{
															thisp = 50;
														}
													}
													else
													{
														if ((thing.classname == "weapon_skull"))
														{
															if (!(self.items & thing.weapon))
															{
																thisp = 90;
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
	}
	else
	{
		if (((thing.flags & IT_ROCKET_LAUNCHER) && (thing.health > TE_SPIKE)))
		{
			thisp = 45;
		}
		else
		{
			if ((thing.classname == "player"))
			{
				if ((thing.health > TE_SPIKE))
				{
					if ((thing == self))
					{
						return (TE_SPIKE);
					}
					else
					{
						if ((thing.items & IT_INVISIBILITY))
						{
							thisp = IT_SUPER_SHOTGUN;
						}
						else
						{
							if (coop)
							{
								thisp = 200;
								if ((thing.target1.classname == "player"))
								{
									if (!thing.target1.ishuman)
									{
										return (TE_SPIKE);
									}
								}
							}
							else
							{
								if ((teamplay && (thing.team == self.team)))
								{
									thisp = 100;
									if ((thing.target1.classname == "player"))
									{
										return (TE_SPIKE);
									}
								}
								else
								{
									thisp = SVC_INTERMISSION;
								}
							}
						}
					}
				}
			}
			else
			{
				if ((thing.classname == "waypoint"))
				{
					if ((thing.b_aiflags & IT_ARMOR1))
					{
						thisp = SVC_INTERMISSION;
					}
					else
					{
						if ((thing.b_aiflags & IT_ARMOR2))
						{
							thisp = SVC_INTERMISSION;
						}
					}
				}
			}
		}
	}
	if ((pointcontents(thing.origin) < CONTENT_WATER))
	{
		return (TE_SPIKE);
	}
	if (thisp)
	{
		if (thing.current_way)
		{
			if ((thing.current_way.items == CONTENT_EMPTY))
			{
				return (TE_SPIKE);
			}
			else
			{
				thisp = thisp + ((13000 - thing.current_way.items) * 0.05);
			}
		}
	}
	return (thisp);
};

void(float scope) bot_look_for_crap =
{
	local entity foe;
	local entity best;
	local float thatp;
	local float bestp;
	local float dist;

	if ((scope == IT_SHOTGUN))
	{
		foe = findradius(self.origin, 13000);
	}
	else
	{
		foe = findradius(self.origin, 500);
	}
	bestp = IT_SHOTGUN;
	while (foe)
	{
		thatp = priority_for_thing(foe);
		if (thatp)
		{
			if (!scope)
			{
				if (!sisible(foe))
				{
					thatp = TE_SPIKE;
				}
			}
		}
		if ((thatp > bestp))
		{
			bestp = thatp;
			best = foe;
			dist = vlen((self.origin - foe.origin));
		}
		foe = foe.chain;
	}
	if ((best == world))
	{
		return;
	}
	if (!target_onstack(best))
	{
		target_add(best);
		if (scope)
		{
			bot_get_path(best, TE_SPIKE);
			self.b_aiflags = (self.b_aiflags | IT_NAILGUN);
		}
	}
};

void() bot_angle_set =
{
	local float h;
	local vector view;
	local float levels;

	if (self.enemy)
	{
		if ((self.enemy.items & IT_INVISIBILITY))
		{
			if ((random() > 0.01))
			{
				return;
			}
		}
		if ((self.missile_speed == TE_SPIKE))
		{
			self.missile_speed = 10000;
		}
		if ((self.enemy.solid == IT_NAILGUN))
		{
			view = ((self.enemy.absmin + self.enemy.absmax) * 0.5) - self.origin;
		}
		else
		{
			levels = TE_EXPLOSION;
			view = self.enemy.origin;
			while (levels)
			{
				h = vlen((view - self.origin)) / self.missile_speed;
				if ((self.enemy.flags & IT_NAILS))
				{
					view = (self.enemy.velocity * h) + '0 0 -20';
				}
				else
				{
					view = (self.enemy.velocity - ((sv_gravity * '0 0 1') * h)) * h;
				}
				view = self.enemy.origin + view;
				traceline(self.enemy.origin, view, TE_SPIKE, self);
				view = trace_endpos;
				levels = levels - IT_SHOTGUN;
			}
			view = normalize((view - self.origin));
		}
		view = vectoangles(view);
		view_x = view_x * CONTENT_EMPTY;
		self.b_angle = view;
	}
	else
	{
		if (self.target1)
		{
			view = realorigin(self.target1);
			if ((self.target1.flags & IT_SHELLS))
			{
				view = view + '0 0 48';
			}
			view = view - (self.origin + self.view_ofs);
			view = vectoangles(view);
			view_x = view_x * CONTENT_EMPTY;
			self.b_angle = view;
		}
		else
		{
			self.b_angle_x = TE_SPIKE;
		}
	}
	if ((self.b_skill == TE_EXPLOSION))
	{
		self.keys = (self.keys & 63);
		self.v_angle = self.b_angle;
		while ((self.v_angle_x < -180))
		{
			self.v_angle_x = (self.v_angle_x + 360);
		}
		while ((self.v_angle_x > 180))
		{
			self.v_angle_x = (self.v_angle_x - 360);
		}
	}
	else
	{
		if ((((self.enemy == world) || (self.enemy.movetype == TE_WIZSPIKE)) && (self.target1.classname != "player")))
		{
			self.keys = (self.keys & 63);
			self.v_angle = self.b_angle;
			while ((self.v_angle_x < -180))
			{
				self.v_angle_x = (self.v_angle_x + 360);
			}
			while ((self.v_angle_x > 180))
			{
				self.v_angle_x = (self.v_angle_x - 360);
			}
		}
		else
		{
			if ((self.b_skill < IT_SUPER_SHOTGUN))
			{
				if ((self.b_angle_x > 180))
				{
					self.b_angle_x = (self.b_angle_x - 360);
				}
				self.keys = (self.keys & 63);
				if ((angcomp(self.b_angle_y, self.v_angle_y) > TE_LAVASPLASH))
				{
					self.keys = (self.keys | IT_SHELLS);
				}
				else
				{
					if ((angcomp(self.b_angle_y, self.v_angle_y) < -10))
					{
						self.keys = (self.keys | IT_NAILS);
					}
				}
				if ((angcomp(self.b_angle_x, self.v_angle_x) < -10))
				{
					self.keys = (self.keys | IT_LIGHTNING);
				}
				else
				{
					if ((angcomp(self.b_angle_x, self.v_angle_x) > TE_LAVASPLASH))
					{
						self.keys = (self.keys | IT_EXTRA_WEAPON);
					}
				}
			}
		}
	}
};
float stagger_think;

void() BotAI =
{

	if ((self.health < IT_SHOTGUN))
	{
		self.button0 = floor((random() * IT_SUPER_SHOTGUN));
		self.button2 = TE_SPIKE;
		self.keys = TE_SPIKE;
		self.b_aiflags = TE_SPIKE;
		ClearMyRoute();
		self.enemy = world;
		self.target4 = world;
		self.target3 = world;
		self.target2 = world;
		self.target1 = world;
		self.last_way = world;
		return;
	}
	if ((self.b_skill < IT_SUPER_SHOTGUN))
	{
		if ((self.ai_time > time))
		{
			return;
		}
		self.ai_time = (time + 0.05);
		if ((bot_count > TE_SPIKE))
		{
			if (((time - stagger_think) < (0.1 / bot_count)))
			{
				self.ai_time = (self.ai_time + (0.1 / (IT_SUPER_SHOTGUN * bot_count)));
			}
		}
		else
		{
			return;
		}
	}
	if ((self.view_ofs == VEC_ORIGIN))
	{
		bot_start_topic(TE_WIZSPIKE);
	}
	stagger_think = time;
	self.button2 = TE_SPIKE;
	self.button0 = TE_SPIKE;
	if ((route_table == self))
	{
		if ((busy_waypoints <= TE_SPIKE))
		{
			if ((waypoint_mode < IT_NAILGUN))
			{
				bot_look_for_crap(IT_SHOTGUN);
			}
		}
		self.b_aiflags = TE_SPIKE;
		self.keys = TE_SPIKE;
	}
	else
	{
		if (self.target1)
		{
			frik_movetogoal();
			bot_path();
		}
		else
		{
			if ((waypoint_mode < IT_NAILGUN))
			{
				if (self.route_failed)
				{
					if ((waypoint_mode == IT_SHOTGUN))
					{
						frik_bot_roam();
					}
					else
					{
						self.keys = TE_SPIKE;
					}
					self.route_failed = TE_SPIKE;
				}
				else
				{
					if (!begin_route())
					{
						bot_look_for_crap(TE_SPIKE);
						self.keys = TE_SPIKE;
					}
				}
			}
			else
			{
				self.b_aiflags = IT_NAILGUN;
				self.keys = TE_SPIKE;
			}
		}
	}
	bot_angle_set();
	if (self.enemy)
	{
		bot_fight_style();
	}
	else
	{
		if ((random() < 0.2))
		{
			if ((random() < 0.2))
			{
				bot_weapon_switch(CONTENT_EMPTY);
			}
		}
	}
	bot_dodge_stuff();
	if ((self.waterlevel > IT_SUPER_SHOTGUN))
	{
		if ((time > (self.air_finished - IT_SUPER_SHOTGUN)))
		{
			traceline(self.origin, (self.origin + '0 0 6800'), IT_SHOTGUN, self);
			if (trace_inopen)
			{
				self.keys = IT_SHOTGUN;
				self.button2 = IT_SHOTGUN;
				return;
			}
		}
	}
	if (self.b_aiflags)
	{
		bot_handle_ai();
	}
	else
	{
		bot_chat();
	}
};
