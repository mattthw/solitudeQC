//Decompiled code. Please respect the original copyright.
float(float v) anglemod;
void() ai_face;

float(float enemy_range) CheckAttack =
{
	local vector spot1;
	local vector spot2;
	local entity targ;
	local float chance;

	targ = self.enemy;
	spot1 = self.origin + self.view_ofs;
	spot2 = targ.origin + targ.view_ofs;
	traceline(spot1, spot2, TE_SPIKE, self);
	if ((trace_ent != targ))
	{
		return (TE_SPIKE);
	}
	if ((trace_inopen && trace_inwater))
	{
		return (TE_SPIKE);
	}
	if ((enemy_range == TE_SPIKE))
	{
		if (self.th_melee)
		{
			self.th_melee();
			return (IT_SHOTGUN);
		}
	}
	if (!self.th_missile)
	{
		return (TE_SPIKE);
	}
	if ((time < self.attack_finished))
	{
		return (TE_SPIKE);
	}
	if ((enemy_range == TE_EXPLOSION))
	{
		return (TE_SPIKE);
	}
	if ((enemy_range == TE_SPIKE))
	{
		chance = 0.9;
		self.attack_finished = TE_SPIKE;
	}
	else
	{
		if ((enemy_range == IT_SHOTGUN))
		{
			if (self.th_melee)
			{
				chance = 0.2;
			}
			else
			{
				chance = 0.4;
			}
		}
		else
		{
			if ((enemy_range == IT_SUPER_SHOTGUN))
			{
				if (self.th_melee)
				{
					chance = 0.05;
				}
				else
				{
					chance = 0.1;
				}
			}
			else
			{
				chance = TE_SPIKE;
			}
		}
	}
	if ((random() < chance))
	{
		self.th_missile();
		SUB_AttackFinished((IT_SUPER_SHOTGUN * random()));
		return (IT_SHOTGUN);
	}
	return (TE_SPIKE);
};

void() ai_face =
{

	self.ideal_yaw = vectoyaw((self.enemy.origin - self.origin));
	ChangeYaw();
};
float(entity targ) infront;
float(entity targ) range;

void(float d) ai_charge =
{
	ai_face();
	movetogoal(d);
};

void() ai_charge_side =
{
	local vector dtemp;
	local float heading;

	self.ideal_yaw = vectoyaw((self.enemy.origin - self.origin));
	ChangeYaw();
	makevectors(self.angles);
	dtemp = self.enemy.origin - (SVC_INTERMISSION * v_right);
	heading = vectoyaw((dtemp - self.origin));
	walkmove(heading, 20);
};

void(float mod) ai_melee =
{
	local vector delta;
	local float ldmg;

	if (!self.enemy)
	{
		return;
	}
	delta = self.enemy.origin - self.origin;
	if ((vlen(delta) > 60))
	{
		return;
	}
	if ((self.elite == TE_SPIKE))
	{
		ldmg = ((random() + random()) + random()) * TE_LAVASPLASH;
	}
	else
	{
		if ((self.elite == IT_SHOTGUN))
		{
			ldmg = ((random() + random()) + random()) * 20;
		}
		else
		{
			if ((self.elite == IT_SUPER_SHOTGUN))
			{
				ldmg = ((random() + random()) + random()) * SVC_INTERMISSION;
			}
			else
			{
				ldmg = ((random() + random()) + random()) * TE_EXPLOSION;
			}
		}
	}
	T_Damage(self.enemy, self, self, ldmg, mod);
};

void(float mod) ai_melee_side =
{
	local vector delta;
	local float ldmg;

	if (!self.enemy)
	{
		return;
	}
	ai_charge_side();
	delta = self.enemy.origin - self.origin;
	if ((vlen(delta) > 60))
	{
		return;
	}
	if (!CanDamage(self.enemy, self))
	{
		return;
	}
	ldmg = ((random() + random()) + random()) * TE_EXPLOSION;
	T_Damage(self.enemy, self, self, ldmg, mod);
};

