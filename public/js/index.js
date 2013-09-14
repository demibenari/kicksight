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

function spinBitch()
{
    $('body').css('-webkit-transform','rotate(360deg)');
    $('body').css('transform','rotate(360deg)');
}

$(document).ready(function()
{
    $('.logoImg').on( "click", spinBitch);
});