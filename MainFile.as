//Sources: http://www.actioscrip.org/resources/articles/648/Car-Movement/Page4.html.
package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.ui.*;
	import flash.text.*;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import fl.controls.Label;
	import flash.events.*;
	import fl.controls.*;
	import flash.display.Stage;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;


	public class MainFile extends MovieClip
	{
		/////////////////////INTRO SCREEN/////////////////////////////////
		private var Intro:intro = new intro  ;
		private var btnContinue:ContinueBtn = new ContinueBtn  ;
		///////////////////Timers for Car Motion//////////////////////////
		var tmrCar:Timer = new Timer(30);
		var tmrCar2:Timer = new Timer(30);
		//////////////////Main Cars//////////////////////////////////////
		var car:Sprite = new Sprite  ;
		var car2:Sprite = new Sprite  ;
		//////////////Different Cars/////////////////////////////////////
		private var CAR1:LAMBO = new LAMBO  ;
		private var CAR2:Porche = new Porche  ;
		private var CAR3:YellowCar = new YellowCar  ;
		private var CAR4:SportsCar = new SportsCar  ;
		private var CAR5:LAMBO = new LAMBO  ;
		private var CAR6:Porche = new Porche  ;
		//////////////////////Track Stuff/////////////////////////////////
		private var grass:Grass = new Grass  ;
		private var track:Track = new Track  ;
		private var startline:TrackStartLine = new TrackStartLine  ;
		private var midline:CheckPoint = new CheckPoint  ;
		/////////////////Car1 Lap Checking////////////////////////////////
		var totalLaps:int = 3;
		var nLap:int;
		var nCount:int;
		var nLapCount:int;
		var currentLap:int;
		var txtLaps:TextField = new TextField  ;
		////////////////Car2 Lap Checking/////////////////////////////////
		var nLap2:int;
		var nCount2:int;
		var nLapCount2:int;
		var currentLap2:int;
		var txtLaps2:TextField = new TextField  ;
		/////////Changing Cars ////////////////////////////
		/////////////Player one Choice////////////////////
		var rbBMW:RadioButton=new RadioButton();
		var rbPorche:RadioButton=new RadioButton();
		/////////////Player two Choice/////////////////////
		var rbgSecondPlayerChoice:RadioButtonGroup = new RadioButtonGroup("SecondPlayerChoice");
		var rbBMW2:RadioButton = new RadioButton();
		var rbPorche2:RadioButton = new RadioButton();
		/////////////Car thumbnails///////////////////////
		var car1img:SportsCar = new SportsCar  ;
		var car2img:Car2 = new Car2  ;
		var car3img:Car1 = new Car1  ;
		var car4img:YellowCar = new YellowCar  ;
		private var txtPlayer1:Player1txt = new Player1txt  ;
		private var txtPlayer2:Player2txt = new Player2txt  ;
		//////////////////StopWatch///////////////////////
		var nms:int = 00;
		var nsec:int = 00;
		var nmin:int = 00;
		var nBestLap:Number;
		var tmrLapCount:Timer = new Timer(75);
		var myFormat:TextFormat = new TextFormat  ;
		var FontSize:TextFormat = new TextFormat  ;
		var txtTime:TextField = new TextField  ;
		var txtTime2:TextField = new TextField  ;
		var txtTotalTime:TextField = new TextField  ;

		///////////////////Start Menu//////////////////////
		private var btnStartGame:btnStart = new btnStart  ;
		private var btnSettings:SettingsBtn = new SettingsBtn  ;
		private var btnBack:BackBtn = new BackBtn  ;
		private var btnControls:Controlsbtn = new Controlsbtn  ;
		private var imgWASD:WASDimg = new WASDimg  ;
		private var imgArrowKeys:ArrowKeysimg = new ArrowKeysimg  ;
		private var startbox:StartBox = new StartBox  ;
		private var timerBox:DisplayBox = new DisplayBox  ;
		var cboChooseLaps:ComboBox = new ComboBox  ;
		///////////////////End Menu/////////////////////////
		private var btnHomePage:BtnHome = new BtnHome  ;
		private var btnPlayAgain:btnReset = new btnReset  ;
		//////////Car 1 Settings/Motions////////////////////
		var maxSpeed:Number = 8;
		var rotationSpeed:Number = 3;
		var backSpeeed:Number = 1;
		var decay:Number = .97;
		var currentSpeed:Number = 0;
		var speedX:Number = 0;
		var speedY:Number = 0;
		//////////Car 2 Settings/Motions////////////////////
		var speed2X:Number = 0;
		var speed2Y:Number = 0;
		var currentSpeed2:Number = 0;
		var maxSpeed2:Number = 8;
		var rotationSpeed2:Number = 3;
		///////////////Booleans for lap checking////////////
		var LapCounting:Boolean = false;
		var LapCounting2:Boolean = false;

		///////////////KeyBoard Events//////////////////////
		var nKeyCode:int;
		var movingUp:Boolean = false;
		var movingLeft:Boolean = false;
		var movingRight:Boolean = false;
		var movingBack:Boolean = false;
		var Start:Boolean = true;
		var KeyW:Boolean = false;
		var KeyA:Boolean = false;
		var KeyD:Boolean = false;
		var KeyS:Boolean = false;
		/////////////Boolean for the back button//////////
		var back:Boolean = false;

		public function MainFile()
		{
			////////////////Intro/////////////////
			Intro.x = 233;
			Intro.y = 89;
			addChild(Intro);
			btnContinue.x = 840;
			btnContinue.y = 187;
			addChild(btnContinue);
			btnContinue.addEventListener(MouseEvent.CLICK,Continue);


			car.rotation = 90;
			car.x = startline.x - 50;
			//car.x=stage.stageWidth/2;
			car.y = 685;
			car2.rotation = 90;
			car2.x = startline.x - 50;
			//car2.x=stage.stageWidth/2;
			car2.y = 740;
			//stage.addChild(car);

			grass.x = 553.6;
			grass.y = 400.8;
			//addChild(grass);
			track.x = 554.7;
			track.y = 400.9;
			//addChild(track);

			startline.x = 615;
			startline.y = 710;
			startline.height = 85;
			//addChild(startline);

			midline.x = 275;
			midline.y = 302;
			midline.rotation = 90;
			//addChild(midline);
			///////////////////Lap Display///////////////
			FontSize.size = 19;
			txtLaps.x = 600;
			txtLaps.y = 430;
			txtLaps.defaultTextFormat = FontSize;
			txtLaps.borderColor = 0xFF0000;

			txtLaps.text = "Laps :";
			//addChild(txtLaps);
			//TxtLaps for car 2
			txtLaps2.x = 770;
			txtLaps2.y = 430;
			txtLaps2.defaultTextFormat = FontSize;
			txtLaps2.borderColor = 0xFF0000;
			txtLaps2.text = "Lap :";
			//addChild(txtLaps2);


			//Timer
			FontSize.size = 22;
			txtTime.x = 678;
			txtTime.y = 427;
			txtTime.defaultTextFormat = FontSize;
			txtTime.textColor = 0xFFFF00;
			txtTime.text = "00:00:00";
			//addChild(txtTime);
			///////textfield timer for car 2////////
			txtTime2.x = 850;
			txtTime2.y = 428;
			txtTime2.defaultTextFormat = FontSize;
			txtTime2.textColor = 0xFF00FF;
			txtTime2.text = "00:00:00";
			//addChild(txtTime2);
			myFormat.size = 25;
			txtTotalTime.x = 350;
			txtTotalTime.y = 400;
			txtTotalTime.width = 400;
			txtTotalTime.defaultTextFormat = myFormat;
			txtTotalTime.textColor = 0xFF0000;
			//Timer and Lap Box;
			timerBox.x = 725;
			timerBox.y = 433;

			//addChild(timerBox);
			//MainPage&EndPage
			startbox.x = 550;
			startbox.y = 400;
			btnSettings.x = 553;
			btnSettings.y = 428;
			//addChild(startbox);
			btnControls.x = 559;
			btnControls.y = 480;
			//addChild(btnControls);
			imgArrowKeys.x = 480;
			imgArrowKeys.y = 220;
			imgWASD.x = 510;
			imgWASD.y = 440;

			//addChild(btnSettings);
			btnStartGame.x = 550;
			btnStartGame.y = 400;
			//addChild(btnStartGame);
			btnHomePage.x = 660;
			btnHomePage.y = 253;
			//btnHomePage.label="Main Page";
			btnPlayAgain.x = 480;
			btnPlayAgain.y = 250;


			//addChild(btnHomePage);
			cboChooseLaps.move(470,270);
			cboChooseLaps.setSize(180,25);
			cboChooseLaps.prompt = "Choose Laps";
			cboChooseLaps.addItem({label:"1",data:1});
			cboChooseLaps.addItem({label:"2",data:2});
			cboChooseLaps.addItem({label:"3",data:3});
			cboChooseLaps.addItem({label:"4",data:4});
			//addChild(cboChooseLaps);
			btnBack.x = 480;
			btnBack.y = 550;
			////////////RadioButtons Choice for Player 1////////////////
			rbBMW.move(510,320);
			rbBMW.label = " ";
			//addChild(rbBMW);
			rbPorche.move(600,320);
			rbPorche.label = " ";
			//addChild(rbPorche);
			car1img.x = 520;
			car1img.y = 370;
			car1img.rotation = 90;
			//addChild(car1img);
			car2img.x = 610;
			car2img.y = 370;
			car2img.rotation = 90;
			//addChild(car2img);
			////////////RadioButtons Choice for Player 2////////////////
			rbBMW2.move(510,420);
			rbBMW2.label = " ";
			rbBMW2.group = rbgSecondPlayerChoice;
			//addChild(rbBMW2);
			rbPorche2.move(600,420);
			rbPorche2.label = " ";
			rbPorche2.group = rbgSecondPlayerChoice;
			//addChild(rbPorche2);
			//Images
			car3img.x = 520;
			car3img.y = 470;
			car3img.rotation = 90;
			//addChild(car1img);
			car4img.x = 610;
			car4img.y = 470;
			car4img.rotation = 90;
			//addChild(car2img);
			txtPlayer1.x = 460;
			txtPlayer1.y = 350;
			//addChild(txtPlayer1);

			txtPlayer2.x = 460;
			txtPlayer2.y = 450;
			//addChild(txtPlayer2);
			////////////////Event Listeners/////////////////////////
			btnHomePage.addEventListener(MouseEvent.CLICK,MainPage);
			btnPlayAgain.addEventListener(MouseEvent.CLICK,RestartGame);
			btnBack.addEventListener(MouseEvent.CLICK,BackPage);
			btnSettings.addEventListener(MouseEvent.CLICK,Settings);
			btnControls.addEventListener(MouseEvent.CLICK,Controls);
			cboChooseLaps.addEventListener(Event.CHANGE,ChangeLaps);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,PressingKeys);
			stage.addEventListener(KeyboardEvent.KEY_UP,ReleasingKeys);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,NumPadPress);
			stage.addEventListener(KeyboardEvent.KEY_UP,NumPadRelease);
			tmrCar2.addEventListener(TimerEvent.TIMER,Car2Motion);
			tmrCar.addEventListener(TimerEvent.TIMER,carMotion);
			stage.addEventListener(Event.ENTER_FRAME,LapChecking);
			stage.addEventListener(Event.ENTER_FRAME,LapChecking2);
			//stage.addEventListener(Event.ENTER_FRAME,Tie);
			tmrLapCount.addEventListener(TimerEvent.TIMER,LapTime);
			btnStartGame.addEventListener(MouseEvent.CLICK,StartGames);
		}
		private function Continue(Event:MouseEvent):void
		{
			removeChild(Intro);
			removeChild(btnContinue);
			addChild(startbox);
			addChild(btnControls);
			addChild(btnSettings);
			addChild(btnStartGame);
		}
		private function ChangeLaps(e:Event):void
		{
			nLap = int(cboChooseLaps.value);
		}
		private function BackPage(Event:MouseEvent):void
		{
			if (back==true)
			{

				removeChild(imgWASD);
				removeChild(imgArrowKeys);
				removeChild(btnBack);
				addChild(btnSettings);
				addChild(btnStartGame);
				addChild(btnControls);


			}
			if (back==false)
			{
				removeChild(btnBack);
				removeChild(rbBMW);
				removeChild(rbBMW2);
				removeChild(rbPorche);
				removeChild(rbPorche2);
				removeChild(car1img);
				removeChild(car2img);
				removeChild(car3img);
				removeChild(car4img);
				removeChild(txtPlayer1);
				removeChild(txtPlayer2);
				removeChild(cboChooseLaps);
				addChild(btnControls);
				addChild(btnStartGame);
				addChild(btnSettings);
			}

		}
		private function Controls(Event:MouseEvent):void
		{
			back = true;
			removeChild(btnStartGame);
			removeChild(btnSettings);
			removeChild(btnControls);
			addChild(btnBack);
			addChild(imgWASD);
			addChild(imgArrowKeys);
		}
		private function Settings(Event:MouseEvent):void
		{
			back = false;
			removeChild(btnStartGame);
			removeChild(btnControls);
			removeChild(btnSettings);
			addChild(cboChooseLaps);
			addChild(rbBMW);
			addChild(rbPorche);
			addChild(car1img);
			addChild(car2img);
			addChild(rbBMW2);
			addChild(rbPorche2);
			addChild(car3img);
			addChild(car4img);
			addChild(txtPlayer1);
			addChild(txtPlayer2);
			addChild(btnBack);

		}

		private function StartGames(Event:MouseEvent):void
		{
			if (rbBMW.selected)
			{
				car = CAR4;
			}
			else if (rbPorche.selected)
			{
				car = CAR6;
			}
			else
			{
				car = CAR1;
			}
			if (rbBMW2.selected)
			{
				car2 = CAR5;
			}
			else if (rbPorche2.selected)
			{
				car2 = CAR3;
			}
			else
			{
				car2 = CAR2;
			}
			if (nLap>0)
			{
				totalLaps = nLap;
			}
			if (totalLaps==0)
			{
				totalLaps = 3;
			}
			nCount = 0;
			nCount2 = 0;
			currentLap = 0;
			currentLap2 = 0;
			txtLaps.text = "Lap: ";
			txtLaps2.text = "Lap: ";

			removeChild(btnSettings);
			removeChild(btnStartGame);
			removeChild(btnControls);
			removeChild(startbox);
			addChild(midline);
			addChild(grass);
			addChild(track);
			addChild(startline);
			addChild(txtLaps);
			addChild(txtLaps2);
			addChild(txtTime);
			addChild(txtTime2);
			stage.focus = stage;
			addChild(timerBox);
			car.rotation = 90;
			car.x = startline.x - 50;
			car2.rotation = 90;
			car2.x = startline.x - 50;
			car.y = 685;
			car2.y = 740;
			addChild(car2);
			addChild(car);
			speedX = 0;
			speedY = 0;
			speed2X = 0;
			speed2Y = 0;
			Start = false;
			nms = 00;
			nsec = 00;
			nmin = 00;
			tmrCar2.start();
			tmrCar.start();


		}
		private function LapTime(e:Event):void
		{

			nms +=  1;
			if (nms==10)
			{
				nsec++;
				nms = 00;
			}
			if (nsec==60)
			{
				nmin++;
				nsec = 00;
			}
			if (nsec<10)
			{
				txtTime.text = "0" + String(nmin) + ":0" + String(nsec) + "." + String(nms);
				txtTime2.text = "0" + String(nmin) + ":0" + String(nsec) + "." + String(nms);
			}
			else if (nsec>10)
			{
				txtTime.text = "0" + String(nmin) + ":" + String(nsec) + "." + String(nms);
				txtTime2.text = "0" + String(nmin) + ":" + String(nsec) + "." + String(nms);
			}
			else if (nmin<10)
			{
				txtTime.text = "0" + String(nmin) + ":" + String(nsec) + "." + String(nms);
				txtTime2.text = "0" + String(nmin) + ":" + String(nsec) + "." + String(nms);

			}
			else if (nmin>10)
			{
				txtTime.text = String(nmin) + ":" + String(nsec) + "." + String(nms);
				txtTime2.text = String(nmin) + ":" + String(nsec) + "." + String(nms);
			}
		}
		//
		private function LapChecking(event:Event):void
		{
			if (car.hitTestObject(midline))
			{//First I check if the car hits the checkpoint.
				LapCounting = true;//if it did, I set the boolean to true;
			}
			if (car.hitTestObject(startline))
			{//Then I check if the car hits the Starting/Finish line.
				if (nCount==1)
				{//Here I make a int to see which checkpoint i am hitting, and this is the starting line.
					if (currentLap==totalLaps)
					{//If the car passed all the laps, then the total time appears.
						Start = true;
						tmrCar.stop();
						tmrCar2.stop();
						tmrLapCount.stop();
						//removeChild(timerBox);
						removeChild(car);
						removeChild(car2);
						removeChild(startline);
						removeChild(txtLaps);
						removeChild(txtLaps2);
						removeChild(midline);
						removeChild(grass);
						removeChild(timerBox);
						removeChild(track);
						removeChild(txtTime);
						removeChild(txtTime2);
						txtTotalTime.text = "Player One Wins -" + "Total Time: " + txtTime.text;
						addChild(txtTotalTime);
						addChild(btnHomePage);
						addChild(btnPlayAgain);

					}
					else
					{//This just increments current Lap by 1;
						currentLap++;
					}
					txtLaps.text = "Lap: " + currentLap + "/" + totalLaps;//This just outputs the lap  when you hit the Starting line
				}
				nCount++;//I used another int to increment the checkpoint, 
				if (LapCounting==true)
				{//I see if the car hit the Checkpoint and if it is true then it changes back the nCount to 1;
					LapCounting = false;
					nCount = 1;
				}
			}
		}
		private function LapChecking2(event:Event):void
		{
			if (car2.hitTestObject(midline))
			{//First I check if the car hit the checkpoint.
				LapCounting2 = true;//if it did, I set the boolean to true;
			}
			if (car2.hitTestObject(startline))
			{//Then I check if the car hit the Starting/Finish line.
				if (nCount2==1)
				{//Here I make a int to see which checkpoint i am hitting, and this is starting line.
					if (currentLap2==totalLaps)
					{
						Start = true;

						tmrCar2.stop();
						tmrCar.stop();
						tmrLapCount.stop();
						removeChild(car);
						removeChild(car2);
						removeChild(startline);
						removeChild(txtLaps);
						removeChild(txtLaps2);
						removeChild(midline);
						removeChild(grass);
						removeChild(track);
						removeChild(timerBox);
						removeChild(txtTime);
						removeChild(txtTime2);
						txtTotalTime.text = "Player Two Wins -" + "Total Time: " + txtTime2.text;
						addChild(txtTotalTime);
						addChild(btnHomePage);
						addChild(btnPlayAgain);


					}
					else
					{//This just increments current Lap by 1;
						currentLap2++;
					}
					txtLaps2.text = "Lap: " + currentLap2 + "/" + totalLaps;//just outputs the lap when you hit the Starting line
				}
				nCount2++;//I used another int to increment the checkpoint, 
				if (LapCounting2==true)
				{//I see if the car hit the Checkpoint and if it is true then it changes back the nCount to 1;
					LapCounting2 = false;
					nCount2 = 1;
				}
			}
		}
		/*private function Tie(event:Event):void {
		if (currentLap&&currentLap2==totalLaps) {
		tmrLapCount.stop();
		removeChild(timerBox);
		
		removeChild(car);
		removeChild(car2);
		removeChild(txtTime);
		removeChild(txtTime2);
		removeChild(startline);
		removeChild(txtLaps);
		removeChild(txtLaps2);
		removeChild(midline);
		removeChild(grass);
		removeChild(track);
		//removeChild(timerBox);
		txtTotalTime.text="Its a tie -"+"Total Time: "+txtTime2.text;
		addChild(txtTotalTime);
		addChild(btnHomePage);
		addChild(btnPlayAgain);
		
		}
		}*/



		private function carMotion(e:TimerEvent):void
		{

			if (rbBMW.selected)
			{
				tmrCar.delay = 28;
				//maxSpeed = 10;
				//rotationSpeed = 6;
			}
			if (rbPorche.selected)
			{
				tmrCar.delay = 26.5;
				//maxSpeed = 12;
				//rotationSpeed = 7;
			}

			if (Start==false)
			{//I set the boolean to false, so that the car can move only when on the track and not on the MainMenu

				tmrLapCount.start();

				if (movingRight)
				{

					car.rotation +=  rotationSpeed;

					if (! movingRight)
					{
						car.rotation -=  .95;

					}
				}
				if (movingLeft)
				{
					car.rotation -=  rotationSpeed;

					if (! movingLeft)
					{
						car.rotation -=  .95;
					}
				}
				if (movingUp)
				{

					speedX +=  maxSpeed * Math.sin(car.rotation * Math.PI / 180);
					speedY +=  maxSpeed * Math.cos(car.rotation * Math.PI / 180);
				}
				if (movingBack)
				{

					speedX -=  backSpeeed * Math.sin(car.rotation * Math.PI / 180);
					speedY -=  backSpeeed * Math.cos(car.rotation * Math.PI / 180);
				}
				else
				{
					// Deccelerate when Up Arrow key is released
					speedX *=  decay;
					speedY *=  decay;

				}
				//grass
				if (grass.hitTestPoint(car.x + car.width / 2,car.y,true))
				{
					maxSpeed = 2;
					rotationSpeed = 2;

				}
				else if (grass.hitTestPoint(car.x-car.width/2,car.y,true))
				{
					maxSpeed = 2;
					rotationSpeed = 2;

				}
				else
				{
					maxSpeed = 8;
					rotationSpeed = 5;
				}

				// Maintain speed limit
				currentSpeed=Math.sqrt(speedX*speedX+speedY*speedY);

				if (currentSpeed>maxSpeed)
				{
					speedX *=  maxSpeed / currentSpeed;
					speedY *=  maxSpeed / currentSpeed;

				}
				else
				{
					maxSpeed = 8;
					rotationSpeed = 5;
				}
				// Move _player based on calculations above
				car.y -=  speedY;
				car.x +=  speedX;
			}

			//this one works for back bumper
			if (car2.hitTestPoint(car.x-(car.width/2),car.y,true))
			{

				if (car.rotation == 0 - 180)
				{
					car.y -=  speedY;
					car.x +=  speedX;
				}
				if (car.rotation == 180 - 360)
				{
					car.y +=  speedY;
					car.x -=  speedX;
				}
				speedX += currentSpeed2 * Math.sin(car.rotation * (Math.PI / 180));
				speedY +=currentSpeed2 * Math.cos(car.rotation * (Math.PI / 180));
				tmrCar.delay = 34;

			}
			else
			{
				tmrCar = new Timer(30);

			}
			if (car.x >= 1060)
			{
				car.x = 1060;
			}
			if (car.x <= 40)
			{
				car.x = 40;
			}
			if (car.y >= 750)
			{
				car.y = 750;
			}
			if (car.y <= 50)
			{
				car.y = 50;
			}

		}

		private function Car2Motion(e:TimerEvent):void
		{
			if (rbBMW2.selected)
			{
				tmrCar2.delay = 28;
				//maxSpeed2 = 10;
				//rotationSpeed2 = 6;
			}
			if (rbPorche2.selected)
			{
				tmrCar2.delay = 26.5;
				//maxSpeed2 = 12;
				//rotationSpeed2 = 7;
			}
			if (Start==false)
			{
				tmrLapCount.start();
				if (KeyA)
				{

					car2.rotation -=  rotationSpeed2;

					if (! KeyA)
					{
						car2.rotation -=  .95;
					}
				}
				if (KeyD)
				{

					car2.rotation +=  rotationSpeed2;

					if (! KeyD)
					{
						car2.rotation -=  .95;
					}
				}
				if (KeyW)
				{

					speed2X +=  maxSpeed2 * Math.sin(car2.rotation * Math.PI / 180);
					speed2Y +=  maxSpeed2 * Math.cos(car2.rotation * Math.PI / 180);
				}
				if (KeyS)
				{
					speed2X -=  backSpeeed * Math.sin(car2.rotation * Math.PI / 180);
					speed2Y -=  backSpeeed * Math.cos(car2.rotation * Math.PI / 180);
				}
				else
				{
					// Deccelerate when Up Arrow key is released
					speed2X *=  decay;
					speed2Y *=  decay;

				}
				if (grass.hitTestPoint(car2.x + car2.width / 2,car2.y,true))
				{
					maxSpeed2 = 2;
					rotationSpeed2 = 2;

				}
				else if (grass.hitTestPoint(car2.x-car2.width/2,car2.y,true))
				{
					maxSpeed2 = 2;
					rotationSpeed2 = 2;

				}
				else
				{
					maxSpeed2 = 8;
					rotationSpeed2 = 5;
				}

				currentSpeed2=Math.sqrt(speed2X*speed2X+speed2Y*speed2Y);

				if (currentSpeed2>maxSpeed2)
				{
					speed2X *=  maxSpeed2 / currentSpeed2;
					speed2Y *=  maxSpeed2 / currentSpeed2;
				}
				else
				{
					maxSpeed2 = 8;
					rotationSpeed2 = 5;
				}
				// Move _player based on calculations above
				car2.y -=  speed2Y;
				car2.x +=  speed2X;


				//this one works. for back bumper
				if (car.hitTestPoint(car2.x-(car2.width/2),car2.y,true))
				{
					if (car2.rotation == 0 - 180)
					{
						car2.y -=  speed2Y;
						car2.x +=  speed2X;
					}
					if (car2.rotation == 180 - 360)
					{
						car2.y +=  speed2Y;
						car2.x -=  speed2X;
					}
					speed2X += currentSpeed * Math.sin(car2.rotation * (Math.PI / 180));
					speed2Y +=currentSpeed * Math.cos(car2.rotation * (Math.PI / 180));
					tmrCar2.delay = 34;

				}
				else
				{
					tmrCar2 = new Timer(30);

				}
			}
			if (car2.x >= 1060)
			{
				car2.x = 1060;
			}
			if (car2.x <= 40)
			{
				car2.x = 40;
			}
			if (car2.y >= 750)
			{
				car2.y = 750;
			}
			if (car2.y <= 50)
			{
				car2.y = 50;
			}


		}
		private function MainPage(Event:MouseEvent):void
		{
			removeChild(txtTotalTime);
			stage.focus = stage;
			txtTime.text = "00:00:00";
			removeChild(btnHomePage);
			removeChild(btnPlayAgain);
			addChild(startbox);
			addChild(btnControls);
			addChild(btnStartGame);
			addChild(btnSettings);

		}
		private function RestartGame(Event:MouseEvent):void
		{
			removeChild(txtTotalTime);
			stage.focus = stage;
			txtTime.text = "00:00:00";
			txtTime2.text = "00:00:00";
			tmrCar.start();
			tmrCar2.start();
			nCount = 0;
			nCount2 = 0;
			currentLap = 0;
			currentLap2 = 0;
			txtLaps.text = "Lap: ";
			txtLaps2.text = "Lap: ";
			nms = 00;
			nsec = 00;
			nmin = 00;
			removeChild(btnHomePage);
			removeChild(btnPlayAgain);
			addChild(midline);
			addChild(grass);
			addChild(track);
			addChild(startline);
			addChild(txtLaps);
			addChild(txtLaps2);
			addChild(txtTime);
			addChild(timerBox);
			addChild(txtTime2);
			stage.focus = stage;
			addChild(car);
			addChild(car2);
			car.rotation = 90;
			car.x = startline.x - 50;
			car.y = 685;
			car2.rotation = 90;
			car2.x = startline.x - 50;
			car2.y = 740;
			speedX = 0;
			speedY = 0;
			speed2X = 0;
			speed2Y = 0;
			Start = false;


		}
		public function PressingKeys(event:KeyboardEvent):void
		{
			switch (event.keyCode)
			{
				case Keyboard.UP :
					movingUp = true;
					break;
				case Keyboard.LEFT :
					movingLeft = true;
					break;
				case Keyboard.RIGHT :
					movingRight = true;
					break;
				case Keyboard.DOWN :
					movingBack = true;
					break;
			}
		}
		public function ReleasingKeys(event:KeyboardEvent):void
		{
			switch (event.keyCode)
			{
				case Keyboard.UP :
					movingUp = false;
					break;
				case Keyboard.LEFT :
					movingLeft = false;
					break;
				case Keyboard.RIGHT :
					movingRight = false;
					break;
				case Keyboard.DOWN :
					movingBack = false;
					break;
			}
		}
		public function NumPadPress(event:KeyboardEvent):void
		{

			nKeyCode = event.keyCode;
			if (nKeyCode==87)
			{//W KEY
				KeyW = true;
			}
			if (nKeyCode==83)
			{//S KEY

				KeyS = true;
			}
			if (nKeyCode==65)
			{//A KEY
				KeyA = true;
			}
			if (nKeyCode==68)
			{//D KEY
				KeyD = true;
			}
		}
		public function NumPadRelease(event:KeyboardEvent):void
		{
			nKeyCode = event.keyCode;
			if (nKeyCode==87)
			{//W KEY
				KeyW = false;
			}
			if (nKeyCode==83)
			{//S KEY

				KeyS = false;
			}
			if (nKeyCode==65)
			{//A KEY
				KeyA = false;
			}
			if (nKeyCode==68)
			{//D KEY
				KeyD = false;
			}
		}
	}
}