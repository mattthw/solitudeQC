//Decompiled code. Please respect the original copyright.

void(string targ, float mod) SuicideMessage =
{
#error Corrupt Function: SuicideMessage
#if 0
	local string s;
	local string t;
	local string u;

	s = "";
	t = "";
	u = "";
	do_tail
	{
		s = targ;
		t = " tries to put the pin back in";
	}
	else
	{
		do
		{
			s = targ;
			t = " discharges into the water.";
		}
		else
		{
			do
			{
				s = targ;
				t = " discharges into the slime";
			}
			else
			{
				do
				{
					s = targ;
					t = " discharges into the lava";
				}
				else
				{
					do
					{
						s = "Satan's power deflects ";
						t = targ;
						u = "'s telefrag";
					}
					else
					{
						do
						{
							s = targ;
							t = " electrocutes himself.";
						}
						else
						{
							do
							{
								s = targ;
								t = " blew himself up";
							}
							else
							{
								do
								{
									s = targ;
									t = " becomes bored with life";
								}
								else
								{

								} while ((mod == TE_LIGHTNING2));

							} while ((mod == TE_LAVASPLASH));

						} while ((mod == TE_TELEPORT));

					} while ((mod == 12));

				} while ((mod == SVC_UPDATEFRAGS));

			} while ((mod == 24));

		} while ((mod == 19));
	} while(1);
}
}
}
}
}
}
}
}
_bprint(s, t, u, /*2101i*/"\n");
#endif
};

void(string targ, string attacker, float mod) KillMessage =
{
#error Corrupt Function: KillMessage
#if 0
	local string s;
	local string t;
	local string u;
	local string v;
	local string w;

	s = "";
	t = "";
	u = "";
	v = "";
	w = "";
	do_tail
	{
		s = targ;
		t = " was ax-murdered by ";
		u = attacker;
	}
	else
	{
		do
		{
			s = targ;
			t = " chewed on ";
			u = attacker;
			v = "'s boomstick";
		}
		else
		{
			do
			{
				s = targ;
				t = " ate two loads of ";
				u = attacker;
				v = "'s buckshot";
			}
			else
			{
				do
				{
					s = targ;
					t = " was nailed by ";
					u = attacker;
				}
				else
				{
					do
					{
						s = targ;
						t = " was punctured by ";
						u = attacker;
					}
					else
					{
						do
						{
							s = targ;
							t = " eats ";
							u = attacker;
							v = "'s pineapple";
						}
						else
						{
							do
							{
								do
								{
									s = targ;
									t = " rides ";
									u = attacker;
									v = "'s rocket";
								}
								else
								{
									do
									{
										s = targ;
										t = " accepts ";
										u = attacker;
										v = "'s shaft";
									}
									else
									{
										do
										{
											do
											{
												do
												{
													s = targ;
													t = " accepts ";
													u = attacker;
													v = "'s discharge";
												}
												else
												{
													do
													{
														s = targ;
														t = " was telefragged by ";
														u = attacker;
													}
													else
													{
														do
														{
															s = targ;
															t = " was telefragged by ";
															u = attacker;
															v = "'s Satan's power";
														}
														else
														{
															do
															{
																s = attacker;
																t = " squishes ";
																u = targ;
															}
															else
															{
																do
																{
																	s = targ;
																	t = " was blown up by ";
																	u = attacker;
																}
																else
																{
																	do
																	{
																		s = targ;
																		t = " was killed by ";
																		u = attacker;
																	}
																	else
																	{

																	} while ((mod == IT_SHOTGUN));

																} while ((mod == IT_SUPER_SHOTGUN));

															} while ((mod == TE_EXPLOSION));

														} while ((mod == IT_NAILGUN));

													} while ((mod == TE_LIGHTNING1));

												} while ((mod == TE_LIGHTNING2));

											} while ((mod == TE_WIZSPIKE));

										} while ((mod == IT_SUPER_NAILGUN));

									} while ((mod == TE_LIGHTNING3));

								} while ((mod == TE_LAVASPLASH));

							} while ((mod == TE_TELEPORT));

						} while ((mod == 12));

					} while ((mod == 13));

				} while ((mod == SVC_UPDATEFRAGS));

			} while ((mod == 15));

		} while ((mod == 19));
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
_bprint(s, t, u, v, w, /*2101i*/"\n");
#endif
};

void(string targ, string attacker, float mod) TeamKillMessage =
{
#error Corrupt Function: TeamKillMessage
#if 0
	local string s;
	local string t;
	local string u;
	local string v;
	local string w;
	local float rnum;

	s = "";
	t = "";
	u = "";
	v = "";
	w = "";
	do_tail
	{
		s = attacker;
		t = " squishes teammate ";
		u = targ;
	}
	else
	{
		do
		{
			rnum = random();
			s = attacker;
			if ((rnum < 0.25))
			{
				t = " mows down teammate ";
			}
			else
			{
				if ((rnum < 0.5))
				{
					t = " checks his glasses and sees ";
					v = " dead";
				}
				else
				{
					if ((rnum < 0.75))
					{
						t = " frags ";
						v = " for the other team";
					}
					else
					{
						t = " loses his friend ";
					}
				}
			}
			u = targ;
		}
		else
		{

		} while ((mod == 15));
	} while(1);
}
}
_bprint(s, t, u, v, w, /*2101i*/"\n");
#endif
};

