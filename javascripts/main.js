(function(){var e;(function(){var e,t,n,r,i,s,o;i=function(){},r=["assert","clear","count","debug","dir","dirxml","error","exception","group","groupCollapsed","groupEnd","info","log","markTimeline","profile","profileEnd","table","time","timeEnd","timeStamp","trace","warn"],e=window.console||(window.console={});for(t=s=0,o=r.length;0<=o?s<=o:s>=o;t=0<=o?++s:--s)n=r[t],e[n]||(e[n]=i);return!0})(),window.location_pathname=function(){return location.pathname.replace(/index.\w+$/,"")},e=function(){return typeof mixpanel!="undefined"&&mixpanel!==null?mixpanel.track_links(".nav-collapse[role=navigation] a","click nav link",{referrer:document.referrer}):void 0},$(function(){return e(),$("article.single").find("a").each(function(e,t){return $(t).attr("target","_blank")}),$(".aside img").on("click",function(e){return e.preventDefault(),$(this).parent(".aside").toggleClass("stretch")}),$(document).on("scroll",function(e){var t,n;return n=$(window).scrollTop(),t=$(".announcement"),n>0?t.addClass("sticky"):t.removeClass("sticky")})})}).call(this);