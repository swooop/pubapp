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
//= require bootstrap
//= require_tree .

$(function(){

  if($('#flash_notice').length > 0) {
    $('.alert-success').fadeTo(4000, 0);
  };

  var switch_index = function(idx) {
    $('.index-category').hide(); $('#cat_' + idx).fadeIn(500);
  };

  $('#clicksign').click(function() {
    $('#signup').slideToggle('slow', function() {
      // Animation complete.
      console.log('click');
    });
  });

  $('#easteregg').click(function() {
    $('.hider').slideToggle('slow', function() {
      // Animation complete.
      console.log('click');
    });
  });

  $('.indexer').click(function() {
    switch_index($(this).data('indice'));
  });


  if($('#map-canvas').length > 0) {
    // Map options object
    var mapOptions = {
      center: new google.maps.LatLng(-51.511, -0.119),
      zoom: 8,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    // Draw map on page, add options
    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    //Create infowindow
    var infowindow = new google.maps.InfoWindow({
      content: 'Hi george'
      });

    // Array to store pub markers
    // var pub_markers = [];

    // Variable to store boundaries of markers
    var bounds = new google.maps.LatLngBounds();

    // Grab address
    var address = $('#map-canvas').attr('data-address');

    // Grab 5 pubs as JSON
    $.getJSON("/search?address=" + address + "&format=json", function(data) {
      
      // Variable to store locations
      var locations = data;

      // Loop through each location
      $.each(locations, function(index, location) {
        console.log(location)
        // Create marker for location using JSON lat and long

        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(location.latitude, location.longitude),
          map: map,
          title: null
        });

        //Infowindow event
          google.maps.event.addListener(marker, 'click', function() {
          infowindow.setContent(location.pubs[0].name);
          infowindow.open(map,marker);

        });

        // Add marker to pub_markers array
        // pub_markers.push(marker);

        // Extend boundary of LatLngBounds
        bounds.extend(marker.position);

      });

      // Apply new boundary
      map.fitBounds(bounds);

    });
  }

});
