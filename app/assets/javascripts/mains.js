/**
 * Created with JetBrains RubyMine.
 * User: rails
 * Date: 8/20/13
 * Time: 6:24 PM
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function () {

    // Maayan - this is an example of how to call the server to get the Projects
    //           if you add the 'withIDs' parameter, you can get back the id's of the category and status as well
    $('#get').click(function () {
        $.getJSON('/mains/get_projects', { withIDs: 'true' }, function (data) {
            // alert( data );

            // do something in the code :)
        });
    });

    /**      $("#new_post").on("ajax:success", (e, data, status, xhr) ->
     $("#new_post").append xhr.responseText
     ).bind "ajax:error", (e, xhr, status, error) ->
     $("#new_post").append "<p>ERROR</p>"
     */
});
