#DOM
Document Object Model
자바스크립트가  html과 연동하기 위해서 api가 필요한데 이게 DOM이다. DOM을 이용하면 인터랙티브한 페이지를 만들 수가 있다.
DOM은 초기에는 XML방식으로 디자인되었다.
document...로 시작하는 api
Html페이지에서  DOM이 만들어진다: html 컴포넌트로 만들어진 트리구조.

##selection method
+ document.getElementById
+ document/node.getElementsByTagName
+ document.getElementsByName
+ document/node.getElementsByClassName
+ document/node.querySelector, querySelectorAll

##Programmatically set/get attributes

```html
 <!DOCTYPE html>
 <html>
 <head>
     <title>Element Attributes Example</title>
 </head>
 <body>
     <style type="text/css">
         .change {
             color: red;
         }
     </style>
     <div id="myDiv" class="bd" title="Body text" lang="en" dir="ltr" my_special_attribute="hello!">Some text</div>
     <!--<div id="myDiv1" class="change" title="Body text1" lang="en" dir="ltr" my_special_attribute="hello!">-->
         <!--Some other text</div>-->
     <input type="button" value="Get Values" onclick="getValues()">
     <input type="button" value="Set Values" onclick="setValues()">
     <!--<input type="button" value="Set Values" onclick="setValues()">-->
     <p>Try clicking &quot;Get Values&quot;, then &quot;Set Values&quot;, then &quot;Get Values&quot; again.</p>
     <script type="text/javascript">
         var div = null;
         function getValues(){
             if (div == null) {
                 div = document.getElementById("myDiv");
             }
             alert(div.getAttribute("id"));         //"myDiv"
             alert(div.getAttribute("class"));      //"bd"
             alert(div.getAttribute("title"));      //"Body text"
             alert(div.getAttribute("lang"));       //"en"
             alert(div.getAttribute("dir"));        //"ltr"
             alert(div.getAttribute("my_special_attribute"));   //"hello!"

         }    

         function setValues(){
             if (div == null) {
                 div = document.getElementById("myDiv");
             }

             div.setAttribute("id", "someOtherId");
             div.setAttribute("title", "Some other text");
             div.setAttribute("lang","fr");
             div.setAttribute("dir", "rtl");        
             div.setAttribute("class", "change");
         }
     </script>
 </body>
 </html>
```

##Create and Add elements
버튼을 클릭하면 폼이 보이게 한다던가 할 때 사용하는데 css를 사용해서 안보이게 할 수 도 있고 javascript를 사용해서 remove하거나 새로운 element를 만들어서 보이게 할 수 있다.
```html
<!DOCTYPE html>
<html>
<head>
    <title>Create Element Example</title>
</head>
<body>
    <style type="text/css">
        .box {
            width: 1032px;
            height: 32px;
            background-color: red;
        }
    </style>
    <input type="button" value="Create Element" onclick="createNewElement()">

    <script type="text/javascript">
        function createNewElement(element){
            var div = document.createElement("div");
            div.id = "myNewDiv";
            div.className = "box";
            div.innerHTML = "Some text going into the DIV";
            document.body.appendChild(div);

        }
    </script>
</body>
</html>
```

##form
폼을 서밋하는 방법은 두 가지가 있는 데 GET과 POST 이다. 좀 복잡하거나 정보가 긴 폼의 경우는 POST를 사용하는 것이 좋다.
html에서 폼을 가져오는 것은 폼을 다 가져올수가 있고, 아니면 이름으로 가져올 수 가 있다.

```javascript
var firstForm = document.forms[0]; //get the first form in the page
var myForm = document.forms[“form2”]; //get the form with a name of “form2”
```

사인업 같은 경우에는 클라이언트와 서버 사이드 둘다에서 인풋을 체크하는 데, 클라이언트의 경우에는 주로 인풋 밸리데이션을 하고,
서버 사이드 같은 경우에는 아이디와 관련해서 체크를 한다. 예를 들어서, 아이디가 중복되어있는 지 아닌지와 같은. 이 경우 어차피 아이디를 보내야하기때문에 아이디 인풋 체크도 서버에서 하는 편이다.
요즘은 유저가 서밋할때가지 기다리지 않고, 유저가 인풋을 넣자마자 체크하는 게 트렌드.
주로 발생하는 이벤트 : tab out, key up/key down
요즘은 인풋체크 같은 경우는 html5에서 많이 해준다. 예전에는 자바스크립트로 많이 한다.

폼을 서버로 서밋하는 방법은 버튼을 사용하는 데 onClick, onSubmit , 또는 폼을 클리어할 때 onReset 할 수 있다.
