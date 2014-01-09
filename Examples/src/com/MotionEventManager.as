﻿/**
 * VERSION: 1.0
 * DATE: 2013-08-09
 * AS2 (AS3 version will be sooner)
 **/
import com.greensock.TweenLite;
import com.greensock.plugins.*;
import com.greensock.easing.*;


class com.MotionEventManager{
	
		private var _dur:Number;
		private var _FT:Number;
		private var _blur:Number = 50;
		private var _distance:Number = 50;
		private var _distanceLeft:Number = -50;
		private var _easeIn = Circ.easeInOut;
		private var _easeOut = Circ.easeInOut;
		private var _easeStrong = Strong.easeIn;
	
		public function init(nameEvent:String, _mc:MovieClip, _delay:Number, _value:Number, onComplete:Function){
		
		
		
		BlurFilterPlugin.activate([BlurFilterPlugin]);
		
		_FT = _root._frameTime;
		_dur = _root._duration;
		if(_delay == undefined) _delay = 0;
				
			switch(nameEvent){
				
		
					case	"fadeIn":
					TweenLite.from(_mc,_dur,{_alpha:0, delay:_delay});
					TweenLite.to(_mc,_dur,{_alpha:0, delay:_FT+_delay, overwrite:0});
					break;
					
					case	"fadeInStop":
					TweenLite.from(_mc,_dur,{_alpha:0, delay:_delay});
					break;
					
					case	"fadeOut":
					TweenLite.to(_mc,_dur,{_alpha:0, delay:_delay});
					break;
					
					case	"inRight":
					TweenLite.from(_mc,_dur,{delay:_delay, _alpha:0, _x:_mc._x - _distance, blurFilter:{blurX:_blur}, ease:_easeOut, overwrite:0});
					TweenLite.to(_mc,_dur,{delay:_FT+_delay, _alpha:0, _x:_mc._x - _distance, blurFilter:{blurX:_blur}, ease:_easeOut, overwrite:0});
					break;
					
					case	"inRightStop":
					TweenLite.from(_mc,_dur,{delay:_delay, _alpha:0, _x:_mc._x + _distance, blurFilter:{blurX:_blur}, ease:_easeOut});
					break;
					
					case	"inLeft":
					TweenLite.from(_mc,_dur,{delay:_delay, _alpha:0, _x:_mc._x + _distance, blurFilter:{blurX:_blur}, ease:_easeOut});
					TweenLite.to(_mc,_dur,{delay:_FT + _delay, _alpha:0, _x:_mc._x + _distance, blurFilter:{blurX:_blur}, ease:_easeOut, overwrite:0});
					break;
					
					case	"inLeftStop":
					TweenLite.from(_mc,_dur,{delay:_delay, _alpha:0, _x:_distanceLeft, blurFilter:{blurX:_blur}, ease:_easeOut});
					break;
					
					case	"inUpStop":
					TweenLite.to(_mc,_dur,{delay:_delay, _y:_value, ease:_easeOut, overwrite:0});
					break;
					
					case	"rotate":
					TweenLite.to(_mc,_dur,{delay:_delay, _rotation:_value, ease:_easeOut, overwrite:0});
					break;
					
					case	"scale":
					TweenLite.to(_mc,_dur,{delay:_delay, _xscale:_value, _yscale:_value, ease:_easeOut, overwrite:0});
					break;
					
					case	"fromScale":
					TweenLite.from(_mc,_dur,{delay:_delay, _xscale:_value, _yscale:_value, ease:_easeOut, overwrite:0});
					break;
					
					case	"inRightScale":
					TweenLite.from(_mc,_dur,{delay:_delay, _alpha:0, _x:_mc._x - _distance * 2, blurFilter:{blurX:_blur}, _xscale:_value, _yscale:_value, ease:_easeOut, overwrite:0});
					trace("1::"+_FT+_delay)
					TweenLite.to(_mc,_dur,{delay:_FT + _delay, _alpha:0, _x:_mc._x - _distance * 2, blurFilter:{blurX:_blur}, _xscale:_value, _yscale:_value, ease:_easeOut, overwrite:0});
					break;
					
					case "color":
					TweenPlugin.activate([ColorTransformPlugin, TintPlugin]);
					TweenLite.from(_mc, _dur, {colorTransform:{tint:_value, exposure:2 } , overwrite:0 });
					trace("2::"+_FT)
					TweenLite.to(_mc,_dur,{_alpha:0, delay:_FT+_delay, overwrite:0});
					break;
					
					case "colorStop":
					TweenPlugin.activate([ColorTransformPlugin, TintPlugin]);
					TweenLite.from(_mc, _dur, {colorTransform:{tint:_value, exposure:2 } , overwrite:0 });
					break;
					
					
					default:
					break;
		
			}
			
		}
		
		
		function createClickTag(){
			
			 var _button:MovieClip = _root.createEmptyMovieClip("_clip",_root.getNextHighestDepth());
			_button._width = 300;
			_button._height = Stage.height;
			
			
		}
		

		function rangeMove(copyDeck:Array, _mc){
	
			var i:Number;
			var _delay:Number;
		
			for (i=0; i < copyDeck.length; i++){
				
				var duplicate = _mc.duplicateMovieClip("clip_", _root.getNextHighestDepth());
				duplicate._y = duplicate._y + 20 * i;
				duplicate.tf.htmlText = copyDeck[i];
				
				if(i==0){
					_delay = 0;
				} else{
					_delay += 0.1;
				}
				
				init("inRight", duplicate, _delay)
				}
			
		}	
		
		/* this function controls the time in every frame, this template was created to any frame has a same duration */
		
		function setTimer(_time:Number):Void{
	
			_time = _time + 1;
			//trace(1)
			setTimeout(go, _time * 1000);
		}

		function go():Void{ 
			
			_root.play();
			//trace(2)
		} 
		
	}