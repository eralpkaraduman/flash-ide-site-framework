package com.godstroke.IDEProject 
{
	import com.godstroke.IDEProject.SiteT;
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	import flash.system.System;
	/**
	$(CBI)* ...
	$(CBI)* @author eralp
	$(CBI)*/
	public class SiteT 
	{
		public static var stage:Stage;
		static public var stateManager:*; //custom for now
		static public var popupManager:*; //custom for now
		
		public static function get isDevelopmentMode():Boolean{
			return (Capabilities.playerType == "External");
		}
		
		public static function get width():int {
			if (!stage) return NaN;
			return stage.stageWidth;
		}
		
		public static function get height():int {
			if (!stage) return NaN;
			return stage.stageHeight;
		}
		
		public static function get rect():Rectangle {
			if (!stage) return null;
			return new Rectangle(0, 0, stage.width, stage.height);
		}
		
		static public function get center():Point 
		{
			if (!stage) return null;
			return new Point(Math.round(width/2),Math.round(height/2));
		}
		// tools
		public static function nextIndex(cur:int, len:uint):int
		{
			var t_next:int = cur + 1;
			if (t_next >= len) {
				t_next = 0;
			}
			return t_next;
		}
		
		public static function prevIndex(cur:int, len:uint):int
		{
			var t_prev:int = cur - 1;
			if (t_prev < 0) {
				t_prev = len-1;
			}
			return t_prev;
		}
		
		
		
		
		
		
	}

}