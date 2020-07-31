var myMap;


ymaps.ready(init);

function init () {
  myMap = new ymaps.Map('map', {
    center: [55.76, 37.64], 
    zoom: 10
},  {
        searchControlProvider: 'yandex#search'
    });
    document.getElementById('destroyButton').onclick = function () {
        myMap.destroy();
    };

}