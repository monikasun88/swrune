var main = function() {
    $('.btn').click(function(event) {
        var post = $('.status-box').val();
        $('<li>').text(post).prependTo('.posts');
        $('.status-box').val('');
        $('.counter').text("140");
        $('.btn').addClass('disabled');
    });
    $('.status-box').keyup(function() {
        var postLength = $(this).val().length;
        var charactersLeft = 140 - postLength;
        $('.counter').text(charactersLeft);
        if (charactersLeft < 0) {
            $('.btn').addClass('disabled');
        }
        else if (charactersLeft === 140) {
            $('.btn').addClass('disabled');
        }
        else {
            $('.btn').removeClass('disabled');
        }
    })
    $('.btn').addClass('disabled');
    var $aerialTr = $('#id_A').closest('td').hide();
    var $groundSprayTr = $('#id_B').closest('td').hide();

    $('#id_application_method').change(function() {
        var selectedValue = $(this).val();

        if(selectedValue  === 'A') {
            $aerialTr.show();
            $groundSprayTr.hide();
        } else if (selectedValue === 'B') {
            $aerialTr.hide();
            $groundSprayTr.show();
        } else {
            $aerialTr.hide();
            $groundSprayTr.hide();
        }
    });
}


$(document).ready(main);
