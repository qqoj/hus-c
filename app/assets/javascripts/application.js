// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tether
//= require bootstrap
//= require js.cookie
//= require_tree .

$(document).on('ready page:load', function () {
    $('#index').find('tbody.blueprint').on('click', function () {
        $('tbody.materials').filter('[data-i=' + $(this).data('i') + ']').toggleClass('hidden')
    });

    $('#pricing').find('select,input').on('change', function () {
        console.log($(this).attr('name') + '=' + $(this).val());
        Cookies.set($(this).attr('name'), $(this).val());
    }).end().find('select').each(function () {
        $(this).val(Cookies.get($(this).attr('name')) || $(this).val()).trigger('change');
    }).end().find('input').each(function () {
        var cookie = Cookies.get($(this).attr('name'));
        if (cookie == $(this).val()) {
            $(this).prop('checked', true);
            $(this).trigger('change');
        }
        if (!cookie && $(this).is(':checked')) $(this).trigger('change');
    });
});
