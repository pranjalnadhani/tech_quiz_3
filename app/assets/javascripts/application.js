// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//
// This goes in application.js
// Using this, the confirmation alerts on Rails 3.1 will be replaced with this behaviour:
// The link text changes to 'Sure?' for 5 seconds. If you click the button again within 2 seconds the action is performed,
// otherwise the text of the link (or button) flips back and nothing happens.
$.rails.confirm = function(message, element) 
{ 
    var state = element.data('state');
    var txt = element.text();
    if (!state)
    {
        element.data('state', 'last');
        element.text('Sure to delete?');
        setTimeout(function()
        {
            element.data('state', null);
            element.text(txt);
        }, 5000);
        return false;
    }   
    else
    {
        return true;
    }
};

$.rails.allowAction = function(element) 
{
    var message = element.data('confirm'),
        answer = false, callback;
    if (!message) { return true; }

    if ($.rails.fire(element, 'confirm')) 
    {
        // le extension.
        answer = $.rails.confirm(message, element);
        callback = $.rails.fire(element, 'confirm:complete', [answer]);
    }
    return answer && callback;
};

$.rails.handleLink = function(link) 
{
    if (link.data('remote') !== undefined) 
    {
        $.rails.handleRemote(link);
    } 
    else if (link.data('method')) 
    {
        $.rails.handleMethod(link);
    }

    return false;
};
