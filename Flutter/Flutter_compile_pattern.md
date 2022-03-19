# Flutter의 컴파일 패턴

## 컴파일 패턴의 분류

일반적으로 컴파일 패턴은 JIT와 AOT 두 가지 범주로 나눌 수 있다.

### JIT

Just In Time의 줄임말이다. 대표적으로 V8엔진에서 자바스크립트 코드를 in time에서 컴파일하고 실행하는 것을 예로 들 수 있다.
일반적으로 JIT을 지우너하는 프로그래밍 언어는 평가 기능을 지원하며, 이는 소스코드를 동적으로 실행하는데 기여하는 요소이다.
JIT 패턴에는 몇 가지 장점이 있는데, 사용자의 시스템 아키텍처를 고려하지 않고 동적으로 사용자에게 전달 할 수 있어 풍부하고 다이나믹한 콘텐츠를 제공할 수 있다는 점이 대표적이다.
반면에 in time에 컴파일을 실행하고 실행하기에 많은 시간과 메모리를 소모하게 된다. 이렇게 되면 사용자가 앱을 시작할 때 시작 속도가 떨어진다 느낄 수 있다.

### AOT

Ahead Of Time을 나타낸다. 호스트 프로세스에 의해 로드되거나 실행되기 위해 바이너리 라는 형식으로 컴파일 되어야 하는데 이 패턴을 AOT 라고 한다.
AOT는 속도에서 명확한 이점을 가지고 있는데, 미리 컴파일된 바이너리 형식으로 코드를 직접 실행할 수 있기 때문에 고사양이 요구되는 그래픽 렌더링 등의 작업을 수행하는데 있어 사용자에게 높은 사용성을 제공해 줄 수 있다.
하지만 코드를 바이너리 형식으로 컴파일 해야하기 때문에 타겟 디바이스마다 알맞는 바이너리 코드를 생성, 관리 해줘야 하는 단점이 있고, 또 os에 따라 권한의 문제가 생길 수 있다.

## Dart의 컴파일 패턴

Flutter는 Dart를 개발언어로서 사용하므로 Dart의 컴파일 패턴을 살펴볼 필요가 있다.

- Script: 가장 일반적인 Jit모드이다. Dart VM cli 툴에서 직접 dart 소스코드를 실행할 수 있다.
- Script Snapshot: Script 모드와는 달리 Snapshot모드는 소스를 토큰화된 코드로 압축한다. 이렇게 되면 Lexer가 컴파일 하는 동안 시간을 절약할 수 있다. 하지만 소스만이 토큰화 되어 있어 실행 때 마다 구문분석과 컴파일을 해줘야 한다.
- Application Snapshot: 이 역시 JIT 모드이다. Dart의 App Snapshot은 일종의 런타임 덤프와 같이 동작한다. 이미 구문분석 된 클래스와 함수가 런타임에 로드 및 실행하여 일반적인 JIT모드보다 더 빨리 실행 가능한 장점이 있다. 하지만 이러한 종류의 Snapshot은 아키텍처 마다 다르다는 단점이 있다.
- AOT: 이 모드에서는 Dart 소스코드가 어셈블리 파일로 번역되고, 어셈블리 파일은 어셈블러에 의해 각 아키텍처에 대한 바이너리 코드로 컴파일된다.

| Pattern / Term       | Compilation Pattern | Architecture Specific | Package Size | Dispatch Dynamically |
| -------------------- | ------------------- | --------------------- | ------------ | -------------------- |
| Script               | JIT                 | False                 | Small        | True                 |
| Script Snapshot      | JIT                 | False                 | Smallest     | True                 |
| Application Snapshot | JIT                 | True                  | Lager        | True                 |
| AOT                  | AOT                 | True                  | Lagest       | False                |

## Flutter의 컴파일 패턴

Flutter는 Dart로 구현되기에 얼핏 보기엔 두 컴파일 패턴은 일치할 것 같다. 하지만 Android와 iOS 개발 간 차이로 인해 Flutter만의 패턴이 존재한다.

- Script: Script 모드가 있긴 하지만 잘 사용되진 않는다.
- Script Snapshot: Dart의 Snapshot 모드와 동일하나 역시 사용하진 않는다.
- Kernel Snapshot: Dart의 Byte Code 모드이다. Flutter Project의 Core Snapshot이라고도 불리는데, 마치 JVM의 JIT과 비슷하게 동작한다. DartVM에서 사용하는 중간언어인 Dart Kernel로 변환하고, 저장한다. 때문에 Application Snapshot보다 아키텍쳐간 이식성에서 보다 유리하다. 하지만 실행마다 구문분석 및 컴파일을 해줘야 하는 단점이 있다.

## Flutter 개발 단계의 컴파일 모드

앱 개발을 가속화 하려면 Hot Reload 기능이 거의 필수로 필요하다. Flutter에서는 Hot Reload의 성능 향상을 위해 Kernel Snapshot 모드를 사용한다. 디버그 모드에서 압축된 어플리케이션의 번들에서는 아래와 같은 파일들을 찾아 볼 수있다.

- isolate_snapshot_data: Dart Isolate의 시작속도를 높이기 위한 Snapshot
- platform.dill: Flutter 엔진에 관련된 Dart Kernel이다.
- vm_snapshot_data: DartVM 시작속도를 높이는 Snapshot
- kernel_blob.bin: 어플리케이션의 비지니스 코드

| Term/Platform       | Android              | iOS                 |
| ------------------- | -------------------- | ------------------- |
| Stage               | debug                | debug               |
| Compilation Pattern | Kernel Snapshot      | Kernel Snapshot     |
| Packaging Tool      | dart vm              | dart vm             |
| Command             | flutter build bundle | fluter build bundle |
| Packed Product      | flutter_assets/      | flutter_assets/     |

## 릴리즈 단계의 컴파일 모드

Flutter의 릴리즈 컴파일은 AOT 모드를 선택했다. 때문에 플랫폼 마다 컴파일 모드도 매우 다르다.

| Term/Platform       | Android           | iOS                    | Android(-build-shared-library)          |
| ------------------- | ----------------- | ---------------------- | --------------------------------------- |
| Stage               | release           | release                | release                                 |
| Compilation Pattern | Core JIT          | AOT Assembly           | AOT Assemlby                            |
| Package Tool        | gen_snapshot      | gen_snapshot           | gen_snapshot                            |
| Flutter Command     | flutter build aot | flutter built aot -ios | flutter build aot -build-shared-library |
| Packed Product      | flutter_assets/   | App.framewort          | app.so                                  |

## Ref

(가장 많이 참고한 자료)[https://proandroiddev.com/flutters-compilation-patterns-24e139d14177]
(디테일 확인)[https://doc.xuwenliang.com/docs/dart-flutter/4838]
(디테일 확인)[https://api.dart.dev/stable/2.1.0/dart-isolate/Isolate-class.html]
