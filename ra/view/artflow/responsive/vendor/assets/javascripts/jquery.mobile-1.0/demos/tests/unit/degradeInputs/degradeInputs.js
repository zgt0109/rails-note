/***
 * Excerpted from "The Rails View",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/warv for more book information.
***/
/*
 * degradeInputs unit tests
 */

(function($){
    
    module('jquery.mobile.slider.js');
	
	test('keepNative elements should not be degraded', function() {
        same($('input#not-to-be-degraded').attr("type"), "range");
	});
	
	test('should degrade input type to a different type, as specified in page options', function(){
        var degradeInputs = $.mobile.page.prototype.options.degradeInputs;
    
        expect( degradeInputs.length );
    
        $.each(degradeInputs, function( oldType, newType ) {
            if (newType === false) {
                newType = oldType;
            }
            
            $('#test-container').html('<input type="' + oldType + '" />').trigger("create");
            
            same($('#test-container input').attr("type"), newType);
        });
    });
	
})(jQuery);