#Array

일반적인 Array 오브젝트.
아래 경우에 colors.length = 6; 으로 선언할 경우, 즉 원래 어레이보다 length를 길게 하면
늘어난 element는 undefined 로 만들어진다.

```javascript
var colors = ["red", "blue", "green"];
colors[colors.length] = "black"; //add a colors
colors[colors.length] = "brown";
```

##Stack
자바스크립트에서는 stack을 위해서 push()와  pop()을 지원한다.
```javascript
colors.pop();
colors.push("black");
```

##Queue
push로 엘리먼트를 집어넣는 대신, shift()로 엘리먼트를 꺼낸다.

###Splice()
 * splice(0,1) remove the first element
 - splice(0,2,"red", "green") insert red, green into position 2

###Sort()
sort의 경우는 아무것도 pass하지않으면 모든 엘리먼트가 string이라고 간주. 즉, 숫자의 경우는 틀린 결과를 리턴한다.
숫자의 경우는 callback function을 넘겨줘야한다.

###Access to each element
```javascript
var numbers =[1,2,3,4,5];
//modifies original array
        numbers.forEach(function(item,idx,arr){
            return item * 3;
        });

        //returns another array
        var mapResult = numbers.map(function(item,index,array){
            return item *2;
        });

        //return true or false
        var everyResult = numbers.every(function(item, index, array){
           return(item >2);
        });

        //return true or false
        var someResult = numbers.some(function(item, index, array){
            return(item >2);
        });

        //returns elements satisfies the condition
        var filterResult = numbers.filter(function(item, index, array){
            return(item >2);
        });


```