float(float enemy_range) SoldierCheckAttack =
{
	local vector spot1;
	local vector spot2;
	local entity targ;
	local float chance;

	targ = self.enemy;
	spot1 = self.origin + self.view_ofs;
	spot2 = targ.origin + targ.view_ofs;
	traceline(spot1, spot2, TE_SPIKE, self);
	if ((trace_inopen && trace_inwater))
	{
		return (TE_SPIKE);
	}
	if ((trace_ent != targ))
	{
		return (TE_SPIKE);
	}
	if ((time < self.attack_finished))
	{
		return (TE_SPIKE);
	}
	if ((enemy_range == TE_EXPLOSION))
	{
		return (TE_SPIKE);
	}
	if ((enemy_range == TE_SPIKE))
	{
		chance = 0.9;
	}
	else
	{
		if ((enemy_range == IT_SHOTGUN))
		{
			chance = 0.4;
		}
		else
		{
			if ((enemy_range == IT_SUPER_SHOTGUN))
			{
				chance = 0.05;
			}
			else
			{
				chance = TE_SPIKE;
			}
		}
	}
	if ((random() < chance))
	{
		self.th_missile();
		SUB_AttackFinished((IT_SHOTGUN + random()));
		return (IT_SHOTGUN);
	}
	return (TE_SPIKE);
};

float(float enemy_range) ShamCheckAttack =
{
	local vector spot1;
	local vector spot2;
	local entity targ;

	if ((enemy_range == TE_SPIKE))
	{
		if (CanDamage(self.enemy, self))
		{
			self.attack_state = TE_EXPLOSION;
			return (IT_SHOTGUN);
		}
	}
	if ((time < self.attack_finished))
	{
		return (TE_SPIKE);
	}
	targ = self.enemy;
	spot1 = self.origin + self.view_ofs;
	spot2 = targ.origin + targ.view_ofs;
	if ((vlen((spot1 - spot2)) > 600))
	{
		return (TE_SPIKE);
	}
	traceline(spot1, spot2, TE_SPIKE, self);
	if ((trace_inopen && trace_inwater))
	{
		return (TE_SPIKE);
	}
	if ((trace_ent != targ))
	{
		return (TE_SPIKE);
	}
	if ((enemy_range == TE_EXPLOSION))
	{
		return (TE_SPIKE);
	}
	self.attack_state = IT_NAILGUN;
	SUB_AttackFinished((IT_SUPER_SHOTGUN + (IT_SUPER_SHOTGUN * random())));
	return (IT_SHOTGUN);
};

float(float enemy_range) OgreCheckAttack =
{
	local vector spot1;
	local vector spot2;
	local entity targ;
	local float chance;

	if ((enemy_range == TE_SPIKE))
	{
		if (CanDamage(self.enemy, self))
		{
			self.attack_state = TE_EXPLOSION;
			return (IT_SHOTGUN);
		}
	}
	if ((time < self.attack_finished))
	{
		return (TE_SPIKE);
	}
	targ = self.enemy;
	spot1 = self.origin + self.view_ofs;
	spot2 = targ.origin + targ.view_ofs;
	traceline(spot1, spot2, TE_SPIKE, self);
	if ((trace_inopen && trace_inwater))
	{
		return (TE_SPIKE);
	}
	if ((trace_ent != targ))
	{
		return (TE_SPIKE);
	}
	if ((time < self.attack_finished))
	{
		return (TE_SPIKE);
	}
	if ((enemy_range == TE_EXPLOSION))
	{
		return (TE_SPIKE);
	}
	else
	{
		if ((enemy_range == IT_SHOTGUN))
		{
			chance = 0.1;
		}
		else
		{
			if ((enemy_range == IT_SUPER_SHOTGUN))
			{
				chance = 0.05;
			}
			else
			{
				chance = TE_SPIKE;
			}
		}
	}
	self.attack_state = IT_NAILGUN;
	SUB_AttackFinished((IT_SHOTGUN + (IT_SUPER_SHOTGUN * random())));
	return (IT_SHOTGUN);
};
