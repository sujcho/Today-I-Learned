#Browser Object Model
window 오브젝트가 global scope이다.

##Navigating and Opening Windows
topFrame이라는 윈도우 또는 프레임이 있으면 url을 거기에 로드하고, 없으면 새로운 창이 생성되고, 거기에 로드한다.
```html
<!DOCTYPE html>
<html>
<head>
    <title>Window Open Example</title>
    <script type="text/javascript">
            var windowReference;
        function openWindows(url,windowName){
            windowReference= window.open(url,windowName);
        }
        function closeWindow(){
                windowReference.close();
        }

    </script>
</head>
<body>
    <p>This will open a new window/tab:
    <input type="button" value="Go to Yahoo.com"
           onclick="openWindows('http://www.yahoo.com/','topFrame')" /></p>
    <p>This will close the newly opened window/tab:
    <input type="button" value="Close Yahoo.com"
           onclick="closeWindow()" /></p>
    <p>This will open in the current window/tab:
    <input type="button" value="Go to Yahoo.com"
           onclick="openWindows('http://www.yahoo.com/', '_self')" /></p>
</body>
</html>
``
팝업으로 열고싶은 경우에는 아래와 같이 사이즈를 지정해준다.
```javascript
window.open(“http://www.wrox.com/”,”wroxWindow”,“height=400,width=400,top=10,left=10,resizable=yes”);
```
**팝업의 경우에는 block 당할 수가 있어서 팝업이 block 됐을 때 알려주는 코드가 필요하다.**
```javascript
var blocked = false;

try {
    var wroxWin = window.open("http://www.wrox.com", "_blank");
    if (wroxWin == null){
        blocked = true;
    }
} catch (ex){
    blocked = true;
}

if (blocked){
    alert("The popup was blocked!");
}
```
##setTimeout() 과 setInterval()
setInterval()은 매 인터벌마다 실행된다. setTimeout()은 한번만 실행된다.
setInterval()은 재실행이 끝나는 베이스 컨디션이 필요하다.
###setInterval()
incrementNumber라는 함수를 매 500ms 마다 실행하라.
```javascript
var num = 0;
       var max = 10;
       var intervalId = null;


       function incrementNumber() {
           num++;

           //if the max has been reached, cancel all pending executions
           if (num == max) {
                   clearInterval(intervalId);
               alert("Done");
           }
       }

intervalId = setInterval(incrementNumber, 500);
```
###setTimeout()
위와 동일한 코드
```javascript
var num = 0;
var max = 100;

function incrementNumber() {
    num++;

    //if the max has not been reached, set another timeout
    if (num < max) {
        setTimeout(incrementNumber, 500);
    } else {
        alert("Done");
    }
}

setTimeout(incrementNumber, 500);
```

##System Dialog
###confirm()
ok와 cancel을 보여준다.
```javascript
if (confirm("Are you sure?")) {
     alert("I'm so glad you're sure! ");
 } else {
      alert("I'm sorry to hear you're not sure. ");
 }
```

###prompt()
사용자가 인풋을 타입할 수 있으면 타입된 인풋을 사용할 수 있다.
```javascript
var result = prompt("What is your name? ", "UCSC");
  if (result !== null) {
   alert("Welcome, " + result);
  }
```
