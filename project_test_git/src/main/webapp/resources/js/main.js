requirejs.config({
	baseUrl : "/js/lib",

	paths: {
		'jquery' : [
			'jquery-1.12.1',
			'//ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min'
		],
		
		'backbone' : [
			'backbone', 
			'//cdnjs.cloudflare.com/ajax/libs/backbone.js/1.0.0/backbone-min'
		],

		'underscore': [ 
		  'underscore', 
		  '//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.4.2/underscore-min' 
		]
	},
	
	shim: {
		'underscore' : {
			exports: function() { return _; }
		},
		'backbone': {
			deps: ['underscore', 'jquery'],
			exports: 'backbone'
		},
		'jquery' : {
			exports: function() {
				var jQuery = jQuery.noConflict();
				return jQuery;
			}
		}
	}
});

(function(factory) {
	requirejs(["jquery"], function($) {
		//alert($);
	});
})(function(root, Boackbone, _, $) {});