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

##Component 구성하기
컴포넌트는 출력에서 ​​다른 구성 요소를 참조 할 수 있고 이를 통해 모든 세부 수준에서 동일한 컴포넌트 추상화를 사용할 수 있다. React 앱에서는 버튼, 폼, 대화 상자, 화면 등 모든 것이 일반적으로 컴포넌트로 표현된다.
```javascript
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}

function App() {
  return (
    <div>
      <Welcome name="Sara" />
      <Welcome name="Cahal" />
      <Welcome name="Edite" />
    </div>
  );
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```
여기서보면 props는 부모로부터 값을 넘겨받을 수 있는 매개체이다.
모든 React 컴포넌트는 props과 관련하여 pure 함수처럼 작동해야한다.
