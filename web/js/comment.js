/* Comment JS
 * for adding AJAX comments
 */

$(document).ready(function() {
    $('#addComment').click(function() {
        var comment-content = $('#comment-content').value;
        $.get("CommentController",
            {
                content: comment;
            },
            function(data, status) {
                var 
                $('#comments').prepent
            }
        );
    });
});


