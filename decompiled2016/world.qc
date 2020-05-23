//Decompiled code. Please respect the original copyright.

void() main =
{
	precache_file(/*17381i*/"progs.dat");
	precache_file(/*17391i*/"gfx.wad");
	precache_file(/*17399i*/"quake.rc");
	precache_file(/*17408i*/"default.cfg");
	precache_file(/*17420i*/"end1.bin");
	precache_file2(/*17429i*/"end2.bin");
	precache_file(/*17438i*/"demo1.dem");
	precache_file(/*17448i*/"demo2.dem");
	precache_file(/*17458i*/"demo3.dem");
	precache_file(/*17468i*/"gfx/palette.lmp");
	precache_file(/*17484i*/"gfx/colormap.lmp");
	precache_file2(/*17501i*/"gfx/pop.lmp");
	precache_file(/*17513i*/"gfx/complete.lmp");
	precache_file(/*17530i*/"gfx/inter.lmp");
	precache_file(/*17544i*/"gfx/ranking.lmp");
	precache_file(/*17560i*/"gfx/vidmodes.lmp");
	precache_file(/*17577i*/"gfx/finale.lmp");
	precache_file(/*17592i*/"gfx/conback.lmp");
	precache_file(/*17608i*/"gfx/qplaque.lmp");
	precache_file(/*17624i*/"gfx/menudot1.lmp");
	precache_file(/*17641i*/"gfx/menudot2.lmp");
	precache_file(/*17658i*/"gfx/menudot3.lmp");
	precache_file(/*17675i*/"gfx/menudot4.lmp");
	precache_file(/*17692i*/"gfx/menudot5.lmp");
	precache_file(/*17709i*/"gfx/menudot6.lmp");
	precache_file(/*17726i*/"gfx/menuplyr.lmp");
	precache_file(/*17743i*/"gfx/bigbox.lmp");
	precache_file(/*17758i*/"gfx/dim_modm.lmp");
	precache_file(/*17775i*/"gfx/dim_drct.lmp");
	precache_file(/*17792i*/"gfx/dim_ipx.lmp");
	precache_file(/*17808i*/"gfx/dim_tcp.lmp");
	precache_file(/*17824i*/"gfx/dim_mult.lmp");
	precache_file(/*17841i*/"gfx/mainmenu.lmp");
	precache_file(/*17858i*/"gfx/box_tl.lmp");
	precache_file(/*17873i*/"gfx/box_tm.lmp");
	precache_file(/*17888i*/"gfx/box_tr.lmp");
	precache_file(/*17903i*/"gfx/box_ml.lmp");
	precache_file(/*17918i*/"gfx/box_mm.lmp");
	precache_file(/*17933i*/"gfx/box_mm2.lmp");
	precache_file(/*17949i*/"gfx/box_mr.lmp");
	precache_file(/*17964i*/"gfx/box_bl.lmp");
	precache_file(/*17979i*/"gfx/box_bm.lmp");
	precache_file(/*17994i*/"gfx/box_br.lmp");
	precache_file(/*18009i*/"gfx/sp_menu.lmp");
	precache_file(/*18025i*/"gfx/ttl_sgl.lmp");
	precache_file(/*18041i*/"gfx/ttl_main.lmp");
	precache_file(/*18058i*/"gfx/ttl_cstm.lmp");
	precache_file(/*18075i*/"gfx/mp_menu.lmp");
	precache_file(/*18091i*/"gfx/netmen1.lmp");
	precache_file(/*18107i*/"gfx/netmen2.lmp");
	precache_file(/*18123i*/"gfx/netmen3.lmp");
	precache_file(/*18139i*/"gfx/netmen4.lmp");
	precache_file(/*18155i*/"gfx/netmen5.lmp");
	precache_file(/*18171i*/"gfx/sell.lmp");
	precache_file(/*18184i*/"gfx/help0.lmp");
	precache_file(/*18198i*/"gfx/help1.lmp");
	precache_file(/*18212i*/"gfx/help2.lmp");
	precache_file(/*18226i*/"gfx/help3.lmp");
	precache_file(/*18240i*/"gfx/help4.lmp");
	precache_file(/*18254i*/"gfx/help5.lmp");
	precache_file(/*18268i*/"gfx/pause.lmp");
	precache_file(/*18282i*/"gfx/loading.lmp");
	precache_sound(/*18298i*/"misc/menu1.wav");
	precache_sound(/*18313i*/"misc/menu2.wav");
	precache_sound(/*18328i*/"misc/menu3.wav");
	precache_sound(/*18343i*/"ambience/water1.wav");
	precache_sound(/*18363i*/"ambience/wind2.wav");
	precache_file(/*18382i*/"maps/start.bsp");
	precache_file2(/*17501i*/"gfx/pop.lmp");
};

