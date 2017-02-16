#Array

일반적인 Array 오브젝트.
아래 경우에 colors.length = 6; 으로 선언할 경우, 즉 원래 어레이보다 length를 길게 하면
늘어난 element는 undefined 로 만들어짐.

```javascript
var colors = ["red", "blue", "green"];
colors[colors.length] = "black"; //add a colors
colors[colors.length] = "brown";
```
