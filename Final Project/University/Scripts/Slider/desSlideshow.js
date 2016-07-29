// Copyright 2011 jdesign.ir Inc.
/**
 * @projectHomepage: http://www.jdesign.ir/
 * @projectDescription: Stylish featured image slideshow jQuery plugin.
 * @author amir anoosheh
 * More script and css style : jdesign.ir
 * @version 1.0
 * @license http://www.apache.org/licenses/LICENSE-2.0
 */
(function(a){
    a.fn.desSlideshow=function(p){
        var p=p||{};

        var autoplay=p&&p.autoplay?p.autoplay:"enable";
        var slideshow_width=p&&p.slideshow_width?p.slideshow_width:"650";
        var slideshow_height=p&&p.slideshow_height?p.slideshow_height:"250";
        var thumbnail_width=p&&p.thumbnail_width?p.thumbnail_width:"200";
        var time_Interval = p&&p.time_Interval?p.time_Interval:"4000";
        var directory=p&&p.directory?p.directory:"images";
        slideshow_height = parseInt(slideshow_height);
        slideshow_width = parseInt(slideshow_width);
        time_Interval = parseInt(time_Interval);
        var g=a(this);
        var current = -1;
        var y=g.children(".jDesign_slider").children("div").length;
        var v;
        var w;
        if(y==0){
            g.append("Require content");
            return null
        }
        init();
        if(autoplay == "enable"){
            g.find(".jDesign_slider").css("display","block");
            g.find(".nav").css("display","block");
            g.css("background","none");
            play();
        }else{
            g.find(".jDesign_slider").css("display","block");
            g.find(".nav").css("display","block");
            g.css("background","none");
            current = 0;
            showpic();
        }
        g.find(".nav").children("li").hover(
            function(){
                var index = g.find(".nav").children("li").index($(this));
                if(index != current){
                    current = index;
                    showpic();
                }
            },
            function(){

            }
        );
        g.hover(
            function(){

            },
            function(){
                if(autoplay == "enable"){
                    v=setTimeout(play,time_Interval);
                }
            }
        );
        function init(){
            g.css("width",slideshow_width+"px").css("height",slideshow_height+"px").css("position","relative").css("font-family","Tahoma").css("border-top","1px solid #CCCCCC").css("overflow","hidden");
            g.find("a").css("color","#FFF");
            g.find("img").css("border","none");
            g.find("ul").css("margin","0px").css("padding","0px");
            g.find("li").css("margin","0px").css("padding","0px").css("list-style","none");
            g.find(".jDesign_slider").css("position","relative");
            g.find(".jDesign_slider").children("div").css("position","absolute").css("overflow","hidden");
            g.find(".jDesign_slider").children("div").children("p").css("position","absolute").css("padding","5px").css("margin","0px").css("bottom","0px").css("opacity","0.6").css("background-color","#000").css("color","#FFF").css("font-size","12px").css("width","100%");
            g.find(".nav").css("width",thumbnail_width+"px").css("height",slideshow_height+"px").css("position","absolute").css("right","0px");
            g.find(".nav").children("li").css("height","49px").css("background-image","url("+directory+"flashtext-bg.jpg)").css("line-height","49px").css("border-bottom","1px solid #CCCCCC").css("border-right","1px solid #CCCCCC");
            g.find(".nav").children("li").children("a").css("text-decoration","none").css("height","49px").css("display","block").css("padding-left","25px").css("font-size","14px");
            g.find(".nav").children("li").css("margin-left","0px");
            g.find(".jDesign_slider").children("div").hide();
        }
        function showpic(){
            clearTimeout(v);
            g.find(".nav").children("li").css("background-image","url("+directory+"flashtext-bg.jpg)").css("border-bottom","1px solid #CCCCCC");
            g.find(".nav").children("li").eq(current).css("background-image","url("+directory+"flash-on.gif)").css("border-bottom","none");
            g.find(".jDesign_slider").children("div").fadeOut();
            g.find(".jDesign_slider").children("div").eq(current).fadeIn();
            g.find(".nav").children("li").eq(current).animate({marginLeft: '-35px'}, "fast");
            g.find(".nav").children("li").eq(w).animate({marginLeft: '0px'}, "fast");
            w = current;

        }
        function play(){
            current++;
            if(current>=y){
                current=0
            }
            showpic();
            v=setTimeout(play,time_Interval);
        }
    }
})(jQuery);