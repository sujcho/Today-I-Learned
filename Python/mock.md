from http://blog.thedigitalcatonline.com/blog/2016/03/06/python-mocks-a-gentle-introduction-part-1/#.WObJ71MrJE4

# Basic Concept
테스트 용어에서 모의 ​​(mock)는 다른 (더 복잡한) 객체의 동작을 시뮬레이트하는 객체입니다. 라이브러리의 객체를 테스트 할 때 객체가 연결할 다른 시스템에 액세스 할 때가끔 필요하지만 몇 가지 이유 때문에 실제로 실행하도록 강요하고 싶지는 않습니다.

## mock object
라이브러리를 import 한다.
```python
from unittest import mock
```
라이브러리가 제공하는 주요 객체는 Mock이며 인수없이 인스턴스화 할 수 있습니다.
```python
m = mock.Mock()
```
이 객체에는 필요할 때 즉시 메서드와 속성을 만드는 고유 한 속성이 있습니다. 객체를 살펴보고 객체가 제공하는 것을 한 번 살펴 보겠습니다.
이미 알 수 있듯이 Mock 객체에 이미 정의 된 몇 가지 메소드가 있습니다. 존재하지 않는 속성을 읽어봅시다.

당신이 볼 수 있듯이,이 클래스는 당신이 익숙한 것과는 다소 차이가 있습니다. 우선 인스턴스가 존재하지 않는 속성을 묻는 경우 AttributeError를 발생시키지 않지만 모의 자체의 또 다른 인스턴스를 기꺼이 반환합니다. 두 번째로, 액세스하려고 시도한 속성이 객체 내부에서 생성되었으며 액세스 한 객체는 이전과 같은 모의 객체를 반환합니다.

모의 객체는 호출 가능 객체이므로 속성과 메소드로 모두 작동 할 수 있습니다. 모의 객체를 호출하려고하면 호출 가능한 속성을 나타내는 괄호가 포함 된 이름을 가진 다른 모의 객체를 반환합니다.

이해할 수 있듯이 이러한 객체는 예외를 발생시키지 않고 API를 노출 할 수 있기 때문에 다른 객체 또는 시스템을 모방하는 완벽한 도구입니다. 그러나 테스트에서 사용하려면 원본과 똑같이 행동해야합니다. 이는 원래 값을 반환하거나 작업을 수행한다는 의미입니다.

## Return value
모의 (mock)이 할 수있는 가장 간단한 일은 호출 할 때마다 주어진 값을 반환하는 것입니다. 이것은 mock 객체의 return_value 속성을 설정하도록 구성되어 있습니다.
```python
m.some_attribute.return_value = 42
m.some_attribute()
>> 42
```
물론 함수 나 객체와 같은 호출 가능 객체를 저장할 수도 있으며, 메소드는 그것을 반환 할 것이지만 그것을 실행하지는 않을 것입니다. 내가 한 가지 예를 들자.
```python
>>> def print_answer():
...  print("42")
...
>>>
>>> m.some_attribute.return_value = print_answer
>>> m.some_attribute()
<function print_answer at 0x7f8df1e3f400>
```
여러분이 볼 수 있듯이 some_attribute ()를 호출하면 return_value에 저장된 값, 즉 함수 자체가 반환됩니다. 함수에서 오는 값을 반환하려면 side_effect라는 mock 객체의 약간 더 복잡한 속성을 사용해야합니다.

## Side effect
모의 객체의 side_effect 매개 변수는 매우 강력한 도구입니다. 객체, 호출 가능, 반복 가능 및 예외의 세 가지 유형을 허용하고 이에 따라 동작을 변경합니다.
예외를 전달하면 모의 객체가 예외를 발생시킵니다.
```python
>>> m.some_attribute.side_effect = ValueError('A custom value error')
>>> m.some_attribute()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.4/unittest/mock.py", line 902, in __call__
    return _mock_self._mock_call(*args, **kwargs)
  File "/usr/lib/python3.4/unittest/mock.py", line 958, in _mock_call
    raise effect
ValueError: A custom value error
```
예를 들어 generator, plain list, tuple 또는 이와 유사한 객체와 같은 iterable을 전달하면 mock은 iterable의 값을 반환합니다. 즉, 이후의 mock 호출에서 iterable에 포함 된 모든 값을 반환합니다. 내가 한 가지 예를 들자.

```python
>>> m.some_attribute.side_effect = range(3)
>>> m.some_attribute()
0
>>> m.some_attribute()
1
>>> m.some_attribute()
2
>>> m.some_attribute()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.4/unittest/mock.py", line 902, in __call__
    return _mock_self._mock_call(*args, **kwargs)
  File "/usr/lib/python3.4/unittest/mock.py", line 961, in _mock_call
    result = next(effect)
StopIteration
```
약속대로, 모의 객체는 반복자에있는 모든 객체 (이 경우에는 범위 객체)를 한 번에 하나씩 생성자가 고갈 될 때까지 반환합니다. 반복자 프로토콜 (이 게시물 참조)에 따라 모든 항목이 반환되면 객체는 StopIteration 예외를 발생시킵니다. 즉, 루프에서 올바르게 사용할 수 있습니다.

