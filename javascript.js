/*$(document).ready(function() {
    $(#loginbutton).click(function() {
        $.post()
    }
}*/

/*$('#loginbutton').click(function() {
    event.preventDefault();
    var u_name = $('#usernameinput').val();
    var p_word = $('#passwordinput').val();
    $.ajax({
        url: "login.php",
        method: "login",
        data: {
            username: u_name,
            password: p_word
        },
        success: function(data) {
            if (login > 0) {
                $('#loginmessage').html("success");
            } else if (login == "brugernavn eller password mangler") {
                $('#loginmessage').html("felterne er tomme???");
            } else if (login == "password or username not correcet try agian") {
                $('#loginmessage').html("Brugernavn eller password er forkert");
            }
        }
        
    })
})*/

$(document).ready(function() {
    $('#selectbutton').click(function() {
        alert('aids');
        $.ajax({
            type: 'POST',
            url: 'straf.php',
            data: 'id=testdata',
            datatype: 'array',
            success: function(result) {
                $('#test').html(result);
            }
        })
    })
})