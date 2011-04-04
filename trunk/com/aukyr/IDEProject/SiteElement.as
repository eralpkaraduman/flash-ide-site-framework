package com.aukyr.IDEProject 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	/**
	$(CBI)* ...
	$(CBI)* @author eralp
	$(CBI)*/
	public class SiteElement extends MovieClip 
	{
		
		protected var elementsToResize:Array = [];
		public var protoRect:Rectangle = new Rectangle();
		
		public function SiteElement() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			if (stage) onAddedToStage(null);
		}
		
		/**
		 * başında super.onAddedToStage(e); çağır
		 * @param	e
		 */
		protected function onAddedToStage(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			resize();
		}
		
		public function resize():void 
		{
			for each(var se:SiteElement in elementsToResize) {
				if(se)se.resize();
			}
		}
		
		public function destroy():void 
		{
			
		}
		
	}

}