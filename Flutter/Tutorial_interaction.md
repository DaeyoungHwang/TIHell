# interaction

ListTile의 onTap 메서드를 추가하여 상호작용을 구현해본다.

## TileBuilder

```Dart
Widget _buildRow(WordPair pair) {
  final alreadySaved = _saved.contains(pair);
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
    trailing: Icon(
      alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: alreadySaved ? Colors.red : null,
      semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
    ),
    onTap: () {
      setState(() {
        if (alreadySaved) {
          _saved.remove(pair);
        } else {
          _saved.add(pair);
        }
      });
    },
  );
}
```

State Class의 State의 변화를 Flutter 프레임워크가 감지하여 build를 호출하고 ui를 업데이트 하게 된다.
이때 State Class의 State를 단순히 변화 시키는 것이 아니라 setState()를 사용하여 Flutter 프레임워크에 알려주어야 한다.
