#Location Object
로케이션 오브젝트는 현재 윈도우에 로드된 페이지의 모든 정보를 가지고 있다.
window.location 으로 콘솔에서 치면 정보를 볼 수 있다.

##Navigation function
다른 url로 이동하는 함수들. 5초뒤에 다른 페이지로 이동합니다와 같은 경우에 쓸 수 있다.
```javascript
setTimeout(function () {
    location.replace("http://www.wrox.com/");
            //location.assign("http://www.wrox.com/");
            //window.open("http://www.yahoo.com",'_self');
}, 5000);
```
