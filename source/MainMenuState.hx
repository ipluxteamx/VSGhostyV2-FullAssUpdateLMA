package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import ColorblindFilters;
import sys.FileSystem;
import sys.io.File;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import openfl.filters.ShaderFilter;
import Shaders;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var osEngineVersion:String = '1.5.1'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	var optionShit:Array<String> = [
		'story_mode',
		'song_selector',
		//#if MODS_ALLOWED 'mods', #end
		//#if ACHIEVEMENTS_ALLOWED 'awards', #end REMINDER TO UNCOMMENT THIS LATER
		'credits',
		//'donate',
		//'discord', you can go to discord now by pressing ctrl in credits
		'options'
	];

	/*#if MODS_ALLOWED
	var customOption:String;
	var	customOptionLink:String;
	#end*/

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;
	var rightArrow:FlxSprite;
	var leftArrow:FlxSprite;

	override function create()
	{
		/*#if MODS_ALLOWED
		Paths.pushGlobalMods();
		#end*/
		WeekData.loadTheFirstEnabledMod();
		if (ClientPrefs.colorblindMode != null) ColorblindFilters.applyFiltersOnGame(); // applies colorbind filters, ok?

		#if desktop
		// Updating Discord Rich Presence

		DiscordClient.changePresence("In the Menus", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];
		//camera.zoom = 1.85;

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var emitterthingy = new FlxEmitter(100, 100);

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
        var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBGSelect'));
        bg.scrollFactor.set(0, yScroll);
        bg.setGraphicSize(Std.int(bg.width * 1.175));
        bg.updateHitbox();
        bg.screenCenter();
        bg.antialiasing = ClientPrefs.globalAntialiasing;
        add(bg);

		var particle = new FlxParticle();
        	particle.makeGraphic(1920, 1080, 0xFFFFFFFF);
        	particle.exists = false;
        	emitterthingy.add(particle);
			add(emitterthingy);

			emitterthingy.start(false, 10, 1);

        //if(ClientPrefs.themedmainmenubg == true) {

		var themedBg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBGSelect'));
		themedBg.scrollFactor.set(0, yScroll);
		themedBg.setGraphicSize(Std.int(bg.width));
		themedBg.updateHitbox();
		themedBg.screenCenter();
		themedBg.antialiasing = ClientPrefs.globalAntialiasing;
		add(themedBg);

		var hours:Int = Date.now().getHours();
		if(hours > 18) {
			themedBg.color = 0x233FA5; // 0x6939ff
		} else if(hours > 8) {
			themedBg.color = 0xB8B82B;
		}
        //}

        camFollow = new FlxObject(0, 0, 1, 1);
        camFollowPos = new FlxObject(0, 0, 1, 1);
        add(camFollow);
        add(camFollowPos);

        magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
        magenta.scrollFactor.set(0, yScroll);
        magenta.setGraphicSize(Std.int(magenta.width * 1.175));
        magenta.updateHitbox();
        magenta.screenCenter();
        magenta.visible = false;
        magenta.antialiasing = ClientPrefs.globalAntialiasing;
        magenta.color = 0xFFfd719b;
        add(magenta);
		
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		//var scale:Float = 0.45;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		var curoffset:Float = 100;
		/*#if MODS_ALLOWED
		pushModMenuItemsToList(Paths.currentModDirectory);
		#end*/

		for (i in 0...optionShit.length)
		{
			//var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, 0);
			menuItem.scale.x = 0.575;
			menuItem.scale.y = 0.575;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/gh_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', "idle", 24);
			//menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItem.screenCenter(X);
			menuItem.screenCenter(Y);
			menuItem.x += 202.5;
			menuItem.y += 197.5;
			menuItems.add(menuItem);
			/*var scr:Float = (optionShit.length - 4) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);*/
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			//menuItem.scale.x = 0.17;
			//menuItem.scale.y = 0.17;
			
			menuItem.updateHitbox();
			//curoffset = curoffset + 20;
		}

		var ui_tex = Paths.getSparrowAtlas('menu_UI_assets');

		leftArrow = new FlxSprite(100, 0);
		leftArrow.frames = ui_tex;
		leftArrow.animation.addByPrefix('idle', "arrow left");
		leftArrow.animation.addByPrefix('press', "arrow push left");
		leftArrow.animation.play('idle');
		leftArrow.antialiasing = ClientPrefs.globalAntialiasing;
		add(leftArrow);
		leftArrow.screenCenter(Y);

		rightArrow = new FlxSprite(FlxG.width - 145 , 0);
		rightArrow.frames = ui_tex;
		rightArrow.animation.addByPrefix('idle', 'arrow right');
		rightArrow.animation.addByPrefix('press', "arrow push right");
		rightArrow.animation.play('idle');
		rightArrow.antialiasing = ClientPrefs.globalAntialiasing;
		add(rightArrow);
		rightArrow.screenCenter(Y);

		//FlxG.camera.follow(menuItems.members[0], null, 1);

		/*var versionShit:FlxText = new FlxText(FlxG.width * 0.7, FlxG.height - 44, 0, "OS Engine v" + osEngineVersion + " - Modded Psych Engine", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(FlxG.width * 0.7, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);*/

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		var textBG:FlxSprite = new FlxSprite(0, FlxG.height - 26).makeGraphic(FlxG.width, 26, 0xFF000000);
		textBG.alpha = 0.6;
		add(textBG);

		var leText:String = "placeholder for thing~ theehee~!"; //TODO: delete this message i hate it with a burning passion
		var size:Int = 18;

		var text:FlxText = new FlxText(textBG.x, textBG.y + 4, FlxG.width, leText, size);
		text.setFormat(Paths.font("vcr.ttf"), size, FlxColor.WHITE, RIGHT);
		text.scrollFactor.set();
		add(text);

		super.create();
	}

	/*#if MODS_ALLOWED
	private var modsAdded:Array<String> = [];
	function pushModMenuItemsToList(folder:String)
	{
		if(modsAdded.contains(folder)) return;

		var menuitemsFile:String = null;
		if(folder != null && folder.trim().length > 0) menuitemsFile = Paths.mods(folder + '/data/menuitems.txt');
		else menuitemsFile = Paths.mods('data/menuitems.txt');

		if (FileSystem.exists(menuitemsFile))
		{
			var firstarray:Array<String> = File.getContent(menuitemsFile).split('\n');
			if (firstarray[0].length > 0) {
				var arr:Array<String> = firstarray[0].split('||');
				//if(arr.length == 1) arr.push(folder);
				optionShit.push(arr[0]);
				customOption = arr[0];
				customOptionLink = arr[1];
			}
		}
		modsAdded.push(folder);
	}
	#end*/


	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;


	override function update(elapsed:Float)
	{
		if (optionShit[curSelected] == 'story_mode')
		{
			menuItems.members[0].visible = true;
			menuItems.members[1].visible = false;
			menuItems.members[2].visible = false;
			menuItems.members[3].visible = false;
		}
		if (optionShit[curSelected] == 'song_selector')
		{
			menuItems.members[1].visible = true;
			menuItems.members[0].visible = false;
			menuItems.members[2].visible = false;
			menuItems.members[3].visible = false;
		}
		if (optionShit[curSelected] == 'credits')
		{
			menuItems.members[2].visible = true;
			menuItems.members[0].visible = false;
			menuItems.members[1].visible = false;
			menuItems.members[3].visible = false;
		}
		if (optionShit[curSelected] == 'options')
		{
			menuItems.members[3].visible = true;
			menuItems.members[0].visible = false;
			menuItems.members[1].visible = false;
			menuItems.members[2].visible = false;
		}

		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
			if(FreeplayState.vocals != null) FreeplayState.vocals.volume += 0.5 * elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);

		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		if (!selectedSomethin)
		{
			if (controls.UI_LEFT_P)
			{
				leftArrow.animation.play('press');
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.8);
				changeItem(-1);
			} else {
				leftArrow.animation.play('idle');
			}

			if (controls.UI_RIGHT_P)
			{
				rightArrow.animation.play('press');
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.8);
				changeItem(1);
			} else {
				rightArrow.animation.play('idle');
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				/*if (optionShit[curSelected] == 'donate') {
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				} else if (optionShit[curSelected] == customOption) {
					CoolUtil.browserLoad(customOptionLink);
				}*/
				/*else
				{*/
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					if(ClientPrefs.flashing) FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							/*
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
							*/
							FlxTween.tween(spr, {x: -500}, 2, {ease: FlxEase.backInOut, type: ONESHOT, onComplete: function(twn:FlxTween) {
								spr.kill();
							}});
						}
						else
						{
							/*
							FlxTween.tween(spr, {x: 500}, 1, {ease: FlxEase.backInOut, type: ONESHOT, onComplete: function(tween: FlxTween) {	no more tweenings
								var daChoice:String = optionShit[curSelected];


								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'song_selector':
										MusicBeatState.switchState(new FreeplayState());
									#if MODS_ALLOWED
									case 'mods':
										MusicBeatState.switchState(new ModsMenuState());
									#end			
									case 'awards':
										MusicBeatState.switchState(new AchievementsMenuState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
										LoadingState.loadAndSwitchState(new options.OptionsState());
								}
							}});
							*/
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)

							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'song_selector':
										MusicBeatState.switchState(new FreeplayState());
									/*#if MODS_ALLOWED
									case 'mods':
										MusicBeatState.switchState(new ModsMenuState()); 
									#end*/
									case 'awards':
										MusicBeatState.switchState(new AchievementsMenuState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
										LoadingState.loadAndSwitchState(new options.OptionsState());
								}
							});
						}
					});
				}
			//}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				//MusicBeatState.switchState(new MasterEditorMenu());
				PlayState.SONG = Song.loadFromJson("uh-oh", "uh oh"); // you dun fucked up
				MusicBeatState.switchState(new PlayState());
				FlxG.save.data.uhOhFound = true;
				return;
			}
			#end
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			//spr.screenCenter(X);
		});
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			//spr.updateHitbox();
			//spr.scale.x = 0.7;
			//spr.scale.y = 0.7;

			if (spr.ID == curSelected)
			{
				//spr.animation.play('selected');
				/*spr.scale.x = 1.0;
				spr.scale.y = 1.0;*/
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y - add);
				//spr.centerOffsets();
			}
		});
	}

	override function beatHit()
	{
		super.beatHit();


	}
}
