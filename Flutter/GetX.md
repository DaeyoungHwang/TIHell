# GetX

flutter의 상태관리 툴이다. 매우 가볍고 강력한 솔루션이며, 고성능 상태관리, 지능형 종속성주입, 라우트 관리 기능을 제공한다.

## 기본원칙

- 성능

  - 성능과 리소스 소비의 최소화에 집중한다
  - Streams, ChangeNotifier를 사용하지 않는다.

- 생산성

  - 쉽고 간결한 구문을 사용한다.
  - 사용하지 않는 리소스는 메모리에서 자동으로 제거해준다. 따라서 개발자가 메모리에서 컨트롤러를 제거하는 것을 신경쓰지 않아도 된다.

- 조직화
  - 화면, 프레젠테이션 로직, 비지니스 로직, 종속성 주입, 네비게이션을 완전히 분리할 수 있다.

## 설치

```yaml
#pubspec.yaml
dependencies:
  get: ^4.6.1
```

```bash
flutter pub get
```

```Dart
import 'package:get/get.dart'
```

## 라우트관리

flutter에서는 네비게이션 기능을 이용하고자 할 때 context를 필요로 한다.
그런데 GetX를 사용하면 context 없이 라우트를 관리할 수 있다.

라우트 관리를 위해선 우선 MaterialApp을 GetMaterialApp 으로 변경해야 한다.

```Dart
GetMaterialApp(
  title: 'Getx example',
  home: HomePage(),
)
```

## Navigation

- Get.to() : 새로운 화면으로 이동한다.
- Get.toNamed() : 미리 설정해준 이름을 사용하여 새로운 화면으로 이동한다. GetMaterialApp의 getPage 파라메터를 추가하고 이름과 페이지 위젯을 연결해줘야 한다.
- Get.back() : 이전 화면으로 돌아간다.
- Get.off() : 다음화면으로 이동하면서 이전화면을 스택에서 제거한다.
- Get.offAll() : 다음화면으로 이동하면 스택의 모든 화면을 제거한다.

# ref

https://terry1213.github.io/flutter/flutter-getx/
