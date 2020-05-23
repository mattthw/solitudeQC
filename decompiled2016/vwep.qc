//Decompiled code. Please respect the original copyright.
float modelindex_playernail;
float modelindex_playersnail;
float modelindex_playershot;
float modelindex_playersshot;
float modelindex_playerneedler;
float modelindex_playerrocket;
float modelindex_playersniper;
float modelindex_playerplasma;
float modelindex_playerbr;
float modelindex_dead;

void() CheckModel =
{
	if ((self.health <= TE_SPIKE))
	{
		self.modelindex = modelindex_dead;
	}
	if ((self.weapon == IT_SHOTGUN))
	{
		self.modelindex = modelindex_playershot;
	}
	else
	{
		if ((self.weapon == IT_NAILGUN))
		{
			self.modelindex = modelindex_playernail;
		}
		else
		{
			if ((self.weapon == IT_SUPER_NAILGUN))
			{
				self.modelindex = modelindex_playersnail;
			}
			else
			{
				if ((self.weapon == IT_SUPER_SHOTGUN))
				{
					self.modelindex = modelindex_playersshot;
				}
				else
				{
					if ((self.weapon == IT_EXTRA_WEAPON))
					{
						self.modelindex = modelindex_playerneedler;
					}
					else
					{
						if ((self.weapon == IT_GRENADE_LAUNCHER))
						{
							self.modelindex = modelindex_playersniper;
						}
						else
						{
							if ((self.weapon == IT_ROCKET_LAUNCHER))
							{
								self.modelindex = modelindex_playerrocket;
							}
							else
							{
								if ((self.weapon == IT_LIGHTNING))
								{
									self.modelindex = modelindex_playerplasma;
								}
								else
								{
									if ((self.weapon == IT_BR))
									{
										self.modelindex = modelindex_playerbr;
									}
								}
							}
						}
					}
				}
			}
		}
	}
};
