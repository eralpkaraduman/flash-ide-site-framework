package com.aukyr.IDEProject 
{
	import com.aukyr.IDEProject.SiteButton;
	import com.aukyr.IDEProject.SiteElement;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	$(CBI)* ...
	$(CBI)* @author eralp
	$(CBI)*/
	public class SiteButton extends SiteElement 
	{
		public var groupContainer:*;
		
		public var label_rollover:String;
		public var label_rollout:String;
		public var label_click:String;
		public var label_active:String;
		public var label_inactive:String;
		public var label_toggleOn:String;
		public var label_toggleOff:String;
		
		public var callback:Function;
		public var rollover:Function;
		public var rollout:Function;
		public var toggleOffF:Function;
		public var toggleOnF:Function;
		public var buttonRect:SimpleButton;
		public var isEnabled:Boolean = true;
		
		protected var _isToggle:Boolean = false;
		protected var _toggleState:Boolean = false;
		
		
		/**
		 * aynı handlere bağlı birden çok sitebuttonu birbirinden ayırmak için kullanılabilir.
		 */
		public var dataObject:Object;
		
		public function SiteButton()
		{
			stop();
		}
		
		public function simulateClick():void {
			onClick(null);
		}
		
		public function deactivate():void 
		{
			if (label_inactive)gotoAndStop(label_inactive);
		}
		
		public function activate():void 
		{
			if (label_active)gotoAndStop(label_active);
		}
		
		public function setAsToggle(initialState:Boolean, onLabel:String, offLabel:String,onF:Function,offF:Function):void 
		{
			_isToggle = true;
			_toggleState = initialState;
			
			if (_toggleState) {
				gotoAndStop(label_toggleOn);
			}else {
				gotoAndStop(label_toggleOff);
			}
			
			label_toggleOn = onLabel;
			label_toggleOff = offLabel;
			
			toggleOnF = onF;
			toggleOffF = offF;
		}
		
		override protected function onAddedToStage(e:Event):void {
			super.onAddedToStage(e);
			
			stop();
			
			if(!buttonRect){
				var er:Error = new Error("buttonRect=null !! buttonRect ins. nameli simplebuton yaratman gerek");
				throw(er);
			}
			
			buttonRect.addEventListener(MouseEvent.CLICK,onClick);
			buttonRect.addEventListener(MouseEvent.MOUSE_OUT,onRollOutF);
			buttonRect.addEventListener(MouseEvent.MOUSE_OVER,onRollOverF);
		}
		
		protected function onRollOverF(e:MouseEvent):void 
		{
			if (!isEnabled) return;
			
			if (_isToggle) {
				if (_toggleState) {
					gotoAndStop(label_toggleOn);
				}else {
					gotoAndStop(label_toggleOff);
				}
				return;
			}
			
			if (label_rollover) gotoAndPlay(label_rollover);
			if (rollout != null) rollover(this);
			
		}
		
		protected function onRollOutF(e:MouseEvent):void 
		{
			if (!isEnabled) return;
			
			if (_isToggle) {
				if (_toggleState) {
					gotoAndStop(label_toggleOn);
				}else {
					gotoAndStop(label_toggleOff);
				}
				return;
			}
			
			if (label_rollout) gotoAndPlay(label_rollout);
			if(rollover!=null) rollout(this);
		}
		
		protected function onClick(e:MouseEvent):void 
		{
			if (!isEnabled) return;
			
			if (_isToggle) {
				
				_toggleState = !_toggleState;
				
				if (_toggleState && toggleOnF!=null) {
					gotoAndStop(label_toggleOn);
					toggleOnF(this);
					//trace("on");
				}else if (!_toggleState && toggleOffF!=null)  {
					gotoAndStop(label_toggleOff);
					toggleOffF(this);
					//trace("off");
				}
				
				return;
			}
			
			if (label_click) gotoAndPlay(label_click);
			if (callback!=null) callback(this);
		}
		
		
		
	}

}