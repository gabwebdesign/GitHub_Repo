Basic Template AS2 Banners OLA

The basic template OLA Banner is based on Greensocks libraries. This implementation provides many advantages compared to full timeline manage process.

Animating with code may seem intimidating at first, but donít worry ñ youíll get the hang of it quickly. For addtional information check the following link: http://www.greensock.com/get-started-tweening/

The first step is to locate the com file in the same place as your banner. This file must contain the MotionEventManager.as class. Once in the Banner, you need to initialize the class and some setups like time frame and duration to each animation.

/* initializing the class to events */ 
import com.MotionEventManager; 
var _tl:MotionEventManager = new MotionEventManager(); 
var _frameTime:Number = 3;

/* global values */ 
var _frameTime:Number = 3; 
var _duration:Number = 0.5;

	/* ========================================================= 
	Param 1: type of animation // Param 2: target // Param 3: delay 
	Param 4 and 5: different value depends of move
	param 7: function to begin in the onComplete event 
	param 8: boolean to hide the blur in the movement  
	 ========================================================= */

_tl.init("fadeInStop", logo)

/*  this timer controls the seconds to keep in the banner */
_tl.setTimer(_frameTime)
