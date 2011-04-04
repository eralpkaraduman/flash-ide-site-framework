package com.aukyr.IDEProject 
{
	import com.aukyr.IDEProject.SiteButton;
	import com.aukyr.IDEProject.SiteElement;
	import flash.display.Sprite;
	
	/**
	$(CBI)* ...
	$(CBI)* @author eralp
	$(CBI)*/
	public class SiteNavigation extends SiteElement 
	{
		protected var buttons:Array = new Array();
		
		public function SiteNavigation()
		{
			
		}
		
		protected function addButton(instance:SiteButton, callback:Function,params:Object=null):void {

			buttons.push( { btn:instance, callback:callback , params:params} );

			instance.groupContainer = this;
			instance.callback = allButtonsClickHandler;
			instance.deactivate();
			
			
		}
		
		protected function buttonAtIndex(idx:int):SiteButton {
			return buttons[idx].btn;
		}
		
		protected function onButtonRollOver(b:SiteButton):void {
			
		}
		
		private function allButtonsClickHandler(btn:SiteButton=null):void {
			for (var i:int = 0 ; i < buttons.length ; i++ ) {
				
				if (btn == buttons[i].btn) {
					var cb:Function = buttons[i].callback;
					var pr:Object = buttons[i].params;
					cb(btn, pr);
					buttons[i].btn.activate();
				}else {
					buttons[i].btn.deactivate();
				}
				
				
			}
		}
		
		public function resetAllButtons() {
			allButtonsClickHandler(null);
		}
		
	}

}