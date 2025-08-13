import 'package:build_html/src/html_container.dart';
import 'package:build_html/src/html_element.dart';

class HtmlChild extends Object with Html {
  @override
  String toHtml() {
    switch (this) {
      case Element():
        return (this as Element).element.toHtml();
      case Raw():
        return (this as Raw).content;
      default:
        throw UnimplementedError('toHtml not implemented for $this');
    }
  }
}

class Element extends HtmlChild {
  Element(this.element);
  final HtmlElement element;
}

class Raw extends HtmlChild {
  Raw(this.content);
  final String content;
}
