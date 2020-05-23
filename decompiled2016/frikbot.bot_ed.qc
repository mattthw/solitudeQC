//Decompiled code. Please respect the original copyright.
float saved1;
float saved2;
float saved3;
float scratch1;
float scratch2;
float scratch3;
float scratch4;
float bytecounter;
float filecount;
void() BSPDumpWaypoints;
void() QCDumpWaypoints;
void() DumpWaypoints;
void() SaveWays;

void() bot_menu_display =
{
	local string s1;
	local string s2;
	local string s3;
	local string s4;
	local string s5;
	local string s6;
	local string s7;
	local string h;
	local entity t;

	if ((((self.impulse > TE_SPIKE) && (self.impulse < TE_TELEPORT)) && self.b_menu))
	{
		if ((self.b_menu == IT_SHOTGUN))
		{
			if ((self.impulse == IT_SHOTGUN))
			{
				self.b_menu = IT_SUPER_SHOTGUN;
				self.b_menu_time = time;
			}
			else
			{
				if ((self.impulse == IT_SUPER_SHOTGUN))
				{
					self.b_menu = TE_EXPLOSION;
					self.b_menu_time = time;
				}
				else
				{
					if ((self.impulse == TE_EXPLOSION))
					{
						self.b_menu = IT_NAILGUN;
						self.b_menu_time = time;
					}
					else
					{
						if ((self.impulse == IT_NAILGUN))
						{
							self.b_menu = TE_LIGHTNING2;
							self.b_menu_time = time;
						}
						else
						{
							if ((self.impulse == TE_LIGHTNING1))
							{
								self.b_menu = TE_WIZSPIKE;
								self.b_menu_time = time;
							}
							else
							{
								if ((self.impulse == TE_LIGHTNING2))
								{
									if ((self.movetype == IT_SUPER_NAILGUN))
									{
										self.movetype = TE_EXPLOSION;
									}
									else
									{
										self.movetype = IT_SUPER_NAILGUN;
									}
									self.b_menu_time = time;
								}
								else
								{
									if ((self.impulse == TE_WIZSPIKE))
									{
										if ((self.flags & IT_LIGHTNING))
										{
											self.flags = (self.flags - IT_LIGHTNING);
										}
										else
										{
											self.flags = (self.flags | IT_LIGHTNING);
										}
										self.b_menu_time = time;
									}
									else
									{
										if ((self.impulse == IT_SUPER_NAILGUN))
										{
											if ((self.b_aiflags & IT_SUPER_SHOTGUN))
											{
												self.b_aiflags = (self.b_aiflags - IT_SUPER_SHOTGUN);
											}
											else
											{
												self.b_aiflags = (self.b_aiflags | IT_SUPER_SHOTGUN);
											}
											self.b_menu_time = time;
										}
										else
										{
											if ((self.impulse == TE_LIGHTNING3))
											{
												self.b_menu = SVC_UPDATEFRAGS;
												self.b_menu_time = time;
											}
											else
											{
												if ((self.impulse == TE_LAVASPLASH))
												{
													bot_way_edit();
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
			if ((self.b_menu == IT_SUPER_SHOTGUN))
			{
				if ((self.impulse == IT_SHOTGUN))
				{
					if (self.current_way)
					{
						setorigin(self.current_way, (self.origin + self.view_ofs));
					}
				}
				else
				{
					if ((self.impulse == IT_SUPER_SHOTGUN))
					{
						if (self.current_way)
						{
							self.b_menu = 15;
							self.b_menu_time = time;
							self.last_way = self.current_way;
						}
					}
					else
					{
						if ((self.impulse == TE_EXPLOSION))
						{
							make_waypoint((self.origin + self.view_ofs));
						}
						else
						{
							if ((self.impulse == IT_NAILGUN))
							{
								t = make_waypoint((self.origin + self.view_ofs));
								if (!LinkWays(self.current_way, t))
								{
									sprint(self, "Unable to link them\n");
								}
							}
							else
							{
								if ((self.impulse == TE_LIGHTNING1))
								{
									t = make_waypoint((self.origin + self.view_ofs));
									if (!LinkWays(self.current_way, t))
									{
										sprint(self, "Unable to link old to new\n");
									}
									LinkWays(t, self.current_way);
								}
								else
								{
									if ((self.impulse == TE_LIGHTNING2))
									{
										t = make_waypoint((self.origin + self.view_ofs));
										if (!TeleLinkWays(self.current_way, t))
										{
											sprint(self, "Unable to link them\n");
										}
									}
									else
									{
										if ((self.impulse == TE_WIZSPIKE))
										{
											if (self.current_way)
											{
												sprint(self, "\nwaypoint info for waypoint #");
												h = ftos(self.current_way.count);
												sprint(self, h);
												sprint(self, "\nAI Flag value: ");
												h = ftos(self.current_way.b_aiflags);
												sprint(self, h);
												if (self.current_way.target1)
												{
													h = ftos(self.current_way.target1.count);
													if ((self.current_way.b_aiflags & IT_SHOTGUN))
													{
														sprint(self, "\nTelelink1 to:");
													}
													else
													{
														sprint(self, "\nLink1 to:");
													}
													sprint(self, h);
												}
												if (self.current_way.target2)
												{
													h = ftos(self.current_way.target2.count);
													if ((self.current_way.b_aiflags & IT_SUPER_SHOTGUN))
													{
														sprint(self, "\nTelelink2 to:");
													}
													else
													{
														sprint(self, "\nLink2 to:");
													}
													sprint(self, h);
												}
												if (self.current_way.target3)
												{
													h = ftos(self.current_way.target3.count);
													if ((self.current_way.b_aiflags & IT_NAILGUN))
													{
														sprint(self, "\nTelelink3 to:");
													}
													else
													{
														sprint(self, "\nLink3 to:");
													}
													sprint(self, h);
												}
												if (self.current_way.target4)
												{
													h = ftos(self.current_way.target4.count);
													if ((self.current_way.b_aiflags & IT_SUPER_NAILGUN))
													{
														sprint(self, "\nTelelink4 to:");
													}
													else
													{
														sprint(self, "\nLink4 to:");
													}
													sprint(self, h);
												}
												sprint(self, "\n\n");
											}
										}
									}
								}
							}
						}
					}
				}
				if ((self.impulse == IT_SUPER_NAILGUN))
				{
					self.b_menu = TE_EXPLOSION;
					self.b_menu_time = time;
				}
				else
				{
					if ((self.impulse == TE_LIGHTNING3))
					{
						self.b_menu = IT_NAILGUN;
						self.b_menu_time = time;
					}
					else
					{
						if ((self.impulse == TE_LAVASPLASH))
						{
							self.b_menu = IT_SHOTGUN;
							self.b_menu_time = time;
						}
					}
				}
			}
			else
			{
				if ((self.b_menu == TE_EXPLOSION))
				{
					if ((self.impulse == IT_SHOTGUN))
					{
						self.b_menu = IT_GRENADE_LAUNCHER;
						self.b_menu_time = time;
						self.last_way = self.current_way;
					}
					else
					{
						if ((self.impulse == IT_SUPER_SHOTGUN))
						{
							self.b_menu = IT_SUPER_NAILGUN;
							self.b_menu_time = time;
							self.last_way = self.current_way;
						}
						else
						{
							if ((self.impulse == TE_EXPLOSION))
							{
								self.b_menu = TE_LIGHTNING3;
								self.b_menu_time = time;
								self.last_way = self.current_way;
							}
							else
							{
								if ((self.impulse == IT_NAILGUN))
								{
									self.b_menu = TE_LAVASPLASH;
									self.b_menu_time = time;
									self.last_way = self.current_way;
								}
								else
								{
									if ((self.impulse == TE_LIGHTNING1))
									{
										self.b_menu = TE_TELEPORT;
										self.b_menu_time = time;
										self.last_way = self.current_way;
									}
									else
									{
										if ((self.impulse == TE_LIGHTNING2))
										{
											self.b_menu = 12;
											self.b_menu_time = time;
											self.last_way = self.current_way;
										}
										else
										{
											if ((self.impulse == TE_WIZSPIKE))
											{
												make_waypoint((self.origin + self.view_ofs));
											}
											else
											{
												if ((self.impulse == IT_SUPER_NAILGUN))
												{
													self.b_menu = IT_SUPER_SHOTGUN;
													self.b_menu_time = time;
												}
												else
												{
													if ((self.impulse == TE_LIGHTNING3))
													{
														self.b_menu = IT_NAILGUN;
														self.b_menu_time = time;
													}
													else
													{
														if ((self.impulse == TE_LAVASPLASH))
														{
															self.b_menu = IT_SHOTGUN;
															self.b_menu_time = time;
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
					if ((self.b_menu == IT_NAILGUN))
					{
						if (self.current_way)
						{
							if ((self.impulse == IT_SHOTGUN))
							{
								if ((self.current_way.b_aiflags & IT_GRENADE_LAUNCHER))
								{
									self.current_way.b_aiflags = (self.current_way.b_aiflags - (self.current_way.b_aiflags & IT_GRENADE_LAUNCHER));
								}
								else
								{
									self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_GRENADE_LAUNCHER);
								}
								self.b_menu_time = time;
							}
							else
							{
								if ((self.impulse == IT_SUPER_SHOTGUN))
								{
									if ((self.current_way.b_aiflags & IT_ROCKET_LAUNCHER))
									{
										self.current_way.b_aiflags = (self.current_way.b_aiflags - (self.current_way.b_aiflags & IT_ROCKET_LAUNCHER));
									}
									else
									{
										self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_ROCKET_LAUNCHER);
									}
									self.b_menu_time = time;
								}
								else
								{
									if ((self.impulse == TE_EXPLOSION))
									{
										if ((self.current_way.b_aiflags & IT_LIGHTNING))
										{
											self.current_way.b_aiflags = (self.current_way.b_aiflags - (self.current_way.b_aiflags & IT_LIGHTNING));
										}
										else
										{
											self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_LIGHTNING);
										}
										self.b_menu_time = time;
									}
									else
									{
										if ((self.impulse == IT_NAILGUN))
										{
											if ((self.current_way.b_aiflags & IT_EXTRA_WEAPON))
											{
												self.current_way.b_aiflags = (self.current_way.b_aiflags - (self.current_way.b_aiflags & IT_EXTRA_WEAPON));
											}
											else
											{
												self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_EXTRA_WEAPON);
											}
											self.b_menu_time = time;
										}
										else
										{
											if ((self.impulse == TE_LIGHTNING1))
											{
												if ((self.current_way.b_aiflags & IT_SHELLS))
												{
													self.current_way.b_aiflags = (self.current_way.b_aiflags - (self.current_way.b_aiflags & IT_SHELLS));
												}
												else
												{
													self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_SHELLS);
												}
												self.b_menu_time = time;
											}
											else
											{
												if ((self.impulse == TE_LIGHTNING2))
												{
													if ((self.current_way.b_aiflags & IT_NAILS))
													{
														self.current_way.b_aiflags = (self.current_way.b_aiflags - (self.current_way.b_aiflags & IT_NAILS));
													}
													else
													{
														self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_NAILS);
													}
													self.b_menu_time = time;
												}
												else
												{
													if ((self.impulse == TE_WIZSPIKE))
													{
														if ((self.current_way.b_aiflags & IT_AXE))
														{
															self.current_way.b_aiflags = (self.current_way.b_aiflags - (self.current_way.b_aiflags & IT_AXE));
														}
														else
														{
															self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_AXE);
														}
														self.b_menu_time = time;
													}
												}
											}
										}
									}
								}
							}
						}
						if ((self.impulse == TE_LIGHTNING3))
						{
							self.b_menu = TE_LIGHTNING1;
							self.b_menu_time = time;
						}
						else
						{
							if ((self.impulse == TE_LAVASPLASH))
							{
								self.b_menu = IT_SHOTGUN;
								self.b_menu_time = time;
							}
						}
					}
					else
					{
						if ((self.b_menu == TE_LIGHTNING1))
						{
							if (self.current_way)
							{
								if ((self.impulse == IT_SHOTGUN))
								{
									if ((self.current_way.b_aiflags & 65536))
									{
										self.current_way.b_aiflags = (self.current_way.b_aiflags - (self.current_way.b_aiflags & 65536));
									}
									else
									{
										self.current_way.b_aiflags = (self.current_way.b_aiflags | 65536);
									}
									self.b_menu_time = time;
								}
								else
								{
									if ((self.impulse == IT_SUPER_SHOTGUN))
									{
										if ((self.current_way.b_aiflags & IT_ROCKETS))
										{
											self.current_way.b_aiflags = (self.current_way.b_aiflags - (self.current_way.b_aiflags & IT_ROCKETS));
										}
										else
										{
											self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_ROCKETS);
										}
										self.b_menu_time = time;
									}
									else
									{
										if ((self.impulse == TE_EXPLOSION))
										{
											if ((self.current_way.b_aiflags & IT_CELLS))
											{
												self.current_way.b_aiflags = (self.current_way.b_aiflags - (self.current_way.b_aiflags & IT_CELLS));
											}
											else
											{
												self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_CELLS);
											}
											self.b_menu_time = time;
										}
										else
										{
											if ((self.impulse == IT_NAILGUN))
											{
												if ((self.current_way.b_aiflags & IT_ARMOR3))
												{
													self.current_way.b_aiflags = (self.current_way.b_aiflags - (self.current_way.b_aiflags & IT_ARMOR3));
												}
												else
												{
													self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_ARMOR3);
												}
												self.b_menu_time = time;
											}
											else
											{
												if ((self.impulse == TE_LIGHTNING1))
												{
													if ((self.current_way.b_aiflags & IT_ARMOR2))
													{
														self.current_way.b_aiflags = (self.current_way.b_aiflags - (self.current_way.b_aiflags & IT_ARMOR2));
													}
													else
													{
														self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_ARMOR2);
													}
													self.b_menu_time = time;
												}
												else
												{
													if ((self.impulse == TE_LIGHTNING2))
													{
														if ((self.current_way.b_aiflags & IT_ARMOR1))
														{
															self.current_way.b_aiflags = (self.current_way.b_aiflags - (self.current_way.b_aiflags & IT_ARMOR1));
														}
														else
														{
															self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_ARMOR1);
														}
														self.b_menu_time = time;
													}
													else
													{
														if ((self.impulse == TE_WIZSPIKE))
														{
															if ((self.current_way.b_aiflags & IT_KEY1))
															{
																self.current_way.b_aiflags = (self.current_way.b_aiflags - (self.current_way.b_aiflags & IT_KEY1));
															}
															else
															{
																self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_KEY1);
															}
															self.b_menu_time = time;
														}
													}
												}
											}
										}
									}
								}
							}
							if ((self.impulse == TE_LIGHTNING3))
							{
								self.b_menu = IT_NAILGUN;
								self.b_menu_time = time;
							}
							else
							{
								if ((self.impulse == TE_LAVASPLASH))
								{
									self.b_menu = IT_SHOTGUN;
									self.b_menu_time = time;
								}
							}
						}
						else
						{
							if ((self.b_menu == TE_LIGHTNING2))
							{
								if ((self.impulse == IT_SHOTGUN))
								{
									self.impulse = 100;
									return;
								}
								else
								{
									if ((self.impulse == IT_SUPER_SHOTGUN))
									{
										b_temp3 = self;
										self = player_head;
										while (self)
										{
											if (!self.ishuman)
											{
												target_add(b_temp3);
												bot_get_path(b_temp3, IT_SHOTGUN);
												self = world;
											}
											else
											{
												self = self._next;
											}
										}
										self = b_temp3;
									}
									else
									{
										if ((self.impulse == TE_EXPLOSION))
										{
											self.impulse = 102;
											return;
										}
										else
										{
											if ((self.impulse == IT_NAILGUN))
											{
												b_temp1 = self;
												self = player_head;
												while (self)
												{
													if (!self.ishuman)
													{
														self.target4 = world;
														self.target3 = world;
														self.target2 = world;
														self.target1 = world;
														route_table = world;
													}
													self = self._next;
												}
												self = b_temp1;
											}
											else
											{
												if ((self.impulse == TE_LIGHTNING1))
												{
													if (self.current_way)
													{
														b_temp1 = self;
														self = player_head;
														while (self)
														{
															if (!self.ishuman)
															{
																setorigin(self, b_temp1.current_way.origin);
															}
															self = self._next;
														}
														self = b_temp1;
													}
													else
													{
														sprint(self, "select a waypoint first\n");
													}
												}
												else
												{
													if ((self.impulse == TE_LIGHTNING2))
													{
														self.b_menu = SVC_UPDATEFRAGS;
														self.b_menu_time = time;
													}
													else
													{
														if ((self.impulse == TE_LAVASPLASH))
														{
															self.b_menu = IT_SHOTGUN;
															self.b_menu_time = time;
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
								if ((self.b_menu == TE_WIZSPIKE))
								{
									if ((self.impulse == IT_SHOTGUN))
									{
										self.b_menu = 13;
										self.b_menu_time = time;
									}
									else
									{
										if ((self.impulse == IT_SUPER_SHOTGUN))
										{
											if ((dump_mode == TE_SPIKE))
											{
												DumpWaypoints();
											}
											else
											{
												if ((dump_mode == IT_SHOTGUN))
												{
													QCDumpWaypoints();
												}
												else
												{
													if ((dump_mode == IT_SUPER_SHOTGUN))
													{
														BSPDumpWaypoints();
													}
												}
											}
										}
										else
										{
											if ((self.impulse == TE_EXPLOSION))
											{
												t = way_head;
												while (t)
												{
													if (((((t.target1 == world) && (t.target2 == world)) && (t.target3 == world)) && (t.target4 == world)))
													{
														sprint(self, "Waypoint #");
														h = ftos(t.count);
														sprint(self, h);
														sprint(self, " has no outbound links\n");
													}
													if (((((t.target1 == t) || (t.target2 == t)) || (t.target3 == t)) || (t.target4 == t)))
													{
														sprint(self, "Waypoint #");
														h = ftos(t.count);
														sprint(self, h);
														sprint(self, " links to itself (??)\n");
													}
													t = t._next;
												}
												sprint(self, "Error check complete\n");
											}
											else
											{
												if ((self.impulse == IT_NAILGUN))
												{
													self.b_menu = SVC_UPDATECOLORS;
													self.b_menu_time = time;
												}
												else
												{
													if ((self.impulse == TE_LIGHTNING1))
													{
														if ((waypoint_mode == TE_LIGHTNING1))
														{
															waypoint_mode = IT_NAILGUN;
														}
														else
														{
															waypoint_mode = TE_LIGHTNING1;
														}
														self.b_menu_time = time;
													}
													else
													{
														if ((self.impulse == TE_LIGHTNING2))
														{
															if ((waypoint_mode == TE_LIGHTNING2))
															{
																waypoint_mode = IT_NAILGUN;
															}
															else
															{
																waypoint_mode = TE_LIGHTNING2;
															}
															self.b_menu_time = time;
														}
														else
														{
															if ((self.impulse == TE_WIZSPIKE))
															{
																dump_mode = TE_SPIKE;
																self.b_menu_time = time;
															}
															else
															{
																if ((self.impulse == IT_SUPER_NAILGUN))
																{
																	dump_mode = IT_SHOTGUN;
																	self.b_menu_time = time;
																}
																else
																{
																	if ((self.impulse == TE_LIGHTNING3))
																	{
																		dump_mode = IT_SUPER_SHOTGUN;
																		self.b_menu_time = time;
																	}
																	else
																	{
																		if ((self.impulse == TE_LAVASPLASH))
																		{
																			self.b_menu = IT_SHOTGUN;
																			self.b_menu_time = time;
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
									if ((self.b_menu == IT_SUPER_NAILGUN))
									{
										if ((self.impulse == IT_SHOTGUN))
										{
											if (self.current_way)
											{
												if (!LinkWays(self.last_way, self.current_way))
												{
													sprint(self, "Unable to link them\n");
												}
												self.b_menu = TE_EXPLOSION;
												self.b_menu_time = time;
											}
										}
										else
										{
											if ((self.impulse == IT_SUPER_SHOTGUN))
											{
												self.b_menu = TE_EXPLOSION;
												self.b_menu_time = time;
											}
										}
									}
									else
									{
										if ((self.b_menu == TE_LIGHTNING3))
										{
											if ((self.impulse == IT_SHOTGUN))
											{
												if (self.current_way)
												{
													if (!TeleLinkWays(self.last_way, self.current_way))
													{
														sprint(self, "Unable to link them\n");
													}
													self.b_menu = TE_EXPLOSION;
													self.b_menu_time = time;
												}
											}
											else
											{
												if ((self.impulse == IT_SUPER_SHOTGUN))
												{
													self.b_menu = TE_EXPLOSION;
													self.b_menu_time = time;
												}
											}
										}
										else
										{
											if ((self.b_menu == TE_LAVASPLASH))
											{
												if ((self.impulse == IT_SHOTGUN))
												{
													if (self.current_way)
													{
														UnlinkWays(self.last_way, self.current_way);
														self.b_menu = TE_EXPLOSION;
														self.b_menu_time = time;
													}
												}
												else
												{
													if ((self.impulse == IT_SUPER_SHOTGUN))
													{
														self.b_menu = TE_EXPLOSION;
														self.b_menu_time = time;
													}
												}
											}
											else
											{
												if ((self.b_menu == TE_TELEPORT))
												{
													if ((self.impulse == IT_SHOTGUN))
													{
														if (self.current_way)
														{
															if (!LinkWays(self.last_way, self.current_way))
															{
																sprint(self, "Unable to link 1 to 2\n");
															}
															if (!LinkWays(self.current_way, self.last_way))
															{
																sprint(self, "Unable to link 2 to 1\n");
															}
															self.b_menu = TE_EXPLOSION;
															self.b_menu_time = time;
														}
													}
													else
													{
														if ((self.impulse == IT_SUPER_SHOTGUN))
														{
															self.b_menu = TE_EXPLOSION;
															self.b_menu_time = time;
														}
													}
												}
												else
												{
													if ((self.b_menu == 12))
													{
														if ((self.impulse == IT_SHOTGUN))
														{
															if (self.current_way)
															{
																UnlinkWays(self.last_way, self.current_way);
																UnlinkWays(self.current_way, self.last_way);
																self.b_menu = TE_EXPLOSION;
																self.b_menu_time = time;
															}
														}
														else
														{
															if ((self.impulse == IT_SUPER_SHOTGUN))
															{
																self.b_menu = TE_EXPLOSION;
																self.b_menu_time = time;
															}
														}
													}
													else
													{
														if ((self.b_menu == 13))
														{
															if ((self.impulse == IT_SHOTGUN))
															{
																ClearAllWays();
																self.b_menu = TE_WIZSPIKE;
																self.b_menu_time = time;
															}
															else
															{
																if ((self.impulse == IT_SUPER_SHOTGUN))
																{
																	self.b_menu = TE_WIZSPIKE;
																	self.b_menu_time = time;
																}
															}
														}
														else
														{
															if ((self.b_menu == SVC_UPDATEFRAGS))
															{
																if ((self.impulse == TE_LAVASPLASH))
																{
																	self.impulse = TE_SPIKE;
																}
																self.b_menu_value = ((self.b_menu_value * TE_LAVASPLASH) + self.impulse);
																self.b_menu_time = TE_SPIKE;
															}
															else
															{
																if ((self.b_menu == 15))
																{
																	if ((self.impulse == IT_SHOTGUN))
																	{
																		delete_waypoint(self.last_way);
																		self.b_menu = IT_SUPER_SHOTGUN;
																		self.b_menu_time = time;
																	}
																	else
																	{
																		if ((self.impulse == IT_SUPER_SHOTGUN))
																		{
																			self.b_menu = IT_SUPER_SHOTGUN;
																			self.b_menu_time = time;
																		}
																	}
																}
																else
																{
																	if ((self.b_menu == IT_GRENADE_LAUNCHER))
																	{
																		if ((self.impulse == IT_SHOTGUN))
																		{
																			if (self.last_way)
																			{
																				self.last_way.target4 = world;
																				self.last_way.target3 = world;
																				self.last_way.target2 = world;
																				self.last_way.target1 = world;
																				self.last_way.b_aiflags = (self.last_way.b_aiflags - (self.last_way.b_aiflags & 15));
																			}
																			self.b_menu = TE_EXPLOSION;
																			self.b_menu_time = time;
																		}
																		else
																		{
																			if ((self.impulse == IT_SUPER_SHOTGUN))
																			{
																				self.b_menu = TE_EXPLOSION;
																				self.b_menu_time = time;
																			}
																		}
																	}
																	else
																	{
																		if ((self.b_menu == SVC_UPDATECOLORS))
																		{
																			if ((self.impulse == IT_SHOTGUN))
																			{
																				SaveWays();
																			}
																			if ((self.impulse < TE_EXPLOSION))
																			{
																				self.b_menu = TE_WIZSPIKE;
																				self.b_menu_time = time;
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
		}
		self.impulse = TE_SPIKE;
	}
	if ((self.b_menu_time <= time))
	{
		if ((self.b_menu == IT_SHOTGUN))
		{
			s1 = "­­ Íáéî Íåîõ ­­\n >>Waypoint Management\n >>Link Management    \n >>AI Flag Management \n >>Bot Management     \n >>Waylist Management \n";
			if ((self.movetype == IT_SUPER_NAILGUN))
			{
				s2 = " … Noclip           \n";
			}
			else
			{
				s2 = "   Noclip           \n";
			}
			if ((self.flags & IT_LIGHTNING))
			{
				s3 = " … Godmode          \n";
			}
			else
			{
				s3 = "   Godmode          \n";
			}
			if ((self.b_aiflags & IT_SUPER_SHOTGUN))
			{
				s4 = " … Hold Select      \n";
			}
			else
			{
				s4 = "   Hold Select      \n";
			}
			s5 = " Teleport to Way #    \n Close Menu           \n";
		}
		else
		{
			if ((self.b_menu == IT_SUPER_SHOTGUN))
			{
				s1 = "­­ ×áùðïéîô Íáîáçåíåîô ­­\n Move Waypoint        \n Delete Waypoint      \n Make Waypoint        \n Make Way + Link      \n Make Way + Link X2   \n Make Way + Telelink  \n Show waypoint info   \n >>Link Management    \n >>AI Flag Management \n >>Main Menu          \n";
			}
			else
			{
				if ((self.b_menu == TE_EXPLOSION))
				{
					s1 = "­­ Ìéîë Íáîáçåíåîô ­­\n Unlink Waypoint      \n Create Link          \n Create Telelink      \n Delete Link          \n Create Link X2       \n Delete Link X2       \n >Make Waypoint       \n >>Waypoint Management\n >>AI Flag Management \n >>Main Menu          \n";
				}
				else
				{
					if ((self.b_menu == IT_NAILGUN))
					{
						if ((self.current_way.b_aiflags & IT_GRENADE_LAUNCHER))
						{
							s1 = "­­ ÁÉ Æìáç Íáîáçåíåîô ­­\n … Door Flag        \n";
						}
						else
						{
							s1 = "­­ ÁÉ Æìáç Íáîáçåíåîô ­­\n   Door Flag        \n";
						}
						if ((self.current_way.b_aiflags & IT_ROCKET_LAUNCHER))
						{
							s2 = " … Precision        \n";
						}
						else
						{
							s2 = "   Precision        \n";
						}
						if ((self.current_way.b_aiflags & IT_LIGHTNING))
						{
							s3 = " … Surface for air  \n";
						}
						else
						{
							s3 = "   Surface for air  \n";
						}
						if ((self.current_way.b_aiflags & IT_EXTRA_WEAPON))
						{
							s4 = " … Blind mode       \n";
						}
						else
						{
							s4 = "   Blind mode       \n";
						}
						if ((self.current_way.b_aiflags & IT_SHELLS))
						{
							s5 = " … Jump             \n";
						}
						else
						{
							s5 = "   Jump             \n";
						}
						if ((self.current_way.b_aiflags & IT_NAILS))
						{
							s6 = " … Directional      \n";
						}
						else
						{
							s6 = "   Directional      \n";
						}
						if ((self.current_way.b_aiflags & IT_AXE))
						{
							s7 = " … Super Jump       \n\n >>AI Flags page 2    \n >>Main Menu          \n";
						}
						else
						{
							s7 = "   Super Jump       \n\n >>AI Flags page 2    \n >>Main Menu          \n";
						}
					}
					else
					{
						if ((self.b_menu == TE_LIGHTNING1))
						{
							if ((self.current_way.b_aiflags & 65536))
							{
								s1 = "­­ ÁÉ Æìáçó ðç® ²­­\n … Difficult        \n";
							}
							else
							{
								s1 = "­­ ÁÉ Æìáçó ðç® ²­­\n   Difficult        \n";
							}
							if ((self.current_way.b_aiflags & IT_ROCKETS))
							{
								s2 = " … Wait for plat    \n";
							}
							else
							{
								s2 = "   Wait for plat    \n";
							}
							if ((self.current_way.b_aiflags & IT_CELLS))
							{
								s3 = " … Ride train       \n";
							}
							else
							{
								s3 = "   Ride train       \n";
							}
							if ((self.current_way.b_aiflags & IT_ARMOR3))
							{
								s4 = " … Door flag no open\n";
							}
							else
							{
								s4 = "   Door flag no open\n";
							}
							if ((self.current_way.b_aiflags & IT_ARMOR2))
							{
								s5 = " … Ambush           \n";
							}
							else
							{
								s5 = "   Ambush           \n";
							}
							if ((self.current_way.b_aiflags & IT_ARMOR1))
							{
								s6 = " … Snipe            \n";
							}
							else
							{
								s6 = "   Snipe            \n";
							}
							if ((self.current_way.b_aiflags & IT_KEY1))
							{
								s7 = " … Trace Test       \n\n >>AI Flag Management \n >>Main Menu          \n";
							}
							else
							{
								s7 = "   Trace Test       \n\n >>AI Flag Management \n >>Main Menu          \n";
							}
						}
						else
						{
							if ((self.b_menu == TE_LIGHTNING2))
							{
								s1 = "­­ Âïô Íáîáçåíåîô ­­\n Add a Test Bot       \n Order Test Bot here  \n Remove Test Bot      \n Stop Test Bot        \n Teleport Bot here    \n Teleport to Way #    \n\n\n\n >>Main Menu          \n";
							}
							else
							{
								if ((self.b_menu == TE_WIZSPIKE))
								{
									s1 = "­­ ×áùìéóô Íáîáçåíåîô ­­\n Delete ALL Waypoints \n Dump Waypoints       \n Check For Errors     \n Save Waypoints       \n";
									if ((waypoint_mode == TE_LIGHTNING1))
									{
										s2 = " … Dynamic Mode     \n … Dynamic Link     \n";
									}
									else
									{
										if ((waypoint_mode == TE_LIGHTNING2))
										{
											s2 = "   Dynamic Mode     \n … Dynamic Link     \n";
										}
										else
										{
											s2 = "   Dynamic Mode     \n   Dynamic Link     \n";
										}
									}
									if ((dump_mode == TE_SPIKE))
									{
										s3 = " … WAY output       \n   QC output        \n   BSP ents output  \n Main Menu            \n";
									}
									else
									{
										if ((dump_mode == IT_SHOTGUN))
										{
											s3 = "   WAY output       \n … QC output        \n   BSP ents output  \n Main Menu            \n";
										}
										else
										{
											if ((dump_mode == IT_SUPER_SHOTGUN))
											{
												s3 = "   WAY output       \n   QC output        \n … BSP ents output  \n Main Menu            \n";
											}
										}
									}
								}
								else
								{
									if ((self.b_menu == IT_SUPER_NAILGUN))
									{
										s1 = "­­ Ìéîë ×áùó ­­\n\nSelect another way and push 1\nor press 2 to cancel";
									}
									else
									{
										if ((self.b_menu == TE_LIGHTNING3))
										{
											s1 = "­­ Ôåìåìéîë ×áùó ­­\n\nSelect another way and push 1\nor press 2 to cancel";
										}
										else
										{
											if ((self.b_menu == TE_LAVASPLASH))
											{
												s1 = "­­ Äåìåôå Ìéîë ­­\n\nSelect another way and push 1\nor press 2 to cancel";
											}
											else
											{
												if ((self.b_menu == TE_TELEPORT))
												{
													s1 = "­­ Ãòåáôå Ìéîë Ø² ­­\n\nSelect another way and push 1\nor press 2 to cancel";
												}
												else
												{
													if ((self.b_menu == 12))
													{
														s1 = "­­ Äåìåôå Ìéîë Ø² ­­\n\nSelect another way and push 1\nor press 2 to cancel";
													}
													else
													{
														if ((self.b_menu == 13))
														{
															s1 = "­­ Äåìåôå ÁÌÌ ×áùó ­­\n\nAre you sure? Push 1 to go\nthrough with it, 2 to cancel";
														}
														else
														{
															if ((self.b_menu == SVC_UPDATEFRAGS))
															{
																s1 = "­­ Ôåìåðïòô ôï ×áù # ­­\n\nEnter way number and press\nimpulse 104 to warp\n\nWaypoint #";
																s2 = ftos(self.b_menu_value);
															}
															else
															{
																if ((self.b_menu == 15))
																{
																	s1 = "­­ Äåìåôå ×áùðïéîô ­­\n\nAre you sure? Push 1 to go\nthrough with it, 2 to cancel";
																}
																else
																{
																	if ((self.b_menu == IT_GRENADE_LAUNCHER))
																	{
																		s1 = "­­ Õîìéîë ×áùðïéîô ­­\n\nAre you sure? Push 1 to go\nthrough with it, 2 to cancel";
																	}
																	else
																	{
																		if ((self.b_menu == SVC_UPDATECOLORS))
																		{
																			s1 = "­­ Óáöå ×áùðïéîôó ­­\n\nSave Waypoints requires\nFrikaC's file access tutorial from\nwww.quakesrc.org to be present\n in the engine code.\n Push 1 to continue, 2 to cancel";
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
		frik_big_centerprint(self, s1, s2, s3, s4, s5, s6, s7);
		self.b_menu_time = (time + 1.25);
	}
};

void() bot_way_edit =
{
	local entity t;
	local float f;

	if (self.b_menu_value)
	{
		if ((self.b_menu == SVC_UPDATEFRAGS))
		{
			t = WaypointForNum(self.b_menu_value);
			if (t)
			{
				setorigin(self, (t.origin - self.view_ofs));
			}
			else
			{
				sprint(self, "No waypoint with that number\n");
			}
			self.b_menu = IT_SHOTGUN;
			self.b_menu_time = time;
		}
		self.b_menu_value = TE_SPIKE;
		return;
	}
	if ((waypoint_mode < IT_NAILGUN))
	{
		self.b_menu = IT_SHOTGUN;
		waypoint_mode = IT_NAILGUN;
		self.b_menu_time = TE_SPIKE;
		cvar_set(/*2504i*/"saved2", /*2558i*/"0");
		WriteByte(IT_SUPER_SHOTGUN, IT_SUPER_NAILGUN);
		WriteByte(IT_SUPER_SHOTGUN, IT_SHOTGUN);
		WriteString(IT_SUPER_SHOTGUN, "MAKE SURE THE FOLLOWING LINE CONTAINS -CONDEBUG BEFORE PROCEEDING\n");
		localcmd(/*9386i*/"cmdline\n");
		t = way_head;
		while (t)
		{
			setmodel(t, /*2255i*/"progs/s_bubble.spr");
			t = t._next;
		}
		if (self.current_way)
		{
			setmodel(self.current_way, /*2237i*/"progs/s_light.spr");
		}
	}
	else
	{
		saved2 = cvar(/*2504i*/"saved2");
		if ((saved2 != TE_SPIKE))
		{
			f = self.b_menu;
			self.b_menu = floor((saved2 / IT_GRENADE_LAUNCHER));
			self.impulse = (saved2 & 15);
			bot_menu_display();
			if ((self.b_menu == floor((saved2 / IT_GRENADE_LAUNCHER))))
			{
				self.b_menu = f;
			}
			cvar_set(/*2504i*/"saved2", /*2558i*/"0");
			return;
		}
		self.b_menu = TE_SPIKE;
		waypoint_mode = TE_EXPLOSION;
		t = way_head;
		while (t)
		{
			setmodel(t, string_null);
			t = t._next;
		}
	}
};

void() PrintWaypoint =
{
	local entity t;
	local float needcolon;
	local string h;

	if ((self.enemy == world))
	{
		t = way_head;
	}
	else
	{
		t = self.enemy._next;
	}
	if ((bytecounter >= 8000))
	{
		bprint("exec maps/");
		bprint(mapname);
		bprint(".wa");
		h = ftos(filecount);
		bprint(h);
		filecount = filecount + IT_SHOTGUN;
		bprint("\n// **** break here ****\n");
		bytecounter = 26;
	}
	if ((t == world))
	{
		remove(self);
		fixer = world;
		bprint("saved4 3\n// end waypoint dump\n");
		bytecounter = bytecounter + SVC_KILLEDMONSTER;
		return;
	}
	t.origin_x = rint(t.origin_x);
	t.origin_y = rint(t.origin_y);
	t.origin_z = rint(t.origin_z);
	if (((t.origin_x != saved1) || (t.count == IT_SHOTGUN)))
	{
		bprint("saved1 ");
		h = ftos(t.origin_x);
		bprint(h);
		saved1 = t.origin_x;
		bytecounter = bytecounter + 12;
		needcolon = IT_SHOTGUN;
	}
	if (((t.origin_y != saved2) || (t.count == IT_SHOTGUN)))
	{
		if (needcolon)
		{
			bprint("; ");
			bytecounter = bytecounter + IT_SUPER_SHOTGUN;
		}
		else
		{
			needcolon = IT_SHOTGUN;
		}
		bprint("saved2 ");
		h = ftos(t.origin_y);
		bprint(h);
		bytecounter = bytecounter + 12;
		saved2 = t.origin_y;
	}
	if (((t.origin_z != saved3) || (t.count == IT_SHOTGUN)))
	{
		if (needcolon)
		{
			bprint("; ");
			bytecounter = bytecounter + IT_SUPER_SHOTGUN;
		}
		else
		{
			needcolon = IT_SHOTGUN;
		}
		bprint("saved3 ");
		h = ftos(t.origin_z);
		bprint(h);
		bytecounter = bytecounter + 12;
		saved3 = t.origin_z;
	}
	if (needcolon)
	{
		bytecounter = bytecounter + IT_SHOTGUN;
		bprint("\n");
		needcolon = TE_SPIKE;
	}
	if (((scratch1 != t.target1.count) || (t.count == IT_SHOTGUN)))
	{
		needcolon = IT_SHOTGUN;
		bprint("scratch1 ");
		bytecounter = bytecounter + SVC_UPDATEFRAGS;
		h = ftos(t.target1.count);
		bprint(h);
		scratch1 = t.target1.count;
	}
	if (((scratch2 != t.target2.count) || (t.count == IT_SHOTGUN)))
	{
		if (needcolon)
		{
			bprint("; ");
			bytecounter = bytecounter + IT_SUPER_SHOTGUN;
		}
		else
		{
			needcolon = IT_SHOTGUN;
		}
		bprint("scratch2 ");
		bytecounter = bytecounter + SVC_UPDATEFRAGS;
		h = ftos(t.target2.count);
		bprint(h);
		scratch2 = t.target2.count;
	}
	if (((scratch3 != t.target3.count) || (t.count == IT_SHOTGUN)))
	{
		if (needcolon)
		{
			bprint("; ");
			bytecounter = bytecounter + IT_SUPER_SHOTGUN;
		}
		else
		{
			needcolon = IT_SHOTGUN;
		}
		bprint("scratch3 ");
		bytecounter = bytecounter + SVC_UPDATEFRAGS;
		h = ftos(t.target3.count);
		bprint(h);
		scratch3 = t.target3.count;
	}
	if (((scratch4 != t.target4.count) || (t.count == IT_SHOTGUN)))
	{
		if (needcolon)
		{
			bprint("; ");
			bytecounter = bytecounter + IT_SUPER_SHOTGUN;
		}
		else
		{
			needcolon = IT_SHOTGUN;
		}
		bprint("scratch4 ");
		bytecounter = bytecounter + SVC_UPDATEFRAGS;
		h = ftos(t.target4.count);
		bprint(h);
		scratch4 = t.target4.count;
	}
	if (needcolon)
	{
		bprint("\n");
		needcolon = TE_SPIKE;
	}
	bprint("saved4 ");
	bytecounter = bytecounter + 19;
	if ((t.count != IT_SHOTGUN))
	{
		h = ftos(((t.b_aiflags * IT_NAILGUN) + IT_SUPER_SHOTGUN));
	}
	else
	{
		h = ftos(((t.b_aiflags * IT_NAILGUN) + IT_SHOTGUN));
	}
	bprint(h);
	bprint("; wait\n");
	self.nextthink = (time + 0.01);
	self.enemy = t;
};

void() DumpWaypoints =
{
	bytecounter = 50;
	filecount = IT_SHOTGUN;
	bprint("// ");
	bprint(world.message);
	bprint(" - maps/");
	bprint(mapname);
	bprint(".way\n");
	bprint("// Ways by ");
	bprint(self.netname);
	bprint("\n");
	if (!fixer)
	{
		fixer = spawn();
		fixer.nextthink = (time + 0.01);
		fixer.think = PrintWaypoint;
		fixer.enemy = world;
	}
};

void() PrintQCWaypoint =
{
	local entity t;
	local string h;

	if ((self.enemy == world))
	{
		t = way_head;
	}
	else
	{
		t = self.enemy._next;
	}
	if ((t == world))
	{
		remove(self);
		fixer = world;
		bprint("};\n// End dump\n");
		return;
	}
	bprint("	make_way(");
	t.origin_x = rint(t.origin_x);
	t.origin_y = rint(t.origin_y);
	t.origin_z = rint(t.origin_z);
	h = vtos(t.origin);
	bprint(h);
	bprint(", '");
	h = ftos(t.target1.count);
	bprint(h);
	bprint(" ");
	h = ftos(t.target2.count);
	bprint(h);
	bprint(" ");
	h = ftos(t.target3.count);
	bprint(h);
	bprint("', ");
	h = ftos(t.target4.count);
	bprint(h);
	bprint(", ");
	h = ftos(t.b_aiflags);
	bprint(h);
	bprint(");\n");
	self.nextthink = (time + 0.01);
	self.enemy = t;
};

void() QCDumpWaypoints =
{
	bprint("/* QC Waypoint Dump - src/frikbot/map_");
	bprint(mapname);
	bprint(".qc\nFor instructions please read the\nreadme.html that comes with FrikBot */\n\nvoid(vector org, vector bit1, float bit4, float flargs) make_way;\n");
	bprint("// Ways by ");
	bprint(self.netname);
	bprint("\n\n");
	bprint("void() map_");
	bprint(mapname);
	bprint(" =\n{\n");
	if (!fixer)
	{
		fixer = spawn();
		fixer.nextthink = (time + 0.01);
		fixer.think = PrintQCWaypoint;
		fixer.enemy = world;
	}
};

void() PrintBSPWaypoint =
{
	local entity t;
	local string h;

	if ((self.enemy == world))
	{
		t = way_head;
	}
	else
	{
		t = self.enemy._next;
	}
	if ((t == world))
	{
		bprint("// End dump\n");
		remove(self);
		fixer = world;
		return;
	}
	bprint("{\n\"classname\" \"waypoint\"\n\"origin\" \"");
	t.origin_x = rint(t.origin_x);
	t.origin_y = rint(t.origin_y);
	t.origin_z = rint(t.origin_z);
	h = ftos(t.origin_x);
	bprint(h);
	bprint(" ");
	h = ftos(t.origin_y);
	bprint(h);
	bprint(" ");
	h = ftos(t.origin_z);
	bprint(h);
	if (t.target1.count)
	{
		bprint("\"\n\"b_pants\" \"");
		h = ftos(t.target1.count);
		bprint(h);
	}
	if (t.target2.count)
	{
		bprint("\"\n\"b_skill\" \"");
		h = ftos(t.target2.count);
		bprint(h);
	}
	if (t.target3.count)
	{
		bprint("\"\n\"b_shirt\" \"");
		h = ftos(t.target3.count);
		bprint(h);
	}
	if (t.target4.count)
	{
		bprint("\"\n\"b_frags\" \"");
		h = ftos(t.target4.count);
		bprint(h);
	}
	if (t.b_aiflags)
	{
		bprint("\"\n\"b_aiflags\" \"");
		h = ftos(t.b_aiflags);
		bprint(h);
	}
	bprint("\"\n}\n");
	self.nextthink = (time + 0.01);
	self.enemy = t;
};

void() BSPDumpWaypoints =
{
	bprint("/* BSP entities Dump - maps/");
	bprint(mapname);
	bprint(".ent\nFor instructions please read the\nreadme.html that comes with FrikBot */\n\n");
	if (!fixer)
	{
		fixer = spawn();
		fixer.nextthink = (time + 0.01);
		fixer.think = PrintBSPWaypoint;
		fixer.enemy = world;
	}
};
string(string s1, optional string s2, optional string s3, optional string s4, optional string s5, optional string s6, optional string s7, optional string s8) strcat = #82; 
__variant(...) open = #86; 
void(entity killer, entity killee) zone = #79; 
string(entity e, string key) unzone = #80; 
__variant(...) close = #87; 
__variant(...) write = #89; 
string(string s1, optional string s2, optional string s3, optional string s4, optional string s5, optional string s6, optional string s7, optional string s8) strcat;
__variant(...) open;
void(entity killer, entity killee) zone;
string(entity e, string key) unzone;
__variant(...) close;
__variant(...) write;
float file;

void() SaveWaypoint =
{
	local entity t;
	local float needcolon;
	local string h;
	local string j;
	local string k;
	local string l;

	if ((self.enemy == world))
	{
		t = way_head;
	}
	else
	{
		t = self.enemy._next;
	}
	if ((bytecounter >= 8000))
	{
		h = "maps/";
		j = ftos(filecount);
		h = zone(strcat(/*10186i*/"maps/", mapname));
		k = zone(strcat(/*10186i*/"maps/", mapname));
		h = zone(strcat(h, /*9408i*/".wa"));
		l = zone(strcat(h, /*9408i*/".wa"));
		unzone(k);
		h = zone(strcat(h, j));
		unzone(l);
		write(file, /*10192i*/"exec ");
		write(file, h);
		write(file, /*2101i*/"\n");
		filecount = filecount + IT_SHOTGUN;
		close(file);
		file = open(h, IT_SUPER_SHOTGUN);
		unzone(h);
		if ((file == CONTENT_EMPTY))
		{
			remove(self);
			fixer = world;
			bprint("Error: failed to save file\n");
			return;
		}
		bytecounter = TE_SPIKE;
	}
	if ((t == world))
	{
		remove(self);
		fixer = world;
		write(file, /*10226i*/"saved4 3\n");
		close(file);
		bprint("waypoints saved.\n");
		bytecounter = bytecounter + SVC_KILLEDMONSTER;
		return;
	}
	t.origin_x = rint(t.origin_x);
	t.origin_y = rint(t.origin_y);
	t.origin_z = rint(t.origin_z);
	if (((t.origin_x != saved1) || (t.count == IT_SHOTGUN)))
	{
		write(file, /*9469i*/"saved1 ");
		h = ftos(t.origin_x);
		write(file, h);
		saved1 = t.origin_x;
		bytecounter = bytecounter + 12;
		needcolon = IT_SHOTGUN;
	}
	if (((t.origin_y != saved2) || (t.count == IT_SHOTGUN)))
	{
		if (needcolon)
		{
			write(file, /*9477i*/"; ");
			bytecounter = bytecounter + IT_SUPER_SHOTGUN;
		}
		else
		{
			needcolon = IT_SHOTGUN;
		}
		write(file, /*9480i*/"saved2 ");
		h = ftos(t.origin_y);
		write(file, h);
		bytecounter = bytecounter + 12;
		saved2 = t.origin_y;
	}
	if (((t.origin_z != saved3) || (t.count == IT_SHOTGUN)))
	{
		if (needcolon)
		{
			write(file, /*9477i*/"; ");
			bytecounter = bytecounter + IT_SUPER_SHOTGUN;
		}
		else
		{
			needcolon = IT_SHOTGUN;
		}
		write(file, /*9488i*/"saved3 ");
		h = ftos(t.origin_z);
		write(file, h);
		bytecounter = bytecounter + 12;
		saved3 = t.origin_z;
	}
	if (needcolon)
	{
		bytecounter = bytecounter + IT_SHOTGUN;
		write(file, /*2101i*/"\n");
		needcolon = TE_SPIKE;
	}
	if (((scratch1 != t.target1.count) || (t.count == IT_SHOTGUN)))
	{
		needcolon = IT_SHOTGUN;
		write(file, /*9496i*/"scratch1 ");
		bytecounter = bytecounter + SVC_UPDATEFRAGS;
		h = ftos(t.target1.count);
		write(file, h);
		scratch1 = t.target1.count;
	}
	if (((scratch2 != t.target2.count) || (t.count == IT_SHOTGUN)))
	{
		if (needcolon)
		{
			write(file, /*9477i*/"; ");
			bytecounter = bytecounter + IT_SUPER_SHOTGUN;
		}
		else
		{
			needcolon = IT_SHOTGUN;
		}
		write(file, /*9506i*/"scratch2 ");
		bytecounter = bytecounter + SVC_UPDATEFRAGS;
		h = ftos(t.target2.count);
		write(file, h);
		scratch2 = t.target2.count;
	}
	if (((scratch3 != t.target3.count) || (t.count == IT_SHOTGUN)))
	{
		if (needcolon)
		{
			write(file, /*9477i*/"; ");
			bytecounter = bytecounter + IT_SUPER_SHOTGUN;
		}
		else
		{
			needcolon = IT_SHOTGUN;
		}
		write(file, /*9516i*/"scratch3 ");
		bytecounter = bytecounter + SVC_UPDATEFRAGS;
		h = ftos(t.target3.count);
		write(file, h);
		scratch3 = t.target3.count;
	}
	if (((scratch4 != t.target4.count) || (t.count == IT_SHOTGUN)))
	{
		if (needcolon)
		{
			write(file, /*9477i*/"; ");
			bytecounter = bytecounter + IT_SUPER_SHOTGUN;
		}
		else
		{
			needcolon = IT_SHOTGUN;
		}
		write(file, /*9526i*/"scratch4 ");
		bytecounter = bytecounter + SVC_UPDATEFRAGS;
		h = ftos(t.target4.count);
		write(file, h);
		scratch4 = t.target4.count;
	}
	if (needcolon)
	{
		write(file, /*2101i*/"\n");
		needcolon = TE_SPIKE;
	}
	write(file, /*9536i*/"saved4 ");
	bytecounter = bytecounter + 19;
	if ((t.count != IT_SHOTGUN))
	{
		h = ftos(((t.b_aiflags * IT_NAILGUN) + IT_SUPER_SHOTGUN));
	}
	else
	{
		h = ftos(((t.b_aiflags * IT_NAILGUN) + IT_SHOTGUN));
	}
	write(file, h);
	write(file, /*9544i*/"; wait\n");
	self.nextthink = (time + 0.01);
	self.enemy = t;
};

void() SaveWays =
{
	local string h;
	local string f;

	bytecounter = 50;
	filecount = IT_SHOTGUN;
	h = strcat(/*10186i*/"maps/", mapname);
	h = zone(h);
	f = zone(h);
	h = strcat(h, /*10267i*/".way");
	unzone(f);
	file = open(h, IT_SUPER_SHOTGUN);
	if ((file == CONTENT_EMPTY))
	{
		bprint("Error: failed to open file\n");
		return;
	}
	if (!fixer)
	{
		fixer = spawn();
		fixer.nextthink = (time + 0.01);
		fixer.think = SaveWaypoint;
		fixer.enemy = world;
	}
};
