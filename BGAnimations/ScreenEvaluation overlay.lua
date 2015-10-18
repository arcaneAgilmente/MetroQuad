local vStats = STATSMAN:GetCurStageStats();

local function CreateStats( pnPlayer )
	-- Actor Templates
	local aLabel = LoadFont("Common Normal") .. { InitCommand=cmd(zoom,0.5;shadowlength,1;horizalign,left); };
	local aText = LoadFont("Common Normal") .. { InitCommand=cmd(zoom,0.5;shadowlength,1;horizalign,left); };
	-- DA STATS, JIM!!
	local pnStageStats = vStats:GetPlayerStageStats( pnPlayer );
	-- Organized Stats.
	local tStats = {
		W3			= pnStageStats:GetTapNoteScores('TapNoteScore_W3');
		W4			= pnStageStats:GetTapNoteScores('TapNoteScore_W4');
		W5			= pnStageStats:GetTapNoteScores('TapNoteScore_W5');
		Miss		= pnStageStats:GetTapNoteScores('TapNoteScore_Miss');
		HitMine		= pnStageStats:GetTapNoteScores('TapNoteScore_HitMine');
		AvoidMine	= pnStageStats:GetTapNoteScores('TapNoteScore_AvoidMine');
		Held		= pnStageStats:GetHoldNoteScores('HoldNoteScore_Held');
		LetGo		= pnStageStats:GetHoldNoteScores('HoldNoteScore_LetGo');
	};
	local t = Def.ActorFrame {};
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(y,-34);
		LoadActor(THEME:GetPathG("ScreenTitleMenu","PreferenceFrame")) .. {
			InitCommand=cmd(zoom,0.875;diffuse,PlayerColor( pnPlayer ));
		};
		aLabel .. { Text=THEME:GetString("ScreenEvaluation","ITG DP:"); InitCommand=cmd(x,-64) };
		aText .. { Text=string.format("%04i",tValues["ITG"]); InitCommand=cmd(x,-8;y,5;vertalign,bottom;zoom,0.6); };
		aText .. { Text="/"; InitCommand=cmd(x,28;y,5;vertalign,bottom;zoom,0.5;diffusealpha,0.5); };
		aText .. { Text=string.format("%04i",tValues["ITG_MAX"]); InitCommand=cmd(x,32;y,5;vertalign,bottom;zoom,0.5); };
	};
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(y,-6);
		LoadActor(THEME:GetPathG("ScreenTitleMenu","PreferenceFrame")) .. {
			InitCommand=cmd(zoom,0.875;diffuse,PlayerColor( pnPlayer ));
		};
		aLabel .. { Text=THEME:GetString("ScreenEvaluation","MIGS DP:"); InitCommand=cmd(x,-64) };
		aText .. { Text=string.format("%04i",tValues["MIGS"]); InitCommand=cmd(x,-8;y,5;vertalign,bottom;zoom,0.6); };
		aText .. { Text="/"; InitCommand=cmd(x,28;y,5;vertalign,bottom;zoom,0.5;diffusealpha,0.5); };
		aText .. { Text=string.format("%04i",tValues["MIGS_MAX"]); InitCommand=cmd(x,32;y,5;vertalign,bottom;zoom,0.5); };
	};
	return t
end;

local t = Def.ActorFrame {};

GAMESTATE:IsPlayerEnabled(PLAYER_1)

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(hide_if,not GAMESTATE:IsPlayerEnabled(PLAYER_1);x,WideScale(math.floor(SCREEN_CENTER_X*0.3)-8,math.floor(SCREEN_CENTER_X*0.5)-8);y,SCREEN_CENTER_Y-34);
	CreateStats( PLAYER_1 );
};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(hide_if,not GAMESTATE:IsPlayerEnabled(PLAYER_2);x,WideScale(math.floor(SCREEN_CENTER_X*1.7)+8,math.floor(SCREEN_CENTER_X*1.5)+8);y,SCREEN_CENTER_Y-34);
	CreateStats( PLAYER_2 );
};

return t