void() worldspawn =
{
	local float sol_grav;
	local float sol_ms;

	lastspawn = world;
	spotspawn = TE_SPIKE;
	BotInit();
	ENG_Check();
	sol_grav = cvar(/*18402i*/"sol_gravity");
	sol_ms = cvar(/*18414i*/"sol_maxspeed");
	if (sol_grav)
	{
		cvar_set(/*2603i*/"sv_gravity", ftos(sol_grav));
	}
	else
	{
		cvar_set(/*2603i*/"sv_gravity", /*18427i*/"340");
	}
	if (sol_ms)
	{
		cvar_set(/*2591i*/"sv_maxspeed", ftos(sol_ms));
	}
	else
	{
		cvar_set(/*2591i*/"sv_maxspeed", /*18431i*/"170");
	}
	cvar_set(/*18435i*/"sv_maxvelocity", /*18450i*/"10000");
	W_Precache();
	precache_sound(/*18456i*/"demon/dland2.wav");
	precache_sound(/*18473i*/"misc/h2ohit1.wav");
	precache_sound(/*18490i*/"items/itembk2.wav");
	precache_sound(/*18508i*/"player/plyrjmp8.wav");
	precache_sound(/*18528i*/"player/land.wav");
	precache_sound(/*18544i*/"player/land2.wav");
	precache_sound(/*10531i*/"misc/talk.wav");
	precache_sound(/*18561i*/"misc/r_tele1.wav");
	precache_sound(/*13218i*/"weapons/lock4.wav");
	precache_sound(/*18578i*/"weapons/pkup.wav");
	precache_sound(/*18595i*/"player/death1.wav");
	precache_sound(/*18613i*/"player/death2.wav");
	precache_sound(/*18631i*/"player/death3.wav");
	precache_sound(/*18649i*/"player/pain1.wav");
	precache_sound(/*18666i*/"player/beep1.wav");
	precache_sound(/*18683i*/"player/beep2.wav");
	precache_sound(/*18700i*/"player/sheild_recharge.wav");
	precache_sound(/*18727i*/"player/sheilds_low_bleep.wav");
	precache_sound(/*18756i*/"weapons/ax1.wav");
	precache_sound(/*18772i*/"player/axhit1.wav");
	precache_sound(/*15731i*/"player/axhit2.wav");
	precache_sound(/*18790i*/"player/h2ojump.wav");
	precache_sound(/*18809i*/"player/inh2o.wav");
	precache_sound(/*18826i*/"misc/outwater.wav");
	precache_sound(/*18844i*/"misc/water1.wav");
	precache_sound(/*18860i*/"misc/water2.wav");
	precache_model(/*18876i*/"progs/plyr.mdl");
	precache_model(/*18891i*/"progs/player.mdl");
	precache_model(/*18908i*/"progs/player_shot.mdl");
	precache_model(/*18930i*/"progs/player_snail.mdl");
	precache_model(/*18953i*/"progs/player_sshot.mdl");
	precache_model(/*18976i*/"progs/player_needler.mdl");
	precache_model(/*19001i*/"progs/player_rocket.mdl");
	precache_model(/*19025i*/"progs/player_sniper.mdl");
	precache_model(/*19049i*/"progs/player_plasma.mdl");
	precache_model(/*19073i*/"progs/eyes.mdl");
	precache_sound(/*19088i*/"player/tornoff2.wav");
	precache_model(/*2255i*/"progs/s_bubble.spr");
	precache_model(/*11261i*/"progs/s_explod.spr");
	precache_model(/*16707i*/"progs/v_axe.mdl");
	precache_model(/*16672i*/"progs/v_shot.mdl");
	precache_model(/*14436i*/"progs/v_nail.mdl");
	precache_model(/*19108i*/"progs/v_rock.mdl");
	precache_model(/*16689i*/"progs/v_shot2.mdl");
	precache_model(/*19125i*/"progs/v_nail2.mdl");
	precache_model(/*19143i*/"progs/bolt.mdl");
	precache_model(/*19158i*/"progs/bolt2.mdl");
	precache_model(/*19174i*/"progs/bolt3.mdl");
	precache_model(/*19190i*/"progs/lavaball.mdl");
	precache_model(/*16352i*/"progs/missile.mdl");
	precache_model(/*19209i*/"progs/grenade.mdl");
	precache_model(/*16576i*/"progs/spike.mdl");
	precache_model(/*16624i*/"progs/s_spike.mdl");
	precache_model(/*13335i*/"progs/backpack.mdl");
	precache_model(/*15761i*/"progs/zom_gib.mdl");
	precache_model(/*19227i*/"progs/v_light.mdl");
	lightstyle(TE_SPIKE, /*19245i*/"m");
	lightstyle(IT_SHOTGUN, /*19247i*/"mmnmmommommnonmmonqnmmo");
	lightstyle(IT_SUPER_SHOTGUN, /*19271i*/"abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcba");
	lightstyle(TE_EXPLOSION, /*19323i*/"mmmmmaaaaammmmmaaaaaabcdefgabcdefg");
	lightstyle(IT_NAILGUN, /*19358i*/"mamamamamama");
	lightstyle(TE_LIGHTNING1, /*19371i*/"jklmnopqrstuvwxyzyxwvutsrqponmlkj");
	lightstyle(TE_LIGHTNING2, /*19405i*/"nmonqnmomnmomomno");
	lightstyle(TE_WIZSPIKE, /*19423i*/"mmmaaaabcdefgmmmmaaaammmaamm");
	lightstyle(IT_SUPER_NAILGUN, /*19452i*/"mmmaaammmaaammmabcdefaaaammmmabcdefmmmaaaa");
	lightstyle(TE_LIGHTNING3, /*19495i*/"aaaaaaaazzzzzzzz");
	lightstyle(TE_LAVASPLASH, /*19512i*/"mmamammmmammamamaaamammma");
	lightstyle(TE_TELEPORT, /*19538i*/"abcdefghijklmnopqrrqponmlkjihgfedcba");
	lightstyle(63, /*19575i*/"a");
};

