
var SF_LAT = -33.4488897;
var SF_LNG = -70.6692655;

$(document).ready(function() {
  initialize();
});

var initialize = function() {
  // Define some options for the map
  var mapOptions = {
    center: new google.maps.LatLng(SF_LAT, SF_LNG),
    zoom: 10,

    // hide controls
    panControl: false,
    streetViewControl: false,

    // reconfigure the zoom controls
    zoomControl: true,
    zoomControlOptions: {
      position: google.maps.ControlPosition.RIGHT_BOTTOM,
      style: google.maps.ZoomControlStyle.SMALL
    }
  };

  // create a new Google map with the options in the map element
  var map = new google.maps.Map($("#map_canvas")[0], mapOptions);

  $.get('locations', function(data){
    for (var i = 0; i < data.length; i++) {
      var marker = new google.maps.Marker({
        position: { lat: data[i]['latitude'], lng: data[i]['longitude'] },
        map: map,
        title: 'Vehicle: ' + data[i]['vehicle_identifier'] + ', Send at: ' + data[i]['send_at']
      });
    };
  });
}
