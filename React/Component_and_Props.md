#Component and props
컴포넌트를 사용하여 UI를 독립적이고 재사용 가능한 부분으로 분리하고 각 부분을 개별적으로 생각할 수 있다.
개념상 컴포넌트는 JavaScript 함수와 같다. 컴포넌트는 임의의 입력 ( "props"라고 함)을 받아들이고 무엇이 화면에 나타나야 하는지를 담고있는 React 요소를 반환한다.

##Component
컴포넌트를 정의하는 가장 쉬운 방법은 자바스크립트 함수를 정의하는 것이다.
```javascript
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}
```
또는 ES6적으로 클래스를 사용하여 정의할 수 있다.
```java
class Welcome extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>;
  }
}
```
위의 두 정의는 React개념상으로는 같은 의미이다.
