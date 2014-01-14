﻿/** * VERSION: 1.0 * DATE: 2013-08-09 * AS2 (AS3 version will be sooner) **/import com.greensock.TweenLite;import com.greensock.plugins.TweenPlugin;import com.greensock.plugins.BlurFilterPlugin;import com.greensock.plugins.ColorTransformPlugin;import com.greensock.plugins.TintPlugin; import com.greensock.easing.*;class com.MotionEventManager{			private var _dur:Number;		private var _FT:Number;		private var _blur:Number = 50;		private var _distance:Number = 50;		private var _distanceLeft:Number = -50;		private var _easeIn = Circ.easeInOut;		private var _easeOut = Circ.easeInOut;		private var _easeStrong = Strong.easeIn;			public function init(nameEvent:String, _mc:MovieClip, _delay:Number, _value1:Number, _value2:Number, myFunction:Function){								BlurFilterPlugin.activate([BlurFilterPlugin]);				_FT = _root._frameTime;		_dur = _root._duration;		if(_delay == undefined) _delay = 0;							switch(nameEvent){											case	"fadeIn":					TweenLite.from(_mc,_dur,{_alpha:0, delay:_delay});					TweenLite.to(_mc,_dur,{_alpha:0, delay:_FT+_delay, overwrite:0});					break;										case	"fadeInStop":					TweenLite.from(_mc,_dur,{_alpha:0, delay:_delay});					break;										case	"fadeOut":					TweenLite.to(_mc,_dur,{_alpha:0, delay:_delay, overwrite:0});					break;										case	"inRight":					TweenLite.from(_mc,_dur,{delay:_delay, _alpha:0, _x:_mc._x + _distance, blurFilter:{blurX:_blur}, ease:_easeOut, overwrite:0});					TweenLite.to(_mc,_dur,{delay:_FT+_delay, _alpha:0, _x:_mc._x + _distance, blurFilter:{blurX:_blur}, ease:_easeOut, overwrite:0});					break;										case	"inRightStop":					TweenLite.from(_mc,_dur,{delay:_delay, _alpha:0, _x:_mc._x + _distance, blurFilter:{blurX:_blur}, ease:_easeOut, overwrite:0});					break;										case	"inLeft":					TweenLite.from(_mc,_dur,{delay:_delay, _alpha:0, _x:_mc._x - _distance, blurFilter:{blurX:_blur}, ease:_easeOut, overwrite:0});					TweenLite.to(_mc,_dur,{delay:_FT + _delay, _alpha:0, _x:_mc._x - _distance, blurFilter:{blurX:_blur}, ease:_easeOut, overwrite:0});					break;										case	"inLeftStop":					TweenLite.from(_mc,_dur,{delay:_delay, _alpha:0, _x:_distanceLeft, blurFilter:{blurX:_blur}, ease:_easeOut, overwrite:0});					break;										case	"inUpStop":					TweenLite.to(_mc,_dur,{delay:_delay, _y:_value1, ease:_easeOut, overwrite:0});					break;										case	"moveTo":					TweenLite.to(_mc,_dur,{delay:_delay, _x:_value1, _y:_value2, blurFilter:{blurX:_blur}, ease:_easeOut, overwrite:0, onComplete:myFunction});					break;										case	"moveFrom":					TweenLite.from(_mc,_dur,{delay:_delay, _x:_value1, _y:_value2, blurFilter:{blurX:_blur}, ease:_easeOut, overwrite:0, onComplete:myFunction});					break;										case	"rotate":					TweenLite.to(_mc,_dur,{delay:_delay, _rotation:_value1, ease:_easeOut, overwrite:0});					break;										case	"scale":					TweenLite.to(_mc,_dur,{delay:_delay, _xscale:_value1, _yscale:_value1, ease:_easeOut, overwrite:0});					break;										case	"fromScale":					TweenLite.from(_mc,_dur,{delay:_delay, _xscale:_value1, _yscale:_value1, ease:_easeOut, overwrite:0});					break;										case	"inRightScale":					TweenLite.from(_mc,_dur,{delay:_delay, _alpha:0, _x:_mc._x - _distance * 2, blurFilter:{blurX:_blur}, _xscale:_value1, _yscale:_value1, ease:_easeOut, overwrite:0});					TweenLite.to(_mc,_dur,{delay:_FT + _delay, _alpha:0, _x:_mc._x - _distance * 2, blurFilter:{blurX:_blur}, _xscale:_value1, _yscale:_value1, ease:_easeOut, overwrite:0});					break;										case "color":					TweenPlugin.activate([ColorTransformPlugin, TintPlugin]);															TweenLite.from(_mc, _dur, {delay:_delay, _alpha:0, colorTransform:{tint:_value1, exposure:2 } , overwrite:0 });					TweenLite.to(_mc,_dur,{_alpha:0, delay:_FT+_delay, overwrite:0});					break;										case "colorStop":					TweenPlugin.activate([ColorTransformPlugin, TintPlugin]);					TweenLite.from(_mc, _dur, {colorTransform:{tint:_value1, exposure:2 } , overwrite:0 });					break;															default:					break;					}					}						function createClickTag(){						 var _button:MovieClip = _root.createEmptyMovieClip("_clip",_root.getNextHighestDepth());			_button._width = 300;			_button._height = Stage.height;								}				function rangeMove(copyDeck:Array, _mc, leading:Number){				var i:Number;			var _delay:Number;					for (i=0; i < copyDeck.length; i++){								var duplicate = _mc.duplicateMovieClip("clip_", _root.getNextHighestDepth());				if(i>=1) duplicate._y = duplicate._y + (leading * i);				duplicate.tf.htmlText = copyDeck[i];				duplicate.tf.antiAliasType = "advanced";								if(i==0){					_delay = 0;				} else{					_delay += 0.1;				}								init("inLeft", duplicate, _delay)				}					}					/* this function controls the time in every frame, this template was created to any frame has a same duration */				function setTimer(_time:Number):Void{				_time = _time + 1;			//trace(1)			setTimeout(go, _time * 1000);		}		function go():Void{ 						_root.play();			//trace(2)		} 			}