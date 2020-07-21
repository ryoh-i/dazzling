$(document).on('turbolinks:load', function () {
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#image_prev').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.file[0]);
        }
    }

    $("#post_img").change(function () {
        $('#image_prev').removeClass('hidden')
        $('.present_image').remove();
        readURL(this)
    });
});