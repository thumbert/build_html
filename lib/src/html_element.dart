import 'package:build_html/src/html_child.dart';
import 'package:build_html/src/html_container.dart';
import 'package:build_html/src/html_tag.dart';

class HtmlElement extends HtmlChild with HtmlContainer, Html {
  HtmlElement(this.tag);

  final HtmlTag tag;
  final List<(String, String)> attributes = [];
  final List<HtmlChild> children = [];

  void addAttribute(String key, String value) {
    attributes.add((key, value));
  }

  void addChild(HtmlChild content) {
    children.add(content);
  }

  HtmlElement withChild(HtmlChild content) {
    addChild(content);
    return this;
  }

  HtmlElement withAttribute(String key, String value) {
    attributes.add((key, value));
    return this;
  }

  @override
  void addHtml<T extends Html>(T html) {
    children.add(Raw(html.toHtml()));
  }

  @override
  String toHtml() {
    if (attributes.isEmpty && children.isEmpty) {
      return '<${tag.toString()}/>';
    }
    var sb = StringBuffer();
    sb.write('<${tag.toString()}');
    if (attributes.isNotEmpty) {
      for (var (key, value) in attributes) {
        sb.write(' $key="$value"');
      }
    }
    sb.write('>');
    for (var child in children) {
      sb.write(child.toHtml());
    }
    sb.write('</${tag.toString()}>');
    return sb.toString();
  }
}
