/*
<script type="text/javascript" src="/_js/social.js"></script>

<script type="text/javascript">
    var social = new SocialShare();
    social.setTitle(document.title);
    social.setURL(document.location.href);
</script>

*/

function SocialShare() { }

SocialShare.FACEBOOK = 1;
SocialShare.TWITTER = 2;
SocialShare.FRIENDFEED = 3;
SocialShare.YAHOO = 4;
SocialShare.GOOGLE = 5;
SocialShare.DELICIOUS = 6;
SocialShare.LIVE = 7;
SocialShare.MYSPACE = 8;
SocialShare.BLOGGER = 9;

SocialShare.prototype = {
    setURL: function(url) {
        this._url = url;
    },
    getURL: function() {
        return escape(this._url);
    },
    setTitle: function(title) {
        this._title = title;
    },
    getTitle: function() {
        return encodeURI(this._title);
    },
    share: function(o) {
        var socialURL;
        var asPopup = false;
        switch (o) {
            case SocialShare.FACEBOOK:
                socialURL = "http://www.facebook.com/sharer.php?u=" + this.getURL() + "&title=" + this.getTitle();
                break;
            case SocialShare.TWITTER:
                socialURL = "http://twitter.com/home?status=" + this.getTitle() + "+" + this.getURL();
                break;
            case SocialShare.FRIENDFEED:
                socialURL = "http://friendfeed.com/?url=" + this.getTitle() + " - " + this.getURL();
                break;
            case SocialShare.YAHOO:
                socialURL = "http://myweb2.search.yahoo.com/myresults/bookmarklet?u=" + this.getURL() + "&t=" + this.getTitle();
                break;
            case SocialShare.GOOGLE:
                socialURL = "http://www.google.com/bookmarks/mark?op=edit&bkmk=" + this.getURL() + "&title=" + this.getTitle();
                break;
            case SocialShare.DELICIOUS:
                socialURL = "http://del.icio.us/post?url=" + this.getURL() + "&title=" + this.getTitle();
                break;
            case SocialShare.LIVE:
                socialURL = "https://favorites.live.com/quickadd.aspx?marklet=1&mkt=tr-tr&top=1&url=" + this.getURL() + "&title=" + this.getTitle();
                break;
            case SocialShare.MYSPACE:
                socialURL = "http://www.myspace.com/Modules/PostTo/Pages/?u=" + this.getURL() + "&title=" + this.getTitle();
                break;
            case SocialShare.BLOGGER:
                socialURL = "http://www.blogger.com/blog_this.pyra?t&u=" + this.getURL() + "&title=" + this.getTitle();
                break;
            case SocialShare.WORDPRESS:
                socialURL = "http://www.addtoany.com/ext/wordpress/press_this?linkurl=" + this.getURL() + "&linkname=Worldcard&linknote=" + this.getTitle();
        }

        if (asPopup) {
            window.open(socialURL, "_blank", "width=500,height=500");
        } else {
            window.open(socialURL, "_blank");
        }
    }
};
