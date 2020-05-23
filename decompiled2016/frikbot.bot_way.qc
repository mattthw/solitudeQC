//Decompiled code. Please respect the original copyright.

float(entity e1, entity e2) CheckLinked =
{
	if ((((e1 == e2) || (e2 == world)) || (e1 == world)))
	{
		return (TE_SPIKE);
	}
	else
	{
		if ((e1.target1 == e2))
		{
			if ((e1.b_aiflags & IT_SHOTGUN))
			{
				return (IT_SUPER_SHOTGUN);
			}
			else
			{
				return (IT_SHOTGUN);
			}
		}
		else
		{
			if ((e1.target2 == e2))
			{
				if ((e1.b_aiflags & IT_SUPER_SHOTGUN))
				{
					return (IT_SUPER_SHOTGUN);
				}
				else
				{
					return (IT_SHOTGUN);
				}
			}
			else
			{
				if ((e1.target3 == e2))
				{
					if ((e1.b_aiflags & IT_NAILGUN))
					{
						return (IT_SUPER_SHOTGUN);
					}
					else
					{
						return (IT_SHOTGUN);
					}
				}
				else
				{
					if ((e1.target4 == e2))
					{
						if ((e1.b_aiflags & IT_SUPER_NAILGUN))
						{
							return (IT_SUPER_SHOTGUN);
						}
						else
						{
							return (IT_SHOTGUN);
						}
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

float(entity e1, entity e2) LinkWays =
{
	if ((((e1 == e2) || (e2 == world)) || (e1 == world)))
	{
		return (TE_SPIKE);
	}
	else
	{
		if (CheckLinked(e1, e2))
		{
			return (TE_SPIKE);
		}
	}
	if ((e1.target1 == world))
	{
		e1.target1 = e2;
		return (IT_SHOTGUN);
	}
	else
	{
		if ((e1.target2 == world))
		{
			e1.target2 = e2;
			return (IT_SHOTGUN);
		}
		else
		{
			if ((e1.target3 == world))
			{
				e1.target3 = e2;
				return (IT_SHOTGUN);
			}
			else
			{
				if ((e1.target4 == world))
				{
					e1.target4 = e2;
					return (IT_SHOTGUN);
				}
				else
				{
					return (TE_SPIKE);
				}
			}
		}
	}
};

float(entity e1, entity e2) TeleLinkWays =
{
	if ((((e1 == e2) || (e2 == world)) || (e1 == world)))
	{
		return (TE_SPIKE);
	}
	else
	{
		if (CheckLinked(e1, e2))
		{
			return (TE_SPIKE);
		}
	}
	if ((e1.target1 == world))
	{
		e1.target1 = e2;
		e1.b_aiflags = (e1.b_aiflags | IT_SHOTGUN);
		return (IT_SHOTGUN);
	}
	else
	{
		if ((e1.target2 == world))
		{
			e1.target2 = e2;
			e1.b_aiflags = (e1.b_aiflags | IT_SUPER_SHOTGUN);
			return (IT_SHOTGUN);
		}
		else
		{
			if ((e1.target3 == world))
			{
				e1.target3 = e2;
				e1.b_aiflags = (e1.b_aiflags | IT_NAILGUN);
				return (IT_SHOTGUN);
			}
			else
			{
				if ((e1.target4 == world))
				{
					e1.target4 = e2;
					e1.b_aiflags = (e1.b_aiflags | IT_SUPER_NAILGUN);
					return (IT_SHOTGUN);
				}
				else
				{
					return (TE_SPIKE);
				}
			}
		}
	}
};

void(entity e1, entity e2) UnlinkWays =
{
	if ((((e1 == e2) || (e2 == world)) || (e1 == world)))
	{
		return;
	}
	else
	{
		if (!CheckLinked(e1, e2))
		{
			return;
		}
	}
	if ((e1.target1 == e2))
	{
		e1.b_aiflags = (e1.b_aiflags - (e1.b_aiflags & IT_SHOTGUN));
		e1.target1 = world;
	}
	if ((e1.target2 == e2))
	{
		e1.b_aiflags = (e1.b_aiflags - (e1.b_aiflags & IT_SUPER_SHOTGUN));
		e1.target2 = world;
	}
	if ((e1.target3 == e2))
	{
		e1.b_aiflags = (e1.b_aiflags - (e1.b_aiflags & IT_NAILGUN));
		e1.target3 = world;
	}
	if ((e1.target4 == e2))
	{
		e1.b_aiflags = (e1.b_aiflags - (e1.b_aiflags & IT_SUPER_NAILGUN));
		e1.target4 = world;
	}
};

entity(entity start) FindWayPoint =
{
	local entity t;
	local vector org;
	local float dst;
	local float tdst;
	local entity best;

	org = realorigin(self);
	t = way_head;
	if ((start != world))
	{
		dst = vlen((start.origin - org));
		best = start;
	}
	else
	{
		dst = 100000;
		best = world;
	}
	while (t)
	{
		if ((dst < 20))
		{
			return (best);
		}
		if ((!(t.b_aiflags & AI_IGNORE_TYPES) || self.ishuman))
		{
			tdst = vlen((t.origin - org));
			if ((tdst < dst))
			{
				if (sisible(t))
				{
					dst = tdst;
					best = t;
				}
			}
		}
		t = t._next;
	}
	return (best);
};
entity way_foot;

entity(vector org) make_waypoint =
{
	local entity point;

	point = spawn();
	point.classname = "waypoint";
	point.solid = IT_SHOTGUN;
	point.movetype = TE_SPIKE;
	point.items = CONTENT_EMPTY;
	setorigin(point, org);
	setsize(point, VEC_HULL_MIN, VEC_HULL_MAX);
	waypoints = waypoints + IT_SHOTGUN;
	if (!way_head)
	{
		way_head = point;
		way_foot = point;
	}
	else
	{
		way_foot._next = point;
		point._last = way_foot;
		way_foot = point;
	}
	point.count = waypoints;
	if ((waypoint_mode > TE_EXPLOSION))
	{
		setmodel(point, /*2255i*/"progs/s_bubble.spr");
	}
	return (point);
};

void() DynamicWaypoint =
{
	local entity t;
	local float dist;
	local float dynlink;
	local float dynpoint;
	local float editor;

	if ((self.teleport_time > self.portal_time))
	{
		if (!(self.flags & IT_CELLS))
		{
			self.dyn_flags = IT_SUPER_SHOTGUN;
			if (!self.ishuman)
			{
				bot_lost(self.target1, IT_SHOTGUN);
				self.enemy = world;
			}
		}
		self.portal_time = self.teleport_time;
	}
	if ((waypoint_mode > TE_EXPLOSION))
	{
		if (self.ishuman)
		{
			if ((waypoint_mode == TE_LIGHTNING2))
			{
				dynlink = IT_SHOTGUN;
			}
			else
			{
				if ((waypoint_mode == TE_LIGHTNING1))
				{
					dynpoint = IT_SHOTGUN;
					dynlink = IT_SHOTGUN;
				}
			}
			editor = IT_SHOTGUN;
		}
	}
	else
	{
		if ((waypoint_mode == IT_SHOTGUN))
		{
			dynpoint = IT_SHOTGUN;
			dynlink = IT_SHOTGUN;
		}
	}
	if (!dynpoint)
	{
		if (!editor)
		{
			return;
		}
	}
	if (!self.ishuman)
	{
		if (coop)
		{
			return;
		}
	}
	if ((max_clients < IT_SUPER_SHOTGUN))
	{
		return;
	}
	else
	{
		if ((self.health <= TE_SPIKE))
		{
			if (dynpoint)
			{
				if (self.current_way)
				{
					if ((pointcontents(self.origin) < CONTENT_SLIME))
					{
						if ((self.current_way.b_aiflags & IT_EXTRA_WEAPON))
						{
							self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_ROCKET_LAUNCHER);
						}
						else
						{
							self.current_way.b_aiflags = (self.current_way.b_aiflags | IT_EXTRA_WEAPON);
						}
					}
				}
			}
			self.dyn_dest = VEC_ORIGIN;
			self.current_way = world;
			self.dyn_flags = TE_SPIKE;
			return;
		}
	}
	if (dynpoint)
	{
		if (!((self.flags & IT_NAILS) || (self.waterlevel == TE_EXPLOSION)))
		{
			if ((self.dyn_flags != IT_SUPER_SHOTGUN))
			{
				self.dyn_flags = IT_SHOTGUN;
			}
			return;
		}
	}
	if ((self.dyn_time > time))
	{
		return;
	}
	self.dyn_time = (time + 0.2);
	if (editor)
	{
		if (self.current_way)
		{
			if (self.current_way.target1)
			{
				DeveloperLightning(self.current_way, self.current_way.target1, (self.current_way.b_aiflags & IT_SHOTGUN));
			}
			if (self.current_way.target2)
			{
				DeveloperLightning(self.current_way, self.current_way.target2, (self.current_way.b_aiflags & IT_SUPER_SHOTGUN));
			}
			if (self.current_way.target3)
			{
				DeveloperLightning(self.current_way, self.current_way.target3, (self.current_way.b_aiflags & IT_NAILGUN));
			}
			if (self.current_way.target4)
			{
				DeveloperLightning(self.current_way, self.current_way.target4, (self.current_way.b_aiflags & IT_SUPER_NAILGUN));
			}
		}
		if ((self.b_aiflags & IT_SUPER_SHOTGUN))
		{
			return;
		}
	}
	t = FindWayPoint(self.current_way);
	if (t)
	{
		dist = vlen((self.origin - t.origin));
		if ((dist < 192))
		{
			if ((dist < IT_LIGHTNING))
			{
				if ((t != self.current_way))
				{
					if (dynlink)
					{
						if (!self.dyn_flags)
						{
							if (wisible(t, self.current_way))
							{
								LinkWays(t, self.current_way);
							}
						}
						if ((self.dyn_flags == IT_SUPER_SHOTGUN))
						{
							TeleLinkWays(self.current_way, t);
						}
						else
						{
							if (wisible(t, self.current_way))
							{
								LinkWays(self.current_way, t);
							}
						}
					}
					if (editor)
					{
						setmodel(t, /*2237i*/"progs/s_light.spr");
						if (self.current_way)
						{
							setmodel(self.current_way, /*2255i*/"progs/s_bubble.spr");
						}
					}
				}
				self.current_way = t;
				self.dyn_flags = TE_SPIKE;
			}
			self.dyn_dest = (self.origin + self.view_ofs);
			return;
		}
	}
	if (frik_recognize_plat(TE_SPIKE))
	{
		if ((vlen(trace_ent.velocity) > TE_SPIKE))
		{
			if (self.dyn_plat)
			{
				return;
			}
			self.dyn_plat = IT_SHOTGUN;
			if (!self.dyn_flags)
			{
				self.dyn_flags = IT_SHOTGUN;
			}
		}
		else
		{
			self.dyn_plat = TE_SPIKE;
		}
	}
	else
	{
		self.dyn_plat = TE_SPIKE;
	}
	if ((self.dyn_flags == IT_SUPER_SHOTGUN))
	{
		self.dyn_dest = (self.origin + self.view_ofs);
	}
	else
	{
		if ((self.dyn_dest == VEC_ORIGIN))
		{
			self.dyn_dest = (self.origin + self.view_ofs);
		}
	}
	if (!dynpoint)
	{
		return;
	}
	t = make_waypoint(self.dyn_dest);
	if (!self.dyn_flags)
	{
		if (wisible(t, self.current_way))
		{
			LinkWays(t, self.current_way);
		}
	}
	if ((self.dyn_flags == IT_SUPER_SHOTGUN))
	{
		TeleLinkWays(self.current_way, t);
	}
	else
	{
		if (wisible(t, self.current_way))
		{
			LinkWays(self.current_way, t);
		}
	}
	if (editor)
	{
		setmodel(t, /*2237i*/"progs/s_light.spr");
		if (self.current_way)
		{
			setmodel(self.current_way, /*2255i*/"progs/s_bubble.spr");
		}
	}
	self.current_way = t;
	self.dyn_flags = TE_SPIKE;
	self.dyn_dest = (self.origin + self.view_ofs);
	if (frik_recognize_plat(TE_SPIKE))
	{
		if ((trace_ent.classname == "door"))
		{
			t.b_aiflags = (t.b_aiflags | IT_GRENADE_LAUNCHER);
		}
	}
};

void() ClearAllWays =
{
	local entity t;
	local entity n;

	t = way_head;
	while (t)
	{
		n = t._next;
		remove(t);
		t = n;
	}
	way_head = world;
	way_foot = world;
	waypoints = TE_SPIKE;
};

entity(float num) WaypointForNum =
{
	local entity t;

	if (!num)
	{
		return (world);
	}
	t = way_head;
	while (t)
	{
		if ((t.count == num))
		{
			return (t);
		}
		t = t._next;
	}
	return (world);
};

void() FixThisWaypoint =
{

	self.enemy.target1 = WaypointForNum(self.enemy.b_pants);
	self.enemy.target2 = WaypointForNum(self.enemy.b_skill);
	self.enemy.target3 = WaypointForNum(self.enemy.b_shirt);
	self.enemy.target4 = WaypointForNum(self.enemy.b_frags);
	self.enemy = self.enemy._next;
	self.nextthink = time;
	if ((self.enemy == world))
	{
		remove(self);
		fixer = world;
	}
};

void() FixWaypoints =
{
	if (!fixer)
	{
		fixer = spawn();
	}
	fixer.nextthink = time;
	fixer.think = FixThisWaypoint;
	fixer.enemy = way_head;
};

void(entity what) delete_waypoint =
{
	local entity t;

	if ((way_head == what))
	{
		way_head = what._next;
	}
	if ((way_foot == what))
	{
		way_foot = what._last;
	}
	if (what._last)
	{
		what._last._next = what._next;
	}
	if (what._next)
	{
		what._next._last = what._last;
	}
	waypoints = TE_SPIKE;
	t = way_head;
	while (t)
	{
		waypoints = waypoints + IT_SHOTGUN;
		t.count = waypoints;
		if (CheckLinked(t, what))
		{
			UnlinkWays(t, what);
		}
		t = t._next;
	}
	if ((self.current_way == what))
	{
		self.current_way = world;
	}
	remove(what);
};

entity(string s) FindThing =
{
	local entity t;
	local float tdst;
	local float dst;
	local entity best;

	dst = 100000;
	best = world;
	t = find(world, classname, s);
	while ((t != world))
	{
		tdst = vlen((((t.absmin + t.absmax) * 0.5) - self.origin));
		if ((tdst < dst))
		{
			dst = tdst;
			best = t;
		}
		t = find(t, classname, s);
	}
	return (best);
};

entity(entity lastone) FindRoute =
{
	local entity t;
	local entity best;
	local float dst;
	local float tdst;
	local float flag;

	flag = ClientBitFlag(self.b_clientno);
	if (lastone)
	{
		if ((lastone.target1.b_sound & flag))
		{
			return (lastone.target1);
		}
		else
		{
			if ((lastone.target2.b_sound & flag))
			{
				return (lastone.target2);
			}
			else
			{
				if ((lastone.target3.b_sound & flag))
				{
					return (lastone.target3);
				}
				else
				{
					if ((lastone.target4.b_sound & flag))
					{
						return (lastone.target4);
					}
				}
			}
		}
	}
	t = way_head;
	dst = 100000;
	best = world;
	while (t)
	{
		tdst = vlen((t.origin - self.origin));
		if (((tdst < dst) && (t.b_sound & flag)))
		{
			dst = tdst;
			best = t;
		}
		t = t._next;
	}
	return (best);
};

void() ClearRouteTable =
{
	local entity t;

	t = way_head;
	while (t)
	{
		t.keys = TE_SPIKE;
		t.enemy = world;
		t.items = CONTENT_EMPTY;
		t = t._next;
	}
};

void() ClearMyRoute =
{
	local float flag;
	local entity t;

	flag = ClientBitFlag(self.b_clientno);
	t = way_head;
	while (t)
	{
		t.b_sound = (t.b_sound - (t.b_sound & flag));
		t = t._next;
	}
};

void(entity this) mark_path =
{
	local entity t;
	local entity oself;
	local float flag;

	ClearMyRoute();
	oself = self;
	self = this;
	t = FindWayPoint(this.current_way);
	self = oself;
	if ((this.classname != "player"))
	{
		this.current_way = t;
	}
	if ((t.enemy == world))
	{
		bot_lost(this, TE_SPIKE);
		self.route_failed = IT_SHOTGUN;
		return;
	}
	flag = ClientBitFlag(self.b_clientno);
	while (t)
	{
		if ((t.b_sound & flag))
		{
			return;
		}
		if ((t == self.last_way))
		{
			return;
		}
		t.b_sound = (t.b_sound | flag);
		t = t.enemy;
	}
};

void(entity e2, float b_bit) FollowLink =
{
	local float dist;

	if ((self.b_aiflags & b_bit))
	{
		dist = self.items;
	}
	else
	{
		dist = vlen((self.origin - e2.origin)) + self.items;
	}
	if ((e2.b_aiflags & IT_AXE))
	{
		if (!bot_can_rj(route_table))
		{
			return;
		}
	}
	if ((e2.b_aiflags & 65536))
	{
		dist = dist + 1000;
	}
	if (((dist < e2.items) || (e2.items == CONTENT_EMPTY)))
	{
		if (!e2.keys)
		{
			busy_waypoints = busy_waypoints + IT_SHOTGUN;
		}
		e2.keys = IT_SHOTGUN;
		e2.items = dist;
		e2.think = WaypointThink;
		e2.nextthink = time;
		e2.enemy = self;
	}
};

void() WaypointThink =
{
	local entity oself;

	if ((self.items == CONTENT_EMPTY))
	{
		return;
	}
	if ((self.b_aiflags & IT_KEY1))
	{
		if (self.target1)
		{
			traceline(self.origin, self.target1.origin, IT_SHOTGUN, self);
			if ((trace_fraction == IT_SHOTGUN))
			{
				FollowLink(self.target1, IT_SHOTGUN);
			}
		}
		if (self.target2)
		{
			traceline(self.origin, self.target2.origin, IT_SHOTGUN, self);
			if ((trace_fraction == IT_SHOTGUN))
			{
				FollowLink(self.target2, IT_SUPER_SHOTGUN);
			}
		}
		if (self.target3)
		{
			traceline(self.origin, self.target3.origin, IT_SHOTGUN, self);
			if ((trace_fraction == IT_SHOTGUN))
			{
				FollowLink(self.target3, IT_NAILGUN);
			}
		}
		if (self.target4)
		{
			traceline(self.origin, self.target4.origin, IT_SHOTGUN, self);
			if ((trace_fraction == IT_SHOTGUN))
			{
				FollowLink(self.target4, IT_SUPER_NAILGUN);
			}
		}
	}
	else
	{
		if (self.target1)
		{
			FollowLink(self.target1, IT_SHOTGUN);
		}
		if (self.target2)
		{
			FollowLink(self.target2, IT_SUPER_SHOTGUN);
		}
		if (self.target3)
		{
			FollowLink(self.target3, IT_NAILGUN);
		}
		if (self.target4)
		{
			FollowLink(self.target4, IT_SUPER_NAILGUN);
		}
	}
	busy_waypoints = busy_waypoints - IT_SHOTGUN;
	self.keys = TE_SPIKE;
	if ((busy_waypoints <= TE_SPIKE))
	{
		if (direct_route)
		{
			oself = self;
			self = route_table;
			bot_get_path(self.target1, TE_SPIKE);
			self = oself;
			direct_route = TE_SPIKE;
		}
	}
};

float() begin_route =
{

	if ((busy_waypoints > TE_SPIKE))
	{
		return (TE_SPIKE);
	}
	if ((route_table != world))
	{
		if (!route_table.ishuman)
		{
			if ((route_table.b_clientno != CONTENT_EMPTY))
			{
				return (TE_SPIKE);
			}
		}
	}
	route_table = self;
	ClearRouteTable();
	self.last_way = FindWayPoint(self.current_way);
	if ((self.last_way != world))
	{
		self.last_way.items = vlen((self.last_way.origin - self.origin));
		self.last_way.nextthink = time;
		self.last_way.think = WaypointThink;
		self.last_way.keys = IT_SHOTGUN;
		busy_waypoints = IT_SHOTGUN;
		return (IT_SHOTGUN);
	}
	else
	{
		route_table = world;
		busy_waypoints = TE_SPIKE;
		return (TE_SPIKE);
	}
};

void(entity this, float direct) bot_get_path =
{
	if ((this == world))
	{
		return;
	}
	if ((route_table == self))
	{
		if ((busy_waypoints <= TE_SPIKE))
		{
			route_table = world;
			mark_path(this);
		}
		return;
	}
	if (direct)
	{
		if (begin_route())
		{
			direct_route = IT_SHOTGUN;
		}
		else
		{
			bot_lost(this, TE_SPIKE);
		}
		return;
	}
};

void() waypoint =
{
	self.solid = IT_SHOTGUN;
	self.movetype = TE_SPIKE;
	setorigin(self, self.origin);
	setsize(self, VEC_HULL_MIN, VEC_HULL_MAX);
	waypoints = waypoints + IT_SHOTGUN;
	if (!way_head)
	{
		way_head = self;
		way_foot = self;
	}
	else
	{
		way_foot._next = self;
		self._last = way_foot;
		way_foot = self;
	}
	self.count = waypoints;
	waypoint_mode = TE_EXPLOSION;
	if ((self.count == IT_SHOTGUN))
	{
		localcmd(/*2983i*/"echo BSP waypoints detected\n");
		self.think = FixWaypoints;
		self.nextthink = time;
	}
};

void(vector org, vector bit1, float bit4, float flargs) make_way =
{
	local entity y;

	waypoint_mode = TE_EXPLOSION;
	y = make_waypoint(org);
	y.b_aiflags = flargs;
	y.b_pants = bit1_x;
	y.b_skill = bit1_y;
	y.b_shirt = bit1_z;
	y.b_frags = bit4;
	if ((y.count == IT_SHOTGUN))
	{
		localcmd(/*3021i*/"echo QuakeC waypoints detected\n");
		y.think = FixWaypoints;
		y.nextthink = time;
	}
};

void(vector org) SpawnTempWaypoint =
{
	local entity tep;

	if (!self.temp_way)
	{
		tep = spawn();
		self.temp_way = spawn();
	}
	else
	{
		tep = self.temp_way;
	}
	tep.classname = "temp_waypoint";
	tep.solid = IT_SHOTGUN;
	tep.movetype = IT_SUPER_NAILGUN;
	setorigin(tep, org);
	target_add(tep);
	setsize(tep, VEC_HULL_MIN, VEC_HULL_MAX);
};
