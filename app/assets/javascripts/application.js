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
        $('tbody.materials').filter('[data-type-id=' + $(this).data('type-id') + ']').toggleClass('hidden')
    });

    [$('#system'), $('#buy'), $('#sell')].forEach(function (select) {
        select.on('change', function () {
            Cookies.set(select.attr('name'), $(this).val())
        }).val(Cookies.get(select.attr('name')) || select.val()).trigger('change');
    });
});
