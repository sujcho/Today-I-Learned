#Ajax
Asynchronous Javascript + XML. 페이지를 리로드 하지않고 데이터가 바뀔때 DOM을 업데이트한다.

1) 브라우저에서 XMLHttpRequest를 만든다.
```javascript
function getRequest() {
  var request;
    if(window.XMLHttpRequest){
        request  = new XMLHttpRequest();
    }else{
        request = new ActiveXObject();
    }
   return request;
}
```

2) 보낼때
하지만 Synchronous로 해서는 안된다.

- sync
```javascript
function loadSyncXHR(){
    for(var i = 0; i<100; i++){
        var xhr = getRequest();
        xhr.open('GET','data.txt',false);
        xhr.send()
        if(xhr.status == 200){
            document.getElementById('output1').innerHTML = xhr.responseText;
        }

    }
}
```
- Asynchronous
```javascript
function loadAsyncXHR(){
        var xhr = getRequest();
        xhr.open('GET','data.txt',true);
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4 && xhr.status == 200){
                document.getElementById('output2').innerHTML = xhr.responseText;
            }
        }
        xhr.send()
}
```
- load XML
```javascript
function loadXML(){
    var xhr = getRequest();
    xhr.open('GET','myXml.xml',true);
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            var myXML = xhr.responseXML;
            console.log(myXML.getElementsByTagName('name')[0].firstChild.nodeValue);
            var items = myXML.getElementsByTagName('name');
            var myHTML = "<ul>";
            for(var i =0; i<items.length; i++){
                myHTML += "<li>" + myXML.getElementsByTagName('name')[i].firstChild.nodeValue + "</li>";
            }
            myHTML += "</ul>";
            document.getElementById('output3').innerHTML = myHTML;
        }
    }
    xhr.send()
}
```
-load json
```javascript
function loadJSON(){
    var xhr = getRequest();
    xhr.open('GET','data.json',true);
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            var myJSON = JSON.parse(xhr.responseText);

            var myHTML = "<ul>";

            for(var key in myJSON){
                myHTML += "<li>" + myJSON[key].name+ "</li>";
            }myHTML += "</ul>";
            document.getElementById('output4').innerHTML = myHTML;
        }
    }
    xhr.send()
```
