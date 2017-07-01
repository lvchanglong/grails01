// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.2.0.min
//= require bootstrap
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function() {
            $('#spinner').fadeIn();
        }).ajaxStop(function() {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}

jQuery(document).ready(function () {

    jQuery(".ajaxForm").ajaxForm({
        success:function (data, textStatus) {
            // alert("success");
            doSuccess(data);
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
            // alert("error");
            doError(XMLHttpRequest.responseText);
        }
    });

    jQuery('[data-toggle="tooltip"]').tooltip();
    jQuery('[data-toggle="popover"]').popover();

});

function doSuccess(text) {
    Messenger().post(text);
    window.location.reload();
}

function doError(text) {
    Messenger().post({
        message: text,
        hideAfter: 3,
        showCloseButton: true
    });
}