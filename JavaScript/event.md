#Event핸들러를 정의하는 법
정의하는 세가지 방법이 있음.
onclick = ... 로 쓰는 것은 여러개의 핸들러를 정의할 때 좋음.

```javascript
<body>
<!-- outputs "click" -->
<input type="button" id= "button1" value="Click Me" onclick="myHandler">

<script type="text/javascript">
    var button = document.getElementById("button1");
    button.onclick = myHandler;

    button.addEventListener("click",myHandler,true);

    function myHandler(event){
        alert(event.type);
        var button = event.target;
        alert(button.value);

    }

    /* button.addEventListener("click",function(event){
     alert(event.type);


     })*/

</script>
</body>

```

하나의 객체에 여러개의 이벤트를 핸들하기

```javascript
<body>
    <input type="button" id="myBtn" value="Click Me" />
    <script type="text/javascript">
        var btn = document.getElementById("myBtn");
        var handler = function(event){
            switch(event.type){
                case "click":
                    alert("Clicked");
                    break;

                case "mouseover":
                    event.target.style.backgroundColor = "red";
                    break;

                case "mouseout":
                    event.target.style.backgroundColor = "";
                    break;                        
            }
        };

        btn.onclick = handler;
        btn.onmouseover = handler;
        btn.onmouseout = handler;

    </script>
</body>
```
