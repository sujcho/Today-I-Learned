From http://redux.js.org/docs/basics/Actions.html
#Actions
먼저 몇 가지 액션을 정의해보자.
액션은 응용 프로그램에서 스토어로 데이터를 전송하는 정보 페이로드이다. 이들은 스토어에 대한 유일한 정보출처이며 store.dispatch ()를 사용하여 스토어로 보낼 수 있다.
다음은 할 일 목록 항목을 새로 추가하는 액션의 예이다.

```Javascript
const ADD_TODO = 'ADD_TODO'
{
  type: ADD_TODO,
  text: 'Build my first Redux app'
}
```
액션은 일반 JavaScript 객체이다. 액션에는 수행할 액션의 유형을 나타내는 type 속성이 있어야한다. 형식은 일반적으로 문자열 상수로 정의한다. 앱의 크기가 커지면 별도의 모듈로 옮길 수 있다.

#Action Creators
액션 크리에이터는 정확하게 액션을 생성하는 함수이다. 리덕스에서는 액션 크리에이터는 단순히 액션을 반환한다.
```JavaScript
function addTodo(text) {
  return {
    type: ADD_TODO,
    text
  }
}
```
액션을 스토어에 보내기 위해서는 다음과 같이한다.
```javascript
dispatch(addTodo(text))
dispatch(completeTodo(index))
```

#Example : actions.js
```JavaScript
/*
 * action types
 */
export const ADD_TODO = 'ADD_TODO'
export const TOGGLE_TODO = 'TOGGLE_TODO'
export const SET_VISIBILITY_FILTER = 'SET_VISIBILITY_FILTER'

/*
 * other constants
 */
export const VisibilityFilters = {
  SHOW_ALL: 'SHOW_ALL',
  SHOW_COMPLETED: 'SHOW_COMPLETED',
  SHOW_ACTIVE: 'SHOW_ACTIVE'
}

/*
 * action creators
 */
export function addTodo(text) {
  return { type: ADD_TODO, text }
}

export function toggleTodo(index) {
  return { type: TOGGLE_TODO, index }
}

export function setVisibilityFilter(filter) {
  return { type: SET_VISIBILITY_FILTER, filter }
}
```
