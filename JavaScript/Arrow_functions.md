#Arrow_functions
화살표 함수 표현식은 함수 표현식보다 짧은 구문을 가지며 this, arguments, super 또는 new.target을 자체 바인딩하지 않는다. 화살표 기능은 항상 익명이다. 이 함수 표현식은 메소드가 아닌 함수에 가장 적합하며 생성자로 사용할 수 없다.

##Syntax
###Basic Syntax
```javascript
(param1, param2, …, paramN) => { statements }
(param1, param2, …, paramN) => expression
// equivalent to: (param1, param2, …, paramN) => { return expression; }

// Parentheses are optional when there's only one parameter:
(singleParam) => { statements }
singleParam => { statements }

// A function with no parameters requires parentheses:
() => { statements }
() => expression // equivalent to: () => { return expression; }
```
###Advanced Syntax
```javascript
// 본문을 괄호로 묶어서 객체 리터럴 식을 반환한다:
params => ({foo: bar})

// Rest parameters and default parameters are supported
(param1, param2, ...rest) => { statements }
(param1 = defaultValue1, param2, …, paramN = defaultValueN) => { statements }

// Destructuring within the parameter list is also supported
var f = ([a, b] = [1, 2], {x: c} = {x: a + b}) => a + b + c;
f();  // 6
```
#Description
ES6 introduces a new syntax for writing functions.
function syntax is simply Identifier => Expression. You get to skip typing function and return, as well as some parentheses, braces, and a semicolon.
```javascript
// ES5
var selected = allJobs.filter(function (job) {
  return job.isSelected();
});

// ES6
var selected = allJobs.filter(job => job.isSelected());
```
For object
```javascript
// create a new empty object for each puppy to play with
var chewToys = puppies.map(puppy => {});   // BUG!
var chewToys = puppies.map(puppy => ({})); // ok
```

```javascript
// ES5
$("#confetti-btn").click(function (event) {
  playTrumpet();
  fireConfettiCannon();
});

// ES6
$("#confetti-btn").click(event => {
  playTrumpet();
  fireConfettiCannon();
});
```
다시 한번 정리하면 함수를 쓸 때 => 를 사용하면, function 및 return을 제외하고 바로 parameter => 리턴값 형식으로 쓸 수 있다.
