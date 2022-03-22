# Use external package

flutter에서 pub을 사용하여 외부 패키지를 추가하고, 사용하는 방법을 알아보자

## Add package

- 외부 패키지는 [pub.dev](https://pub.dev/)에서 검색하면 된다
- flutter 에서는 `flutter pub add english_word` 를 사용해서 dependency를 추가 할 수 있다.

```Dart
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  english_words: ^4.0.0
```

## get package

`flutter pub get`을 이용하면 pubspec.yaml의 dependency를 프로젝트로 가져온다.
