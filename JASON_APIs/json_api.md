# JSON API & Ajax


## How to get JSON 

> getJSON

```javascript
$.getJSON("/json/cats.json", function(json) {
          $(".message").html(JSON.stringify(json));
      });```


> ajax

To return JSON data, set the option object "async" to be false.
```javascript
var global = {};
$.ajax({
    async: false,
    url:'https://freegeoip.net/json/',
    success: function(json){
     // $("#message").html(JSON.stringify(json));
      global = json;
      $("city").html(json.city);
      $("#region").html(json.region_name);
      $("#country").html(json.country_name);
    }
 });
 return global;```

