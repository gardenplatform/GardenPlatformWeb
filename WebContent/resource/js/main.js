(function($) {
    $(function() {
        var videobackground = new $.backgroundVideo($('#bgVideo'), {
            "align" : "centerXY",
            "path" : "/GardenPlatformWeb/resource/video/",
            "width": 1280,
            "height": 720,
            "filename" : "preview",
            "types" : ["mp4", "ogg", "webm"]
        });
    });

})(jQuery);