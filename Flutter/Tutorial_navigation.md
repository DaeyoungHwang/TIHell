# navigation

대부분의 웹앱이나 앱 프레임워크가 그런것 처럼 flutter도 navigation이라는 라우팅 기능을 지원한다.
Flutter에서는 screen이나 page를 route라고 부른다.

## route

route는 android의 activity, ios의 viewController와 동일한 개념이다.
그렇다면 flutter에서 route는 widget이라 할 수 있다.

## navigation

route간의 이동은 Navigation class를 이용하여 구현한다.
이번 챕터에선 route간 화면전환을 아래와 같은 단계로 구현한다.

1. 두개의 route를 생성하고
2. Navigation.push()를 사용하여 두 번째 route로 전환하고
3. Navigation.pop()을 사용하여 첫 번째 route로 돌아온다.

## 1. 두개의 route를 생성하고

```Dart
class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            // 눌렀을 때 두 번째 route로 이동합니다.
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // 눌렀을 때 첫 번째 route로 되돌아 갑니다.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
```

## 2. Navigation.push()를 사용하여 두 번째 route로 전환하고

새로운 route로 전환하기 위해서는 Navigation.push() 매서드를 사용해야한다.
push() 매서드는 매개변수로 주어진 route를 Navigation이 관리하는 스택에 추가한다.
route를 위 처럼 직접 구현하여 push해도 좋지만,
MaterialPageRoute를 사용하여 구현하게 되면 플랫폼 특화 화면 등을 손쉽게 적용 가능하다.

```Dart
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondRoute()),
  );
}
```

## Navigation.pop()을 사용하여 첫 번째 route로 돌아온다.

Navigation은 stack에 route를 저장한다고 했다. 따라서 이전 route로 돌아오기 위해선 pop만 해주면 된다.
이러한 정보는 buildContext에 포함되어 있으므로 매개변수로 context를 넣어주자

```Dart
onPressed: () {
  Navigator.pop(context);
}
```
