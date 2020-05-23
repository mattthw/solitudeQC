//Decompiled code. Please respect the original copyright.
void() button_return;

void() button_wait =
{
	self.state = TE_SPIKE;
	self.nextthink = (self.ltime + self.wait);
	self.think = button_return;
	activator = self.enemy;
	SUB_UseTargets();
	self.frame = IT_SHOTGUN;
};

void() button_done =
{
	self.state = IT_SHOTGUN;
};

void() button_return =
{
	self.state = TE_EXPLOSION;
	SUB_CalcMove(self.pos1, self.speed, button_done);
	self.frame = TE_SPIKE;
	if (self.health)
	{
		self.takedamage = IT_SHOTGUN;
	}
};

void() button_blocked =
{
};

void() button_fire =
{
	if (((self.state == IT_SUPER_SHOTGUN) || (self.state == TE_SPIKE)))
	{
		return;
	}
	sound(self, IT_SUPER_SHOTGUN, self.noise, IT_SHOTGUN, IT_SHOTGUN);
	self.state = IT_SUPER_SHOTGUN;
	SUB_CalcMove(self.pos2, self.speed, button_wait);
};

void() button_use =
{
	self.enemy = activator;
	button_fire();
};

void() button_touch =
{
	if ((other.classname != "player"))
	{
		return;
	}
	self.enemy = other;
	button_fire();
};

void() button_killed =
{
	self.enemy = damage_attacker;
	self.health = self.max_health;
	self.takedamage = TE_SPIKE;
	button_fire();
};

void() func_button =
{
#error Corrupt Function: func_button
#if 0

}
else
{
	precache_sound(/*27025i*/"buttons/airbut1.wav");
	self.noise = "buttons/airbut1.wav";
}
else
{
	do
	{
		precache_sound(/*27045i*/"buttons/switch21.wav");
		self.noise = "buttons/switch21.wav";
	}
	else
	{
		do
		{
			precache_sound(/*27066i*/"buttons/switch02.wav");
			self.noise = "buttons/switch02.wav";
		}
		else
		{
			do
			{
				precache_sound(/*27087i*/"buttons/switch04.wav");
				self.noise = "buttons/switch04.wav";
			}
			else
			{
			}

		} while ((self.sounds == IT_SHOTGUN));

	} while ((self.sounds == IT_SUPER_SHOTGUN));

} while ((self.sounds == TE_EXPLOSION));
}
}
}
}
SetMovedir();
self.movetype = TE_WIZSPIKE;
self.solid = IT_NAILGUN;
setmodel(self, self.model);
self.blocked = button_blocked;
self.use = button_use;
if (self.health)
{
self.max_health = self.health;
self.th_die = button_killed;
self.takedamage = IT_SHOTGUN;
}
else
{
self.touch = button_touch;
}
if (!self.speed)
{
self.speed = 40;
}
if (!self.wait)
{
self.wait = IT_SHOTGUN;
}
if (!self.lip)
{
self.lip = IT_NAILGUN;
}
self.state = IT_SHOTGUN;
self.pos1 = self.origin;
self.pos2 = (self.pos1 + (self.movedir * (fabs((self.movedir * self.size)) - self.lip)));
#endif
};
