#Inheritance
자바스크립트는 OOP 프로그래밍이긴하지만 일반적인 상속 개념이 빠져있다.
대신 **prototype chaining** 을 사용해서 상속 개념으로 구현할 수 있다.

```javascript
function Shape(){
	this.name = 'shape';
	this.toString = function() {return this.name;};
}
function TwoDShape(){
	this.name = '2D shape';
	}
function Triangle(side, height) {
	this.name = 'Triangle';
	this.side = side;
	this.height = height;
	this.getArea = function(){return this.side * this.height / 2;};
	}
TwoDShape.prototype = new Shape(); // It actual
Triangle.prototype = new TwoDShape();
var trianagle1 = new Triangle();
trianagle1.toString();
```