void(string targ, float mod) WorldKillMessage =
{
#error Corrupt Function: WorldKillMessage
#if 0
	local string s;
	local string t;
	local string u;

	s = "";
	t = "";
	u = "";
	do_tail
	{
		do
		{
			s = targ;
			t = " was spiked";
		}
		else
		{
			do
			{
				s = targ;
				t = "  was squished";
			}
			else
			{
				do
				{
					s = targ;
					if ((random() < 0.5))
					{
						t = " sleeps with the fishes";
					}
					else
					{
						t = " sucks it down";
					}
				}
				else
				{
					do
					{
						s = targ;
						if ((random() < 0.5))
						{
							t = " gulped a load of slime";
						}
						else
						{
							t = " can't exist on slime alone";
						}
					}
					else
					{
						do
						{
							s = targ;
							if ((random() < 0.5))
							{
								t = " turned into hot slag";
							}
							else
							{
								t = " visits the Volcano God";
							}
						}
						else
						{
							do
							{
								s = targ;
								t = " blew up";
							}
							else
							{
								do
								{
									s = targ;
									t = " fell to his death";
								}
								else
								{
									do
									{
										s = targ;
										t = " ate a lavaball";
									}
									else
									{
										do
										{
											s = targ;
											t = " tried to leave";
										}
										else
										{
											do
											{
												s = targ;
												t = " was zapped";
											}
											else
											{
												do
												{
													s = targ;
													t = " was mauled by a Rottweiler";
												}
												else
												{
													do
													{
														s = targ;
														t = " was shot by a Grunt";
													}
													else
													{
														do
														{
															s = targ;
															t = " was blasted by an Enforcer";
														}
														else
														{
															do
															{
																s = targ;
																t = " was destroyed by an Ogre";
															}
															else
															{
																do
																{
																	s = targ;
																	t = " was scragged by a Scrag";
																}
																else
																{
																	do
																	{
																		s = targ;
																		t = " was eviscerated by a Fiend";
																	}
																	else
																	{
																		do
																		{
																			s = targ;
																			t = " was slashed by a Knight";
																		}
																		else
																		{
																			do
																			{
																				s = targ;
																				t = " was slain by a Death Knight";
																			}
																			else
																			{
																				do
																				{
																					s = targ;
																					t = "  was exploded by a Vore";
																				}
																				else
																				{
																					do
																					{
																						s = targ;
																						t = " was smashed by a Shambler";
																					}
																					else
																					{
																						do
																						{
																							s = targ;
																							t = " was fed to the Rotfish";
																						}
																						else
																						{
																							do
																							{
																								s = targ;
																								t = " was slimed by a Spawn";
																							}
																							else
																							{
																								do
																								{
																									s = targ;
																									t = " joins the Zombies";
																								}
																								else
																								{
																									do
																									{
																										s = targ;
																										t = " fell to Chthon's wrath";
																									}
																									else
																									{
																										do
																										{
																											s = targ;
																											t = " died";
																										}
																										else
																										{

																										} while ((mod == IT_NAILGUN));

																									} while ((mod == TE_LIGHTNING1));

																								} while ((mod == 15));

																							} while ((mod == IT_GRENADE_LAUNCHER));

																						} while ((mod == SVC_UPDATECOLORS));

																					} while ((mod == 18));

																				} while ((mod == 19));

																			} while ((mod == 20));

																		} while ((mod == 21));

																	} while ((mod == 22));

																} while ((mod == SVC_TEMPENTITY));

															} while ((mod == 26));

														} while ((mod == SVC_KILLEDMONSTER));

													} while ((mod == SVC_FOUNDSECRET));

												} while ((mod == 29));

											} while ((mod == SVC_INTERMISSION));

										} while ((mod == SVC_FINALE));

									} while ((mod == IT_ROCKET_LAUNCHER));

								} while ((mod == SVC_SELLSCREEN));

							} while ((mod == 34));

						} while ((mod == 35));

					} while ((mod == 36));

				} while ((mod == 37));

			} while ((mod == 38));

		} while ((mod == 39));
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
_bprint(s, t, u, /*2101i*/"\n");
#endif
};
