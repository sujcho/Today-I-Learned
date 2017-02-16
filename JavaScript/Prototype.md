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
