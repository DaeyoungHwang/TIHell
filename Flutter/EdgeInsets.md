# EdgeInsets

padding, margin과 같이 레이아웃 여백(padding, margin) 영역의 크기를 지정할때 사용하는 클래스이다.

## EdgeInsets.all()

전체 여백을 지정

## ..only()

특정 영역에만 여백을 지정하고 싶을때 사용

```Dart
EdgeInsets.only(bottom: 5)
EdgeInsets.only(top: 40.0)
```

## ..fromLTRB()

Left Top Right Bottom 순으로 지정

```Dart
EdgeInsets.fromLTRB(4, 0, 4, 0)
```

## ..symmetric()

수평, 수직을 기준으로 대칭적인 여백 지정

- vertical
- horizontal
