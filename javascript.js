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
        method: "POST",
        
    })
})