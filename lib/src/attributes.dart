class Attributes {
  Attributes(Iterable<(String, String)> attrs) {
    content = attrs.toList();
  }

  late final List<(String, String)> content;

  @override
  String toString() {
    return content.map((e) => ' ${e.$1}="${e.$2}"').join('');
  }
}
