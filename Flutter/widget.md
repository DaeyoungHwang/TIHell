# widget

- Flutter widget은 react에서 영감을 받은 모던 프레임워크를 사용하여 구축되었다.
- 핵심 아이디어는 위젯으로 UI를 구축하는 것인데, 위젯은 현재 configuration과 state에 따라 어떤 모양이어야 하는지를 정의하여 구현한다.
- 위젯의 상태가 변경되면 상태에 따라 위젯의 모양을 재 작성하고, 프레임워크는 이전 상태의 모양에서 변경된 상태의 모양을 비교하여 최소한의 변경을 계산하고 보여준다.
- 전체적으로 React가 가상돔을 이용하여 최소한의 비용으로 화면을 리랜더링 하는 과정과 유사함을 알 수 있다.

## runApp()

runApp은 주어진 값을 Widget 트리의 루트로 만든다.

## 기본 위젯

### Text

App 내에 styled text를 빌드한다.

### Row, Column

web의 flexbox 모델을 기반으로 한 레이아웃 위젯

### Stack

위젯들을 z방향으로 stack 할 수 있는 레이아웃 위젯

### Container

시각적인 직사각형 요소를 만들 수 있다.
BoxDecoration으로 배경, 테두리 등 style을 적용 가능하다.
matrix를 이용하여 3차원 transforme이 가능하다

```Dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Tutorial',
      home: TutorialHome(),
    ),
  );
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Example title'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body is the majority of the screen.
      body: const Center(
        child: Text('Hello, world!'),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
```
