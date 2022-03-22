# Stateful widget

StateLess widget은 초기에 설정한 속성을 변경할 수 없다.
그래서 life cycle 동안 상태가 변경되어야 하는 경우 stateful widget을 사용해야 한다.

## 구성요소

- StatefulWidget class: 인스턴스를 생성하기 위한 클래스
- State class: StatefulWidget은 life-cycle동안 `immutable`하다. 다만 언제든지 삭제, 재생성이 가능하다. 반면에 State class는 widget의 life-cycle 동안 `persist` 한 특징을 가지고 있다.

## Stateful boilerplate

- IDE 에서 stful을 입력하면 snippet으로 생성해준다.
- stful로 생성한 Stateful widget의 state class에는 `_`가 접두사로 붙는다.
- dart에서는 `_` 접두사가 붙은 식별자는 `privacy`로 취급한다.
- State는 보통 `privacy`로 취급하는게 권장된다.
- State Class는 자동으로 Stateful widget을 제네릭으로 한 State<StatefulWidgetClass>를 extends한다.
- State Class에는 Stateful Widget의 상태를 관리하는 로직이 포함된다.
- build() 메소드는 State Class안에 포함된다.
