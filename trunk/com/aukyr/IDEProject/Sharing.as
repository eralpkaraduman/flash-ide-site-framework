package  com.aukyr.IDEProject
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	/**
	* ...
	* @author Eralp Karaduman
	*/
	
	/**
	 * USE WITH Social.js
	 */
	public class Sharing extends MovieClip
	{
		static public var facebook;
		static public var twitter;
		static public var friendfeed;
		static public var delicious;
		
		private var r:URLRequest;
		
		/*
		SocialShare.FACEBOOK = 1;
		SocialShare.TWITTER = 2;
		SocialShare.FRIENDFEED = 3;
		
		SocialShare.YAHOO = 4;
		SocialShare.GOOGLE = 5;
		SocialShare.DELICIOUS = 6;
		SocialShare.LIVE = 7;
		SocialShare.MYSPACE = 8;
		SocialShare.BLOGGER = 9;
		*/
		
		
		public function Social()
		{
			
		}
		
		public static function setlinks():void {
			if(facebook)facebook.addEventListener(MouseEvent.CLICK, onFacebook);
			if(twitter)twitter.addEventListener(MouseEvent.CLICK, onTwitter);
			if(friendfeed)friendfeed.addEventListener(MouseEvent.CLICK, onFriendfeed);
			if(delicious)delicious.addEventListener(MouseEvent.CLICK, onDelicious);
		}
		
		private static function onFacebook(e:MouseEvent):void
		{
			var r:URLRequest = new URLRequest("javascript:social.share(SocialShare.FACEBOOK)");
			navigateToURL(r,"_self");
		}
		
		private static function onTwitter(e:MouseEvent):void
		{
			var r:URLRequest = new URLRequest("javascript:social.share(SocialShare.TWITTER)");
			navigateToURL(r,"_self");
		}
		
		private static function onDelicious(e:MouseEvent):void
		{
			var r:URLRequest = new URLRequest("javascript:social.share(SocialShare.DELICIOUS)");
			navigateToURL(r,"_self");
		}
		
		private static function onFriendfeed(e:MouseEvent):void
		{
			var r:URLRequest = new URLRequest("javascript:social.share(SocialShare.FRIENDFEED)");
			navigateToURL(r,"_self");
		}
		
	}

}


