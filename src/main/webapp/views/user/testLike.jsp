<!DOCTYPE html>
<html>
<head>
<title>Like Button</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $("#likeButton").click(function() {
            var action = $(this).text().trim();
            $.ajax({
                url : "like",
                type : "POST",
                data : {
                    action : action
                },
                success : function(response) {
                    $("#likeButton").text(response);
                } 
            });
        });
    });
</script>
</head>
<body>
    <button id="likeButton">Like</button>
</body>
</html>