void() StartFrame =
{
	BotFrame();
	timelimit = cvar(/*19588i*/"timelimit") * 60;
	fraglimit = cvar(/*19598i*/"fraglimit");
	deathmatch = cvar(/*19608i*/"deathmatch");
	coop = cvar(/*19619i*/"coop");
	teamplay = cvar(/*19624i*/"teamplay");
	skill = cvar(/*2662i*/"skill");
	framecount = framecount + IT_SHOTGUN;
};

void() func_rotating =
{
	self.solid = IT_NAILGUN;
	self.movetype = TE_WIZSPIKE;
	setorigin(self, self.origin);
	setmodel(self, self.model);
	self.classname = "func_rotating";
	setsize(self, self.mins, self.maxs);
	if (!self.speed)
	{
		self.speed = 100;
	}
	if ((self.spawnflags & IT_SUPER_SHOTGUN))
	{
		self.speed = (TE_SPIKE - self.speed);
	}
	if ((self.spawnflags & IT_LIGHTNING))
	{
		self.solid = TE_SPIKE;
	}
	if ((self.spawnflags & IT_NAILGUN))
	{
		self.avelocity_z = self.speed;
		self.avelocity_x = TE_SPIKE;
		self.avelocity_y = TE_SPIKE;
	}
	else
	{
		if ((self.spawnflags & IT_SUPER_NAILGUN))
		{
			self.avelocity_z = TE_SPIKE;
			self.avelocity_x = self.speed;
			self.avelocity_y = TE_SPIKE;
		}
		else
		{
			self.avelocity_z = TE_SPIKE;
			self.avelocity_x = TE_SPIKE;
			self.avelocity_y = self.speed;
		}
	}
};
