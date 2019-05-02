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
        $.ajax({
            type: 'POST',
            url: 'straf.php',
            method: 'printpunishment',
            data: 'user_id=40',
            datatype: 'array',
            success: function(result) {
                $('#test').html(result);
                /*result.forEach(i => {
                    $('<p/>').prepend(result[i]);
                    //$('#test').html(result[i]);
                });*/
            }
        })
    })
    $('#removebutton').click(function() {
        $.ajax({
            type: 'POST',
            url: 'straf.php',
            method: 'removepunishment',
            data: 'user_id=40, subject=1',
            datatype: 'array',
            success: function(result) {
                $('#fjernstraf').html(result);
                /*result.forEach(i => {
                    $('<p/>').prepend(result[i]);
                    //$('#test').html(result[i]);
                });*/
            }
        })
    })
})