마지막으로 가장 많이 사용되는 경우는 side_effect에 호출 가능 코드를 전달하는 것입니다. side_effect는 자체 매개 변수로 부끄럽게 사용하지 않습니다. 이는 특히 "기능"에 대한 생각을 멈추고 "호출 기능"을 고려하기 시작하면 매우 강력합니다. 실제로 side_effect는 클래스를 받아 들여 호출합니다. 즉, 객체를 인스턴스화 할 수 있습니다. 인자없는 함수를 가진 간단한 예제를 생각해 보자.

```python
>>> def print_number(num):
...     print("Number:", num)
...
>>> m.some_attribute.side_effect = print_number
>>> m.some_attribute.side_effect(5)
Number: 5
```
# Testing with mocks
## Testing types
Incoming queries (assertion on result)
Incoming commands (assertion on direct public side effects)
Outgoing commands (expectation on call and arguments)

외부 객체를 처리 할 때 알 수 있듯이 메서드가 호출 된 경우와 호출자가 객체에 전달한 매개 변수를 알고있는 경우에만 관심이 있습니다. 원격 객체가 정확한 결과를 반환하는지 테스트하지는 않습니다. 이것은 모의 객체에 의해 가짜입니다. 실제로 우리가 필요로하는 결과를 정확하게 반환합니다.

따라서 mock 객체가 제공하는 메소드의 목적은 모의 객체에서 호출 한 메소드와 호출에서 사용한 매개 변수를 확인할 수있게하는 것입니다.

#Asserting calls
테스트에서 파이썬 모의 객체를 사용하는 방법을 보여주기 위해 먼저 TDD 방법론을 따르고 테스트를 작성한 다음 테스트를 통과시키는 코드를 작성합니다. 이 글에서는 모의 객체에 대한 간단한 개요를 제공하기 위해 실제 사용 사례를 구현하지 않을 것이며 코드는 매우 사소 할 것입니다. 이 시리즈의 두 번째 파트에서는 좀 더 재미있는 사용 사례를 보여주기 위해 실제 클래스를 테스트하고 구현합니다.
외부 객체를 처리 할 때 가장 먼저 관심을 갖는 것은 주어진 메소드가 호출되었음을 알리는 것입니다. 파이썬 모크는이 조건을 검사하기 위해 assert_called_with () 메소드를 제공한다.
우리가 테스트 할 유스 케이스는 다음과 같다. 우리는 외부 객체를 필요로하는 myobj.MyObj 클래스를 인스턴스화합니다. 클래스는 매개 변수없이 외부 객체의 connect () 메서드를 호출해야합니다.
```python
from unittest import mock
import myobj

def test_instantiation():
    external_obj = mock.Mock()
    myobj.MyObj(external_obj)
    external_obj.connect.assert_called_with()
```
이 간단한 예제에서 myobj.MyObj 클래스는 외부 저장소 (예 : 원격 저장소 또는 데이터베이스)에 연결해야합니다. 테스트 목적으로 알 필요가있는 것은 클래스가 매개 변수없이 외부 객체의 connect () 메소드를 호출 한 경우뿐입니다.

따라서이 테스트에서 가장 먼저 할 일은 모의 객체를 인스턴스화하는 것입니다. 이것은 외부 개체의 가짜 버전이며 테스트 목적의 MyObj 개체에서 호출을 받아들이고 적절한 값을 반환하는 용도로만 사용됩니다. 그런 다음 외부 객체를 전달하는 MyObj 클래스를 인스턴스화합니다. 우리는 클래스가 connect () 메서드를 호출하여 external_obj.connect.assert_called_with ()를 호출하는이 기대를 표현할 것으로 기대합니다.

배후에서는 어떤 일이 발생합니까? MyObj 클래스는 외부 객체를 받고 초기화 프로세스는 mock 객체의 connect () 메소드를 호출하고 메소드 자체를 mock 객체로 만듭니다. 이 새로운 모의 객체는 호출하는 데 사용 된 매개 변수를 기록하고 assert_called_with ()에 대한 후속 호출은 메소드가 호출되었고 매개 변수가 전달되지 않았는지 확인합니다.

pytest를 실행하면 테스트가 실패합니다.
다음과 같은 코드를 넣으면 테스트를 통과하게 만들 수 있습니다.
```python
class MyObj():
    def __init__(self, repo):
        repo.connect()
```
보시다시피, __init __ ()메서드는 실제로 repo.connect ()를 호출합니다. 여기서 repo는 주어진 API를 제공하는 완전한 기능을 갖춘 외부 객체입니다. 이 경우 (당분간) API는 connect () 메소드 일뿐입니다. Repo가 mock 객체 일 때 repo.connect ()를 호출하면 앞에서와 같이 mock 객체로 메소드가 자동으로 생성됩니다.

assert_called_with () 메서드를 사용하면 호출 할 때 전달 된 매개 변수를 확인할 수 있습니다. 이를 보여주기 위해 MyObj.setup () 메서드가 외부 개체에 대해 setup (cache = True, max_connections = 256)을 호출 할 것으로 기대합니다. 보시다시피 호출 된 메서드에 몇 가지 인수 (즉, cache 및 max_connections)를 전달하고 호출이이 형식으로 정확하게 이루어 졌는지 확인하고자합니다. 따라서 새로운 테스트는
