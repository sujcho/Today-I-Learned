#Prototype

자바스크립트에서 function이 오브젝트이고, 모든 오브젝트는 prototype이라는 property를 가지고 있다.
prototype은 만들어졌을 때 empty 오브젝트임.

```javascript
function Gadget(name) {
  this.name = name;
}
Gadget.prototype.name = 'foo';

var toy = new Gadget('camera');
alert(toy.name); //"camera"
delete toy.name;
alert(toy.name); //"foo"
```


#isPrototypeOf()
모든 오브젝트는 isPrototypeOf() 함수를 가지고 있다.

```javascript
var monkey = {
  hair: true,
  feeds: 'bananas',
  breathes: 'air'
};

function Human(name) {
	this.name = name;
}
Human.prototype = monkey;
```
```
>>> var george = new Human('George');
>>> monkey.isPrototypeOf(george) // true
```
이 경우 monkey가 Human의 prototype property이기 때문에 Human 이 super 클래스라고 생각하기 쉬운데  monkey 가 super class 임.
