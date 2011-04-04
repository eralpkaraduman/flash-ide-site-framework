package com.aukyr.IDEProject {
	
	import com.aukyr.IDEProject.SiteT;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import com.aukyr.IDEProject.SiteElement;
	
	
	public class SiteDocumentClass extends MovieClip {
		
		protected var elementsToResize:Array = [];
		
		public function SiteDocumentClass() {
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			if (stage) onAddedToStage(null);
		}
		
		protected function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			SiteT.stage = stage;
			
			loaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, preloaderLoop);
			if (loaderInfo.bytesLoaded >= loaderInfo.bytesTotal) onLoadComplete(null);
			
			stage.addEventListener(Event.RESIZE, onResize);
			onResize(null);
		}
		
		/**
		 * Resize edildiğinde elementsToResize[] 'e eklenen bütün SiteElement'lerin resize() metodunu çağırır
		 * sonunda super.onResize(e); çağır.
		 * @param	e Event
		 */
		protected function onResize(e:Event):void 
		{
			for each(var se:SiteElement in elementsToResize) {
				if(se)se.resize();
			}
		}
		
		protected function preloaderLoop(e:ProgressEvent):void {
			
		}
		
		protected function onLoadComplete(e:Event):void 
		{
			loaderInfo.removeEventListener(Event.COMPLETE, onLoadComplete);
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, preloaderLoop);
		}
	}
	
}
