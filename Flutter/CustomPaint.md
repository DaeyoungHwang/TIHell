# CustomPaint

Flutter의 대부분의 위젯은 common feature나 functionality를 제공하기 때문에 canvas를 이용해 직접 그려야 할 일이 거의 없다.
그 외에도 rounding corners, opacity, substituting colors 등의 커스텀을 쉽게 할 수 있어 그 필요성이 더 낮다.

하지만 더 디테일한 디자인이나 스타일링, 애니메이션이 필요한 경우를 위해 Flutter에선 CustomPaint를 통해 Canvas API 기능을 제공한다.
여기서 살펴보아야 할 3가지 주요사항은 customPaint, customPainter, canvas 클래스이다.

## CustomPaint

CustomPaint widget은 Canvas를 제공하여 커스텀한 위젯을 만들 수 있도록 도와준다.

```Dart
CustomPaint(
  child: childWidget(),
  foregroundPainter: DemoForegroundPainter(),
  painter: DemoPainter(),
)
```

위를 보면 알겠지만 위젯에 주요한 매개변수는 3가지이다.

child, painter, foregroundPainter

painter와 foregroundPainter는 canvas에 그려지는 것들을 정의하는 customPainters이다.

이중 painter가 먼저 그려진다, 그 후 child widget이 background 위에 랜더링된다.
마지막으로 foregroundpainter가 그 위에 랜더링된다.
child widget을 painter들이 샌드위치처럼 앞뒤에 그려진다고 생각하면 된다.

이 때 customPaint widget의 크기는 부모, 자식, 매개변수의 우선순위로 지정된다.
예를들어 부모의 크기가 null이고 자식의 크기가 지정되어 있으면 widget의 크기는 자식의 크기가 된다.

## CustomPainter

이제 customPaint의 canvas위에 무언가를 그려야 하는데 이를 위해 custompainter를 서브클래싱하여 painter 클래스를 생성해야한다.

```Dart
class DemoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
```

- paint는 canvas에 무엇을 그릴지 정의하는 매서드이다. canvas instance를 매개변수로 제공한다.
- shouldRepaint는 custompainter 인스턴스가 갱신되면 새로운 파라메터로 리페인팅 해야할지 결정하는 매서드이다.

> 위의 내용을 정리해보자. customPaint widget은 그림을 그릴 수 있는 canvas를 제공한다.
> 이 canvas위에 painter이라는 customPainter로 background를 드로잉하고 child widget을 render한 뒤 마지막으로 foregroundPainter를 드로잉한다.
> 실제 그림은 customPainter에 paint매서드에서 정의하는데, 이때 paint매서드의 매개변수인 canvas instance와 canvas api method를 사용한다.

## drawing에 사용되는 common classes

### Paint class

canvas api로 그림을 그릴 때 Paint object를 사용하여 스타일을 정의한다.

```Dart
Paint paint = Paint()
  ..color = Colors.yellow
  ..strokeWidth = 20.0
```

- color: 페인팅 컬러
- strokeWidth: 페인팅 객체의 두께

**_위에서 사용하는 double dot(..)은 계단식 표기법(Cascade notation)이라 하는 신텍스 슈거이다. 동일한 객체에 대해 여러 매소드를 호출할 때 사용한다._**

### Rect

Rect는 width와 height를 입력받아 가상의 사각형을 생성한다.
canvas api중 2D area를 가지는 오브젝트는 이 Rect를 범위로 내접하여 그려진다.

```Dart
Rect.fromCenter(
  center: Offset(100, 100),
  width: 50,
  height: 80,
);
```

**_Offset은 원점을 기준으로 주어진 x, y만큼 떨어진 좌표를 반환한다.(아마도 부모 위젯의 원점일듯)_**

### Path

Path는 Rect로 표현하기 힘든 custom shape를 표현하기 위해 사용된다

```Dart
Path()
  ..moveTo(0, 0)
  ..lineTo(100, 100)
  ..lineTo(0, 100)
  ..lineTo(0, 0);
```

## start drawing

### point

```Dart
void paint(Canvas canvas, Size size) {
  Size center = size/2;
  Paint paint = Paint()..color = Colors.white;

  canvas.drawCircle(Offset(center.width, center.height), 10.0, paint);
}
```

### horizontal line

```Dart
void paint(Canvas canvas, Size size) {
  Size center = size/2;
  Paint paint = Paint()..color = Colors.white;

  canvas.drawCircle(Offset(center.width, center.height), 10.0, paint);
}
```

### coloring the canvas

```Dart
void paint(Canvas canvas, Size size) {
  canvas.drawColor(Colors.black, BlendMode.color);
}
```

**_*BlendMode는 src(그려지거나 이미지)와 dst(배경)의 픽셀을 혼합하는 알고리즘이다. [자세한 내용은 여길 참고하자](https://api.flutter.dev/flutter/dart-ui/BlendMode.html)*_**

### paragraph

canvas에 글자를 그리는 일은 언제나 골치아픈 일이다.
Flutter에선 ParagraphBuilder와 TextPainter 두 방법으로 Text를 그릴 수 있다.
아래선 좀 더 low-level인 ParagraphBuilder로 그리는 방법을 소개하였다.
이 방법은 TextPainter보다 더 복잡하지만 아주 약간(대략 2%) 더 빠르다.

```Dart
void paint(Canvas canvas, Size size) {
  Size center = size / 2;
  TextStyle style = TextStyle(color: Colors.amber);
  final ParagraphBuilder paragraphBuilder = ParagraphBuilder(
    ParagraphStyle(
      fontSize:   style.fontSize,
      fontFamily: style.fontFamily,
      fontStyle:  style.fontStyle,
      fontWeight: style.fontWeight,
      textAlign: TextAlign.justify,
    )
  )
    ..pushStyle(style.getTextStyle())
    ..addText('Demo Text');
  final Paragraph paragraph = paragraphBuilder.build()
    ..layout(ParagraphConstraints(width: size.width));
  canvas.drawParagraph(paragraph, Offset(center.width, center.height));
}
```

### arc

```Dart
void paint(Canvas canvas, Size size) {
  Size center = size / 2;
  Paint paint = Paint()..color = Colors.yellow;
  canvas.drawArc(
    Rect.fromCenter(
      center: Offset(center.width, center.height), width: 50, height: 50),
    0.4,
    2 * pi - 0.8,
    true,
    paint);
}
```

### drawPath

```Dart
Paint paint = Paint()
  ..color = Colors.yellow
  ..strokeWidth = 8.0;
Path path = Path()
  ..moveTo(0, 0)
  ..lineTo(100, 100)
  ..lineTo(0, 100)
  ..lineTo(0, 0);
canvas.drawPath(path, paint);
```

### drawPath line

```Dart
Paint paint = Paint()
  ..color = Colors.yellow
  ..style = PaintingStyle.stroke
  ..strokeWidth = 8.0;

Path path = Path()..lineTo(size.width, size.height);

canvas.drawPath(path, paint);
```

### quadraticBezierTo

```Dart
Paint paint = Paint()
  ..color = Colors.yellow
  ..style = PaintingStyle.stroke
  ..strokeWidth = 8.0;
Path path = Path()
  ..moveTo(0, size.height / 2)
  ..quadraticBezierTo(
    size.width / 2, size.height, size.width, size.height / 2);
canvas.drawPath(path, paint);
canvas.drawPath(path, paint);
```

## ref

- https://medium.com/flutter-community/a-deep-dive-into-custompaint-in-flutter-47ab44e3f216
- https://medium.com/flutter-community/paths-in-flutter-a-visual-guide-6c906464dcd0
