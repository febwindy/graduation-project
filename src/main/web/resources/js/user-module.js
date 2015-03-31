/**
 * Created by ivan_ on 2015/3/31.
 */
$(function(){
    $("input, select").bind("click", function () {
        $(this).next("span").remove();
    });
    $("#reset").bind("click", function () {
        var formInputs = $("input, select");
        formInputs.each(function (a, b) {
            $(b).val("").next("span").remove();
        });
    });
});