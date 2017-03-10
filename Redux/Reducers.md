#Reducers
액션은 무언가가 일어났다는 사실을 알리지만, 애플리케이션의 상태가 어떻게 변하는지를 지정하지는 않는다 . 이것은 리듀서의 일이다.

#State Shape 디자인
Redux에서 모든 응용 프로그램 상태는 단일 객체로 저장된다. 코드를 작성하기 전에 모양을 생각하는 것이 좋다. 어떻게 앱의 상태를 하나의 걕체로서 최소한으로 잘 표현할 수 있을까?

#액션 핸들링
이제 상태 객체를 정의했으므로 리듀서를 작성할 준비가 되었다. 리듀서는 이전 상태와 액션을 받아서 다음 상태를 반환하는 순수한 함수이다.
```JavaScript
(previousState, action) => newState
```
이것이 당신이 Array.prototype.reduce (reducer,? initialValue)에 전달할 함수 유형이기 때문에 리듀서라고 부른다. 리듀서는 순수 함수인것이 매우 중요하다.
리듀서 내부에서 절대해서는 안되는 것들 :
- 인수를 변경.
- API 호출 및 라우팅 전환과 같은 사이드 이펙트를 수행.
- 비 순수 함수를 호출한다 (예 : Date.now () 또는 Math.random ().

우리가 이전에 정의한 동작을 이해하기 위해 점차적으로 리듀서를 작성해 보겠다.
초기 상태 지정부터 시작한다. Redux는 처음에 undefined 상태로 리듀서를 호출한다. 이것은 앱의 초기 상태를 반환 할 수있는 기회이다.
```JavaScript
import { VisibilityFilters } from './actions'

const initialState = {
  visibilityFilter: VisibilityFilters.SHOW_ALL,
  todos: []
}

function todoApp(state, action) {
  if (typeof state === 'undefined') {
    return initialState
  }

  // For now, don't handle any actions
  // and just return the state given to us.
  return state
}
```

```Javascript
function todoApp(state = initialState, action) {
  switch (action.type) {
    case SET_VISIBILITY_FILTER:
      return Object.assign({}, state, {
        visibilityFilter: action.filter
      })
    default:
      return state
  }
}
```
**Object Assign** : Object.assign () 메서드는 열거 가능 속성과 자체 속성을 원본 개체에서 대상 개체로만 복사한다.
예:
```Javascript
var obj = { a: 1 };
var copy = Object.assign({}, obj);
console.log(copy); // { a: 1 }
```
