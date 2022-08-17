package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.events.TimerEvent;
	import flash.net.SharedObject;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.globalization.DateTimeFormatter;
	import flash.geom.Transform;
    import flash.geom.ColorTransform;
    import fl.motion.Color;

	
	
	//Tween
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.greensock.plugins.*;
	
	import comtwo.hd.confetti.*; //Confetti
	
	
	//SHARE
	import flash.net.navigateToURL;
    import flash.net.URLVariables;
    import flash.net.URLRequest;
    import flash.net.URLRequestMethod;
	//Keyboard controls
	import flash.system.Capabilities;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	
	
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode; 
	import flash.display.StageQuality;
	
	
	
	//ANES
	import com.distriqt.extension.core.Core;
	import com.distriqt.extension.adverts.AdSize;
	import com.distriqt.extension.adverts.AdView;
	import com.distriqt.extension.adverts.AdViewParams;
	import com.distriqt.extension.adverts.AdvertPlatform;
	import com.distriqt.extension.adverts.Adverts;
	import com.distriqt.extension.adverts.InterstitialAd;
	import com.distriqt.extension.adverts.events.InterstitialAdEvent;
	import com.distriqt.extension.adverts.rewarded.RewardedVideoAd;
	import com.distriqt.extension.adverts.events.RewardedVideoAdEvent;
	import com.distriqt.extension.adverts.rewarded.RewardedVideoAds;
	import com.distriqt.extension.adverts.Interstitials;
	import com.distriqt.extension.adverts.builders.AdRequestBuilder;
	import com.distriqt.extension.adverts.builders.AdViewParamsBuilder;
	import com.distriqt.extension.adverts.events.AdViewEvent;
	import com.distriqt.extension.playservices.base.PlayServicesBase;
	import com.distriqt.extension.playservices.base.ConnectionResult;
	import com.distriqt.extension.playservices.base.GoogleApiAvailability;
	import com.distriqt.extension.gameservices.GameServices;
    import com.distriqt.extension.gameservices.events.GameServicesEvent;
	import com.distriqt.extension.gameservices.ServiceEnvironment;
	import com.distriqt.extension.gameservices.Player;
	import com.distriqt.extension.gameservices.Service;
	import com.distriqt.extension.playservices.base.ConnectionResult;
    import com.distriqt.extension.playservices.base.GoogleApiAvailability;
	import com.distriqt.extension.vibration.Vibration;  //VIBRATE
	
	
	/**
	 * ...
	 * @author Nathan Fitchett
	 */
	public class geniusQuizEngine extends MovieClip 
	{
		
		//MovieClips
		private var playScreen:mcPlayScreen;
		private var hex_1:mcHex;
		private var hex_2:mcHex2;
		private var hex_3:mcHex3;
		private var hex_4:mcHex4;
		private var hex_5:mcHex5;
		private var hex_6:mcHex6;
		private var hex_7:mcHex7;
		private var hexContainer:MovieClip;
		private var currentHex; //For use of for loop elsewhere
		private var matchCompleteScrn:mcMatchCompleteScreen;
		private var gameOverScreen:mcGameOverScreen;
		private var gameOverEffect:mcGameOverEffect;
		private var startScreen:mcStartScreen;
		private var achievementScreen:mcAchievementScreen;
		private var spark:mcSpark;
		private var pauseScreen:mcPauseScreen;
		private var splashScreen:mcSplashScreen;
		private var shareScreen:mcShareScreen;
		private var storeScreen:mcStoreScreen;
		private var levelScreen:mcLevelScreen;
		private var tutorialScreen:mcTutorialScreen;
		
		//Color Hexs
		private var orangeHex:mcOrangeHex;
		private var redHex:mcRedHex;
		private var yellowHex:mcYellowHex;
		private var blueHex:mcBlueHex;
		private var purpleHex:mcPurpleHex;
		private var whiteHex:mcWhiteHex;
		private var greenHex:mcGreenHex;
		private var resetHex:mcResetHexagons;
		
		//COnfetti
		private var c:Confetti;
		
		
		//Arrays
		private var aMainHexFrameArray:Array;
		private var aMainHexArray:Array;
		private var aHexColorArray:Array;
		
		//Sounds
		private var matchSound_1:Sound;
		private var matchSound_2:Sound;
		private var matchSound_3:Sound;
		private var matchSound_4:Sound;
		private var matchSound_5:Sound;
		private var matchSound_6:Sound;
		private var matchSound_7:Sound;
		private var matchComplete:Sound;
		private var addHexSound:Sound;
		private var hexSwitchSound:Sound;
		private var gameOverSound:Sound;
		private var resetSound:Sound;
		private var selectSound:Sound;
		private var levelCompleteSound:Sound;
		private var hexSelectSound:Sound;
		private var introSound:Sound;
		private var IQSound:Sound;
		
		
		//Sound Channel
		private var matchSoundChannel:SoundChannel;
		
		
		//Booleans
		private var bLevel_1:Boolean = true;
		private var bLevel_2:Boolean = false;
		private var bLevel_3:Boolean = false;
		private var bLevel_4:Boolean = false;
		private var bLevel_5:Boolean = false;
		private var bLevel_6:Boolean = false;
		private var bLevel_7:Boolean = false;
		private var bDragging:Boolean = false;
		private var bResetDraggin:Boolean = false;
		private var bNightModeOn:Boolean = false;
		private var bShowSettings:Boolean = false;
		private var bSoundIsOn:Boolean = true;
		private var bVibrate:Boolean = true;
		private var bGeniusMode:Boolean = false;
		private var bOnStartScreen:Boolean = false;
		private var bOnGameOverScreen:Boolean = false;
		private var bPauseIsActive:Boolean = false;
		private var bPlayingGame:Boolean = false;
		private var bMatchComplete:Boolean = false;
		private var bLevelScreenActive:Boolean = false;
		private var bConfettiActive:Boolean = false;
		
		
		//For index bug fix quick solution
		private var bBlueHex:Boolean = false;
		private var bRedHex:Boolean = false;
		private var bPurpleHex:Boolean = false;
		private var bGreenHex:Boolean = false;
		private var bWhiteHex:Boolean = false;
		private var bYellowHex:Boolean = false;
		private var bOrangeHex:Boolean = false;
		
		
		//Level Progression Screen
		//private var blv1Locked:Boolean;
		private var blv2Locked:Boolean;
		private var blv3Locked:Boolean;
		private var blv4Locked:Boolean;
		private var blv5Locked:Boolean;
		private var blv6Locked:Boolean;
		private var blv7Locked:Boolean;
		
		//LEVEL COMPLETION
		private var blv1_Complete:Boolean = false;
		private var blv2_Complete:Boolean = false;
		private var blv3_Complete:Boolean = false;
		private var blv4_Complete:Boolean = false;
		private var blv5_Complete:Boolean = false;
		private var blv6_Complete:Boolean = false;
		private var blv7_Complete:Boolean = false;
		
		//Level Animation Booleans
		private var blv1_FINISHED:Boolean;
		private var blv2_FINISHED:Boolean;
		private var blv3_FINISHED:Boolean;
		private var blv4_FINISHED:Boolean;
		private var blv5_FINISHED:Boolean;
		private var blv6_FINISHED:Boolean;
		private var blv7_FINISHED:Boolean;
		
		//Tut
		private var bWatchedTutorial:Boolean;
		private var nClick:Number = 1;
		
		//Timers
		private var tCountTimer:Timer;
		private var tCountIQTimer:Timer; //for level progression 
		private var timerCount:int;
		private var timerCountIQ:int
		
		//Timer Variables
		private var time:Date;
		private var minutes:String;
		private var seconds:String;
		private var miliseconds:String;
		private var milliseconds:int;
		private var nTime:String;
		private var nTimeiQ:String; // To act as a duplicate so we can reset it
		
		//Numbers
		private var nHexColors:Number;
		private var nSoundEffect:Number = 1;
		private var nCorrectMatch:Number = 0; //Number of Correct matches
		private var nColorTimer:Number;
		private var nLevel:Number = 1;
		private var nLevelData:Number = 1;
		private var nLevelsText:Number = 1; // for the level screen
		private var nIQ:Number = 0;
		private var nSparks:Number = 20;
		private var nUsedSparks:Number = 0;
		private var nReset:Number = 5;
		private var nIncrease:Number = 1;
		private var nLevelIQ:Number = 1;
		private var totalIQ:Number = 20; 
		private var nMatchingCounter:Number = 0;
		private var nEasterEgg:Number = 0;
		private var nAdView:Number = 0;
		private var nLevelDisplay:Number = 1;
		
		
		
		//Shared Objects
		private var sharedObjectSparks:SharedObject;
		private var sharedObjectLevel:SharedObject;
		private var sharedObjectTime:SharedObject;
		private var sharedObjectIQ:SharedObject;
		private var sharedObjectLevelProgress:SharedObject;
		private var sharedObjectLevelComplete:SharedObject;
		private var sharedObjectTutorial:SharedObject;
		
		
		private var nLeaderboardScore:Number;	
		private var service:Service;
		private var adView:AdView;
		private var nTut:Number = 1;
		private var rewardedVideoAd:RewardedVideoAd;
		private var interstitial:InterstitialAd;
		private var params:AdViewParams;


		public function geniusQuizEngine() 
		{
			
			TweenLite.delayedCall(0.1, fullScreenHandler);
			
			//Start core 
			Core.init()
			//SETUP
			Adverts.service.setup( AdvertPlatform.PLATFORM_ADMOB);
			Adverts.service.initialise();
			
			//PRE LOAD ADS
			bannerAdsHandler(); //Show Banner on load function
			interstitalAdHandler();
			rewardAdsHandler();
			
			

			//Instantiate/Load Mc's To reuse and not Lag
			playScreen = new mcPlayScreen();
			orangeHex = new mcOrangeHex();
			redHex = new mcRedHex();
			blueHex = new mcBlueHex();
			yellowHex = new mcYellowHex();
			whiteHex = new mcWhiteHex();
			greenHex = new mcGreenHex();
			purpleHex = new mcPurpleHex();
			resetHex = new mcResetHexagons(); 
			startScreen = new mcStartScreen();
			spark = new mcSpark();
			gameOverScreen = new mcGameOverScreen();
			pauseScreen = new mcPauseScreen();
			storeScreen = new mcStoreScreen();
			shareScreen = new mcShareScreen();
			levelScreen = new mcLevelScreen();
			
			//Add Splash SCREEN
			splashScreen = new mcSplashScreen();
			splashScreen.x = (stage.stageWidth / 2);
			splashScreen.y = (stage.stageHeight / 2);
			addChild(splashScreen);
			TweenLite.delayedCall(1.0, startScreenMainHandler);
			
			
		}
		
		
		private function bannerAdsHandler():void
		{
			if (Adverts.isSupported)
            {
				
				//BANNERS
				adView = Adverts.service.createAdView();
				adView.setAdaptiveAdSize();
                adView.setAdUnitId( "ca-app-pub-1630894172429657/3710712707" ); // BANNER  

				params = new AdViewParams();
                params.horizontalAlign = AdViewParams.ALIGN_CENTER;
                params.verticalAlign = AdViewParams.ALIGN_BOTTOM;
                adView.setViewParams( params );
				
				adView.load( new AdRequestBuilder().build());

				adView.addEventListener( AdViewEvent.LOADED, loadedHandler );
                adView.addEventListener( AdViewEvent.ERROR, errorHandler );
				adView.addEventListener( AdViewEvent.CLOSED, closedHandler );
			}
		}
		
		private function closedHandler( event:AdViewEvent ):void 
		{
			// Control has returned to your application
			adView.load( new AdRequestBuilder().build() ); 
		}
		
		private function loadedHandler( event:AdViewEvent ):void
        {
            // Ad loaded and ready to be displayed
			
			if (Adverts.isSupported && !bPlayingGame)
			{
				//hide ad during game
				adView.show();
			}
			trace("LOADED AD");
        }
        
        private function errorHandler( event:AdViewEvent ):void
        {
            // Load error occurred. The errorCode will contain more information
            trace( "Error" + event.errorCode );
        }
		
		
		private function interstitalAdHandler():void
		{
			if (Adverts.isSupported)
            {
				//INTERSTITALS
				interstitial = Adverts.service.interstitials.createInterstitialAd();
				interstitial.setAdUnitId("ca-app-pub-1630894172429657/5662922777"); //INTERSTITAL
				// Interstitials are supported
				interstitial.load( new AdRequestBuilder().build());
				
				interstitial.addEventListener( InterstitialAdEvent.CLOSED, closedHandlerInterstital );
				interstitial.addEventListener( InterstitialAdEvent.CLOSED, errorHandlerInterstitial );
			}
		}
		
		public function closedHandlerInterstital( event:InterstitialAdEvent ):void 
		{
			// Control has returned to your application Load New Ad on Close
			interstitial.load( new AdRequestBuilder().build());
			trace("LOAD NEW AD");
		}
		
		private function errorHandlerInterstitial(event:InterstitialAdEvent):void 
		{
			    // Load error occurred. The errorCode will contain more information
				trace( "Error" + event.errorCode );
		}
		
		
		private function rewardAdsHandler():void
		{
			if (Adverts.isSupported)
            {
				//REWARD ADS
				rewardedVideoAd = Adverts.service.rewardedVideoAds.createRewardedVideoAd();
				rewardedVideoAd.setAdUnitId( "ca-app-pub-1630894172429657/4349841102" ); //REWARD
				rewardedVideoAd.load( new AdRequestBuilder().build());
				trace("SUPPORT REWARD ADS");
				rewardedVideoAd.addEventListener( RewardedVideoAdEvent.LOADED, loadedHandlerReward );
				rewardedVideoAd.addEventListener( RewardedVideoAdEvent.ERROR, errorHandlerReward );
				
				trace("REWARD");
				
            }

			
		}
		
		private function closedHandlerReward(e:RewardedVideoAdEvent):void 
		{
			rewardedVideoAd.load( new AdRequestBuilder().build() );
		}
	
		
		private function loadedHandlerReward( event:RewardedVideoAdEvent ):void
		{
			// rewarded video ad loaded and ready to be displayed
			trace("INTERSTITAL LOADED");
			
		}
		
		private function errorHandlerReward( event:RewardedVideoAdEvent ):void
		{
			// Load error occurred. The errorCode will contain more information
			trace( "Error" + event.errorCode );
		}
		
		
		
		private function fullScreenHandler():void 
		{
			TweenLite.delayedCall(0.1, fullScreenHandler);
			stage.align= StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.EXACT_FIT;
            stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			
			//Handle Keys
			if (!bPauseIsActive)
			{
				
				NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, handleDeactivate);
				NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, handleActivate);
				NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN, handleKeys);
			}
		}
		
		private function handleActivate(e:Event):void 
		{
			//align stage
			stage.align= StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.EXACT_FIT;
            stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		}
		
		private function handleDeactivate(e:Event):void 
		{
			e.preventDefault();
            e.stopImmediatePropagation();
		
			stage.align= StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.EXACT_FIT;
            stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			
			nativePauseHandler();
			
			
		}
		
		
		private function handleKeys(e:KeyboardEvent):void 
		{
			switch (e.keyCode)
            {
                case Keyboard.BACK:
					
				   e.preventDefault();
                   e.stopImmediatePropagation();
				  //create pause 
				if (bPlayingGame && !bPauseIsActive)
			      {
			         nativePauseHandler();
			      }
		
                 trace("Back key is pressed.");
                 break;
                case Keyboard.MENU:
					
					e.preventDefault();
                    e.stopImmediatePropagation();
				   //create pause 
				 if (bPlayingGame && !bPauseIsActive)
			      {
			         nativePauseHandler();
			      }
		
                 trace("Menu key is pressed.");
                 break;
                case Keyboard.SEARCH:
					
				   e.preventDefault();
                   e.stopImmediatePropagation();
				   //create pause 
				 if (bPlayingGame && !bPauseIsActive)
			      {
			         nativePauseHandler();
			      }
                 break;
            }

			trace("HANDLE KEYS");
		}
		
		
		private function nativePauseHandler():void
		{
			if (bPlayingGame && !bPauseIsActive && !bLevelScreenActive)
			{
				//if timer is active then stop it 
				tCountTimer.stop();
				tCountIQTimer.stop();
				
				//Stop all controls
				removeEventListener(Event.ENTER_FRAME, engineLogic);
				//HIDE ALL OBJECTS
				for (var i:int = 0; i < aHexColorArray.length; i++)
				{
					var allHexColors = aHexColorArray[i];
					
					allHexColors.visible = false;
				}
				//Remove Main hexes
				for (var k:int = 0; k < aMainHexArray.length; k++)
				{
					var allHexs = aMainHexArray[k];
					
					allHexs.visible = false;
				}
				//Reset hide
				resetHex.visible = false;
				
				//make objects invisible
				playScreen.display.visible = false;
				if (!bGeniusMode)
				{
					playScreen.sparkDisplay.visible = false;
				}
				//Add pause screen
				pauseScreen.x = (stage.stageWidth / 2);
				pauseScreen.y = (stage.stageHeight / 2);
				addChild(pauseScreen);
				pauseScreen.mcPlay.addEventListener(MouseEvent.CLICK, pauseControls);
				pauseScreen.mcHome.addEventListener(MouseEvent.CLICK, pauseControls);
				pauseScreen.mcRetry.addEventListener(MouseEvent.CLICK, pauseControls);
				
				//For SOUNDS, VIBRATION AND NIGHT MODE
				pauseScreen.nightMode.addEventListener(MouseEvent.CLICK, pauseNightModeHandler);
				pauseScreen.sound.addEventListener(MouseEvent.CLICK, pauseSoundModeHandler);
				pauseScreen.vibrate.addEventListener(MouseEvent.CLICK, pauseVibrateModeHandler);
				pauseIconSettings();
				
				
				//Booleans
				bDragging = false; //For Dragging and dropping hittest
				bResetDraggin = false;
				
				
				if (bSoundIsOn)
				{
					selectSound.play();
				}
				
				trace("PAUSE");
				//Native Key Handler
				bPauseIsActive = true;
			
			}
		}
		
		private function startScreenMainHandler():void 
		{
			
			//Remove Splash references
			TweenLite.killDelayedCallsTo(startScreenMainHandler);
			splashScreen.destroy();
			
			
			playScreen.x = (stage.stageWidth / 2);
			playScreen.y = (stage.stageHeight / 2);
			addChild(playScreen);
			
			//Add Start Screen
			startScreen.x = (stage.stageWidth / 2);
			startScreen.y = (stage.stageHeight / 2);
			addChild(startScreen);
			
			//Select Sound
			selectSound = new sndSelect();
			introSound = new sndIntro();
			IQSound = new sndIQ();
			levelCompleteSound = new sndLevelComplete();
			
			//Play intro 
			if (bSoundIsOn)
			{
				introSound.play();
			}
			
			bOnStartScreen = true;
			bOnGameOverScreen = false;
			bPlayingGame = false;
			//Set back to default 
			bGeniusMode = false;
			
			//Shared Object Data
			allSharedObjectData();
			
			//settings listeners for start screen // Make sure to remove all references of handlers
			startScreen.playBtn.addEventListener(MouseEvent.CLICK, removeStartScreenHandler);
			startScreen.geniusModeBtn.addEventListener(MouseEvent.CLICK, removeStartScreenHandler);
			startScreen.settings.hit.addEventListener(MouseEvent.CLICK, settingsStartHandler);
			startScreen.mcAchievements.addEventListener(MouseEvent.CLICK, achievementHandler);
			startScreen.mcLeaderboard.addEventListener(MouseEvent.CLICK, leaderboardHandler);
			startScreen.mcShare.addEventListener(MouseEvent.CLICK, shareScreenHandler);
			startScreen.mcStore.addEventListener(MouseEvent.CLICK, storeScreenHandler);
			
			//Easter Egg
			startScreen.logoInner.addEventListener(MouseEvent.CLICK, easterEggHandler);
			
			//Activate Sign in
			googlePlaySignInHandler();
			
			//clearDataHandler();
		}
		
		
		private function googlePlaySignInHandler():void 
		{
			//Activate
			if (GameServices.isSupported)
            {
            	//	Functionality here
				 if (GameServices.service.isServiceSupported( Service.GOOGLE_PLAY_GAME_SERVICES ))
                 {
                 	 service = new Service( Service.GOOGLE_PLAY_GAME_SERVICES);
					 GameServices.service.addEventListener( GameServicesEvent.INITIALISED, initialisedHandler );	
                     GameServices.service.initialiseService( service );
					 trace("GAME SERVICE INIT");

                 }
				 

                  trace("INIT");
            }else
			{
				trace("NOT SUPPORT");
			}
		
		}
		
		private function initialisedHandler(event:GameServicesEvent):void 
		{
			GameServices.service.addEventListener( GameServicesEvent.SIGN_IN_SUCCESS, 	signInSuccessHandler );
            GameServices.service.addEventListener( GameServicesEvent.SIGN_IN_FAILED, 	signInFailedHandler );
			trace("INITIALIZE");
			 if (!GameServices.service.isSignedIn())
                 {
                 	GameServices.service.signIn();

					trace("SIGN IN NOW");
                 }else
			 if (GameServices.service.isSignedIn())
				 {
					 trace("ALREADY SIGNED IN BRUH");
					 var player:Player;
			         GameServices.service.loadPlayer();
			         GameServices.service.loadPlayerIcon( player );
			         trace("SIGNED IN SUCCESS");

				 }
		}
		
		private function signInSuccessHandler( event:GameServicesEvent ):void
        {
			var player:Player;
			GameServices.service.loadPlayer();
			GameServices.service.loadPlayerIcon( player );
			trace("SIGNED IN SUCCESS");

        }

		private function signInFailedHandler( event:GameServicesEvent ):void
        {
				trace("SIGNED IN FAILED");
        }
		
		
		
		
		private function easterEggHandler(e:MouseEvent):void 
		{
			nEasterEgg ++;
			
			if (nEasterEgg >= 5)
			{
				nSparks += 10;
				updateSparksCounter();
				IQSound.play();
				nEasterEgg = 0;
			}
			
			trace("Spark Data " + nSparks);
		}
		
		private function storeScreenHandler(e:MouseEvent):void 
		{
			//Add Start Screen
			storeScreen.x = (stage.stageWidth / 2);
			storeScreen.y = (stage.stageHeight / 2);
			addChild(storeScreen);
			//Listners
			storeScreen.mcExit.addEventListener(MouseEvent.CLICK, storeScreenListeners);
			storeScreen.mcWatchAd.addEventListener(MouseEvent.CLICK, storeScreenListeners);
			
			//If on start screen show so we can recycle these listeners and no bug occurs
			if (bOnStartScreen)
			{
				//Hide background
				startScreen.logoInner.visible = false;
				startScreen.settings.visible = false;
				startScreen.colorMatch.visible = false;
				startScreen.playBtn.visible = false;
				startScreen.geniusModeBtn.visible = false;
				startScreen.mcStore.visible = false;
				startScreen.mcLeaderboard.visible = false;
				startScreen.mcAchievements.visible = false;
				startScreen.mcShare.visible = false;
			}
			
			
			
			//Select Sound
			if (bSoundIsOn)
			{
				selectSound.play();
			}
			
			//Update sparks
			allSharedObjectData();
		}
		
		private function storeScreenListeners(e:MouseEvent):void 
		{
			if (e.currentTarget == storeScreen.mcExit)
			{
				//remove screen and listeners
				storeScreen.destroy();
				storeScreen.mcExit.removeEventListener(MouseEvent.CLICK, storeScreenListeners);
				storeScreen.mcWatchAd.removeEventListener(MouseEvent.CLICK, storeScreenListeners);
				trace("EXIT");
				
				//Set back to visible once removed
				if (bOnStartScreen)
				{
					//Hide background
					startScreen.logoInner.visible = true;
					startScreen.settings.visible = true;
					startScreen.colorMatch.visible = true;
					startScreen.playBtn.visible = true;
					startScreen.geniusModeBtn.visible = true;
					startScreen.mcStore.visible = true;
					startScreen.mcLeaderboard.visible = true;
					startScreen.mcAchievements.visible = true;
					startScreen.mcShare.visible = true;
				}
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
				
			}else 
			if (e.currentTarget == storeScreen.mcWatchAd)
			{
				
				if (rewardedVideoAd.isLoaded()) //show the ad then unlock when finished watching
                {
                	// Show the ad
					rewardedVideoAd.show();
					rewardedVideoAd.addEventListener(RewardedVideoAdEvent.REWARD, rewardHandler );
					rewardedVideoAd.addEventListener(RewardedVideoAdEvent.CLOSED, closedHandlerReward);
					trace("REWARD VIDEO CAT");
                }
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
			}
		}
		
		private function rewardHandler(e:RewardedVideoAdEvent):void 
		{
			//Reward Sparks when finished watching
			nSparks += 50;
			updateSparksCounter();
			
			if (bSoundIsOn)
			{
				IQSound.play();
			}
		}
		
		private function shareScreenHandler(e:MouseEvent):void 
		{
			//Add Screen
			shareScreen.x = (stage.stageWidth / 2);
			shareScreen.y = (stage.stageHeight / 2);
			addChild(shareScreen);
			shareScreen.mcFacebook.addEventListener(MouseEvent.CLICK, shareEventHandlers);
			shareScreen.mcInstagram.addEventListener(MouseEvent.CLICK, shareEventHandlers);
			shareScreen.mcTwitter.addEventListener(MouseEvent.CLICK, shareEventHandlers);
			shareScreen.mcExit.addEventListener(MouseEvent.CLICK, shareEventHandlers);
			shareScreen.mcPrivacyPolicy.addEventListener(MouseEvent.CLICK, shareEventHandlers);
			shareScreen.mcRate.addEventListener(MouseEvent.CLICK, shareEventHandlers);
			
			//If on start screen show so we can recycle these listeners and no bug occurs
			if (bOnStartScreen)
			{
				//Hide background
				startScreen.logoInner.visible = false;
				startScreen.settings.visible = false;
				startScreen.colorMatch.visible = false;
				startScreen.playBtn.visible = false;
				startScreen.geniusModeBtn.visible = false;
				startScreen.mcStore.visible = false;
				startScreen.mcLeaderboard.visible = false;
				startScreen.mcAchievements.visible = false;
				startScreen.mcShare.visible = false;
			}
			
			if (bOnGameOverScreen)
			{
				//Hide background
				gameOverScreen.b1.visible = false;
				gameOverScreen.b2.visible = false;
				gameOverScreen.b3.visible = false;
				gameOverScreen.sparksTextField.visible = false;
				gameOverScreen.mcEndIQ.visible = false;
				gameOverScreen.currentTimeText.visible = false;
				gameOverScreen.currentLevelText.visible = false;
				gameOverScreen.bestLevelText.visible = false;
				gameOverScreen.currentTotalText.visible = false;
				gameOverScreen.currentTotalText.visible = false;
				gameOverScreen.bestTotalIQText.visible = false;
				gameOverScreen.mcGameOver.visible = false;
				gameOverScreen.mcLeaderboard.visible = false;
				gameOverScreen.mcHome.visible = false;
				gameOverScreen.mcShare.visible = false;
				gameOverScreen.mcRetry.visible = false;
				gameOverScreen.mcChallenge.visible = false;
	
			}
			
			//Select Sound
			if (bSoundIsOn)
			{
				selectSound.play();
			}
			
		}
		
		private function shareEventHandlers(e:MouseEvent):void 
		{
			if (e.currentTarget == shareScreen.mcFacebook)
			{
				var varsShare:URLVariables = new URLVariables();
                varsShare.u = 'https://play.google.com/store/apps/details?id=air.GeniusColorMatch';
                varsShare.t = 'Are you smart enough to solve the Hexagon?';
                
                var urlFacebookShare:URLRequest = new URLRequest('http://m.facebook.com/sharer.php');
                urlFacebookShare.data = varsShare;
                urlFacebookShare.method = URLRequestMethod.GET;
                
                navigateToURL(urlFacebookShare, '_blank');
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
				trace("FACEBOOK");
			}else 
			if (e.currentTarget == shareScreen.mcInstagram)
			{
				var urlInstagram:URLRequest = new URLRequest('https://www.instagram.com/fitchett_studios/');
                urlInstagram.method = URLRequestMethod.GET;
                navigateToURL(urlInstagram, '_blank');
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
				
				trace("INSTA");
			}else 
			if (e.currentTarget == shareScreen.mcTwitter)
			{
				var varsShares:URLVariables = new URLVariables();
                varsShares.v = '  https://play.google.com/store/apps/details?id=air.GeniusColorMatch';
				
                var urlTwitterShare:URLRequest = new URLRequest('https://twitter.com/intent/tweet?text=  Are you smart enough to solve the Hexagon?!');
                urlTwitterShare.data = varsShares;
                urlTwitterShare.method = URLRequestMethod.GET;
                
                navigateToURL(urlTwitterShare, '_blank');
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
			}else 
			if (e.currentTarget == shareScreen.mcExit)
			{
				shareScreen.mcFacebook.removeEventListener(MouseEvent.CLICK, shareEventHandlers);
				shareScreen.mcInstagram.removeEventListener(MouseEvent.CLICK, shareEventHandlers);
				shareScreen.mcTwitter.removeEventListener(MouseEvent.CLICK, shareEventHandlers);
				shareScreen.mcExit.removeEventListener(MouseEvent.CLICK, shareEventHandlers);
				shareScreen.mcPrivacyPolicy.removeEventListener(MouseEvent.CLICK, shareEventHandlers);
				shareScreen.mcRate.removeEventListener(MouseEvent.CLICK, shareEventHandlers);
				shareScreen.destroy();
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
				
				//Set back to visible once removed
				if (bOnStartScreen)
				{
					//Hide background
					startScreen.logoInner.visible = true;
					startScreen.settings.visible = true;
					startScreen.colorMatch.visible = true;
					startScreen.playBtn.visible = true;
					startScreen.geniusModeBtn.visible = true;
					startScreen.mcStore.visible = true;
					startScreen.mcLeaderboard.visible = true;
					startScreen.mcAchievements.visible = true;
					startScreen.mcShare.visible = true;
				}
				
				if (bOnGameOverScreen)
				{
					//Hide background
					gameOverScreen.b1.visible = true;
					gameOverScreen.b2.visible = true;
					gameOverScreen.b3.visible = true;
					gameOverScreen.sparksTextField.visible = true;
					gameOverScreen.mcEndIQ.visible = true;
					gameOverScreen.currentTimeText.visible = true;
					gameOverScreen.currentLevelText.visible = true;
					gameOverScreen.bestLevelText.visible = true;
					gameOverScreen.currentTotalText.visible = true;
					gameOverScreen.currentTotalText.visible = true;
					gameOverScreen.bestTotalIQText.visible = true;
					gameOverScreen.mcGameOver.visible = true;
					gameOverScreen.mcLeaderboard.visible = true;
					gameOverScreen.mcHome.visible = true;
					gameOverScreen.mcShare.visible = true;
					gameOverScreen.mcRetry.visible = true;
					gameOverScreen.mcChallenge.visible = true;
		
				}
			
			}else 
			if (e.currentTarget == shareScreen.mcPrivacyPolicy)
			{
				var urlPrivacy:URLRequest = new URLRequest('https://www.fitchettstudios.com/privacy-policy');
                urlPrivacy.method = URLRequestMethod.GET;
                navigateToURL(urlPrivacy, '_blank');
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
	
				trace("PRIVACY");
			}else 
			if (e.currentTarget == shareScreen.mcRate)
			{
				var urlRate:URLRequest = new URLRequest('https://play.google.com/store/apps/details?id=air.GeniusColorMatch');
                urlRate.method = URLRequestMethod.GET;
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
                
                navigateToURL(urlRate, '_blank');
				trace("RATE");
			}
		}
		
		
		private function achievementHandler(e:MouseEvent):void 
		{
			//Achievement screen wil be handled on app stores
			//Check if User has signed in
			if (GameServices.isSupported)
			{
				//ACHIEVEMENTS
				GameServices.service.achievements.displayAchievementsUI();
				trace("DIsplay the Achiev screen!");
			}
			trace("ACHEIEVEMENTS");
		}
		
		
		private function leaderboardHandler(e:MouseEvent):void 
		{
			//Check if User has signed in
			if (GameServices.isSupported)
			{
				//LEADERBOARDS
				GameServices.service.leaderboards.loadLeaderboards();
				GameServices.service.leaderboards.displayLeaderboardUI( "CgkI4_7SyqQUEAIQAA" );
			}
			trace("LEADERBOARDS");
		}
		
		private function settingsStartHandler(e:MouseEvent):void //*** create variable so if player clicks settings then goes into game you can destroy the inner listeners for GC bSettingsClicked etc
		{
			if (!bShowSettings)
			{
				bShowSettings = true;
				//have options appear
			    startScreen.settings.gotoAndPlay(2);
			    startScreen.settings.nightMode.addEventListener(MouseEvent.CLICK, nightModeHandler);
				startScreen.settings.sound.addEventListener(MouseEvent.CLICK, soundModeHandler);
				startScreen.settings.vibrate.addEventListener(MouseEvent.CLICK, vibrateModeHandler);
			}else
			if (bShowSettings)
			{
				bShowSettings = false;
				settingsReverseBtn();
				startScreen.settings.nightMode.removeEventListener(MouseEvent.CLICK, nightModeHandler);
				startScreen.settings.sound.removeEventListener(MouseEvent.CLICK, soundModeHandler);
				startScreen.settings.vibrate.removeEventListener(MouseEvent.CLICK, vibrateModeHandler);
			}
			
			
			if (bSoundIsOn)
			{
				startScreen.settings.sound.gotoAndStop(1);
			}else
			{
				startScreen.settings.sound.gotoAndStop(2);
			}
			
			if (bVibrate)
			{
				startScreen.settings.vibrate.gotoAndStop(1);
			}else
			{
				startScreen.settings.vibrate.gotoAndStop(2);
			}
				
			//Select Sound
			if (bSoundIsOn)
			{
				selectSound.play();
			}
			
		}
		
		private function vibrateModeHandler(e:MouseEvent):void 
		{
			if (bVibrate)
			{
				bVibrate = false;
				startScreen.settings.vibrate.gotoAndStop(2);
			}else
			if (!bVibrate)
			{
				bVibrate = true;
				startScreen.settings.vibrate.gotoAndStop(1);
			}
			
			//Select Sound
			if (bSoundIsOn)
			{
				selectSound.play();
			}
		}
		
		private function soundModeHandler(e:MouseEvent):void 
		{
			if (bSoundIsOn)
			{
				bSoundIsOn = false;
				startScreen.settings.sound.gotoAndStop(2);
				trace(bSoundIsOn + " bSound FALSE");
			}else
			if(!bSoundIsOn)
			{
				bSoundIsOn = true;
				startScreen.settings.sound.gotoAndStop(1);
				selectSound.play();
			}
		}
		
		private function nightModeHandler(e:MouseEvent):void 
		{
			var color:Color = new Color();
			if (!bNightModeOn)
			{
				bNightModeOn = true; // Set to true
                color.brightness = -0.4;         
                startScreen.inner.transform.colorTransform = color;
			    playScreen.backGround.transform.colorTransform = color;
				startScreen.settings.nightMode.gotoAndStop(2);
			    trace("NIGHT MODE");
				
			}else
			if (bNightModeOn)
			{
				bNightModeOn = false; //set to false turn off night mode
                color.brightness = 0;         
                startScreen.inner.transform.colorTransform = color;
			    playScreen.backGround.transform.colorTransform = color;
				startScreen.settings.nightMode.gotoAndStop(1);
			    trace("NIGHT MODE");
			}
			
			//Select Sound
			if (bSoundIsOn)
			{
				selectSound.play();
			}
			
		}
		
		private function settingsReverseBtn():void 
		{
			var settingsTimeLine = new TimelineMax();
			settingsTimeLine.to(startScreen.settings, 0.5, {frame:0})
			trace("SETTINGS REVERSE");
		}
		
	
		
		private function removeStartScreenHandler(e:MouseEvent):void 
		{
			if (e.currentTarget == startScreen.playBtn)
			{
				//Remove Listeners etc
			    startScreen.destroy();
				startScreen.playBtn.removeEventListener(MouseEvent.CLICK, removeStartScreenHandler);
				startScreen.geniusModeBtn.removeEventListener(MouseEvent.CLICK, removeStartScreenHandler);
				startScreen.settings.hit.removeEventListener(MouseEvent.CLICK, settingsStartHandler);
				startScreen.mcAchievements.removeEventListener(MouseEvent.CLICK, achievementHandler);
				startScreen.mcLeaderboard.removeEventListener(MouseEvent.CLICK, leaderboardHandler);
				startScreen.mcShare.removeEventListener(MouseEvent.CLICK, shareScreenHandler);
				startScreen.mcStore.removeEventListener(MouseEvent.CLICK, storeScreenHandler);
				startScreen.logoInner.removeEventListener(MouseEvent.CLICK, easterEggHandler);
				
				//In case not removed
				bShowSettings = false;
				settingsReverseBtn();
				startScreen.settings.nightMode.removeEventListener(MouseEvent.CLICK, nightModeHandler);
				startScreen.settings.sound.removeEventListener(MouseEvent.CLICK, soundModeHandler);
				startScreen.settings.vibrate.removeEventListener(MouseEvent.CLICK, soundModeHandler);
				
				bGeniusMode = false;
				//Play Game Handler
			   // playGameHandler(); //OLD CODE BEOFRE LEVELS
			   //*******************************************************************************************************
				addLevelScreen();
				trace("PLAY");
			}else
			if (e.currentTarget == startScreen.geniusModeBtn)
			{
				//Remove Listeners etc
			    startScreen.destroy();
				startScreen.playBtn.removeEventListener(MouseEvent.CLICK, removeStartScreenHandler);
				startScreen.geniusModeBtn.removeEventListener(MouseEvent.CLICK, removeStartScreenHandler);
				startScreen.settings.hit.removeEventListener(MouseEvent.CLICK, settingsStartHandler);
				startScreen.mcAchievements.removeEventListener(MouseEvent.CLICK, achievementHandler);
				startScreen.mcLeaderboard.removeEventListener(MouseEvent.CLICK, leaderboardHandler);
				startScreen.mcShare.removeEventListener(MouseEvent.CLICK, shareScreenHandler);
				startScreen.mcStore.removeEventListener(MouseEvent.CLICK, storeScreenHandler);
				startScreen.logoInner.removeEventListener(MouseEvent.CLICK, easterEggHandler);
				
				
				//Set Genius mode to true
				bGeniusMode = true;
				
				if (!bWatchedTutorial)
				{
					tutorialScreen = new mcTutorialScreen();
					tutorialScreen.x = (stage.stageWidth / 2);
					tutorialScreen.y = (stage.stageHeight / 2);
					addChild(tutorialScreen);
					tutorialScreen.addEventListener(MouseEvent.CLICK, tutorialScreenHandler);
				}else
				{
					//Play Game Handler
					playGameHandler();
				}
				
				trace("GENIUS MODE");
			}
			
			//Select Sound
			if (bSoundIsOn)
			{
				selectSound.play();
			}
			
		}
		
		//LEVEL HANDLER
		private function addLevelScreen():void
		{
			//Go to level progression Screen
			levelScreen = new mcLevelScreen(); // Bottom Left
			levelScreen.x = (stage.stageWidth / 2);
			levelScreen.y = (stage.stageHeight / 2);
			addChild(levelScreen);
			
			
			levelScreen.mcHome.addEventListener(MouseEvent.CLICK, levelEventHandlers);
			
			
			//Change the position of the level screen based on if the level is unlocked or not so it can stay in users focus
			if (sharedObjectLevelProgress.data.blv3Locked == false && sharedObjectLevelProgress.data.blv4Locked == null)
			{
				levelScreen.mcLevels.y = (stage.stageHeight / 2) - 200;
			}else
			if (sharedObjectLevelProgress.data.blv4Locked == false && sharedObjectLevelProgress.data.blv5Locked == null)
			{
				levelScreen.mcLevels.y = (stage.stageHeight / 2) - 400;
				trace("CHANGE SCREEN POSITION 1");
			}else
			if (sharedObjectLevelProgress.data.blv5Locked == false && sharedObjectLevelProgress.data.blv6Locked == null)
			{
				levelScreen.mcLevels.y = (stage.stageHeight / 2) - 600;
				trace("CHANGE SCREEN POSITION 2");
			}else
			if (sharedObjectLevelProgress.data.blv6Locked == false && sharedObjectLevelProgress.data.blv7Locked == null)
			{
				levelScreen.mcLevels.y = (stage.stageHeight / 2) - 800;
				trace("CHANGE SCREEN POSITION 3");
			}else
			if (sharedObjectLevelProgress.data.blv7Locked == false && sharedObjectLevelComplete.data.blv7_Complete == null)
			{
				levelScreen.mcLevels.y = (stage.stageHeight / 2) - 1000;
				trace("CHANGE SCREEN POSITION 3");
			}else
			{
				levelScreen.mcLevels.y = (stage.stageHeight / 2);
			}
			
			
			//LEVEL LISTENERS
			levelScreen.mcLevels.mcLevel1.addEventListener(MouseEvent.CLICK, levelEventHandlers);
			//Check if unlocked first
			if (sharedObjectLevelProgress.data.blv2Locked == false)
			{
				levelScreen.mcLevels.mcLevel2.addEventListener(MouseEvent.CLICK, levelEventHandlers);
			}
			
			if (sharedObjectLevelProgress.data.blv3Locked == false)
			{
				levelScreen.mcLevels.mcLevel3.addEventListener(MouseEvent.CLICK, levelEventHandlers);
			}
			
			if (sharedObjectLevelProgress.data.blv4Locked == false)
			{
				levelScreen.mcLevels.mcLevel4.addEventListener(MouseEvent.CLICK, levelEventHandlers);
			}
			
			if (sharedObjectLevelProgress.data.blv5Locked == false)
			{
				levelScreen.mcLevels.mcLevel5.addEventListener(MouseEvent.CLICK, levelEventHandlers);
			}
			
			if (sharedObjectLevelProgress.data.blv6Locked == false)
			{
				levelScreen.mcLevels.mcLevel6.addEventListener(MouseEvent.CLICK, levelEventHandlers);
			}
			
			
			if (sharedObjectLevelProgress.data.blv7Locked == false)
			{
				levelScreen.mcLevels.mcLevel7.addEventListener(MouseEvent.CLICK, levelEventHandlers);
			}
			
			
			//Level display
			nLevelDisplay = 1;
			updateLevelScreenTextDisplay();
			
			
			
			//*****************************************************************************************************************************

			trace("LEVEL 1 COMPLETE : " + sharedObjectLevelComplete.data.blv1_Complete)
			trace("LEVEL 1 FINISHED : " + sharedObjectLevelProgress.data.blv1_FINISHED)
			
			//UNLOCKED LEVEL ADD ANIMATION
			if (sharedObjectLevelComplete.data.blv1_Complete == true && sharedObjectLevelProgress.data.blv1_FINISHED == null ) //Add another boolean so wont repeeat
			{
				TweenMax.to(levelScreen.mcLevels.mcLevel1.stars.complete, 0.4, {delay: 0.5, scaleX:1.8, scaleY:1.8, ease:Back.easeInOut}); 
				
				//Star Animation 
				TweenMax.to(levelScreen.mcLevels.mcLevel1.stars.starLeft, 0.3, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
				TweenMax.to(levelScreen.mcLevels.mcLevel1.stars.starMiddle, 0.4, {scaleX:1.4, scaleY:1.4, ease:Back.easeOut, repeat:1, yoyo:true}); 
				TweenMax.to(levelScreen.mcLevels.mcLevel1.stars.starRight, 0.3, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
				
				
				blv1_FINISHED = true;
				sharedObjectLevelProgress.data.blv1_FINISHED = blv1_FINISHED;
				sharedObjectLevelProgress.flush();  
				
				//Do the next level hex Animation
				TweenMax.to(levelScreen.mcLevels.mcLevel2, 0.3, {delay: 0.8, scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); //NEXT LEVEL
				
				//Play Level Complete Sound
				if (bSoundIsOn)
				{
					levelCompleteSound.play();
				}
				
				//update level text
				nLevelsText = 2;
				updateLevelScreenText();
				
				//Confetti
				confettiHandler();
				
				//Unlock Achievement starting 
				if (GameServices.isSupported)
				{
					// Achievements functionality is supported  
					GameServices.service.achievements.achievementUnlock( "CgkI4_7SyqQUEAIQAQ" );
					trace("SUPPORT ACHIEVEMENTS");
				}
			
			
			
				trace("DO ANIMATION LEVEL 1");
			}
			
			//UNLOCKED LEVEL ADD ANIMATION LEVEL 2
			if (sharedObjectLevelComplete.data.blv2_Complete == true && sharedObjectLevelProgress.data.blv2_FINISHED == null )
			{
				TweenMax.to(levelScreen.mcLevels.mcLevel2.stars.complete, 0.5, {delay: 0.4, scaleX:1.8, scaleY:1.8, ease:Back.easeInOut}); 
				
				//Star Animation 
				TweenMax.to(levelScreen.mcLevels.mcLevel2.stars.starLeft, 0.3, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
				TweenMax.to(levelScreen.mcLevels.mcLevel2.stars.starMiddle, 0.4, {scaleX:1.4, scaleY:1.4, ease:Back.easeOut, repeat:1, yoyo:true}); 
				TweenMax.to(levelScreen.mcLevels.mcLevel2.stars.starRight, 0.3, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
				
				
				blv2_FINISHED = true;
				sharedObjectLevelProgress.data.blv2_FINISHED = blv2_FINISHED;
				sharedObjectLevelProgress.flush();  
				
				//Do the next level hex Animation
				TweenMax.to(levelScreen.mcLevels.mcLevel3, 0.3, {delay: 0.8, scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); //NEXT LEVEL
				
				//update level text
				nLevelsText = 3;
				updateLevelScreenText();
				
				//Confetti
				confettiHandler();
				
				//Play Level Complete Sound
				if (bSoundIsOn)
				{
					levelCompleteSound.play();
				}
				
				//Unlock Achievement starting 
				if (GameServices.isSupported)
				{
					// Achievements functionality is supported  
					GameServices.service.achievements.achievementUnlock( "CgkI4_7SyqQUEAIQAg" );
					trace("SUPPORT ACHIEVEMENTS");
				}
				trace("DO ANIMATION LEVEL 2");
			}
			
			//UNLOCKED LEVEL ADD ANIMATION LEVEL 3
			if (sharedObjectLevelComplete.data.blv3_Complete == true && sharedObjectLevelProgress.data.blv3_FINISHED == null )
			{
				TweenMax.to(levelScreen.mcLevels.mcLevel3.stars.complete, 0.5, {delay: 0.4, scaleX:1.8, scaleY:1.8, ease:Back.easeInOut}); 
				
				//Star Animation 
				TweenMax.to(levelScreen.mcLevels.mcLevel3.stars.starLeft, 0.3, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
				TweenMax.to(levelScreen.mcLevels.mcLevel3.stars.starMiddle, 0.4, {scaleX:1.4, scaleY:1.4, ease:Back.easeOut, repeat:1, yoyo:true}); 
				TweenMax.to(levelScreen.mcLevels.mcLevel3.stars.starRight, 0.3, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
				
				
				blv3_FINISHED = true;
				sharedObjectLevelProgress.data.blv3_FINISHED = blv3_FINISHED;
				sharedObjectLevelProgress.flush();  
				
				//Do the next level hex Animation
				TweenMax.to(levelScreen.mcLevels.mcLevel4, 0.3, {delay: 0.8, scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); //NEXT LEVEL
				
				//update level text
				nLevelsText = 4;
				updateLevelScreenText();
				
				//Confetti
				confettiHandler();
				
				
				//Play Level Complete Sound
				if (bSoundIsOn)
				{
					levelCompleteSound.play();
				}
				
				//Unlock Achievement starting 
				if (GameServices.isSupported)
				{
					// Achievements functionality is supported  
					GameServices.service.achievements.achievementUnlock( "CgkI4_7SyqQUEAIQAw" );
					trace("SUPPORT ACHIEVEMENTS");
				}
				
				
				trace("DO ANIMATION LEVEL 3");
			}
			
			
			//UNLOCKED LEVEL ADD ANIMATION LEVEL 4
			if (sharedObjectLevelComplete.data.blv4_Complete == true && sharedObjectLevelProgress.data.blv4_FINISHED == null )
			{
				TweenMax.to(levelScreen.mcLevels.mcLevel4.stars.complete, 0.5, {delay: 0.4, scaleX:1.8, scaleY:1.8, ease:Back.easeInOut}); 
				
				//Star Animation 
				TweenMax.to(levelScreen.mcLevels.mcLevel4.stars.starLeft, 0.3, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
				TweenMax.to(levelScreen.mcLevels.mcLevel4.stars.starMiddle, 0.4, {scaleX:1.4, scaleY:1.4, ease:Back.easeOut, repeat:1, yoyo:true}); 
				TweenMax.to(levelScreen.mcLevels.mcLevel4.stars.starRight, 0.3, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
				
				
				blv4_FINISHED = true;
				sharedObjectLevelProgress.data.blv4_FINISHED = blv4_FINISHED;
				sharedObjectLevelProgress.flush();  
				
				//Do the next level hex Animation
				TweenMax.to(levelScreen.mcLevels.mcLevel5, 0.3, {delay: 0.8, scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); //NEXT LEVEL
				
				//update level text
				nLevelsText = 5;
				updateLevelScreenText();
				
				//Confetti
				confettiHandler();
				
				//Play Level Complete Sound
				if (bSoundIsOn)
				{
					levelCompleteSound.play();
				}
				
					//Unlock Achievement starting 
				if (GameServices.isSupported)
				{
					// Achievements functionality is supported  
					GameServices.service.achievements.achievementUnlock( "CgkI4_7SyqQUEAIQBA" );
					trace("SUPPORT ACHIEVEMENTS");
				}
				
				trace("DO ANIMATION LEVEL 4");
			}
			
			//UNLOCKED LEVEL ADD ANIMATION LEVEL 5
			if (sharedObjectLevelComplete.data.blv5_Complete == true && sharedObjectLevelProgress.data.blv5_FINISHED == null )
			{
				TweenMax.to(levelScreen.mcLevels.mcLevel5.stars.complete, 0.5, {delay: 0.4, scaleX:1.8, scaleY:1.8, ease:Back.easeInOut}); 
				
				//Star Animation 
				TweenMax.to(levelScreen.mcLevels.mcLevel5.stars.starLeft, 0.3, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
				TweenMax.to(levelScreen.mcLevels.mcLevel5.stars.starMiddle, 0.4, {scaleX:1.4, scaleY:1.4, ease:Back.easeOut, repeat:1, yoyo:true}); 
				TweenMax.to(levelScreen.mcLevels.mcLevel5.stars.starRight, 0.3, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
				
				
				blv5_FINISHED = true;
				sharedObjectLevelProgress.data.blv5_FINISHED = blv5_FINISHED;
				sharedObjectLevelProgress.flush();  
				
				//Do the next level hex Animation
				TweenMax.to(levelScreen.mcLevels.mcLevel6, 0.3, {delay: 0.8, scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); //NEXT LEVEL
				
				//update level text
				nLevelsText = 6;
				updateLevelScreenText();
				
				//Confetti
				confettiHandler();
				
				//Play Level Complete Sound
				if (bSoundIsOn)
				{
					levelCompleteSound.play();
				}
				
					//Unlock Achievement starting 
				if (GameServices.isSupported)
				{
					// Achievements functionality is supported  
					GameServices.service.achievements.achievementUnlock( "CgkI4_7SyqQUEAIQBQ" );
					trace("SUPPORT ACHIEVEMENTS");
				}
				trace("DO ANIMATION LEVEL 5");
			}
			
			//UNLOCKED LEVEL ADD ANIMATION LEVEL 6
			if (sharedObjectLevelComplete.data.blv6_Complete == true && sharedObjectLevelProgress.data.blv6_FINISHED == null )
			{
				TweenMax.to(levelScreen.mcLevels.mcLevel6.stars.complete, 0.5, {delay: 0.4, scaleX:1.8, scaleY:1.8, ease:Back.easeInOut}); 
				
				//Star Animation 
				TweenMax.to(levelScreen.mcLevels.mcLevel6.stars.starLeft, 0.3, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
				TweenMax.to(levelScreen.mcLevels.mcLevel6.stars.starMiddle, 0.4, {scaleX:1.4, scaleY:1.4, ease:Back.easeOut, repeat:1, yoyo:true}); 
				TweenMax.to(levelScreen.mcLevels.mcLevel6.stars.starRight, 0.3, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
				
				
				blv6_FINISHED = true;
				sharedObjectLevelProgress.data.blv6_FINISHED = blv6_FINISHED;
				sharedObjectLevelProgress.flush();  
				
				//Do the next level hex Animation
				TweenMax.to(levelScreen.mcLevels.mcLevel7, 0.3, {delay: 0.8, scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); //NEXT LEVEL
				
				//update level text
				nLevelsText = 7;
				updateLevelScreenText();
				
				//Confetti
				confettiHandler();
				
				//Play Level Complete Sound
				if (bSoundIsOn)
				{
					levelCompleteSound.play();
				}
				
					//Unlock Achievement starting 
				if (GameServices.isSupported)
				{
					// Achievements functionality is supported  
					GameServices.service.achievements.achievementUnlock( "CgkI4_7SyqQUEAIQBg" );
					trace("SUPPORT ACHIEVEMENTS");
				}
				trace("DO ANIMATION LEVEL 6");
			}
			
			//UNLOCKED LEVEL ADD ANIMATION LEVEL 7
			if (sharedObjectLevelComplete.data.blv7_Complete == true && sharedObjectLevelProgress.data.blv7_FINISHED == null ) //FINAL LEVEL DO CONFETTI 
			{
				TweenMax.to(levelScreen.mcLevels.mcLevel7.stars.complete, 0.5, {delay: 0.4, scaleX:1.8, scaleY:1.8, ease:Back.easeInOut}); 
				
				//Star Animation 
				TweenMax.to(levelScreen.mcLevels.mcLevel7.stars.starLeft, 0.3, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
				TweenMax.to(levelScreen.mcLevels.mcLevel7.stars.starMiddle, 0.4, {scaleX:1.4, scaleY:1.4, ease:Back.easeOut, repeat:1, yoyo:true}); 
				TweenMax.to(levelScreen.mcLevels.mcLevel7.stars.starRight, 0.3, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
				
				
				blv7_FINISHED = true;
				sharedObjectLevelProgress.data.blv7_FINISHED = blv7_FINISHED;
				sharedObjectLevelProgress.flush();  
				
				
				//Confetti
				confettiHandler();
				
				//Play Level Complete Sound
				if (bSoundIsOn)
				{
					levelCompleteSound.play();
				}
				
					//Unlock Achievement starting 
				if (GameServices.isSupported)
				{
					// Achievements functionality is supported  
					GameServices.service.achievements.achievementUnlock( "CgkI4_7SyqQUEAIQBw" );
					trace("SUPPORT ACHIEVEMENTS");
				}
				trace("DO ANIMATION LEVEL 7");
			}
			
		
			//Level screen boolean for native pause handler
			bLevelScreenActive = true;
			
			allSharedObjectData();
			
			//update text
			updateLevelScreenText();
			
			
			//If game is active then use variables to remove objects on screen. 
			if (bPlayingGame)
			{
				//Remove listerners
				removeEventListener(Event.ENTER_FRAME, engineLogic);
				
				//Destroy hexes
				for (var i:int = 0; i < aHexColorArray.length; i++)
			    {
			    	var allHexColors = aHexColorArray[i];
			    	
			    	aHexColorArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, dragHex);
			    	aHexColorArray[i].removeEventListener(MouseEvent.MOUSE_UP, dropHex);
			    	
			    	allHexColors.destroy();
			    	allHexColors = null;
			    	//aHexColorArray = [];
					trace("HEX ARRAY  AFTER" + aMainHexArray.length);
			    }
			    //Remove Main hexes
			    for (var k:int = 0; k < aMainHexArray.length; k++)
			    {
			    	var allHexs = aMainHexArray[k];
			    	
			    	allHexs.destroy();
			    	allHexs = null;
			    	//aMainHexArray = [];
					trace("ALL HEXES DESTROY");
			    }
				
			
				//Spark display
				playScreen.sparkDisplay.gotoAndStop(1);
			    playScreen.sparkDisplay.innerSpark.gotoAndStop(1);
				
				//Display
				playScreen.display.y -= 110;
				
				//Remove Reset hex
			    resetHex.destroy();	
				
				trace("LEVEL COMPLETE LISTENERS REMOVED");
				//Set back to false
				bPlayingGame = false;
		
			}
			
		}
		
		private function destroyLevelScreenListeners():void
		{
			//Destroy Listeners and Screen ADD THE REST LATER
			levelScreen.mcLevels.mcLevel1.removeEventListener(MouseEvent.CLICK, levelEventHandlers);
			levelScreen.mcLevels.mcLevel2.removeEventListener(MouseEvent.CLICK, levelEventHandlers);
			levelScreen.mcLevels.mcLevel3.removeEventListener(MouseEvent.CLICK, levelEventHandlers);
			levelScreen.mcLevels.mcLevel4.removeEventListener(MouseEvent.CLICK, levelEventHandlers);
			levelScreen.mcLevels.mcLevel5.removeEventListener(MouseEvent.CLICK, levelEventHandlers);
			levelScreen.mcLevels.mcLevel6.removeEventListener(MouseEvent.CLICK, levelEventHandlers);
			levelScreen.mcLevels.mcLevel7.removeEventListener(MouseEvent.CLICK, levelEventHandlers);
			levelScreen.mcHome..removeEventListener(MouseEvent.CLICK, levelEventHandlers);
			levelScreen.destroy();
		}
		
		private function levelEventHandlers(e:MouseEvent):void 
		{
			if (e.currentTarget == levelScreen.mcLevels.mcLevel1)
			{
				//Destroy Listeners and Screen
				destroyLevelScreenListeners();
				
				nLevel = 1;
				bLevel_1 = true;
				bLevel_2 = false;
				bLevel_3 = false;
				bLevel_4 = false;
				bLevel_5 = false;
				bLevel_6 = false;
				bLevel_7 = false;
				
				if (bConfettiActive)
				{
					stopConfettiHandler();
					bConfettiActive = false;
				}
				
				//Tutorial screen
				if (!bWatchedTutorial)
				{
					tutorialScreen = new mcTutorialScreen();
					tutorialScreen.x = (stage.stageWidth / 2);
					tutorialScreen.y = (stage.stageHeight / 2);
					addChild(tutorialScreen);
					tutorialScreen.addEventListener(MouseEvent.CLICK, tutorialScreenHandler);
				}else
				{
					//PLAY  GAME
					playGameHandler();
					//Add first hex
					addHexhandler();
				}
				
				
				
				trace("LEVEL 1 PLAY");
			}else 
			if (e.currentTarget == levelScreen.mcLevels.mcLevel2)
			{
				//Destroy Listeners and Screen
				destroyLevelScreenListeners();
				
				nLevel = 2;
				bLevel_1 = false;
				bLevel_2 = true;
				bLevel_3 = false;
				bLevel_4 = false;
				bLevel_5 = false;
				bLevel_6 = false;
				bLevel_7 = false;
				
				if (bConfettiActive)
				{
					stopConfettiHandler();
					bConfettiActive = false;
				}
				
				//PLAY  GAME
				playGameHandler();
				
				addHexhandler();
				
				trace("LEVEL 2 PLAY");
			}else 
			if (e.currentTarget == levelScreen.mcLevels.mcLevel3)
			{
				//Destroy Listeners and Screen
				destroyLevelScreenListeners();
				
				nLevel = 3;
				bLevel_1 = false;
				bLevel_2 = false;
				bLevel_3 = true;
				bLevel_4 = false;
				bLevel_5 = false;
				bLevel_6 = false;
				bLevel_7 = false;
				
				if (bConfettiActive)
				{
					stopConfettiHandler();
					bConfettiActive = false;
				}
				
				//PLAY  GAME
				playGameHandler();
				
				addHexhandler();
				
				//Add additional hexes
				addChild(hex_2);
				
				trace("LEVEL 2 PLAY");
			}else 
			if (e.currentTarget == levelScreen.mcLevels.mcLevel4)
			{
				//Destroy Listeners and Screen
				destroyLevelScreenListeners();
				
				nLevel = 4;
				bLevel_1 = false;
				bLevel_2 = false;
				bLevel_3 = false;
				bLevel_4 = true;
				bLevel_5 = false;
				bLevel_6 = false;
				bLevel_7 = false;
				
				if (bConfettiActive)
				{
					stopConfettiHandler();
					bConfettiActive = false;
				}
				
				//PLAY  GAME
				playGameHandler();
				
				addHexhandler();
				
				//Add additional hexes
				addChild(hex_2);
				addChild(hex_3);
				
				trace("LEVEL 2 PLAY");
			}else 
			if (e.currentTarget == levelScreen.mcLevels.mcLevel5)
			{
				//Destroy Listeners and Screen
				destroyLevelScreenListeners();
				
				nLevel = 5;
				bLevel_1 = false;
				bLevel_2 = false;
				bLevel_3 = false;
				bLevel_4 = false;
				bLevel_5 = true;
				bLevel_6 = false;
				bLevel_7 = false;
				
				if (bConfettiActive)
				{
					stopConfettiHandler();
					bConfettiActive = false;
				}
				
				//PLAY  GAME
				playGameHandler();
				
				addHexhandler();
				
				//Add additional hexes
				addChild(hex_2);
				addChild(hex_3);
				addChild(hex_4);
				
				trace("LEVEL 2 PLAY");
			}else 
			if (e.currentTarget == levelScreen.mcLevels.mcLevel6)
			{
				//Destroy Listeners and Screen
				destroyLevelScreenListeners();
				
				nLevel = 6;
				bLevel_1 = false;
				bLevel_2 = false;
				bLevel_3 = false;
				bLevel_4 = false;
				bLevel_5 = false;
				bLevel_6 = true;
				bLevel_7 = false;
				
				if (bConfettiActive)
				{
					stopConfettiHandler();
					bConfettiActive = false;
				}
				
				//PLAY  GAME
				playGameHandler();
				
				addHexhandler();
				
				//Add additional hexes
				addChild(hex_2);
				addChild(hex_3);
				addChild(hex_4);
				addChild(hex_5);
				
				
				trace("LEVEL 2 PLAY");
			}else 
			if (e.currentTarget == levelScreen.mcLevels.mcLevel7)
			{
				//Destroy Listeners and Screen
				destroyLevelScreenListeners();
				
				nLevel = 7;
				bLevel_1 = false;
				bLevel_2 = false;
				bLevel_3 = false;
				bLevel_4 = false;
				bLevel_5 = false;
				bLevel_6 = false;
				bLevel_7 = true;
				
				if (bConfettiActive)
				{
					stopConfettiHandler();
					bConfettiActive = false;
				}
				
				//PLAY  GAME
				playGameHandler();
				
				addHexhandler();
				
				//Add additional hexes
				addChild(hex_2);
				addChild(hex_3);
				addChild(hex_4);
				addChild(hex_5);
				addChild(hex_6);
				
				trace("LEVEL 2 PLAY");
			}if (e.currentTarget == levelScreen.mcHome)
			{
				//Destroy Listeners and Screen
				destroyLevelScreenListeners();
				
				if (bConfettiActive)
				{
					stopConfettiHandler();
					bConfettiActive = false;
				}
				
				//Main start screen
				startScreenMainHandler();
			}
		}
		
		private function tutorialScreenHandler(e:MouseEvent):void 
		{
			//Incremenet
			nClick ++;
			//Go to frame
			tutorialScreen.gotoAndStop(nClick);
			
			if (nClick >= 4)
			{
				//Remove Tut screen
				tutorialScreen.destroy();
				tutorialScreen.removeEventListener(MouseEvent.CLICK, tutorialScreenHandler);
				
				if (bGeniusMode)
				{
					//PLAY  GAME
					playGameHandler();
				}else
				{
					//PLAY  GAME
					playGameHandler();
					//Add Hex
					addHexhandler();
				}
				
			}
			
			//Save Data
			bWatchedTutorial = true;
			sharedObjectTutorial.data.bWatchedTutorial = bWatchedTutorial;
			sharedObjectTutorial.flush();
			
		}
		
		private function playGameHandler():void // Main Game Start Function
		{
			
			//Add Main Hex
			hex_7 = new mcHex7(); // Top Right
			hex_7.x = (stage.stageWidth / 2);
			hex_7.y = (stage.stageHeight / 2);
			//addChild(hex_7);
			//TweenLite.to(hex_7, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
			
			
			hex_6 = new mcHex6(); // Bottom Left
			hex_6.x = (stage.stageWidth / 2);
			hex_6.y = (stage.stageHeight / 2);
			//addChild(hex_6);
			//TweenLite.to(hex_6, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
			
			
			hex_5 = new mcHex5(); // Bottom Left
			hex_5.x = (stage.stageWidth / 2);
			hex_5.y = (stage.stageHeight / 2);
			//addChild(hex_5);
			//TweenLite.to(hex_5, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
			
		    hex_4 = new mcHex4(); // Top
			hex_4.x = (stage.stageWidth / 2);
			hex_4.y = (stage.stageHeight / 2);
			//addChild(hex_4);
			//TweenLite.to(hex_4, 1.2, {y:(stage.stageHeight / 2) - 118, ease:Back.easeOut});

			hex_3 = new mcHex3(); //Bottom Right
			hex_3.x = (stage.stageWidth / 2);
			hex_3.y = (stage.stageHeight / 2);
			//addChild(hex_3);
			//TweenLite.to(hex_3, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
			
			hex_2 = new mcHex2(); //Bottom
			hex_2.x = (stage.stageWidth / 2);
			hex_2.y = (stage.stageHeight / 2);
			//addChild(hex_2);
			//TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
			
			hex_1 = new mcHex(); //Middle
			hex_1.x = (stage.stageWidth / 2);
			hex_1.y = (stage.stageHeight / 2);
			hex_1.alpha = 0;
			addChild(hex_1);
			TweenLite.to(hex_1, 2.00, {alpha: 1});
			

			//Container for rotation if wanting to add rotation or whole movement of all Hexs container.addchild(aMainHexArray); ..... etc
			//hexContainer = new MovieClip;
			//addChild(hexContainer);
			
			//IQ display variables
			playScreen.display.mcIQlevel.gotoAndStop(1);
			playScreen.display.mcIQlevel.alpha = 0;
			TweenLite.to(playScreen.display.mcIQlevel, 1.5, {alpha:1, delay: 1.0});
			
			//Numbers
			nSoundEffect = 1;
			nCorrectMatch = 0;

			//Color timer before grey out
			nColorTimer = 2.5; //start off Fast
			
			
			if (bGeniusMode)
			{
				nLevel = 1; // Set default unless level mode
				nLevelData = 1;
				nColorTimer = 2.5; //start off Fast
			}
			
			nIncrease = 1; // For IQ Display Change
			nLevelIQ = 1;
			totalIQ = 20; // For adding up IQ in algorithm function start at 20 for level 1
			nUsedSparks = 0;
			nMatchingCounter = 0;
			
			
		    //Timer variables
			tCountTimer = new Timer(100);
            tCountTimer.addEventListener(TimerEvent.TIMER, timerTickHandler);
			timerCount = 0;
			
			tCountIQTimer = new Timer(100);
			tCountIQTimer.addEventListener(TimerEvent.TIMER, iQTickHandler);
			timerCountIQ = 0;
			
			
			//set Time back to 0
			playScreen.display.timerTextField.text = "00:00:0";
			
			//Tween Play sceen display and Spark Display
			if (!bGeniusMode)
			{
				TweenLite.delayedCall(1.0, sparkInnerTween);
				playScreen.sparkText.alpha = 0;
				playScreen.sparkDisplay.alpha = 0;
				TweenLite.to(playScreen.sparkDisplay, 1.5, {alpha:1, ease:Back.easeOut, onComplete:displayTweenHandler});
				playScreen.sparkDisplay.visible = true;
				
				//Update text fields
				updateLevelScreenTextDisplay();
			}else
			{
				playScreen.sparkDisplay.visible = false;
				
				//Update text fields
				updatelevelTextField();
			}
			
			
			TweenLite.to(playScreen.display, 1.0, {y:playScreen.display.y + 110 , ease:Back.easeInOut});
			
			//Sounds
			matchSound_1 = new sndMatch1();
			matchSound_2 = new sndMatch2();
			matchSound_3 = new sndMatch3();
			matchSound_4 = new sndMatch4();
			matchSound_5 = new sndMatch5();
			matchSound_6 = new sndMatch6();
			matchSound_7 = new sndMatch7();
			matchComplete = new sndMatchComplete(); // Finished
			addHexSound = new sndAddhex();
			hexSelectSound = new sndHexSelect();
			hexSwitchSound = new sndSwitch();
			gameOverSound = new sndGameOver();
			resetSound = new sndReset();
			levelCompleteSound = new sndLevelComplete();
			
			aMainHexFrameArray = new Array();
			aHexColorArray = new Array();
			aMainHexArray = new Array()
			
			//Instantiate Hex Color Array
			aMainHexFrameArray = [2, 3, 4, 5, 6, 7, 8]; //These are the Frame Numbers for the main hex
			//Color Array for interactive Hex's to Drag and Drop Make Only one color first
			aHexColorArray = [orangeHex, redHex, blueHex, yellowHex, whiteHex, greenHex, purpleHex]; 
			
			
			// Default Confetti shapes
            c = new Confetti({width:stage.stageWidth, height:stage.stageHeight, colors:[0x003399, 0xcc0000, 0xcccc00, 0x00de00, 0x00dece], maxPieces:50, speed: 4});

			
			//Booleans
			bDragging = false; //For Dragging and dropping hittest
			bResetDraggin = false;
			
			if (bGeniusMode)
			{
				bLevel_1 = true;
				bLevel_2 = false;
				bLevel_3 = false;
				bLevel_4 = false;
				bLevel_5 = false;
				bLevel_6 = false;
				bLevel_7 = false;
			}
			
			//bSoundIsOn = true; // change with shared object 
			
			//For Bug
			bBlueHex = false;
		    bRedHex = false;
		    bPurpleHex = false;
		    bGreenHex = false;
		    bWhiteHex = false;
		    bYellowHex = false;
		    bOrangeHex = false;
			
			//Add Hexs in array
			if (bGeniusMode)
			{
				addHexhandler();
			}
			
		
			trace("CURRENT LEVEL 1 is " + bLevel_1);
			trace("GENIUS MODE  is " + bGeniusMode);
			//Screen Booleans
			bOnStartScreen = false;
			bOnGameOverScreen = false;
			bPlayingGame = true;
			bLevelScreenActive = false;
			
			bConfettiActive = false;
			
			
			updateSparksCounter();
			

			
			//ADVERTISEMENTS HIDE
			if (Adverts.isSupported)
			{
				//hide ad during game
				adView.hide();
				bannerAdsHandler();
			}
			
			//Pause Handler
			playScreen.display.pause.addEventListener(MouseEvent.CLICK, pauseHandler);
 

		}
		
		private function testingGameBugs():void
		{
			bLevel_7 = true;
			nLevel = 12;
			
			aMainHexFrameArray = [2, 3, 4, 5, 6, 7, 8];
			aMainHexArray = [hex_1, hex_2, hex_3, hex_4, hex_5, hex_6, hex_7];
			addChild(hex_7);
			addChild(hex_6);
			addChild(hex_5);
			addChild(hex_4);
			addChild(hex_3);
			addChild(hex_2);
			TweenLite.to(hex_7, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
			TweenLite.to(hex_6, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
			TweenLite.to(hex_5, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
			TweenLite.to(hex_4, 1.2, {y:(stage.stageHeight / 2) - 118, ease:Back.easeOut});
			TweenLite.to(hex_3, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
			TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
			TweenLite.to(hex_1, 1.0, {y:(stage.stageHeight / 2), x:(stage.stageWidth / 2), ease:Back.easeOut});
			

			
			randomColorGenerator();
			
		}
		
		private function pauseHandler(e:MouseEvent):void 
		{
			//if timer is active then stop it 
			tCountTimer.stop();
			tCountIQTimer.stop();
			
			//Stop all controls
			removeEventListener(Event.ENTER_FRAME, engineLogic);
			//HIDE ALL OBJECTS
			for (var i:int = 0; i < aHexColorArray.length; i++)
			{
				var allHexColors = aHexColorArray[i];
				
				allHexColors.visible = false;
			}
			//Remove Main hexes
			for (var k:int = 0; k < aMainHexArray.length; k++)
			{
				var allHexs = aMainHexArray[k];
				
				allHexs.visible = false;
			}
			//make objects invisible
			playScreen.display.visible = false;
			
			if (!bGeniusMode)
			{
				playScreen.sparkDisplay.visible = false;
				
				//Reset hide
				resetHex.visible = false;
			
			}
			
			//Add pause screen
			pauseScreen.x = (stage.stageWidth / 2);
			pauseScreen.y = (stage.stageHeight / 2);
			addChild(pauseScreen);
			pauseScreen.mcPlay.addEventListener(MouseEvent.CLICK, pauseControls);
			pauseScreen.mcHome.addEventListener(MouseEvent.CLICK, pauseControls);
			pauseScreen.mcRetry.addEventListener(MouseEvent.CLICK, pauseControls);
			
			//For SOUNDS, VIBRATION AND NIGHT MODE
			pauseScreen.nightMode.addEventListener(MouseEvent.CLICK, pauseNightModeHandler);
			pauseScreen.sound.addEventListener(MouseEvent.CLICK, pauseSoundModeHandler);
			pauseScreen.vibrate.addEventListener(MouseEvent.CLICK, pauseVibrateModeHandler);
			pauseIconSettings();
			
			//Booleans
			bDragging = false; //For Dragging and dropping hittest
			bResetDraggin = false;

			
			
			if (bSoundIsOn)
			{
				selectSound.play();
			}
		}
		
		private function pauseVibrateModeHandler(e:MouseEvent):void 
		{
			if (bVibrate)
			{
				bVibrate = false;
				pauseScreen.vibrate.gotoAndStop(2);
			}else
			if (!bVibrate)
			{
				bVibrate = true;
				pauseScreen.vibrate.gotoAndStop(1);
				Vibration.service.vibrate( 200 );
			}
			
			//Select Sound
			if (bSoundIsOn)
			{
				selectSound.play();
			}
		}
		
		private function pauseSoundModeHandler(e:MouseEvent):void 
		{
			if (bSoundIsOn)
			{
				bSoundIsOn = false;
				pauseScreen.sound.gotoAndStop(2);
				trace(bSoundIsOn + " bSound FALSE");
			}else
			if(!bSoundIsOn)
			{
				bSoundIsOn = true;
				pauseScreen.sound.gotoAndStop(1);
				selectSound.play();
			}
		}
		
		private function pauseNightModeHandler(e:MouseEvent):void 
		{
			var color:Color = new Color();
			if (!bNightModeOn)
			{
				bNightModeOn = true; // Set to true
                color.brightness = -0.4;         
                startScreen.inner.transform.colorTransform = color;
			    playScreen.backGround.transform.colorTransform = color;
				pauseScreen.nightMode.gotoAndStop(2);
			    trace("NIGHT MODE");
				
			}else
			if (bNightModeOn)
			{
				bNightModeOn = false; //set to false turn off night mode
                color.brightness = 0;         
                startScreen.inner.transform.colorTransform = color;
			    playScreen.backGround.transform.colorTransform = color;
				pauseScreen.nightMode.gotoAndStop(1);
			    trace("NIGHT MODE");
			}
			
			trace("NIGHT MODE" + bNightModeOn);
			//Select Sound
			if (bSoundIsOn)
			{
				selectSound.play();
			}
		}
		
		private function pauseIconSettings():void
		{
			if (bSoundIsOn)
			{
				pauseScreen.sound.gotoAndStop(1);
			}else
			{
				pauseScreen.sound.gotoAndStop(2);
			}
			
			if (bVibrate)
			{
				pauseScreen.vibrate.gotoAndStop(1);
			}else 
			{
				pauseScreen.vibrate.gotoAndStop(2);
			}
			
			if (bNightModeOn)
			{
				pauseScreen.nightMode.gotoAndStop(2);
			}else 
			{
				pauseScreen.nightMode.gotoAndStop(1);
			}
			
			trace("NIGHT MODE" + bNightModeOn);
		}
		
		private function pauseControls(e:MouseEvent):void 
		{
			if (e.currentTarget == pauseScreen.mcPlay) // CONTINUE*******************************
			{
				//destroy pause screen
				pauseScreen.destroy();
				pauseScreen.mcPlay.removeEventListener(MouseEvent.CLICK, pauseControls);
				pauseScreen.mcHome.removeEventListener(MouseEvent.CLICK, pauseControls);
				pauseScreen.mcRetry.removeEventListener(MouseEvent.CLICK, pauseControls);
				addEventListener(Event.ENTER_FRAME, engineLogic);
				//Show Objects
			    for (var i:int = 0; i < aHexColorArray.length; i++)
			    {
			    	var allHexColors = aHexColorArray[i];
			    	
			    	allHexColors.visible = true;
			    }
			    //Remove Main hexes
			    for (var k:int = 0; k < aMainHexArray.length; k++)
			    {
			    	var allHexs = aMainHexArray[k];
			    	
			    	allHexs.visible = true;
			    }
			    //Reset hide
			    resetHex.visible = true;
				playScreen.display.visible = true;
				
				if (!bGeniusMode)
				{
					playScreen.sparkDisplay.visible = true;
				}
			   
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
				
			}else
			if (e.currentTarget == pauseScreen.mcRetry) //Reset everthing and restart  RESTART*******************************
			{
				
				//destroy pause screen
				pauseScreen.destroy();
				pauseScreen.mcPlay.removeEventListener(MouseEvent.CLICK, pauseControls);
				pauseScreen.mcHome.removeEventListener(MouseEvent.CLICK, pauseControls);
				pauseScreen.mcRetry.removeEventListener(MouseEvent.CLICK, pauseControls);

				
				for (i = 0; i < aHexColorArray.length; i++)
			    {
			    	allHexColors = aHexColorArray[i];
			    	
			    	aHexColorArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, dragHex);
			    	aHexColorArray[i].removeEventListener(MouseEvent.MOUSE_UP, dropHex);
			    	
			    	allHexColors.destroy();
			    	allHexColors = null;
			    	//aHexColorArray = [];
			    }
			    //Remove Main hexes
			    for (k = 0; k < aMainHexArray.length; k++)
			    {
			    	allHexs = aMainHexArray[k];
			    	
			    	allHexs.destroy();
			    	allHexs = null;
			    	//aMainHexArray = [];
			    }
			    
				//Show Objects
			    for (i = 0; i < aHexColorArray.length; i++)
			    {
			    	allHexColors = aHexColorArray[i];
			    	
			    	allHexColors.visible = true;
			    }
				
			    for (k = 0; k < aMainHexArray.length; k++)
			    {
			    	allHexs = aMainHexArray[k];
			    	
			    	allHexs.visible = true;
			    }
			    //Reset hide
			    resetHex.visible = true;
				playScreen.display.visible = true;
				
				
				//Clear arrays function
				clearArrays();

			    if (!bGeniusMode)
				{
					playScreen.sparkDisplay.visible = true;
					
					//Spark display
					playScreen.sparkDisplay.gotoAndStop(1);
					playScreen.sparkDisplay.innerSpark.gotoAndStop(1);
					
					//Remove Reset hex
					resetHex.destroy();	
				
					addLevelScreen();
				}else
				{
				
					//Display
					playScreen.display.y -= 110;
			
					//Play new game
					playGameHandler();
				}
				
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
			}else
			if (e.currentTarget == pauseScreen.mcHome)  //HOME*******************************
			{
				for (i = 0; i < aHexColorArray.length; i++)
			    {
			    	allHexColors = aHexColorArray[i];
			    	
			    	aHexColorArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, dragHex);
			    	aHexColorArray[i].removeEventListener(MouseEvent.MOUSE_UP, dropHex);
			    	
			    	allHexColors.destroy();
			    	allHexColors = null;
			    	//aHexColorArray = [];
			    }
			    //Remove Main hexes
			    for (k = 0; k < aMainHexArray.length; k++)
			    {
			    	allHexs = aMainHexArray[k];
			    	
			    	allHexs.destroy();
			    	allHexs = null;
			    	//aMainHexArray = [];
			    }
			    
			    //Remove Reset hex
			    resetHex.destroy();	
				
				//Clear arrays function
				clearArrays();
				
				
				//destroy pause screen
				pauseScreen.destroy();
				pauseScreen.mcPlay.removeEventListener(MouseEvent.CLICK, pauseControls);
				pauseScreen.mcHome.removeEventListener(MouseEvent.CLICK, pauseControls);
				pauseScreen.mcRetry.removeEventListener(MouseEvent.CLICK, pauseControls);
				removeEventListener(Event.ENTER_FRAME, engineLogic);
				//Show Objects
			    for (i = 0; i < aHexColorArray.length; i++)
			    {
			    	allHexColors = aHexColorArray[i];
			    	
			    	allHexColors.visible = true;
			    }
			    //Remove Main hexes
			    for (k = 0; k < aMainHexArray.length; k++)
			    {
			    	allHexs = aMainHexArray[k];
			    	
			    	allHexs.visible = true;
			    }
			    //Reset hide
			    resetHex.visible = true;
				playScreen.display.visible = true;
				
				
				if (!bGeniusMode)
				{
					playScreen.sparkDisplay.visible = true;
					//Spark display
					playScreen.sparkDisplay.gotoAndStop(1);
					playScreen.sparkDisplay.innerSpark.gotoAndStop(1);
	
				}
				
				//Display
				playScreen.display.y -= 110;
				
				//stop coolors from tweening up incase restart game prematurely 
				if (bPlayingGame)
				{
					TweenLite.killDelayedCallsTo(hideColorsHandler);
					bPlayingGame = false;
				}
			
				
				
				//Main start screen
				startScreenMainHandler();
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
			}
		}
		
		private function clearArrays():void
		{
			/*
			aMainHexArray.length = 0
			aHexColorArray.length = 0;
			aMainHexFrameArray.length = 0;
			
			
			orangeHex.destroy();
			redHex.destroy();
			blueHex.destroy();
			yellowHex.destroy();
			whiteHex.destroy(); 
			greenHex.destroy(); 
			purpleHex.destroy();*/
			
			
			
		}
		
		private function allSharedObjectData():void
		{
			
			//***************TUTORIAL**********************
			sharedObjectTutorial = SharedObject.getLocal("TUTORIAL")
			bWatchedTutorial = sharedObjectTutorial.data.bWatchedTutorial != null ? sharedObjectTutorial.data.bWatchedTutorial : false;
			
			
			
			//****************SPARKS***************
			sharedObjectSparks = SharedObject.getLocal("SPARK_DATA_GCM");
			if (sharedObjectSparks.data.nSparks == null)
			{
				sharedObjectSparks.data.nSparks = nSparks;
            }else
			{
				loadSparkshandler();
            } 
			updateSparksCounter();
			
			//***************LEVEL*****************
			sharedObjectLevel = SharedObject.getLocal("LEVEL_DATA_GCM");
			if (sharedObjectLevel.data.nLevelData == null)
			{
              sharedObjectLevel.data.nLevelData = nLevelData;
            }else
			{
             	//If there is data load it. 
				loadLevelDataHandler();
            } 
			
			//LEVEL SCREEN DATA
			if (sharedObjectLevel.data.nLevelsText == null)
			{
				sharedObjectLevel.data.nLevelsText = nLevelsText;
            }else
			{
             	//If there is data load it. 
				loadLevelTextDataHandler();
            } 
			
			
			//***************TIME*****************
			sharedObjectTime = SharedObject.getLocal("TIME_DATA_GCM");
			if (sharedObjectTime.data && sharedObjectTime.data.nTime && !isNaN(sharedObjectTime.data.nTime))
			{
               nTime = String(sharedObjectTime.data.nTime);
            }else
			{
              //no shared object, use default value
              nTime = "00:00.0"; //or whatever it should start off as.
            } 
			
			
			//***************IQ*****************
			sharedObjectIQ = SharedObject.getLocal("IQ_DATA_GCM");
			if (sharedObjectIQ.data.nIQ == null)
			{
				sharedObjectIQ.data.nIQ = nIQ;
            }else
			{
             	//If there is data load it. 
				loadIQDataHandler();
            } 
			
			//LEVEL COMPLETE
			sharedObjectLevelComplete = SharedObject.getLocal("LEVELS_COMPLETE_GCM");
			//SET TO FALSE = NOT COMPLETE
			blv1_Complete = sharedObjectLevelComplete.data.blv1_Complete != null ? sharedObjectLevelComplete.data.blv1_Complete : false;
			blv2_Complete = sharedObjectLevelComplete.data.blv2_Complete != null ? sharedObjectLevelComplete.data.blv2_Complete : false;
			blv3_Complete = sharedObjectLevelComplete.data.blv3_Complete != null ? sharedObjectLevelComplete.data.blv3_Complete : false;
			blv4_Complete = sharedObjectLevelComplete.data.blv4_Complete != null ? sharedObjectLevelComplete.data.blv4_Complete : false;
			blv5_Complete = sharedObjectLevelComplete.data.blv5_Complete != null ? sharedObjectLevelComplete.data.blv5_Complete : false;
			blv6_Complete = sharedObjectLevelComplete.data.blv6_Complete != null ? sharedObjectLevelComplete.data.blv6_Complete : false;
			blv7_Complete = sharedObjectLevelComplete.data.blv7_Complete != null ? sharedObjectLevelComplete.data.blv7_Complete : false;
			
			trace("LEVEL 1 COMPLETE: " + blv1_Complete);
			trace("LEVEL 2 COMPLETE: " + blv2_Complete);
			trace("LEVEL 3 COMPLETE: " + blv3_Complete);
			trace("LEVEL 4 COMPLETE: " + blv4_Complete);
			
			
			//LEVEL 1
			if (sharedObjectLevelComplete.data.blv1_Complete == true)
			{
				levelScreen.mcLevels.mcLevel1.gotoAndStop("COMPLETE"); //Show Complete
			}else
			if (sharedObjectLevelComplete.data.blv1_Complete == false)
			{
				levelScreen.mcLevels.mcLevel1.gotoAndStop("UNLOCKED"); //Just shaw its not locked
			}
			
			//LEVEL 2
			if (sharedObjectLevelComplete.data.blv2_Complete == true)
			{
				levelScreen.mcLevels.mcLevel2.gotoAndStop("COMPLETE"); //Show Complete
			}else
			if (sharedObjectLevelComplete.data.blv2_Complete == false)
			{
				levelScreen.mcLevels.mcLevel2.gotoAndStop("UNLOCKED"); //Just shaw its not locked
			}
			
			//LEVEL 3
			if (sharedObjectLevelComplete.data.blv3_Complete == true)
			{
				levelScreen.mcLevels.mcLevel3.gotoAndStop("COMPLETE"); //Show Complete
			}else
			if (sharedObjectLevelComplete.data.blv3_Complete == false)
			{
				levelScreen.mcLevels.mcLevel3.gotoAndStop("UNLOCKED"); //Just shaw its not locked
			}
			
			//LEVEL 4
			if (sharedObjectLevelComplete.data.blv4_Complete == true)
			{
				levelScreen.mcLevels.mcLevel4.gotoAndStop("COMPLETE"); //Show Complete
			}else
			if (sharedObjectLevelComplete.data.blv4_Complete == false)
			{
				levelScreen.mcLevels.mcLevel4.gotoAndStop("UNLOCKED"); //Just shaw its not locked
			}
			
			
			//LEVEL 5
			if (sharedObjectLevelComplete.data.blv5_Complete == true)
			{
				levelScreen.mcLevels.mcLevel5.gotoAndStop("COMPLETE"); //Show Complete
			}else
			if (sharedObjectLevelComplete.data.blv5_Complete == false)
			{
				levelScreen.mcLevels.mcLevel5.gotoAndStop("UNLOCKED"); //Just shaw its not locked
			}
		
			//LEVEL 6
			if (sharedObjectLevelComplete.data.blv6_Complete == true)
			{
				levelScreen.mcLevels.mcLevel6.gotoAndStop("COMPLETE"); //Show Complete
			}else
			if (sharedObjectLevelComplete.data.blv6_Complete == false)
			{
				levelScreen.mcLevels.mcLevel6.gotoAndStop("UNLOCKED"); //Just shaw its not locked
			}

			
			//LEVEL 7
			if (sharedObjectLevelComplete.data.blv7_Complete == true)
			{
				levelScreen.mcLevels.mcLevel7.gotoAndStop("COMPLETE"); //Show Complete
			}else
			if (sharedObjectLevelComplete.data.blv7_Complete == false)
			{
				levelScreen.mcLevels.mcLevel7.gotoAndStop("UNLOCKED"); //Just shaw its not locked
			}

			//LEVEL PRORGRESSION
			sharedObjectLevelProgress = SharedObject.getLocal("LEVEL_PROGRESSION_GCM");
			
			//LEVEL COMPLETE ANIMATION HOLDER USED FOR NON REPEAT ANIMATION WHEN UNLOCKED 
			blv1_FINISHED = sharedObjectLevelProgress.data.blv1_FINISHED != null ? sharedObjectLevelProgress.data.blv1_FINISHED : false;
			blv2_FINISHED = sharedObjectLevelProgress.data.blv2_FINISHED != null ? sharedObjectLevelProgress.data.blv2_FINISHED : false;
			blv3_FINISHED = sharedObjectLevelProgress.data.blv3_FINISHED != null ? sharedObjectLevelProgress.data.blv3_FINISHED : false;
			blv4_FINISHED = sharedObjectLevelProgress.data.blv4_FINISHED != null ? sharedObjectLevelProgress.data.blv4_FINISHED : false;
			blv5_FINISHED = sharedObjectLevelProgress.data.blv5_FINISHED != null ? sharedObjectLevelProgress.data.blv5_FINISHED : false;
			blv6_FINISHED = sharedObjectLevelProgress.data.blv6_FINISHED != null ? sharedObjectLevelProgress.data.blv6_FINISHED : false;
			blv7_FINISHED = sharedObjectLevelProgress.data.blv7_FINISHED != null ? sharedObjectLevelProgress.data.blv7_FINISHED : false;
			
			
			//SET TO TRUE NOT UNLOCKED
			blv2Locked = sharedObjectLevelProgress.data.blv2Locked != null ? sharedObjectLevelProgress.data.blv2Locked : true;
			blv3Locked = sharedObjectLevelProgress.data.blv3Locked != null ? sharedObjectLevelProgress.data.blv3Locked : true;
			blv4Locked = sharedObjectLevelProgress.data.blv4Locked != null ? sharedObjectLevelProgress.data.blv4Locked : true;
			blv5Locked = sharedObjectLevelProgress.data.blv5Locked != null ? sharedObjectLevelProgress.data.blv5Locked : true;
			blv6Locked = sharedObjectLevelProgress.data.blv6Locked != null ? sharedObjectLevelProgress.data.blv6Locked : true;
			blv7Locked = sharedObjectLevelProgress.data.blv7Locked != null ? sharedObjectLevelProgress.data.blv7Locked : true;

			//LEVEL 2
			if (sharedObjectLevelProgress.data.blv2Locked == false && !sharedObjectLevelComplete.data.blv2_Complete) // Locked is false and Complete is false so will show if COMPLETE and over due to LOCKED
			{
				levelScreen.mcLevels.mcLevel2.gotoAndStop("UNLOCKED"); //Show UNLOCKED
			}
			
			
			//LEVEL 3
			if (sharedObjectLevelProgress.data.blv3Locked == false && !sharedObjectLevelComplete.data.blv3_Complete) 
			{
				levelScreen.mcLevels.mcLevel3.gotoAndStop("UNLOCKED"); //Show UNLOCKED
			}
			
			//LEVEL 4
			if (sharedObjectLevelProgress.data.blv4Locked == false && !sharedObjectLevelComplete.data.blv4_Complete) 
			{
				levelScreen.mcLevels.mcLevel4.gotoAndStop("UNLOCKED"); //Show UNLOCKED
			}
			
			//LEVEL 5
			if (sharedObjectLevelProgress.data.blv5Locked == false && !sharedObjectLevelComplete.data.blv5_Complete) 
			{
				levelScreen.mcLevels.mcLevel5.gotoAndStop("UNLOCKED"); //Show UNLOCKED
			}
			
			//LEVEL 6
			if (sharedObjectLevelProgress.data.blv6Locked == false && !sharedObjectLevelComplete.data.blv6_Complete) 
			{
				levelScreen.mcLevels.mcLevel6.gotoAndStop("UNLOCKED"); //Show UNLOCKED
			}
			
			
			//LEVEL 7
			if (sharedObjectLevelProgress.data.blv7Locked == false && !sharedObjectLevelComplete.data.blv7_Complete) 
			{
				levelScreen.mcLevels.mcLevel7.gotoAndStop("UNLOCKED"); //Show UNLOCKED
			}

		}
		
		private function clearDataHandler():void 
		{
			sharedObjectSparks.clear();
			sharedObjectLevel.clear();
			sharedObjectTime.clear();
			sharedObjectIQ.clear();
			sharedObjectLevelComplete.clear();
			sharedObjectLevelProgress.clear();
			sharedObjectTutorial.clear();
		}
		
		private function loadSparkshandler():void 
		{
			nSparks = sharedObjectSparks.data.nSparks
			//trace("Data Loaded!");
		}
		
		private function loadLevelDataHandler():void 
		{
			nLevelData = sharedObjectLevel.data.nLevelData;
			//trace("Data Loaded!");
		}
		
		private function loadLevelTextDataHandler():void 
		{
			nLevelsText = sharedObjectLevel.data.nLevelsText;
			//trace("Data Loaded!");
		}

		
		private function loadIQDataHandler():void 
		{
			nIQ =  sharedObjectIQ.data.nIQ;
			//trace("Data Loaded!");
		}
	
		
		private function sparkInnerTween():void 
		{
			TweenLite.killDelayedCallsTo(sparkInnerTween);
			playScreen.sparkDisplay.innerSpark.gotoAndPlay(2); // show tween
		}
		
		private function displayTweenHandler():void 
		{
			
			playScreen.sparkDisplay.gotoAndPlay(2);
			TweenLite.to(playScreen.sparkText, 1.0, {alpha:1});
		}
		
		//Iq timer
		private function iQTickHandler(e:TimerEvent):void 
		{
			 timerCountIQ += 100;
             toTimeCodeIQ(timerCountIQ);
		}
		private function toTimeCodeIQ(milliseconds:int):void 
		{
			this.milliseconds = milliseconds;
             
            //create a date object using the elapsed milliseconds
	        time = new Date(milliseconds);
	        
	        //define minutes/seconds/mseconds
	        minutes = String(time.minutes);
	        seconds = String(time.seconds);
	        miliseconds = String(Math.round(time.milliseconds)/100);
	        
	        //add zero if neccecary, for example: 2:3.5 becomes 02:03.5
	        minutes = (minutes.length != 2) ? '0'+minutes : minutes;
	        seconds = (seconds.length != 2) ? '0' + seconds : seconds;

			nTimeiQ = minutes + ":" + seconds + "." + miliseconds;

		}
		
		//Regular timer
		private function timerTickHandler(e:TimerEvent):void 
		{
			 timerCount += 100;
             toTimeCode(timerCount);
		}
		
		
		
		private function toTimeCode(milliseconds:int):void 
		{
			this.milliseconds = milliseconds;
             
            //create a date object using the elapsed milliseconds
	        time = new Date(milliseconds);
	        
	        //define minutes/seconds/mseconds
	        minutes = String(time.minutes);
	        seconds = String(time.seconds);
	        miliseconds = String(Math.round(time.milliseconds)/100);
	        
	        //add zero if neccecary, for example: 2:3.5 becomes 02:03.5
	        minutes = (minutes.length != 2) ? '0'+minutes : minutes;
	        seconds = (seconds.length != 2) ? '0' + seconds : seconds;
			
			nTime =  minutes + ":" + seconds + "." + miliseconds;
            //display elapsed time on in a textfield on stage
            playScreen.display.timerTextField.text = minutes + ":" + seconds + "." + miliseconds;
			
			
		}
		
		private function greyOutColorsHandler():void 
		{
			TweenLite.delayedCall(nColorTimer, hideColorsHandler);
		}

		
		//ADD HEXES FUNCTION AND START GAME *************************************
		private function hideColorsHandler():void 
		{
			//Remove Tween
			TweenLite.killDelayedCallsTo(hideColorsHandler);
			
			//Hide Colors
			for (var i:int = 0; i < aMainHexArray.length; i++)
			{
				var allHexs = aMainHexArray[i];
				
				allHexs.gotoAndStop("GREY"); //GREY OUT COLORS
			}
			
			//Add new Event Lister for dragging
			for (var j:int = 0; j < aHexColorArray.length; j++)
			{
				aHexColorArray[j].addEventListener(MouseEvent.MOUSE_DOWN, dragHex);
				aHexColorArray[j].addEventListener(MouseEvent.MOUSE_UP, dropHex);
			}
			
			if (bGeniusMode)
			{
				tweenColorHexHandler();
			}
			
			if (!bGeniusMode)
			{
				levelDifficultyHandler(); //FOR HARDER WITTIER LEVELS
			}
			
			
			if (!bGeniusMode && nMatchingCounter == 0) // only these conditions show color hex tween other logic used on level difficulty
			{
				//So the color hexs come up after main hex greys out wont confuse user
				tweenColorHexHandler();
				//Add the reset hex function
				if (!bLevel_1)
				{
					addResetHex();
				}
				
			}
			
			//Add Main Logic Listener
			addEventListener(Event.ENTER_FRAME, engineLogic);
			
		}
		
	
		
		
		
		
		private function addColorHexesTween():void
		{
			//So the color hexs come up after main hex greys out wont confuse user
			tweenColorHexHandler();
			//Add the reset hex function
			if (!bLevel_1)
			{
				addResetHex();
			}
		}
		
		private function levelDifficultyHandler():void 
		{
			trace("LEVEL DIFFICULTY HANDLER");
			//LEVEL DIFFICULTY 1************************************************************************************************************************
			if (bLevel_1 && nMatchingCounter == 1 ) 
			{
				
				TweenLite.to(hex_2, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				//add sound
				addHexSwitchSound();
			}else
			if (bLevel_1 && nMatchingCounter == 2 ) 
			{
				
				TweenLite.to(hex_3, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_2, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				//add sound
				addHexSwitchSound();
			}else
			if (bLevel_1 && nMatchingCounter == 3 ) 
			{
				TweenLite.to(hex_4, 1.0, {delay: 0.3, x:(stage.stageWidth / 2), y:(stage.stageHeight / 2), ease:Back.easeOut});
				TweenLite.to(hex_3, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {delay: 0.1, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_1, 1.0, {y:(stage.stageHeight / 2) - 118, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				//add sound
				addHexSwitchSound();
			}else
			if (bLevel_1 && nMatchingCounter == 4 ) 
			{
				TweenLite.to(hex_4, 1.0, {delay: 0.5, x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_5, 1.0, {delay: 0.4, x:(stage.stageWidth / 2) + 103, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {delay: 0.3, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_3, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) - 103, ease:Back.easeOut});
				//add sound
				addHexSwitchSound();
			}
			
			
			
			//LEVEL DIFFICULTY 2************************************************************************************************************************
			if (bLevel_2 && nMatchingCounter == 1 ) 
			{
				TweenLite.to(hex_1, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.1, {y:(stage.stageHeight / 2), ease:Back.easeOut,onComplete: levelsSwitchHandler});
				//add sound
				addHexSwitchSound();
			}else
			if (bLevel_2 && nMatchingCounter == 2 ) 
			{
				TweenLite.to(hex_1, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_2, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				//add sound
				addHexSwitchSound();

			}else
			if (bLevel_2 && nMatchingCounter == 3 ) 
			{
				TweenLite.to(hex_1, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_2, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				//add sound
				addHexSwitchSound();
			}else
			if (bLevel_2 && nMatchingCounter == 4) 
			{
				TweenLite.to(hex_2, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_1, 1.0, {y:(stage.stageHeight / 2) - 118, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				//add sound
				addHexSwitchSound();

			}
			
			
			
			//LEVEL DIFFICULTY 3***************************************************************************************************************************
			if (bLevel_3 && nMatchingCounter == 1 )
			{
				TweenLite.to(hex_2, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_3, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
					//add sound
				addHexSwitchSound();
			}else 
			if (bLevel_3 && nMatchingCounter == 2 ) 
			{
				TweenLite.to(hex_3, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_2, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
					//add sound
				addHexSwitchSound();
			}else 
			if (bLevel_3 && nMatchingCounter == 3 ) 
			{
				TweenLite.to(hex_3, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_1, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2), ease:Back.easeOut});
					//add sound
				addHexSwitchSound();
			}else 
			if (bLevel_3 && nMatchingCounter == 4 ) 
			{
				TweenLite.to(hex_3, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {delay: 0.1, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_1, 1.0, {y:(stage.stageHeight / 2) - 118, ease:Back.easeOut, onComplete: levelsSwitchHandler});
					//add sound
				addHexSwitchSound();
			}
			
			
			
			
			
			
			//LEVEL DIFFICULTY 4***************************************************************************************************************************
			if (bLevel_4 && nMatchingCounter == 1 )
			{
				TweenLite.to(hex_3, 1.0, {delay: 0.3, x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_2, 1.0, {delay: 0.1, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				//add sound
				addHexSwitchSound();
			}else 
			if (bLevel_4 && nMatchingCounter == 2 ) 
			{
				TweenLite.to(hex_4, 1.0, {delay: 0.1, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				TweenLite.to(hex_3, 1.0, {delay: 0.3, x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_2, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				//add sound
				addHexSwitchSound();
			}else 
			if (bLevel_4 && nMatchingCounter == 3 ) 
			{
				TweenLite.to(hex_4, 1.0, {delay: 0.1, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_3, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {delay: 0.1, x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				//add sound
				addHexSwitchSound();
			}else 
			if (bLevel_4 && nMatchingCounter == 4) 
			{
				TweenLite.to(hex_3, 1.0, {delay: 0.1, x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_1, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_4, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {delay: 0.3, y:(stage.stageHeight / 2) - 118, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				//add sound
				addHexSwitchSound();
			}
			
			
			//LEVEL DIFFICULTY 5***************************************************************************************************************************
			if (bLevel_5 && nMatchingCounter == 1)
			{
				TweenLite.to(hex_5, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				TweenLite.to(hex_4, 1.0, {delay: 0.4, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_3, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {delay: 0.3, y:(stage.stageHeight / 2) - 118, ease:Back.easeOut});

				//add sound
				addHexSwitchSound();
			}else
			if (bLevel_5 && nMatchingCounter == 2)
			{
				TweenLite.to(hex_4, 1.0, {delay: 0.5, x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_5, 1.0, {delay: 0.4, x:(stage.stageWidth / 2) + 103, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {delay: 0.3, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_3, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) - 103, ease:Back.easeOut});
				//add sound
				addHexSwitchSound();
			}else
			if (bLevel_5 && nMatchingCounter == 3)
			{
				TweenLite.to(hex_4, 1.0, {delay: 0.5, y: (stage.stageHeight / 2) , onComplete: levelsSwitchHandler});
				TweenLite.to(hex_5, 1.0, {delay: 0.4, x:(stage.stageWidth / 2) + 103, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {delay: 0.3, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_3, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) - 103, ease:Back.easeOut});
				TweenLite.to(hex_1, 1.0, {y:(stage.stageHeight / 2) - 118, ease:Back.easeOut});
				//add sound
				addHexSwitchSound();
			}else
			if (bLevel_5 && nMatchingCounter == 4)
			{
				TweenLite.to(hex_4, 1.0, {delay: 0.5, y: (stage.stageHeight / 2) , onComplete: levelsSwitchHandler});
				TweenLite.to(hex_5, 1.0, {delay: 0.4, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {delay: 0.3, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				TweenLite.to(hex_3, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) - 103, ease:Back.easeOut});
				TweenLite.to(hex_1, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
				//add sound
				addHexSwitchSound();
				
			}
			
			//LEVEL DIFFICULTY 6***************************************************************************************************************************
			if (bLevel_6 && nMatchingCounter == 1)
			{

				TweenLite.to(hex_1, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut, onComplete: levelsSwitchHandler}); //Middle top right
				//add sound
				addHexSwitchSound();
			}else
			if (bLevel_6 && nMatchingCounter == 2)
			{
				TweenLite.to(hex_3, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut}) //Top Go Right side
				TweenLite.to(hex_4, 1.0, {delay: 0.2, y:(stage.stageHeight / 2) , ease:Back.easeOut});
				TweenLite.to(hex_1, 1.0, {delay: 0.3, y:(stage.stageHeight / 2) - 118, ease:Back.easeOut, onComplete: levelsSwitchHandler}); 
				addHexSwitchSound();
				
			}else
			if (bLevel_6 && nMatchingCounter == 3)
			{
				TweenLite.to(hex_5, 1.0,  {delay: 0.4,  x:(stage.stageWidth / 2), y:(stage.stageHeight / 2), ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_6, 1.0, {delay: 0.3, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				TweenLite.to(hex_1, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				//add sound
				addHexSwitchSound();
			}else
			if (bLevel_6 && nMatchingCounter == 4)
			{
				TweenLite.to(hex_4, 1.2, {delay: 0.2, y:(stage.stageHeight / 2) + 118, ease:Back.easeOut, onComplete: levelsSwitchHandler});
				TweenLite.to(hex_2, 1.2, {delay: 0.1, y:(stage.stageHeight / 2) - 118, ease:Back.easeOut});
				//add sound
				addHexSwitchSound();
			}
			
			
			
			//LEVEL DIFFICULTY 7***************************************************************************************************************************
			if (bLevel_7 && nMatchingCounter == 1)
			{

				TweenLite.to(hex_4, 1.2,  {delay: 0.2, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut, onComplete: levelsSwitchHandler}); // Go bottom right
				TweenLite.to(hex_3, 1.0,  {delay: 0.1, x:(stage.stageWidth / 2), y:(stage.stageHeight / 2) - 118, ease:Back.easeOut});

			}else
			if (bLevel_7 && nMatchingCounter == 2)
			{

				TweenLite.to(hex_4, 1.2,  {delay: 0.2, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut, onComplete: levelsSwitchHandler}); // Go bottom right
				TweenLite.to(hex_3, 1.0,  {delay: 0.1, x:(stage.stageWidth / 2), y:(stage.stageHeight / 2) - 118, ease:Back.easeOut});

			}else
			if (bLevel_7 && nMatchingCounter == 3)
			{


				TweenLite.to(hex_4, 1.0, {delay: 0.2, y:(stage.stageHeight / 2), x:(stage.stageWidth / 2),  ease:Back.easeOut, onComplete: levelsSwitchHandler}); // Go middle

				TweenLite.to(hex_1, 1.0, {delay: 0.1, y:(stage.stageHeight / 2) - 118, x:(stage.stageWidth / 2), ease:Back.easeOut}); // Go top
			

			}else
			if (bLevel_7 && nMatchingCounter == 4)
			{
				//Finish the last level as normal
				levelsSwitchHandler();
			}
			
			
		}
		
		private function levelsSwitchHandler():void 
		{
			//Harder Tweens after first are complete. I made all this more complicated than it should be haha
			if (bLevel_2 && nMatchingCounter == 3 ) // LEVEL 2 ***************************************************************************************************************
			{
				TweenLite.to(hex_1, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {delay: 0.1, x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.delayedCall(1.0, addColorHexesTween); //Then show the tween after finish
			}else 
			if (bLevel_2 && nMatchingCounter == 4 ) 
			{
				TweenLite.to(hex_2, 0.5, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_1, 0.5, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 118, ease:Back.easeOut});
				TweenLite.delayedCall(0.5, addColorHexesTween); //Then show the tween after finish
			}else 
			if (bLevel_3 && nMatchingCounter == 3 ) // LEVEL 3 ***************************************************************************************************************
			{
				TweenLite.to(hex_3, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
				TweenLite.to(hex_1, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.delayedCall(0.5, addColorHexesTween); //Then show the tween after finish
			}else
			if (bLevel_3 && nMatchingCounter == 4 ) 
			{
				TweenLite.to(hex_3, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {delay: 0.1, x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				TweenLite.to(hex_1, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
				TweenLite.delayedCall(1.0, addColorHexesTween); //Then show the tween after finish
				//add sound
				addHexSwitchSound();
			}else
			if (bLevel_7 && nMatchingCounter == 2)
			{
				TweenLite.to(hex_4, 1.0, {delay: 0.2, x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});  // Go Top Left
				TweenLite.to(hex_5, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});  // Go Top Left
				TweenLite.delayedCall(1.0, addColorHexesTween); //Then show the tween after finish
			}else
			if (bLevel_7 && nMatchingCounter == 3)
			{
				TweenLite.to(hex_1, 1.0, {y:(stage.stageHeight / 2) + 118, x:(stage.stageWidth / 2), ease:Back.easeOut}); // Go Bottom
				TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2) - 118, x:(stage.stageWidth / 2), ease:Back.easeOut}); // Go TOP
				TweenLite.delayedCall(1.0, addColorHexesTween); //Then show the tween after finish
			}else
			{
				//add color tween handler
				addColorHexesTween();
			}
			
			
		}
		
		private function addHexSwitchSound():void
		{
			//Play switching sound effect
			if (bSoundIsOn)
			{
				hexSwitchSound.play();
			}
			
		}
		
		//Add Reset Hex Button
		private function addResetHex():void
		{
			//Add sparks if user has enough
			if (sharedObjectSparks.data.nSparks >= nReset && !bGeniusMode) // No Help for the Genius Mode
			{
				//For reset btn
				resetHex.x = (stage.stageWidth / 2) + 165;
			    resetHex.y = (stage.stageHeight / 2) + 450;
			    addChild(resetHex);
				TweenLite.to(resetHex, 0.5, {y:(stage.stageHeight / 2) + 255, ease:Back.easeOut});  
			    resetHex.addEventListener(MouseEvent.MOUSE_DOWN, dragReset);
			    resetHex.addEventListener(MouseEvent.MOUSE_UP, dropReset);
				trace("Add NEW Reset Hex");
			}else 
			if (sharedObjectSparks.data.nSparks < nReset && !bGeniusMode)
			{
				resetHex.destroy();
				resetHex.removeEventListener(MouseEvent.MOUSE_DOWN, dragReset);
			    resetHex.removeEventListener(MouseEvent.MOUSE_UP, dropReset);
			}
		}
		
		//Drop resey
		private function dropReset(e:MouseEvent):void 
		{
			e.currentTarget.stopDrag();
			bDragging = true;
		}
		
		//Drag reset
		private function dragReset(e:MouseEvent):void 
		{
			e.currentTarget.startDrag();
			bDragging = false;
		}
		
		
		//Matching HEXES********************************************************************* LEVEL PROGRESSION AS WELL
		private function matchAllHexHandler():void
		{
			//Remove Event Lister for dragging
			for (var i:int = 0; i < aHexColorArray.length; i++)
			{
				var allHexColors = aHexColorArray[i];
				
				aHexColorArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, dragHex);
				aHexColorArray[i].removeEventListener(MouseEvent.MOUSE_UP, dropHex);
				
				allHexColors.destroy();
			    allHexColors = null;
			}
			
			//Remove Main Listners
			removeEventListener(Event.ENTER_FRAME, engineLogic);
			
			// kill tween
			TweenLite.killDelayedCallsTo(matchAllHexHandler);
			//Match complete effect
			matchCompleteScrn = new mcMatchCompleteScreen(); // Maybe keep the effect update it
			matchCompleteScrn.x = (stage.stageWidth / 2);
			matchCompleteScrn.y = (stage.stageHeight / 2);
			addChild(matchCompleteScrn);
			TweenLite.to(matchCompleteScrn, 1.8, {alpha:0});
			//Tween any active hex
			hex_1.x = stage.stageWidth / 2;
			hex_1.y = stage.stageHeight / 2;
			TweenMax.to(hex_2, 1.1, {y:hex_1.y, x:hex_1.x, ease:Back.easeInOut});
			TweenMax.to(hex_3, 1.2, {y:hex_1.y, x:hex_1.x, ease:Back.easeInOut});
			TweenMax.to(hex_4, 1.3, {y:hex_1.y, x:hex_1.x, ease:Back.easeInOut});
			TweenMax.to(hex_5, 1.4, {y:hex_1.y, x:hex_1.x, ease:Back.easeInOut});
			TweenMax.to(hex_6, 1.5, {y:hex_1.y, x:hex_1.x, ease:Back.easeInOut});
			TweenMax.to(hex_7, 1.6, {y:hex_1.y, x:hex_1.x, ease:Back.easeInOut});
			TweenLite.delayedCall(1.6, removeMatchEffect); // Rmeove effect

			if (bSoundIsOn)
			{
				// Play finish sound 
			    matchSoundChannel = matchComplete.play();
			    nSoundEffect = 1; // set sound effect back to one
			}
			//Background SKEW
			TweenMax.to(playScreen.backGround, 0.8, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true}); 
			
			//For Index Bug might fix it set back to false for next round do to all hex colors
			bBlueHex = false;
		    bRedHex = false;
		    bPurpleHex = false;
		    bGreenHex = false;
		    bWhiteHex = false;
		    bYellowHex = false;
		    bOrangeHex = false;
			bDragging = false;
			
			
			//Stop Timer re start on next level
			tCountTimer.stop();
			tCountIQTimer.stop();
			
			
			
				
			//create delayed call to add another hex on the field if needed and start next level
			if (bGeniusMode) //Add regular 
			{
				
				//Increase Level Textfield by 1
				nLevel ++;
				nLevelData ++;
				nLevelIQ ++; //Increase IQ level to not interfere with highscore nLevel
				geniusIQAlgorithm();
				
				
				updatelevelTextField();
			
				TweenLite.delayedCall(2.0, addHexhandler);
				trace("MATCHED GENIUS");
				
				
				
				
				if (nLevel == 6) // SMART
				{
					// Smart IQ display variables
					TweenMax.to(playScreen.display.mcIQlevel, 0.5, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true, delay: 1.0}); 
					TweenLite.delayedCall(0.8, iQShineHandler);
					
					TweenLite.delayedCall(0.5, iQSoundHandler);
					
					//Unlock Achievement starting 
					if (GameServices.isSupported)
					{
						// Achievements functionality is supported  
						GameServices.service.achievements.achievementUnlock( "CgkI4_7SyqQUEAIQCA" );
						trace("SUPPORT ACHIEVEMENTS");
					}
		
				}else
				if (nLevel == 8) // GENIUS
				{
					// Smart IQ display variables
					TweenMax.to(playScreen.display.mcIQlevel, 0.5, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true, delay: 1.0}); 
					TweenLite.delayedCall(0.8, iQShineHandler);
					
					TweenLite.delayedCall(0.5, iQSoundHandler);
					
					//Unlock Achievement starting 
					if (GameServices.isSupported)
					{
						// Achievements functionality is supported  
						GameServices.service.achievements.achievementUnlock( "CgkI4_7SyqQUEAIQCQ" );
						trace("SUPPORT ACHIEVEMENTS");
					}
			
				}else
				if (nLevel >= 12) // EINSTEIN
				{
					// Smart IQ display variables
					TweenMax.to(playScreen.display.mcIQlevel, 0.5, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true, delay: 1.0}); 
					TweenLite.delayedCall(0.8, iQShineHandler);
					
					TweenLite.delayedCall(0.5, iQSoundHandler);
					
					//Unlock Achievement starting 
					if (GameServices.isSupported)
					{
						// Achievements functionality is supported  
						GameServices.service.achievements.achievementUnlock( "CgkI4_7SyqQUEAIQCg" );
						trace("SUPPORT ACHIEVEMENTS");
					}
		
				}
			}
			
			
			
			//FOR MATCHING COUNTER LEVEL PLAY******************************************************
			if (!bGeniusMode)
			{
				
				//Match is complete
				bMatchComplete = true;
				nMatchingCounter ++;  // match a total of 3 times or 3 rounds then unlock 

				//Create Spark Animation and increase spark count 
				addChild(spark);
				TweenLite.to(spark, 0.8, {x:(stage.stageWidth/2) - 35, y:(stage.stageHeight / 2) - 260, onComplete:destroySparkHandler});
				TweenMax.to(playScreen.sparkDisplay.innerSpark, 0.5, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat:1, yoyo:true, delay:0.5});

				//Remove Reset hex
				resetHex.destroy();
				
				nLevelDisplay ++;
				updateLevelScreenTextDisplay();
				
				//All Level data
				levelDataHandler();
				
			}
			


		}
		
		
		private function levelDataHandler():void 
		{

			//EACH LEVEL GO 5 TIMES BESIDES LEVEL 1
			if (bMatchComplete && nMatchingCounter == 5 && nLevel == 1) //LEVEL 1
			{
				
				//If level is complete show past level COMPLETE and new level UNLOCKED save the data
				blv1_Complete = true;
				sharedObjectLevelComplete.data.blv1_Complete = blv1_Complete;
				sharedObjectLevelComplete.flush();  
				
				
				//SHOW NEXT LEVEL UNLOCKED
				blv2Locked = false;
				sharedObjectLevelProgress.data.blv2Locked = blv2Locked;
				sharedObjectLevelProgress.flush();  
			
				//DATA
				allSharedObjectData();
			
				//Show Levele Screen
				TweenLite.delayedCall(2.1, addLevelScreen);
				bMatchComplete = false;
				nMatchingCounter = 0;
				
			}else
			if (bMatchComplete && nMatchingCounter == 5 && nLevel == 2) // LEVEL 2  go 5 times
			{
				
				//If level is complete show past level COMPLETE and new level UNLOCKED save the data
				blv2_Complete = true;
				sharedObjectLevelComplete.data.blv2_Complete = blv2_Complete;
				sharedObjectLevelComplete.flush();  
				
				//SHOW NEXT LEVEL UNLOCKED
				blv3Locked = false;
				sharedObjectLevelProgress.data.blv3Locked = blv3Locked;
				sharedObjectLevelProgress.flush();  
				
				//DATA
				allSharedObjectData();
				
				TweenLite.delayedCall(2.1, addLevelScreen);
				bMatchComplete = false;
				nMatchingCounter = 0;
			}else
			if (bMatchComplete && nMatchingCounter == 5 && nLevel == 3) // LEVEL 3
			{
				
				//If level is complete show past level COMPLETE and new level UNLOCKED save the data
				blv3_Complete = true;
				sharedObjectLevelComplete.data.blv3_Complete = blv3_Complete;
				sharedObjectLevelComplete.flush();  
				
				//SHOW NEXT LEVEL UNLOCKED
				blv4Locked = false;
				sharedObjectLevelProgress.data.blv4Locked = blv4Locked;
				sharedObjectLevelProgress.flush();  
				
				//DATA
				allSharedObjectData();
				
				
				TweenLite.delayedCall(2.1, addLevelScreen);
				bMatchComplete = false;
				nMatchingCounter = 0;
			}else
			if (bMatchComplete && nMatchingCounter == 5 && nLevel == 4) // LEVEL 4
			{
				
				//If level is complete show past level COMPLETE and new level UNLOCKED save the data
				blv4_Complete = true;
				sharedObjectLevelComplete.data.blv4_Complete = blv4_Complete;
				sharedObjectLevelComplete.flush();  
				
				//SHOW NEXT LEVEL UNLOCKED
				blv5Locked = false;
				sharedObjectLevelProgress.data.blv5Locked = blv5Locked;
				sharedObjectLevelProgress.flush();  
				
				//DATA
				allSharedObjectData();
				
				
				TweenLite.delayedCall(2.1, addLevelScreen);
				bMatchComplete = false;
				nMatchingCounter = 0;
			}else
			if (bMatchComplete && nMatchingCounter == 5 && nLevel == 5) // LEVEL 5
			{
				
				//If level is complete show past level COMPLETE and new level UNLOCKED save the data
				blv5_Complete = true;
				sharedObjectLevelComplete.data.blv5_Complete = blv5_Complete;
				sharedObjectLevelComplete.flush();  
				
				//SHOW NEXT LEVEL UNLOCKED
				blv6Locked = false;
				sharedObjectLevelProgress.data.blv6Locked = blv6Locked;
				sharedObjectLevelProgress.flush();  
				
				//DATA
				allSharedObjectData();
				
				
				TweenLite.delayedCall(2.1, addLevelScreen);
				bMatchComplete = false;
				nMatchingCounter = 0;
			}else
			if (bMatchComplete && nMatchingCounter == 5 && nLevel == 6) // LEVEL 6
			{
				
				//If level is complete show past level COMPLETE and new level UNLOCKED save the data
				blv6_Complete = true;
				sharedObjectLevelComplete.data.blv6_Complete = blv6_Complete;
				sharedObjectLevelComplete.flush();  
				
				//SHOW NEXT LEVEL UNLOCKED
				blv7Locked = false;
				sharedObjectLevelProgress.data.blv7Locked = blv7Locked;
				sharedObjectLevelProgress.flush();  
				
				//DATA
				allSharedObjectData();
				
				
				TweenLite.delayedCall(2.1, addLevelScreen);
				bMatchComplete = false;
				nMatchingCounter = 0;
			}else
			if (bMatchComplete && nMatchingCounter == 5 && nLevel == 7) // LEVEL 7 FINISHED
			{
				
				//If level is complete show past level COMPLETE and new level UNLOCKED save the data
				blv7_Complete = true;
				sharedObjectLevelComplete.data.blv7_Complete = blv7_Complete;
				sharedObjectLevelComplete.flush();  
				
				//DATA
				allSharedObjectData();
				
				
				TweenLite.delayedCall(2.1, addLevelScreen);
				bMatchComplete = false;
				nMatchingCounter = 0;
			}else
			{
				TweenLite.delayedCall(2.0, addHexhandler);
			}
		}
		
		private function iQSoundHandler():void
		{	
			TweenLite.killDelayedCallsTo(iQSoundHandler);
			
			if (bSoundIsOn)
			{
				IQSound.play();
			}
		}
		
		
		private function destroySparkHandler():void 
		{
			//remove spark
			spark.destroy();
			//Add to spark counter
			nSparks ++;
			updateSparksCounter();
		}
		
		private function removeMatchEffect():void 
		{
			TweenLite.killDelayedCallsTo(removeMatchEffect);
			//Destroy Effect
			matchCompleteScrn.destroy();
		
		}
		
		private function addHexhandler():void 
		{
			//Update textfield new level 
			//updatelevelTextField();
			trace("ADD HEX NOW");
			
			//Add new hex
			if (bLevel_1)
			{
				//add hex
				if (bGeniusMode)
				{
					aMainHexArray = [hex_1]; 
				}else
				if(!bGeniusMode)
				{
					//FOR LEVELS
					if (nMatchingCounter == 1)
					{
						
						aMainHexFrameArray = [3];
						aMainHexArray = [hex_1, hex_2]; 
						addChild(hex_2);
						TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
					}else
					if (nMatchingCounter == 2)
					{
						aMainHexFrameArray = [4];
						aMainHexArray = [hex_1, hex_2, hex_3];
						addChild(hex_3);
						addChild(hex_2);
						TweenLite.to(hex_3, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
						TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
					}else
					if (nMatchingCounter == 3)
					{
						aMainHexFrameArray = [6];
						aMainHexArray = [hex_1, hex_2, hex_3, hex_4];
						addChild(hex_4);
						addChild(hex_3);
						addChild(hex_2);
						TweenLite.to(hex_4, 1.2, {y:(stage.stageHeight / 2) - 118, ease:Back.easeOut});
						TweenLite.to(hex_3, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
						TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
					}else
					if (nMatchingCounter == 4)
					{
						aMainHexFrameArray = [2];
						aMainHexArray = [hex_1, hex_2, hex_3, hex_4, hex_5];
						addChild(hex_5);
						addChild(hex_4);
						addChild(hex_3);
						addChild(hex_2);
						TweenLite.to(hex_5, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
						TweenLite.to(hex_4, 1.2, {y:(stage.stageHeight / 2) - 118, ease:Back.easeOut});
						TweenLite.to(hex_3, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
						TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
					}else
					{
						aMainHexArray = [hex_1];
					}
				
				}
				
				//randomColorGenerator();
				if (bSoundIsOn)
				{
					//Add new hex sound
				    matchSoundChannel = addHexSound.play();
				}
				greyOutColorsHandler();
				trace("LEVEL 1");
			}else
			if (bLevel_2)
			{
				
				aMainHexFrameArray = [2, 3, 4, 5, 6, 7, 8];
				aMainHexArray = [hex_1, hex_2]; 
			    addChild(hex_2);
			    TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
				//randomColorGenerator();
				
				if (bSoundIsOn)
				{
					//Add new hex sound
				    matchSoundChannel = addHexSound.play();
				}
				//Grey out colors
				greyOutColorsHandler();
				trace("LEVEL 2");
			}else
			if (bLevel_3)
			{
				aMainHexFrameArray = [2, 3, 4, 5, 6, 7, 8];
				aMainHexArray = [hex_1, hex_2, hex_3]; 
			    addChild(hex_3);
				TweenLite.to(hex_3, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
				//randomColorGenerator();
				if (bSoundIsOn)
				{
					//Add new hex sound
				    matchSoundChannel = addHexSound.play();
				}
				//Grey out colors
				greyOutColorsHandler();
				trace("LEVEL 3");
			}else
			if (bLevel_4)
			{
				aMainHexFrameArray = [2, 3, 4, 5, 6, 7, 8];
				aMainHexArray = [hex_1, hex_2, hex_3, hex_4];
			    addChild(hex_4);
				TweenLite.to(hex_4, 1.0, {y:(stage.stageHeight / 2) - 118, ease:Back.easeOut});
				TweenLite.to(hex_3, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
				//randomColorGenerator();	
				if (bSoundIsOn)
				{
					//Add new hex sound
				    matchSoundChannel = addHexSound.play();
				}
				//Grey out colors
				greyOutColorsHandler();
				trace("LEVEL 4");
			}else
			if (bLevel_5)
			{
				aMainHexFrameArray = [2, 3, 4, 5, 6, 7, 8];
				aMainHexArray = [hex_1, hex_2, hex_3, hex_4, hex_5];
			    addChild(hex_5);
				TweenLite.to(hex_5, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				TweenLite.to(hex_4, 1.0, {y:(stage.stageHeight / 2) - 118, ease:Back.easeOut});
				TweenLite.to(hex_3, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
				//randomColorGenerator();
				if (bSoundIsOn)
				{
					//Add new hex sound
				    matchSoundChannel = addHexSound.play();
				}
				//Grey out colors
				greyOutColorsHandler();
				trace("LEVEL 5");
			}else
			if (bLevel_6)
			{
				aMainHexFrameArray = [2, 3, 4, 5, 6, 7, 8];
				aMainHexArray = [hex_1, hex_2, hex_3, hex_4, hex_5, hex_6];
			    addChild(hex_6);
				TweenLite.to(hex_6, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_5, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				TweenLite.to(hex_4, 1.0, {y:(stage.stageHeight / 2) - 118, ease:Back.easeOut});
				TweenLite.to(hex_3, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
				//randomColorGenerator();
				if (bSoundIsOn)
				{
					//Add new hex sound
				    matchSoundChannel = addHexSound.play();
				}
				//Grey out colors
				greyOutColorsHandler();
				trace("LEVEL 6");
			}else
			if (bLevel_7)
			{
				aMainHexFrameArray = [2, 3, 4, 5, 6, 7, 8];
				aMainHexArray = [hex_1, hex_2, hex_3, hex_4, hex_5, hex_6, hex_7];
			    addChild(hex_7);
				TweenLite.to(hex_7, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				TweenLite.to(hex_6, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_5, 1.0, {x:(stage.stageWidth / 2) - 103, y:(stage.stageHeight / 2) - 60, ease:Back.easeOut});
				TweenLite.to(hex_4, 1.0, {y:(stage.stageHeight / 2) - 118, ease:Back.easeOut});
				TweenLite.to(hex_3, 1.0, {x:(stage.stageWidth / 2) + 103, y:(stage.stageHeight / 2) + 60, ease:Back.easeOut});
				TweenLite.to(hex_2, 1.0, {y:(stage.stageHeight / 2) + 118, ease:Back.easeOut});
				//randomColorGenerator();
				if (bSoundIsOn)
				{
					//Add new hex sound
				    matchSoundChannel = addHexSound.play();
				}
				//Grey out colors
				greyOutColorsHandler();
				trace("LEVEL 6");
			}
			
			
			randomColorGenerator();
			
		}
		
		private function levelHandler():void //If matches then re do hexes until meets next level requirments on match hex handler
		{
			//trace("CORRECT MATCH NUM : " + nCorrectMatch);
			if (nCorrectMatch == 1 && bLevel_1)
			{
				nCorrectMatch = 0;
				matchAllHexHandler(); // Do Transition Effect

			}else
			if (nCorrectMatch == 2 && bLevel_2)
			{
				nCorrectMatch = 0;
				matchAllHexHandler();
				
			}else
			if (nCorrectMatch == 3 && bLevel_3)
			{
				nCorrectMatch = 0;
				matchAllHexHandler();
			}else
			if (nCorrectMatch == 4 && bLevel_4)
			{
				nCorrectMatch = 0;
				matchAllHexHandler();
				
				//trace("LEVEL 5");
			}else
			if (nCorrectMatch == 5 && bLevel_5)
			{
				nCorrectMatch = 0;
				matchAllHexHandler();
				//trace("LEVEL 5");
			}else
			if (nCorrectMatch == 6 && bLevel_6)
			{
				nCorrectMatch = 0;
				matchAllHexHandler();
				//trace("LEVEL 5");
			}else
			if (nCorrectMatch == 7 && bLevel_7)
			{
				nCorrectMatch = 0;
				matchAllHexHandler();
				//Increase speed of grey out function
				nColorTimer -= 0.2;
				if (nColorTimer <= 1.0)
				{
					nColorTimer = 1.0;
				}
				//trace("LEVEL 5");
			}
		}
		
		
		
		private function geniusLevelHandler():void 
		{
			//trace("CORRECT MATCH NUM : " + nCorrectMatch);
			if (nCorrectMatch == 1 && bLevel_1)
			{
				 bLevel_1 = false;
			     bLevel_2 = true;
			     bLevel_3 = false;
			     bLevel_4 = false;
			     bLevel_5 = false;
			     bLevel_6 = false;
			     bLevel_7 = false;
				nCorrectMatch = 0;
				matchAllHexHandler(); // Do Transition Effect
				//trace("LEVEL 2");

			}else
			if (nCorrectMatch == 2 && bLevel_2)
			{
				 bLevel_1 = false;
			     bLevel_2 = false;
			     bLevel_3 = true;
			     bLevel_4 = false;
			     bLevel_5 = false;
			     bLevel_6 = false;
			     bLevel_7 = false;
				nCorrectMatch = 0;
				matchAllHexHandler();
				//trace("LEVEL 3");
			}else
			if (nCorrectMatch == 3 && bLevel_3)
			{
				 bLevel_1 = false;
			     bLevel_2 = false;
			     bLevel_3 = false;
			     bLevel_4 = true;
			     bLevel_5 = false;
			     bLevel_6 = false;
			     bLevel_7 = false;
				nCorrectMatch = 0;
				matchAllHexHandler();
				trace("LEVEL 4 Match");
			}else
			if (nCorrectMatch == 4 && bLevel_4)
			{
				 bLevel_1 = false;
			     bLevel_2 = false;
			     bLevel_3 = false;
			     bLevel_4 = false;
			     bLevel_5 = true;
			     bLevel_6 = false;
			     bLevel_7 = false;
				nCorrectMatch = 0;
				matchAllHexHandler();
				
				//trace("LEVEL 5");
			}else
			if (nCorrectMatch == 5 && bLevel_5)
			{
				 bLevel_1 = false;
			     bLevel_2 = false;
			     bLevel_3 = false;
			     bLevel_4 = false;
			     bLevel_5 = false;
			     bLevel_6 = true;
			     bLevel_7 = false;
				nCorrectMatch = 0;
				matchAllHexHandler();
				//trace("LEVEL 5");
			}else
			if (nCorrectMatch == 6 && bLevel_6)
			{
				 bLevel_1 = false;
			     bLevel_2 = false;
			     bLevel_3 = false;
			     bLevel_4 = false;
			     bLevel_5 = false;
			     bLevel_6 = false;
			     bLevel_7 = true;
				nCorrectMatch = 0;
				matchAllHexHandler();
				//trace("LEVEL 5");
			}else
			if (nCorrectMatch == 7 && bLevel_7)
			{
				nCorrectMatch = 0;
				matchAllHexHandler();
				//Increase speed of grey out function
				nColorTimer -= 0.2;
				if (nColorTimer <= 0.6)
				{
					nColorTimer = 0.6;
				}
				//trace("LEVEL 5");
			}
			
			
		}
		
		private function iQShineHandler():void 
		{
			TweenLite.killDelayedCallsTo(iQShineHandler);
			nIncrease ++; //Increase IQ for next level
			playScreen.display.mcIQlevel.gotoAndStop(nIncrease); // Increase level
			playScreen.display.mcIQlevel.inner.gotoAndPlay(2); // Shine
		}
		
		//Drop the Hexagon
		private function dropHex(e:MouseEvent):void 
		{
			e.currentTarget.stopDrag();
			//Boolean 
			bDragging = false;
			trace("Dragging " + bDragging);
			TweenMax.to(e.currentTarget, 0.1, {scaleX:1.0, scaleY:1.0}); //Scale back
			
		}
		
		//Drag the Hexagon
		private function dragHex(e:MouseEvent):void 
		{
			e.currentTarget.startDrag();
			bDragging = true;
			trace("Dragging " + bDragging);
			
			//Start timer 
			tCountTimer.start();
			tCountIQTimer.start();
			
			//Sound effect
			if (bSoundIsOn)
			{
				hexSelectSound.play();
			}
			
			//Create pulsing animation
			TweenMax.to(e.currentTarget, 0.5, {scaleX:1.2, scaleY:1.2, ease:Back.easeOut, repeat: -1, yoyo:true}); //Scale 
		}
		
		private function engineLogic(e:Event):void 
		{
			hitTestHandler(); // Hit test collision
			
			if (bGeniusMode) // Genius mode play
			{
				geniusLevelHandler();
				
			}else
			{
				levelHandler();
				resetHitTestHandler(); // Reset Hit Test
			}
			
			//trace("LEVEL 1 " + bLevel_1);
			//trace("TOTAL IQ " + totalIQ);
		    //clearDataHandler();
		}
		
		private function geniusIQAlgorithm():void // For the genius mode only 
		{
	
			//add to IQ for level progression 
			if (nLevelIQ == 2)
			{
				totalIQ += 30;
			}else
			if (nLevelIQ == 3)
			{
				totalIQ += 30;
			}else
			if (nLevelIQ == 4)
			{
				totalIQ += 10;
			}else
			if (nLevelIQ == 5)
			{
				totalIQ += 10;
			}else
			if (nLevelIQ == 6)
			{
				totalIQ += 10;
			}else
			if (nLevelIQ == 7)
			{
				totalIQ += 5;
			}else
			if (nLevelIQ == 8)
			{
				totalIQ += 5;
			}else
			if (nLevelIQ == 9)
			{
				totalIQ += 10;
			}else
			if (nLevelIQ == 10)
			{
				totalIQ += 10;
			}else
			if (nLevelIQ >= 11)
			{
				totalIQ += 10; 
			}
			
			//Create Statements for LEvel and Time progression if under 0.4ms to start and increase when more are added 
			if (nTimeiQ <= "00:00.4" && nLevelIQ == 2)
			{
				totalIQ += 5;
				tCountIQTimer.reset();
				timerCountIQ = 0;
				nTimeiQ = "00:00.0";
				trace("2");
			}else
			if (nTimeiQ <= "00:00.8" && nLevelIQ == 3)
			{
				totalIQ += 5;
				tCountIQTimer.reset();
				timerCountIQ = 0;
				nTimeiQ = "00:00.0";
				trace("2");
			}else
			if (nTimeiQ <= "00:01.6" && nLevelIQ == 4)
			{
				totalIQ += 5;
				tCountIQTimer.reset();
				timerCountIQ = 0;
				nTimeiQ = "00:00.0";
				trace("2");
			}else
			if (nTimeiQ <= "00:01.6" && nLevelIQ == 5)
			{
				totalIQ += 5;
				tCountIQTimer.reset();
				timerCountIQ = 0;
				nTimeiQ = "00:00.0";
				trace("2");
			}else
			if (nTimeiQ <= "00:02.8" && nLevelIQ == 6)
			{
				totalIQ += 5;
				tCountIQTimer.reset();
				timerCountIQ = 0;
				nTimeiQ = "00:00.0";
				trace("2");
			}else
			if (nTimeiQ <= "00:03.8" && nLevelIQ == 7)
			{
				totalIQ += 5;
				tCountIQTimer.reset();
				timerCountIQ = 0;
				nTimeiQ = "00:00.0";
				trace("2");
			}else
			if (nTimeiQ <= "00:05.0" && nLevelIQ >= 8)
			{
				totalIQ += 5;
				tCountIQTimer.reset();
				timerCountIQ = 0;
				nTimeiQ = "00:00.0";
				trace("2");
			}else
			{
				//tCountIQTimer.reset();
				//timerCountIQ = 0;
				//nTimeiQ = "00:00.0";
			}
			//trace("TIME IQ" + nTimeiQ);
			trace(totalIQ + " Total IQQQQQQQQQQQQQQQQQ");
			
			
		}
		
	
		
		private function resetHitTestHandler():void 
		{
		    for (var i:int = 0; i < aMainHexArray.length; i++)
			{
				
				currentHex = aMainHexArray[i]; // All Hexs

				if (resetHex.hit.hitTestObject(currentHex.hitBox) && bDragging && currentHex.currentFrame == 1) 
				{
					//Stop at current hex color
					currentHex.gotoAndStop(currentHex.sColor);
					
					TweenMax.to(currentHex, 0.5, { ease:Back.easeInOut, repeat:1, yoyo:true, onComplete:resetGreyOut, onCompleteParams:[currentHex]}); // tween animation
					//Add reset hex if user still has enough bolts
					TweenLite.delayedCall(0.5, addResetHex);
					
					
					bDragging = false; // So doesnt loop
					//Sound effect 
					if (bSoundIsOn)
			        {
			        	// Play finish sound 
			            matchSoundChannel = resetSound.play();
			        }
					//Remove Sparks
					nSparks -= nReset;
					updateSparksCounter();
					//Remove reset hex
					resetHex.destroy();
					
					nUsedSparks ++;
					//updateGameOverTextField();
				}
			}
		}
		
		private function resetGreyOut(currentHex:MovieClip):void 
		{
			currentHex.gotoAndStop("GREY");
			trace("GREEEEEY OUT ADD RESET");
		}

		
		
		private function hitTestHandler():void 
		{
		    for (var i:int = 0; i < aMainHexArray.length; i++)
			{
				
				currentHex = aMainHexArray[i]; // All Hexs
				//Hit test with each object in array seperate 0 being first object
				if (orangeHex.hit.hitTestObject(currentHex.hitBox) && currentHex.sColor == "ORANGE" && !bDragging && !bOrangeHex)  //ORANGE
				{
					//Remove Hex
					orangeHex.destroy();
					//Add Sound Effect increase for higher pitch sounds
					soundEffectHandler();
					nSoundEffect ++;
					//Add Effect
					mainEffecthandler();
					//Hex go back to main color
					currentHex.gotoAndStop("ORANGE");
					currentHex.inner.alpha = 0;
					TweenLite.to(currentHex.inner, 0.5, {alpha:1});
					currentHex.inner.gotoAndPlay(2); // Shine Effect
					//Increase Score
					//Add to number of correct matches
					nCorrectMatch ++;
					bOrangeHex = true;
					trace("WINNER");
				}else
				if (orangeHex.hit.hitTestObject(currentHex.hitBox) && currentHex.sColor != "ORANGE" && !bDragging)
				{
					trace("GameOver Orange");
					//Do this to all Colors to Show You were wrong then add error sound and game over screen
					if (bGeniusMode || !bGeniusMode && !bLevel_1)
					{
						currentHex.gotoAndStop(currentHex.sColor);
					}
					
				    //Game over variables 
					gameOverVariables();
				}
				
				//GREEN
				if (greenHex.hit.hitTestObject(currentHex.hitBox) && currentHex.sColor == "GREEN" && !bDragging && !bGreenHex) 
				{
					//Remove Hex
					greenHex.destroy();
					
					//Add Sound Effect increase for higher pitch sounds
					soundEffectHandler();
					nSoundEffect ++;
					//Add Effect
				   	mainEffecthandler();
					//Hex go back to main color
					currentHex.gotoAndStop("GREEN");
					currentHex.inner.alpha = 0;
					TweenLite.to(currentHex.inner, 0.5, {alpha:1});
					currentHex.inner.gotoAndPlay(2); // Shine Effect
					//Increase Score
					//Add to number of correct matches
					nCorrectMatch ++;
					bGreenHex = true;
					trace("WINNER");
				}else
				if (greenHex.hit.hitTestObject(currentHex.hitBox) && currentHex.sColor != "GREEN" && !bDragging)
				{
					trace("GameOver Green");
					//Do this to all Colors to Show You were wrong then add error sound and game over screen
					if (bGeniusMode || !bGeniusMode && !bLevel_1)
					{
						currentHex.gotoAndStop(currentHex.sColor);
					}
					
					//Game over variables 
					gameOverVariables();
				}
				
				//RED
				if (redHex.hit.hitTestObject(currentHex.hitBox) && currentHex.sColor == "RED" && !bDragging && !bRedHex) 
				{
					//Remove Hex
					redHex.destroy();
					
					//Add Sound Effect increase for higher pitch sounds
					soundEffectHandler();
					nSoundEffect ++;
					//Add Effect
					mainEffecthandler();
					//Hex go back to main color
					currentHex.gotoAndStop("RED");
					currentHex.inner.alpha = 0;
					TweenLite.to(currentHex.inner, 0.5, {alpha:1});
					currentHex.inner.gotoAndPlay(2); // Shine Effect
					//Increase Score
					//Add to number of correct matches
					nCorrectMatch ++;
					bRedHex = true;
					
					trace("WINNER");
				}else
				if (redHex.hit.hitTestObject(currentHex.hitBox) && currentHex.sColor != "RED" && !bDragging)
				{
					trace("GameOver Red");
					//Do this to all Colors to Show You were wrong then add error sound and game over screen
					if (bGeniusMode || !bGeniusMode && !bLevel_1)
					{
						currentHex.gotoAndStop(currentHex.sColor);
					}
					
					//Game over variables 
					gameOverVariables();
				}
				
				//YELLOW HEX
				if (yellowHex.hit.hitTestObject(currentHex.hitBox) && currentHex.sColor == "YELLOW" && !bDragging && !bYellowHex) 
				{
					//Remove Hex
					yellowHex.destroy();
					
					//Add Sound Effect increase for higher pitch sounds
					soundEffectHandler();
					nSoundEffect ++;
					//Add Effect
					mainEffecthandler();
					//Hex go back to main color
					currentHex.gotoAndStop("YELLOW");
					currentHex.inner.alpha = 0;
					TweenLite.to(currentHex.inner, 0.5, {alpha:1});
					currentHex.inner.gotoAndPlay(2); // Shine Effect
					//Increase Score
					//Add to number of correct matches
					nCorrectMatch ++;
					bYellowHex = true;
					
					trace("WINNER");
				}else
				if (yellowHex.hit.hitTestObject(currentHex.hitBox) && currentHex.sColor != "YELLOW" && !bDragging)
				{
					trace("GameOver Yellow");
					//Do this to all Colors to Show You were wrong then add error sound and game over screen
					if (bGeniusMode || !bGeniusMode && !bLevel_1)
					{
						currentHex.gotoAndStop(currentHex.sColor);
					}
					
					//Game over variables 
					gameOverVariables();
				}
				
				//BLUE HEX
				if (blueHex.hit.hitTestObject(currentHex.hitBox) && currentHex.sColor == "BLUE" && !bDragging && !bBlueHex) 
				{
					//Remove Hex
					blueHex.destroy();
					
					//Add Sound Effect increase for higher pitch sounds
					soundEffectHandler();
					nSoundEffect ++;
					//Add Effect
					mainEffecthandler();
					//Hex go back to main color
					currentHex.gotoAndStop("BLUE");
					currentHex.inner.alpha = 0;
					TweenLite.to(currentHex.inner, 0.5, {alpha:1});
					currentHex.inner.gotoAndPlay(2); // Shine Effect
					//Increase Score
					//Add to number of correct matches
					nCorrectMatch ++;
					bBlueHex = true;
					
					trace("WINNER");
				}else
				if (blueHex.hit.hitTestObject(currentHex.hitBox) && currentHex.sColor != "BLUE" && !bDragging)
				{
					trace("GameOver Blue");
					//Do this to all Colors to Show You were wrong then add error sound and game over screen
					if (bGeniusMode || !bGeniusMode && !bLevel_1)
					{
						currentHex.gotoAndStop(currentHex.sColor);
					}
					
					//Game over variables 
					gameOverVariables();
				}
				
				//PURPLE HEX
				if (purpleHex.hit.hitTestObject(currentHex.hitBox) && currentHex.sColor == "PURPLE" && !bDragging && !bPurpleHex) 
				{
					//Remove Hex
					purpleHex.destroy();
					
					//Add Sound Effect increase for higher pitch sounds
					soundEffectHandler();
					nSoundEffect ++;
					//Add Effect
					mainEffecthandler();
					//Hex go back to main color
					currentHex.gotoAndStop("PURPLE");
					currentHex.inner.alpha = 0;
					TweenLite.to(currentHex.inner, 0.5, {alpha:1});
					currentHex.inner.gotoAndPlay(2); // Shine Effect
					//Increase Score
					//Add to number of correct matches
					nCorrectMatch ++;
					bPurpleHex = true;
					trace("WINNER");
				}else
				if (purpleHex.hit.hitTestObject(currentHex.hitBox) && currentHex.sColor != "PURPLE" && !bDragging)
				{
					trace("GameOver Purple");
					//Do this to all Colors to Show You were wrong then add error sound and game over screen
					if (bGeniusMode || !bGeniusMode && !bLevel_1)
					{
						currentHex.gotoAndStop(currentHex.sColor);
					}
					
					//Game over variables 
					gameOverVariables();
				}
				
				//WHITE HEX
				if (whiteHex.hit.hitTestObject(currentHex.hitBox) && currentHex.sColor == "WHITE" && !bDragging && !bWhiteHex) 
				{

					//Remove Hex
					whiteHex.destroy();
					
					//Add Sound Effect increase for higher pitch sounds
					soundEffectHandler();
					nSoundEffect ++;
					//Add Effect
					mainEffecthandler();
					//Hex go back to main color
					currentHex.gotoAndStop("WHITE");
					currentHex.inner.alpha = 0;
					TweenLite.to(currentHex.inner, 0.5, {alpha:1});
					currentHex.inner.gotoAndPlay(2); // Shine Effect
					//Increase Score
					//Add to number of correct matches
					nCorrectMatch ++;
					bWhiteHex = true;
					
					trace("WINNER");
				}else
				if (whiteHex.hit.hitTestObject(currentHex.hitBox) && currentHex.sColor != "WHITE" && !bDragging)
				{
					trace("GameOver White");
					//Do this to all Colors to Show You were wrong then add error sound and game over screen 
					if (bGeniusMode || !bGeniusMode && !bLevel_1)
					{
						currentHex.gotoAndStop(currentHex.sColor);
					}
					
					//Game over variables 
					gameOverVariables();
					
				}
			}
		}
		
		
		private function gameOverVariables():void
		{
			//Game Over handler
			removeEventListener(Event.ENTER_FRAME, engineLogic);
			//Game Over Sound Effect
			if (bSoundIsOn)
			{
				matchSoundChannel = gameOverSound.play();
			}
			//Game Over handler
			gameOverEffect = new mcGameOverEffect();
			gameOverEffect.x = currentHex.x;
			gameOverEffect.y = currentHex.y;
			addChild(gameOverEffect);
			TweenLite.to(gameOverEffect, 2.5, {alpha:0, onComplete:removeGameOverEffect});
			//Stop Timer
			tCountTimer.stop();
			tCountIQTimer.stop();
			tCountTimer.removeEventListener(TimerEvent.TIMER, timerTickHandler);
			tCountIQTimer.removeEventListener(TimerEvent.TIMER, iQTickHandler);
			
			
			//Remove colors and listeners
			for (var i:int = 0; i < aHexColorArray.length; i++)
			{
				var allHexColors = aHexColorArray[i];
				
				aHexColorArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, dragHex);
				aHexColorArray[i].removeEventListener(MouseEvent.MOUSE_UP, dropHex);
			}
			
			//Vibrate
			if (bVibrate)
			{
				Vibration.service.vibrate( 500 );
			}
			
			
			TweenMax.to(currentHex, 0.5, {rotation: 90}); 
			
			//Rmeove play screen displays etc
			TweenLite.to(playScreen.sparkDisplay, 0.5, {alpha: 0 });
			TweenLite.to(playScreen.display, 0.5, {y:playScreen.display.y - 110 , ease:Back.easeInOut});
		}
		
		private function removeGameOverEffect():void 
		{
			//remove effect
			gameOverEffect.destroy();
			//Add game over screen
			if (bGeniusMode)
			{
				nAdView ++;
				gameOverHandler();
				
				if (Adverts.isSupported)
				{
					if (nAdView % 3 == 0)
					{
						interstitial.show();
						
					}
				}
			}else //back to level screen
			{
				
				//Remove any listners and Movie clips
				for (var i:int = 0; i < aHexColorArray.length; i++)
				{
					var allHexColors = aHexColorArray[i];
					
					aHexColorArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, dragHex);
					aHexColorArray[i].removeEventListener(MouseEvent.MOUSE_UP, dropHex);
					
					allHexColors.destroy();
					allHexColors = null;
					//aHexColorArray = [];
				}
				//Remove Main hexes
				for (var k:int = 0; k < aMainHexArray.length; k++)
				{
					var allHexs = aMainHexArray[k];
					
					allHexs.destroy();
					allHexs = null;
					//aMainHexArray = [];
				}

				//Remove Reset hex
				resetHex.removeEventListener(MouseEvent.MOUSE_DOWN, dragReset);
				resetHex.removeEventListener(MouseEvent.MOUSE_UP, dropReset);
				resetHex.destroy();
				
				//Clear arrays function
				clearArrays();
				
				bOnGameOverScreen = true;
				bOnStartScreen = false;
				bPlayingGame = false;
				
				//spark display back to position 
				playScreen.sparkDisplay.gotoAndStop(1);
				playScreen.sparkDisplay.innerSpark.gotoAndStop(1);
			
				//add level screen
				addLevelScreen();
				
				//make level display back to 1
				nLevelDisplay = 1;
				
				//ADVERTISEMENTS SHOW
				if (Adverts.isSupported)
				{
					adView.show();
				}
			}
			
			
		}
		
		private function gameOverHandler():void //GENIUS MODE HANDLER
		{
			
			//Remove any listners and Movie clips
			for (var i:int = 0; i < aHexColorArray.length; i++)
			{
				var allHexColors = aHexColorArray[i];
				
				aHexColorArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, dragHex);
				aHexColorArray[i].removeEventListener(MouseEvent.MOUSE_UP, dropHex);
				
				allHexColors.destroy();
				allHexColors = null;
				//aHexColorArray = [];
			}
			//Remove Main hexes
			for (var k:int = 0; k < aMainHexArray.length; k++)
			{
				var allHexs = aMainHexArray[k];
				
				allHexs.destroy();
				allHexs = null;
				//aMainHexArray = [];
			}

			
			//Clear arrays function
			clearArrays();
				
			
			trace(aMainHexArray.length + " Hex Array");
			trace(aHexColorArray.length + " Hex Color Array");
			
			//Remove Reset hex
			resetHex.removeEventListener(MouseEvent.MOUSE_DOWN, dragReset);
			resetHex.removeEventListener(MouseEvent.MOUSE_UP, dropReset);
			resetHex.destroy();

			//Add game over screen
			gameOverScreen.x = (stage.stageWidth / 2);
			gameOverScreen.y = (stage.stageHeight / 2);
			addChild(gameOverScreen);
		    gameOverScreen.mcRetry.addEventListener(MouseEvent.CLICK, gameOverListeners);
		    gameOverScreen.mcLeaderboard.addEventListener(MouseEvent.CLICK, gameOverListeners);
		    gameOverScreen.mcHome.addEventListener(MouseEvent.CLICK, gameOverListeners);
		    gameOverScreen.mcShare.addEventListener(MouseEvent.CLICK, gameOverListeners);
			gameOverScreen.mcAchievements.addEventListener(MouseEvent.CLICK, gameOverListeners);
			gameOverScreen.mcStore.addEventListener(MouseEvent.CLICK, gameOverListeners);
			
			bOnGameOverScreen = true;
			bOnStartScreen = false;
			bPlayingGame = false;
			
			//text for IQ
			nIQ = totalIQ;	
			nLeaderboardScore = nIQ; //HIGH SCORE DATA LEADERBOARDS
			updateGameOverTextField();
			
			updateDisplayIQ();
		}
		
		private function updateDisplayIQ():void 
		{
			if (nIQ >= 90 && nIQ <= 105)
			{
				gameOverScreen.mcEndIQ.gotoAndStop(1);
			}else
			if (nIQ >= 110 && nIQ <= 119)
			{
				gameOverScreen.mcEndIQ.gotoAndStop(2);
			}else
			if (nIQ >= 120 && nIQ <= 140)
			{
				gameOverScreen.mcEndIQ.gotoAndStop(3);
			}else
			if (nIQ >= 150)
			{
				gameOverScreen.mcEndIQ.gotoAndStop(4);
			}
		}
		
		private function gameOverListeners(e:MouseEvent):void 
		{
			if (e.currentTarget ==  gameOverScreen.mcRetry)
			{
				//Remove Screens and listeners
				gameOverScreen.mcRetry.removeEventListener(MouseEvent.CLICK, gameOverListeners);
				gameOverScreen.mcLeaderboard.removeEventListener(MouseEvent.CLICK, gameOverListeners);
				gameOverScreen.mcHome.removeEventListener(MouseEvent.CLICK, gameOverListeners);
				gameOverScreen.mcShare.removeEventListener(MouseEvent.CLICK, gameOverListeners);
				gameOverScreen.mcAchievements.removeEventListener(MouseEvent.CLICK, gameOverListeners);
				gameOverScreen.mcStore.removeEventListener(MouseEvent.CLICK, gameOverListeners);
				gameOverScreen.destroy();
				//Back to Play game
				playGameHandler();
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
			
			}else  
			if (e.currentTarget ==  gameOverScreen.mcLeaderboard)
			{
				
				
				//Check if User has signed in
				if (GameServices.isSupported)
				{
					//LEADERBOARDS
					GameServices.service.leaderboards.loadLeaderboards();
					GameServices.service.leaderboards.displayLeaderboardUI( "CgkI4_7SyqQUEAIQAA" );
				}
				trace("LEADERBOARDS");
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
			}else    
			if (e.currentTarget ==  gameOverScreen.mcAchievements)
			{
				
				//Achievement screen wil be handled on app stores
				//Check if User has signed in
				if (GameServices.isSupported)
				{
					//ACHIEVEMENTS
					GameServices.service.achievements.displayAchievementsUI();
					trace("DIsplay the Achiev screen!");
				}
				trace("ACHEIEVEMENTS");
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
			}else  
			if (e.currentTarget ==  gameOverScreen.mcHome)
			{
				//Remove Screens and listeners
				gameOverScreen.mcRetry.removeEventListener(MouseEvent.CLICK, gameOverListeners);
				gameOverScreen.mcLeaderboard.removeEventListener(MouseEvent.CLICK, gameOverListeners);
				gameOverScreen.mcHome.removeEventListener(MouseEvent.CLICK, gameOverListeners);
				gameOverScreen.mcShare.removeEventListener(MouseEvent.CLICK, gameOverListeners);
				gameOverScreen.mcStore.removeEventListener(MouseEvent.CLICK, gameOverListeners);
				gameOverScreen.destroy();
				
				//Back to start screen
				startScreenMainHandler();
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
				
			}else  
			if (e.currentTarget ==  gameOverScreen.mcShare)
			{
				shareScreenHandler(e); // Reuse the share handler
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
			}else  
			if (e.currentTarget ==  gameOverScreen.mcStore)
			{
				//Add Start Screen
				storeScreen.x = (stage.stageWidth / 2);
				storeScreen.y = (stage.stageHeight / 2);
				addChild(storeScreen);
				//Listners
				storeScreen.mcExit.addEventListener(MouseEvent.CLICK, storeScreenListeners);
				storeScreen.mcWatchAd.addEventListener(MouseEvent.CLICK, storeScreenListeners);
				
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
				
				//Update sparks
				allSharedObjectData();
				//Select Sound
				if (bSoundIsOn)
				{
					selectSound.play();
				}
			}  
			
		}

		
		private function soundEffectHandler():void 
		{
			if (bSoundIsOn)
			{
				if (nSoundEffect == 1)
			    {
			    	matchSoundChannel = matchSound_1.play();
			    }else
			    if (nSoundEffect == 2)
			    {
			    	matchSoundChannel = matchSound_2.play();
			    }else
			    if (nSoundEffect == 3)
			    {
			    	matchSoundChannel = matchSound_3.play();
			    }else
			    if (nSoundEffect == 4)
			    {
			    	matchSoundChannel = matchSound_4.play();
			    }else
			    if (nSoundEffect == 5)
			    {
			    	matchSoundChannel = matchSound_5.play();
			    }else
			    if (nSoundEffect == 6)
			    {
			    	matchSoundChannel = matchSound_6.play();
			    }else
			    if (nSoundEffect == 7)
			    {
			    	matchSoundChannel = matchSound_7.play();
			    }
			}
			
		}
		
		private function mainEffecthandler():void 
		{
			trace("EFFECT");
			setChildIndex(currentHex, numChildren - 1); // Set current hex above others to come on top for effect	
			TweenMax.to(currentHex, 0.5, {scaleX:1.5, scaleY:1.5, ease:Back.easeInOut, repeat:1, yoyo:true, onComplete:hexEffectHandler}); 
			
			
		}
		
		private function hexEffectHandler():void 
		{
			for (var i:int = 0; i < aMainHexArray.length; i++)
			{
				//Reset Hexs Index position
				var allHex = aMainHexArray[i]; // All Hexs
				setChildIndex(allHex, 1);
			}
			
		
		}
		
		//Function for tweenling hexs individually
		private function tweenColorHexHandler():void 
		{
			trace("TWEEN COLOR HEX HANDLER");

			for (var b:int = 0; b < aMainHexArray.length; b++)
			{
			   var nHexColors = aMainHexArray[b];


			   if (nHexColors.sColor == "RED")  // Position Bottom Middle Right
			   {

			       //Add hex 
				   redHex.x = (stage.stageWidth / 2) + 55
			       redHex.y = (stage.stageHeight / 2) + 450;
			       addChild(redHex);
			       TweenLite.to(redHex, 0.5, {y:(stage.stageHeight / 2) + 350, ease:Back.easeOut});  
				   trace("RED On Screen");
			   }else
			   if (nHexColors.sColor == "GREEN") // Position Bottom Middle Left
			   {

			        //Add hex 
				   greenHex.x = (stage.stageWidth / 2) - 55;
			       greenHex.y = (stage.stageHeight / 2) + 450;
			       addChild(greenHex);
			       TweenLite.to(greenHex, 0.5, {y:(stage.stageHeight / 2) + 350, ease:Back.easeOut});  
				   trace("GREEN On Screen");
			   }else
			   if (nHexColors.sColor == "BLUE")  // Position Bottom Right
			   {

			       //Add hex 
				   blueHex.x = (stage.stageWidth / 2) + 165;
			       blueHex.y = (stage.stageHeight / 2) + 450;
			       addChild(blueHex);
			       TweenLite.to(blueHex, 0.5, {y:(stage.stageHeight / 2) + 350, ease:Back.easeOut});
				   trace("BLUE On Screen");
			   }else
			   if (nHexColors.sColor == "YELLOW") // Position Bottom Left
			   {

			       //Add hex 
				   yellowHex.x = (stage.stageWidth / 2) - 165;
			       yellowHex.y = (stage.stageHeight / 2) + 450;
			       addChild(yellowHex);
			       TweenLite.to(yellowHex, 0.5, {y:(stage.stageHeight / 2) + 350, ease:Back.easeOut});
				   trace("YELLOW On Screen");
			   }else
			   if (nHexColors.sColor == "WHITE")  // Position Top Right
			   {

			       //Add hex 
				   whiteHex.x = (stage.stageWidth / 2) - 55;
			       whiteHex.y = (stage.stageHeight / 2) + 450;
			       addChild(whiteHex);
			       TweenLite.to(whiteHex, 0.5, {y:(stage.stageHeight / 2) + 255, ease:Back.easeOut}); 
				   trace("WHITE On Screen");
			   }else
			   if (nHexColors.sColor == "PURPLE")  // Position Top Left
			   {

			       //Add hex 
				   purpleHex.x = (stage.stageWidth / 2) - 165;
			       purpleHex.y = (stage.stageHeight / 2) + 450;
			       addChild(purpleHex);
			       TweenLite.to(purpleHex, 0.5, {y:(stage.stageHeight / 2) + 255, ease:Back.easeOut});
				   trace("PURPLE On Screen");
			   }else
			   if (nHexColors.sColor == "ORANGE") // Position Top Middle
			   {

			       //Add Orange Hex
				   orangeHex.x = (stage.stageWidth / 2) + 55;
			       orangeHex.y = (stage.stageHeight / 2) + 450;
				   addChild(orangeHex);
			       TweenLite.to(orangeHex, 0.5, {y:(stage.stageHeight / 2) + 255, ease:Back.easeOut});
				   trace("ORANGE On Screen");
			   }

			}
		}
	
		private function randomColorGenerator():void 
		{
				
			//Loop through HExes and make them randomn generate color
			for (var i:int = 0; i < aMainHexArray.length; i++)
			{
			   var randomFrame:uint = aMainHexFrameArray.splice(Math.floor(Math.random() * aMainHexFrameArray.length), 1);
			   var currentHexFrame = aMainHexArray[i];
			   
			   nHexColors = randomFrame;
			   
			   currentHexFrame.gotoAndStop(nHexColors);

			   if (nHexColors == 2)  // Position Bottom Middle Right
			   {
				   trace(currentHexFrame + "COLOR FRAME RED");
				   currentHexFrame.sColor = "RED";
				   
				
			
			   }else
			   if (nHexColors == 3) // Position Bottom Middle Left
			   {
				  trace(currentHexFrame + "COLOR FRAME GREEN");
				   currentHexFrame.sColor = "GREEN";
				   
				  
			   }else
			   if (nHexColors == 4)  // Position Bottom Right
			   {
				   trace(currentHexFrame + "COLOR FRAME BLUE");
				   currentHexFrame.sColor = "BLUE";
				   
				   
			   }else
			   if (nHexColors == 5) // Position Bottom Left
			   {
				    trace(currentHexFrame + "COLOR FRAME YELLOW");
				   currentHexFrame.sColor = "YELLOW";
				   
				  
			   }else
			   if (nHexColors == 6)  // Position Top Middle Left
			   {
				    trace(currentHexFrame + "COLOR FRAME WHITE");
				   currentHexFrame.sColor = "WHITE";
				   
				  
			   }else
			   if (nHexColors == 7)  // Position Top Left
			   {
				   trace(currentHexFrame + "COLOR FRAME PURPLE");
				   currentHexFrame.sColor = "PURPLE";
				   
				  
			   }else
			   if (nHexColors == 8) // Position Top Middle right
			   {
				    trace(currentHexFrame + "COLOR FRAME ORANGE");
				   currentHexFrame.sColor = "ORANGE";
				   
				 
			   }
			   
			  
			   /*
			   if (nHexColors == 9)
			   {
				   trace(currentHexFrame + "COLOR FRAME BROWN");
				   currentHexFrame.sColor = "BROWN";
			   }*/
				
			}
		}
		
		
		
		
		
		private function updatelevelTextField():void
		{
			//current level text
			playScreen.display.levelTextField.text = " " + nLevel.toString();
		}
		
		private function updateLevelScreenTextDisplay():void 
		{
				//current level text
			playScreen.display.levelTextField.text = " " + nLevelDisplay.toString();
		}
		
		private function updateLevelScreenText():void
		{
			sharedObjectLevel.data.nLevelsText = nLevelsText;
			
			levelScreen.levelTextField.text = " " + nLevelsText.toString();
		}
		
		private function updateSparksCounter():void 
		{
			//save data
			sharedObjectSparks.data.nSparks = nSparks;
			
			//Play Screen Display
			playScreen.sparkDisplay.sparkTexField.text = " " + nSparks.toString();
			
			//Store screen Display
			storeScreen.sparkTexField.text = " " + nSparks.toString();
		}
		
		private function updateGameOverTextField():void
		{

			//***********************LEVEL***************
			//Save Score 
			if (nLevelData > sharedObjectLevel.data.nLevelData)
			{
				sharedObjectLevel.data.nLevelData = nLevelData;
			}
			
			//TextFields dont need the "";
			gameOverScreen.currentLevelText.text = nLevelData.toString();
			gameOverScreen.bestLevelText.text = sharedObjectLevel.data.nLevelData;
			sharedObjectLevel.flush();
			
			//******************TIME****************
			gameOverScreen.currentTimeText.text = nTime;
			sharedObjectTime.flush();
			trace(nTime + " TIME");
			
			//Save Score 
			if (nIQ > sharedObjectIQ.data.nIQ)
			{
				sharedObjectIQ.data.nIQ = nIQ;
			}
			
			
			//SUBMIT LEADER BOARD SCORES
			if (GameServices.isSupported)
			{
				GameServices.service.leaderboards.submitScore( "CgkI4_7SyqQUEAIQAA", nLeaderboardScore );
			
			    if (nIQ < sharedObjectIQ.data.nIQ )
	            {
	            	GameServices.service.leaderboards.submitScore( "CgkI4_7SyqQUEAIQAA", sharedObjectIQ.data.nIQ );
	            }
			}

			
			
			//******************IQ****************
			gameOverScreen.currentTotalText.text = totalIQ.toString();
			gameOverScreen.bestTotalIQText.text = sharedObjectIQ.data.nIQ;
			sharedObjectIQ.flush();
			
		}
		
		
		private function confettiHandler():void
		{
			bConfettiActive = true;
			
            addChild(c);
            c.start();
			
			//Vibrate
			if (bVibrate)
			{
				Vibration.service.vibrate( 500 );
			}
		}
		
		private function stopConfettiHandler():void 
		{
			c.remove();
			removeChild(c);
		}
		
		
		

		
		/*
		private function saveData():void 
		{
			if (nScore > sharedObjectHighScore.data.highScore )
	        {
	        	sharedObjectHighScore.data.highScore = nScore;	
	        }
			
			endGameScreen.bestScoreTextField.text = " " + sharedObjectHighScore.data.highScore;
			sharedObjectHighScore.flush();
			
			//For leaderboards
			nLeaderboardScore = nScore;
		}*/
		
		
		//Generates a truly "random" number
		public function randomNumber(low:Number=0, high:Number=1):Number
		{
		  return Math.floor(Math.random() * (1+high-low)) + low;
		}
		
		
	}

}