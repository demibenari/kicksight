
var evilGlobalVarOfDeath = 360;
function spinBitch()
{
    $('body').css('-webkit-transform','rotate(' + evilGlobalVarOfDeath + 'deg)');
    $('body').css('transform','rotate(' + evilGlobalVarOfDeath + 'deg)');
    evilGlobalVarOfDeath += 360;
}

$(document).ready(function()
{
    $('.logoImg').on( "click", spinBitch);
});

$(".content").load(function()
{
    $(".categories li").eq(9).css('margin-left', 120);
})