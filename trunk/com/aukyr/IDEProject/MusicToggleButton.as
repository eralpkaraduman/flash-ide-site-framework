package com.aukyr.IDEProject
{
	import com.aukyr.IDEProject.SiteButton;
	import com.aukyr.IDEProject.SoundManager;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.plugins.VolumePlugin;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Eralp Karaduman
	$(CBI)*/
	public class MusicToggleButton extends SiteButton 
	{
		private var _fadeLen:Number;
		protected var state_on:Boolean = false;
		protected var _soundManagerMusicClass:*;
		protected var _maxVolume:Number;
		protected var _minVolume:Number;
		protected var _labelOn:String;
		protected var _labelOff:String;
		
		public function MusicToggleButton()
		{
			
			super();
			
		}
		
		override protected function onAddedToStage(e:Event):void {
			stop();
			
			buttonRect = this["toggleRect"];
			
			if(!buttonRect){
				var er:Error = new Error("toggleRect=null !! toggleRect ins. nameli simplebuton yaratman gerek");
				throw(er);
			}
			
			buttonRect.addEventListener(MouseEvent.CLICK,onClick);
			buttonRect.addEventListener(MouseEvent.MOUSE_OUT,onRollOutF);
			buttonRect.addEventListener(MouseEvent.MOUSE_OVER, onRollOverF);
			
			callback = toggle;
		}
		
		public function set(soundClass:Class,maxVolume:Number,minVolume:Number,labelOn:String,labelOff:String,initialState_On:Boolean=true,fadeLen:Number=0.5):void {
			trace("set");
			
			//music
			TweenPlugin.activate([VolumePlugin]);
			//SoundManager.getInstance().addLibrarySound(soundClass, "MusicToggleButton_loop");
			SoundManager.getInstance().addLibrarySound(soundClass, "MusicToggleButton_loop");
			SoundManager.getInstance().playSound("MusicToggleButton_loop", 0, 0, 9999999);
			
			_fadeLen = fadeLen;
			_soundManagerMusicClass = soundClass;
			_maxVolume = maxVolume;
			_minVolume = minVolume;
			_labelOn = labelOn;
			_labelOff = labelOff;
			state_on = !initialState_On;
			
			
			if (initialState_On) {
				gotoAndStop(_labelOn);
				SoundManager.getInstance().fadeSound("MusicToggleButton_loop", _maxVolume, _fadeLen);
			}else {
				gotoAndStop(_labelOff);
				SoundManager.getInstance().fadeSound("MusicToggleButton_loop", _minVolume, _fadeLen);
			}
			
		}
		
		protected function toggle(b:SiteButton):void {
			
			
			
			if (!state_on) {
				gotoAndStop(_labelOff);
				SoundManager.getInstance().fadeSound("MusicToggleButton_loop", _minVolume, _fadeLen);
			}else {
				gotoAndStop(_labelOn);
				SoundManager.getInstance().fadeSound("MusicToggleButton_loop", _maxVolume, _fadeLen);
			}
			
			state_on = !state_on;
		}
		
		
		
	}

}