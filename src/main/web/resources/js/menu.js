/**
 * Created by ivan_ on 2015/3/30.
 * 菜单样式active的变动
 */
$(function(){
    var localHref = location.href;
    var as = $(".sidebar a");
    $.each(as, function(a, b){
        var href = $(b).attr("href");
        if (localHref.indexOf(href) > 0) {
            $(as).parents("li").removeClass("active");
            $(b).parent("li").addClass("active");
        }
    });
});