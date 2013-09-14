function toggleView(button)
{
    var li = jQuery(button).closest('li').eq(0);
    var selectedProjectClass = "selectedProject";
    var projectClass = "project";

    if (li.hasClass(selectedProjectClass))
    {
        li.removeClass(selectedProjectClass);
        li.addClass(projectClass);
    }
    else
    {
        li.removeClass(projectClass);
        li.addClass(selectedProjectClass);
    }
}

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