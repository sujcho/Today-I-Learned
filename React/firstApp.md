#firstApp
폴더 구조: jsx 파일은 component에 넣는다.
홈에는 index.js, index.html 을 넣는다.
dist 폴더에는 bundle.js를 생성할 것이기때문에 index.html 에서 bundle.js를 로드하는 경로를 바꿔준다.

##index.html
```html
 <script type="text/javascript" src= "dist/bundle.js"></script>
 ```
 bundle.js의 경로를 **dist/bundle.js** 로 바꿔준다.

##App.jsx
App이 최상위 컴포넌트이고 그 Greet과 Input이 하위 컴포넌트이다. Input에서 받은 데이터로 Greet을 변경하려할 때, 데이터는 App을 통해서만 주고 받을 수 있다. 즉, 데이터 플로우는 Input -> App -> Greet

```javascript
import React from 'react';

import Greet from './greet.jsx';
import Input from './input.jsx';

export default class App extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            name: "World"
        };
    }

    changeName(name) {
      this.setState({
          name: name
      });
    }

    render() {
        return (
            <div> // input에서 받은 데이터는 Greet으로 보내야하기때문에 state를 사용
                <Greet
                    name = { this.state.name }
                />
                //Input을 changeName함수를 패스한다.
                <Input
                   handleClick = {this.changeName.bind(this)}
                />
            </div>
        );
    }
}
```

##input.jsx
input은 자기의 state를 가지고 있다.
```javascript
handleClick() {
    this.props.handleClick(this.state.text);
}
```
여기서 props는 부모로부터 넘겨받은 값이다. state는 컴포넌트 내에서 변경 가능한 값이다.

##webpack.config.js
웹팩 같은 경우에는 workspace에 하나만 필요한데, 이는 각 앱별로 개발환경을 따로 셋팅할 필요가 없기 때문이다. 대신 웹팩의 엔트리 포인트를 적절하게 바꿔줘야하는 데 아래와 같다.
```javascript
entry: './fistApp/index.js',
 output: {
     filename: './fisrtApp/dist/bundle.js'
 },
```
