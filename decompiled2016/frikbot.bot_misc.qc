//Decompiled code. Please respect the original copyright.

string(float r) BotName =
{

	self.b_num = r;
	if ((r == IT_SHOTGUN))
	{
		self.b_pants = TE_TELEPORT;
		self.b_shirt = TE_SPIKE;
		return ("Vincent");
	}
	else
	{
		if ((r == IT_SUPER_SHOTGUN))
		{
			self.b_pants = IT_SHOTGUN;
			self.b_shirt = TE_EXPLOSION;
			return ("Bishop");
		}
		else
		{
			if ((r == TE_EXPLOSION))
			{
				self.b_pants = 13;
				self.b_shirt = IT_SUPER_SHOTGUN;
				return ("Nomad");
			}
			else
			{
				if ((r == IT_NAILGUN))
				{
					self.b_pants = TE_WIZSPIKE;
					self.b_shirt = TE_LIGHTNING2;
					return ("Hudson");
				}
				else
				{
					if ((r == TE_LIGHTNING1))
					{
						self.b_pants = 12;
						self.b_shirt = TE_LIGHTNING2;
						return ("Lore");
					}
					else
					{
						if ((r == TE_LIGHTNING2))
						{
							self.b_pants = IT_NAILGUN;
							self.b_shirt = IT_NAILGUN;
							return ("Servo");
						}
						else
						{
							if ((r == TE_WIZSPIKE))
							{
								self.b_pants = IT_SUPER_SHOTGUN;
								self.b_shirt = TE_LIGHTNING1;
								return ("Gort");
							}
							else
							{
								if ((r == IT_SUPER_NAILGUN))
								{
									self.b_pants = TE_LAVASPLASH;
									self.b_shirt = TE_EXPLOSION;
									return ("Kryten");
								}
								else
								{
									if ((r == TE_LIGHTNING3))
									{
										self.b_pants = TE_LIGHTNING3;
										self.b_shirt = IT_NAILGUN;
										return ("Pimp Bot");
									}
									else
									{
										if ((r == TE_LAVASPLASH))
										{
											self.b_pants = IT_NAILGUN;
											self.b_shirt = TE_WIZSPIKE;
											return ("Max");
										}
										else
										{
											if ((r == TE_TELEPORT))
											{
												self.b_pants = TE_EXPLOSION;
												self.b_shirt = TE_TELEPORT;
												return ("Marvin");
											}
											else
											{
												if ((r == 12))
												{
													self.b_pants = 13;
													self.b_shirt = 12;
													return ("Erwin");
												}
												else
												{
													if ((r == 13))
													{
														self.b_pants = TE_TELEPORT;
														self.b_shirt = IT_SUPER_SHOTGUN;
														return ("FrikBot");
													}
													else
													{
														if ((r == SVC_UPDATEFRAGS))
														{
															self.b_pants = TE_SPIKE;
															self.b_shirt = IT_SUPER_SHOTGUN;
															return ("Krosis");
														}
														else
														{
															if ((r == 15))
															{
																self.b_pants = IT_SUPER_NAILGUN;
																self.b_shirt = TE_LIGHTNING3;
																return ("Gypsy");
															}
															else
															{
																if ((r == IT_GRENADE_LAUNCHER))
																{
																	self.b_pants = TE_LIGHTNING1;
																	self.b_shirt = TE_LAVASPLASH;
																	return ("Hal");
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
	}
	return ("Noname");
};

string() PickARandomName =
{
	local float y;
	local float test;
	local string h;
	local entity t;

	if ((bot_count > IT_GRENADE_LAUNCHER))
	{
		return ("player");
	}
	y = IT_SHOTGUN;
	while (y)
	{
		test = ceil((random() * IT_GRENADE_LAUNCHER));
		h = BotName(test);
		t = find(world, netname, h);
		if ((t == world))
		{
			y = TE_SPIKE;
		}
	}
	return (h);
};
entity b_originator;
float b_topic;

void(float tpic) bot_start_topic =
{
	if ((random() < 0.2))
	{
		b_topic = tpic;
		b_originator = self;
	}
	else
	{
		b_topic = TE_SPIKE;
	}
};

void() bot_chat =
{
	local float r;

	if ((b_options & IT_SUPER_SHOTGUN))
	{
		return;
	}
	r = ceil((random() * TE_LIGHTNING2));
	if ((self.b_chattime > time))
	{
		if ((self.b_skill < IT_SUPER_SHOTGUN))
		{
			self.button2 = TE_SPIKE;
			self.button0 = TE_SPIKE;
			self.keys = TE_SPIKE;
		}
		return;
	}
	else
	{
		if (self.b_chattime)
		{
			if ((b_topic == IT_SHOTGUN))
			{
				if ((b_originator == self))
				{
					if ((r == IT_SHOTGUN))
					{
						BotSay(": lo all\n");
						bot_start_topic(IT_SUPER_NAILGUN);
					}
					else
					{
						if ((r == IT_SUPER_SHOTGUN))
						{
							BotSay(": hey everyone\n");
							bot_start_topic(IT_SUPER_NAILGUN);
						}
						else
						{
							if ((r == TE_EXPLOSION))
							{
								BotSay(": prepare to be fragged!\n");
								bot_start_topic(TE_SPIKE);
							}
							else
							{
								if ((r == IT_NAILGUN))
								{
									BotSay(": boy this is laggy\n");
									bot_start_topic(TE_TELEPORT);
								}
								else
								{
									if ((r == TE_LIGHTNING1))
									{
										BotSay(": #mm getting some lag here\n");
										bot_start_topic(TE_TELEPORT);
									}
									else
									{
										BotSay(": hi everyone\n");
										bot_start_topic(IT_SUPER_NAILGUN);
									}
								}
							}
						}
					}
				}
			}
			else
			{
				if ((b_topic == IT_SUPER_SHOTGUN))
				{
					if ((b_originator == self))
					{
						if ((r == IT_SHOTGUN))
						{
							BotSay(": take that\n");
						}
						else
						{
							if ((r == IT_SUPER_SHOTGUN))
							{
								BotSay(": yehaww!\n");
							}
							else
							{
								if ((r == TE_EXPLOSION))
								{
									BotSay(": wh00p\n");
								}
								else
								{
									if ((r == IT_NAILGUN))
									{
										BotSay(": j00_sawk();\n");
									}
									else
									{
										if ((r == TE_LIGHTNING1))
										{
											BotSay(": i rule\n");
										}
										else
										{
											BotSay(": eat that\n");
										}
									}
								}
							}
						}
						bot_start_topic(TE_SPIKE);
					}
				}
				else
				{
					if ((b_topic == TE_EXPLOSION))
					{
						if ((b_originator == self))
						{
							if ((r < TE_EXPLOSION))
							{
								BotSayTeam(": friendly eyes\n");
							}
							else
							{
								BotSayTeam(": team eyes\n");
							}
							bot_start_topic(TE_SPIKE);
						}
					}
					else
					{
						if ((b_topic == IT_NAILGUN))
						{
							if ((b_originator == self))
							{
								if ((r < TE_EXPLOSION))
								{
									BotSayTeam(": on your back\n");
								}
								else
								{
									BotSayTeam(": I'm with you\n");
								}
								bot_start_topic(TE_SPIKE);
							}
						}
						else
						{
							if ((b_topic == TE_LIGHTNING1))
							{
								if ((b_originator == self))
								{
									if ((r < TE_EXPLOSION))
									{
										BotSayTeam(": I need help\n");
									}
									else
									{
										BotSayTeam(": need backup\n");
									}
									bot_start_topic(TE_SPIKE);
								}
							}
							else
							{
								if ((b_topic == TE_LIGHTNING2))
								{
									if ((b_originator == self))
									{
										if ((r == IT_SHOTGUN))
										{
											BotSay(": sun got in my eyes\n");
											bot_start_topic(TE_SPIKE);
										}
										else
										{
											if ((r == IT_SUPER_SHOTGUN))
											{
												BotSay(": mouse needs cleaning\n");
												bot_start_topic(TE_SPIKE);
											}
											else
											{
												if ((r == TE_EXPLOSION))
												{
													BotSay(": i meant to do that\n");
													bot_start_topic(TE_SPIKE);
												}
												else
												{
													if ((r == IT_NAILGUN))
													{
														BotSay(": lag\n");
														bot_start_topic(TE_TELEPORT);
													}
													else
													{
														if ((r == TE_LIGHTNING1))
														{
															BotSay(": killer lag\n");
															bot_start_topic(TE_TELEPORT);
														}
														else
														{
															BotSay(": 100% lag\n");
															bot_start_topic(TE_TELEPORT);
														}
													}
												}
											}
										}
									}
								}
								else
								{
									if ((b_topic == TE_WIZSPIKE))
									{
										if ((r == IT_SHOTGUN))
										{
											BotSay(": gg\n");
										}
										else
										{
											if ((r == IT_SUPER_SHOTGUN))
											{
												BotSay(": gg all\n");
											}
											else
											{
												if ((r == TE_EXPLOSION))
												{
													BotSay(": that was fun\n");
												}
												else
												{
													if ((r == IT_NAILGUN))
													{
														BotSay(": good game\n");
													}
													else
													{
														if ((r == TE_LIGHTNING1))
														{
															BotSay(": pah\n");
														}
														else
														{
															BotSay(": hrm\n");
														}
													}
												}
											}
										}
										bot_start_topic(TE_SPIKE);
									}
									else
									{
										if ((b_topic == IT_SUPER_NAILGUN))
										{
											if ((b_originator != self))
											{
												if ((r == IT_SHOTGUN))
												{
													BotSay(": heya\n");
													bot_start_topic(TE_SPIKE);
												}
												else
												{
													if ((r == IT_SUPER_SHOTGUN))
													{
														BotSay(": welcome\n");
														bot_start_topic(TE_SPIKE);
													}
													else
													{
														if ((r == TE_EXPLOSION))
														{
															BotSayInit();
															BotSay2(": hi ");
															BotSay2(b_originator.netname);
															BotSay2("\n");
															bot_start_topic(TE_SPIKE);
														}
														else
														{
															if ((r == IT_NAILGUN))
															{
																BotSayInit();
																BotSay2(": hey ");
																BotSay2(b_originator.netname);
																BotSay2("\n");
																bot_start_topic(TE_SPIKE);
															}
															else
															{
																if ((r == TE_LIGHTNING1))
																{
																	BotSay(": howdy\n");
																	bot_start_topic(TE_SPIKE);
																}
																else
																{
																	BotSay(": lo\n");
																	bot_start_topic(TE_SPIKE);
																}
															}
														}
													}
												}
											}
										}
										else
										{
											if ((b_topic == TE_LIGHTNING3))
											{
												if ((b_originator != self))
												{
													if ((r == IT_SHOTGUN))
													{
														BotSay(": hah\n");
													}
													else
													{
														if ((r == IT_SUPER_SHOTGUN))
														{
															BotSay(": heheh\n");
														}
														else
														{
															if ((r == TE_EXPLOSION))
															{
																BotSayInit();
																BotSay2(": good work ");
																BotSay2(b_originator.netname);
																BotSay2("\n");
															}
															else
															{
																if ((r == IT_NAILGUN))
																{
																	BotSayInit();
																	BotSay2(": nice1 ");
																	BotSay2(b_originator.netname);
																	BotSay2("\n");
																}
																else
																{
																	if ((r == TE_LIGHTNING1))
																	{
																		BotSay(": lol\n");
																	}
																	else
																	{
																		BotSay(": :)\n");
																	}
																}
															}
														}
													}
													b_topic = TE_LIGHTNING2;
												}
											}
											else
											{
												if ((b_topic == TE_LAVASPLASH))
												{
													if ((b_originator != self))
													{
														if ((r == IT_SHOTGUN))
														{
															BotSay(": have a nice dip?\n");
														}
														else
														{
															if ((r == IT_SUPER_SHOTGUN))
															{
																BotSay(": bah I hate levels with lava\n");
															}
															else
															{
																if ((r == TE_EXPLOSION))
																{
																	BotSayInit();
																	BotSay2(": good job ");
																	BotSay2(b_originator.netname);
																	BotSay2("\n");
																}
																else
																{
																	if ((r == IT_NAILGUN))
																	{
																		BotSayInit();
																		BotSay2(": nice backflip ");
																		BotSay2(b_originator.netname);
																		BotSay2("\n");
																	}
																	else
																	{
																		if ((r == TE_LIGHTNING1))
																		{
																			BotSay(": watch your step\n");
																		}
																		else
																		{
																			BotSay(": hehe\n");
																		}
																	}
																}
															}
														}
														b_topic = TE_LIGHTNING2;
													}
												}
												else
												{
													if ((b_topic == TE_TELEPORT))
													{
														if ((b_originator != self))
														{
															if ((r == IT_SHOTGUN))
															{
																BotSayInit();
																BotSay2(": yeah right ");
																BotSay2(b_originator.netname);
																BotSay2("\n");
																bot_start_topic(TE_SPIKE);
															}
															else
															{
																if ((r == IT_SUPER_SHOTGUN))
																{
																	BotSay(": ping\n");
																	bot_start_topic(TE_SPIKE);
																}
																else
																{
																	if ((r == TE_EXPLOSION))
																	{
																		BotSay(": shuddup, you're an lpb\n");
																		bot_start_topic(TE_SPIKE);
																	}
																	else
																	{
																		if ((r == IT_NAILGUN))
																		{
																			BotSay(": lag my eye\n");
																			bot_start_topic(TE_SPIKE);
																		}
																		else
																		{
																			if ((r == TE_LIGHTNING1))
																			{
																				BotSay(": yeah\n");
																				bot_start_topic(TE_TELEPORT);
																			}
																			else
																			{
																				BotSay(": totally\n");
																				bot_start_topic(TE_TELEPORT);
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
				}
			}
			self.b_chattime = TE_SPIKE;
		}
		else
		{
			if (b_topic)
			{
				if ((random() < 0.5))
				{
					if ((self == b_originator))
					{
						if ((b_topic <= TE_WIZSPIKE))
						{
							self.b_chattime = (time + IT_SUPER_SHOTGUN);
						}
					}
					else
					{
						if ((b_topic >= TE_WIZSPIKE))
						{
							self.b_chattime = (time + IT_SUPER_SHOTGUN);
						}
					}
				}
			}
		}
	}
};

void() KickABot =
{
	local entity ty;

	ty = find(world, classname, /*1957i*/"player");
	while ((ty != world))
	{
		if (!ty.ishuman)
		{
			BotDisconnect(ty);
			ty.ishuman = IT_SHOTGUN;
			ty = world;
		}
		else
		{
			ty = find(ty, classname, /*1957i*/"player");
		}
	}
};

vector(entity ent) realorigin =
{
	return (((ent.absmin + ent.absmax) * 0.5));
};

float(entity targ) fisible =
{
	local vector spot1;
	local vector org;
	local float thruwater;
	local float pc1;
	local float pc2;

	org = realorigin(targ);
	spot1 = self.origin + self.view_ofs;
	if ((targ.solid == IT_NAILGUN))
	{
		traceline(spot1, org, IT_SHOTGUN, self);
		if ((trace_ent == targ))
		{
			return (IT_SHOTGUN);
		}
		else
		{
			if ((trace_fraction == IT_SHOTGUN))
			{
				return (IT_SHOTGUN);
			}
		}
		return (TE_SPIKE);
	}
	else
	{
		pc1 = pointcontents(org);
		pc2 = pointcontents(spot1);
		if ((targ.classname == "player"))
		{
			thruwater = TE_SPIKE;
		}
		else
		{
			if ((pc1 == CONTENT_LAVA))
			{
				return (TE_SPIKE);
			}
			else
			{
				thruwater = IT_SHOTGUN;
			}
		}
	}
	if ((pc1 < CONTENT_EMPTY))
	{
		if ((pc2 != pc1))
		{
			traceline(spot1, (org + targ.mins), IT_SHOTGUN, self);
			if (trace_inopen)
			{
				if (trace_inwater)
				{
					if (!thruwater)
					{
						return (TE_SPIKE);
					}
				}
			}
			if ((trace_ent == targ))
			{
				return (IT_SHOTGUN);
			}
			else
			{
				if ((trace_fraction == IT_SHOTGUN))
				{
					return (IT_SHOTGUN);
				}
			}
			return (TE_SPIKE);
		}
	}
	else
	{
		if ((pc2 != pc1))
		{
			traceline(spot1, (org + targ.maxs), IT_SHOTGUN, self);
			if (trace_inopen)
			{
				if (trace_inwater)
				{
					if (!thruwater)
					{
						return (TE_SPIKE);
					}
				}
			}
			if ((trace_ent == targ))
			{
				return (IT_SHOTGUN);
			}
			else
			{
				if ((trace_fraction == IT_SHOTGUN))
				{
					return (IT_SHOTGUN);
				}
			}
			return (TE_SPIKE);
		}
	}
	traceline(spot1, org, IT_SHOTGUN, self);
	if ((trace_ent == targ))
	{
		return (IT_SHOTGUN);
	}
	else
	{
		if ((trace_fraction == IT_SHOTGUN))
		{
			return (IT_SHOTGUN);
		}
	}
	traceline(spot1, (org + targ.maxs), IT_SHOTGUN, self);
	if ((trace_ent == targ))
	{
		return (IT_SHOTGUN);
	}
	else
	{
		if ((trace_fraction == IT_SHOTGUN))
		{
			return (IT_SHOTGUN);
		}
	}
	traceline(spot1, (org + targ.mins), IT_SHOTGUN, self);
	if ((trace_ent == targ))
	{
		return (IT_SHOTGUN);
	}
	else
	{
		if ((trace_fraction == IT_SHOTGUN))
		{
			return (IT_SHOTGUN);
		}
	}
	return (TE_SPIKE);
};

float(entity targ1, entity targ2) wisible =
{
	local vector spot1;
	local vector spot2;
	local entity ignore;

	spot1 = targ1.origin;
	spot2 = realorigin(targ2);
	ignore = self;
	do
	{
		traceline(spot1, spot2, IT_SHOTGUN, ignore);
		spot1 = realorigin(trace_ent);
		ignore = trace_ent;

	} while (((trace_ent != world) && (trace_fraction != IT_SHOTGUN)));
	if ((trace_endpos == spot2))
	{
		return (IT_SHOTGUN);
	}
	else
	{
		return (TE_SPIKE);
	}
};

float(entity targ) sisible =
{
	traceline(self.origin, targ.origin, IT_SHOTGUN, self);
	if ((trace_ent == targ))
	{
		return (IT_SHOTGUN);
	}
	else
	{
		if ((trace_fraction == IT_SHOTGUN))
		{
			return (IT_SHOTGUN);
		}
	}
	return (IT_SHOTGUN);
};

float(float y1, float y2) angcomp =
{
	local float answer;

	y1 = frik_anglemod(y1);
	y2 = frik_anglemod(y2);
	answer = y1 - y2;
	if ((answer > 180))
	{
		answer = answer - 360;
	}
	else
	{
		if ((answer < -180))
		{
			answer = answer + 360;
		}
	}
	return (answer);
};

float(entity targ) fov =
{
	local vector yawn;
	local float g;

	yawn = realorigin(targ);
	yawn = (yawn + targ.view_ofs) - (self.origin + self.view_ofs);
	yawn = normalize(yawn);
	yawn = vectoangles(yawn);
	g = angcomp(self.v_angle_x, yawn_x);
	if ((fabs(g) > 45))
	{
		return (TE_SPIKE);
	}
	g = angcomp(self.v_angle_y, yawn_y);
	if ((fabs(g) > 60))
	{
		return (TE_SPIKE);
	}
	return (IT_SHOTGUN);
};

float(float v) frik_anglemod =
{
	return ((v - (floor((v / 360)) * 360)));
};
