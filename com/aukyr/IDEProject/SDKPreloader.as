package com.aukyr.IDEProject 
{
	import com.aukyr.IDEProject.SiteDocumentClass;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	/**
	$(CBI)* ...
	$(CBI)* @author Eralp Karaduman
	$(CBI)*/
	public class SDKPreloader extends SiteDocumentClass 
	{
		
		protected var mainClassName:String
		private var mainClass:Class;
		private var app:Object;
		
		public function SDKPreloader() 
		{
			super();
			
		}
		
		override protected function onLoadComplete(e:Event):void 
		{
			super.onLoadComplete(e);
			
			nextFrame();
			mainClass = Class(getDefinitionByName(mainClassName));
			if (mainClass) {
				app = new mainClass();
				elementsToResize.push(app);
				addChild(app as DisplayObject);
			}
		}
	}

}