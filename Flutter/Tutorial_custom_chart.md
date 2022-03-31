# custom chart

아래의 차트를 CustomPaint widget을 사용하여 구현하려고 한다.

![result](./images/tutorial_custom_chart.JPG)

## text util

Text의 경우 ParagraphBuilder를 사용하지 않고 TextWidget을 이용해 그리는 TextPainter를 활용하였다.

```Dart
TextSpan sp = TextSpan(
    style: TextStyle(fontsize, fontweight, color),
    text: text
);

TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.tlr);

tp.layout(); //text 를 그리기 위해 glyphs의 시각적 위치를 계산

tp.paint(canvas, offset);
```

## pie chart

Pie 차트는 입력받은 percentage의 비중을 시각화 한다.

chart는 drawCircle 원을 그리고 그 위에 drawArt로 호를 그려 구현하였다.

### 입력값

```Dart
percentage: 50,
textScaleFactor: 1.0,
textColor: Colors.blueGrey
```

### 배경 원 그리기

```Dart
Paint paint = Paint()
  ..color = Colors.orangeAccent
  ..strokeWidth = 10.0
  ..style = PaintingStyle.stroke
  ..strokeCap = StrokeCap.round;

double radius = min(size.width / 2 - paint.strokeWidth / 2,
        size.height / 2 - paint.strokeWidth / 2);
Offset center = Offset(size.width / 2, size.height / 2);

canvas.drawCircle(center, radius, paint);
```

### 호 그리기

```Dart
double arcAngle = 2 * pi * (percentage / 100);
paint.color = Colors.deepPurpleAccent;

canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, arcAngle, false, paint);
```

## bar chart

bar chart는 데이터로 value와 label을 입력받아 데이터를 히스토그램 형태로 시각화한다.

먼저 부모 widget의 크기를 기준으로 레이아웃을 계산하고, 데이터들의 좌표를 계산한다. 이후 좌표를 기준으로 drawRect, drawLine, textPainter로 차트의 요소를 그려 구현하였다.

### 입력값

```Dart
data: points,
labels: labels,
color: Colors.pinkAccent,
```

### 레이아웃 계산

```Dart
void setTextPadding(Size size) {
  bottomPadding = size.height / 10;
  leftPadding = size.width / 10;
}
```

### 좌표계산

각 데이터를 표현할 bar의 left top 좌표를 구하는 것을 볼 수 있다.

```Dart
List<Offset> getCoordinates(Size size) {

  List<Offset> coordinates = [];

  double maxData = data.reduce(max);
  double width = size.width - leftPadding;
  double minBarWidth = width / data.length;

  for (var index = 0; index < data.length; index++) {

    double left = minBarWidth * index + leftPadding;
    double normalized = data[index] / maxData;
    double height = size.height - bottomPadding;
    double top = height - normalized * height;
    Offset offset = Offset(left, top);

    coordinates.add(offset);
  }

  return coordinates;
}
```

### x axis label

```Dart
void drawXLabels(Canvas canvas, Size size, List<Offset> coordinates) {

  double fontSize = calculateFontSize(labels[0], size, xAxis: true);

  for (int index = 0; index < labels.length; index++) {

    TextSpan span = TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400),
      text: labels[index],
    );
    TextPainter tp = TextPainter(text: span, textDirection: TextDirection.ltr,);

    tp.layout();

    Offset offset = coordinates[index];
    double dx = offset.dx;
    double dy = size.height - tp.height;

    tp.paint(canvas, Offset(dx, dy));
  }
}
```

### y axis label

```Dart
void drawYLabels(Canvas canvas, Size size, List<Offset>coordinates) {

  double bottomY = coordinates[0].dy;
  double topY = coordinates[0].dy;

  for (int index = 0; index < coordinates.length; index++) {
    double dy = coordinates[index].dy;
    if (bottomY < dy) {
      bottomY = dy;
    }
    if (topY > dy) {
      topY = dy;
    }
  }

  String maxValue = "${data.reduce(max).toInt()}";
  String minValue = "${data.reduce(min).toInt()}";
  double fontSize = calculateFontSize(maxValue, size, xAxis: false);

  drawYText(canvas, maxValue, fontSize, topY);
  drawYText(canvas, minValue, fontSize, bottomY);
}
```

여기서는 최대, 최소값위치에 label을 그려주었다. 지금은 data가 이쁘게 들어가 있어서 이상하지 않지만 데이터를 기준으로 label을 그리는게 아니라 척도를 기준으로 그리는게 좀 더 알맞다.

### chart axis line

```Dart
void drawLines(Canvas canvas, Size size, List<Offset> coordinates) {

  Paint paint = Paint()
    ..color = Colors.blueGrey[100]!
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.8;

  double bottom = size.height - bottomPadding;
  double left = coordinates[0].dx;

  Path path = Path();
  path.moveTo(left, 0);
  path.lineTo(left, bottom);
  path.lineTo(size.width, bottom);

  canvas.drawPath(path, paint);
}
```

### bar

```Dart
void drawBar(Canvas canvas, Size size, List<Offset> coordinates) {

  Paint paint = Paint()
    ..color = color
    ..style = PaintingStyle.fill
    ..strokeCap = StrokeCap.round;

  double barWidthMargin = (size.width * 0.09);

  for (var index = 0; index < coordinates.length; index++) {
    Offset offset = coordinates[index];
    double left = offset.dx;
    double right = offset.dx + barWidthMargin;
    double top = offset.dy;
    double bottom = size.height - bottomPadding;
    Rect rect = Rect.fromLTRB(right, top, left, bottom);

    canvas.drawRect(rect, paint);
  }
}
```

## ref

- https://software-creator.tistory.com/23
