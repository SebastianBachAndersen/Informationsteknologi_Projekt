/*$(document).ready(function() {
    $(#loginbutton).click(function() {
        $.post()
    }
}*/

$('#loginbutton').click(function() {
    event.preventDefault();
    var u_name = $('#usernameinput').val();
    var p_word = $('#passwordinput').val();
    $.ajax({
        url: "login.php",
        method: "stmt",
        data: {
            username: u_name,
            password: p_word
        },
        success: function(data) {
            if (data > 0) {
                $('#loginmessage').html("success");
            } else if (data == "tom") {
                $('#loginmessage').html("felterne er tomme???");
            } else {
                $('#loginmessage').html("dunno");
            }
        }
        
    })
})