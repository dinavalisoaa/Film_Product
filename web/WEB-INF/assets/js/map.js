/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Initialize the map
var map = L.map('map').setView([-18.58,46.50], 13);

// Add tile layer to map
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
  maxZoom: 18,
}).addTo(map);

function addMarkers(params) {
    params.forEach((value)=>{
        // alert(JSON.stringify(value));
        let marker = L.marker(value);
        marker.on('click', function (e) {
            var xhr = new XMLHttpRequest();
    
            xhr.onload = function() {
                let popup = L.popup();

            
                popup.setLatLng(e.latlng)
                .setContent(this.responseText)
                .openOn(map);
                // document.getElementById("demo").innerHTML = ;
            }
        
            xhr.open("GET","http://localhost:8000/popup?lat="+e.latlng.lat+"&lng="+e.latlng.lng);
            xhr.send();
        })
        marker.addTo(map);
    });
}

function openPopup(coord) {
    var variable = document.getElementById("idea-full");
    var main =document.getElementById("idea-main-card");


    variable.style.display = "block";

    main.style.animation = "scale";
    main.style.animationDirection = "forward";
    main.style.animationDuration = "200ms";

    let close = document.getElementById("idea-close");
    close.addEventListener('click',function () {
        variable.style.display = "none";
    });

    document.getElementById('latitude').value = coord.lat;
    document.getElementById('longitude').value = coord.lng;
}

map.on('click',(e)=>{
    console.log(e.latlng);
    // e.latlng.toString()
    openPopup(e.latlng);
})

// function getInformation(id) {
//     var xhr = new XMLHttpRequest();
    
//     xhttp.onload = function() {
//         document.getElementById("demo").innerHTML = this.responseText;
//     }

//     xhr.open("GET","http://0.0.0.0:8000/popup.html?id="+id);
//     xhr.send();
// }

// var popup = L.popup();

// function onMapClick(e) {
//     popup
//         .setLatLng(e.latlng)
//         .setContent("You clicked the map at " + e.latlng.toString())
//         .openOn(map);
// }

// map.on('click', onMapClick);
