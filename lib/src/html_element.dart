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

  // void addLink(String href, String text) {
  //   addChild(
  //     HtmlElement(HtmlTag.link)
  //       ..withAttribute('href', href)
  //       ..withChild(Raw(text)),
  //   );
  // }

  // /// Adds a link with additional attributes.
  // void addLinkWithAttributes(
  //   String href,
  //   String text,
  //   List<(String, String)> attributes,
  // ) {
  //   var element = HtmlElement(HtmlTag.link)
  //     ..withAttribute('href', href)
  //     ..withChild(Raw(text));
  //   for (var (key, value) in attributes) {
  //     element.addAttribute(key, value);
  //   }
  //   addHtml(element);
  // }

  void addChild(HtmlChild content) {
    children.add(content);
  }

  // void addParagraph(String content) {
  //   addChild(HtmlElement(HtmlTag.paragraphText)..withChild(Raw(content)));
  // }

  // void addParagraphWithAttributes(
  //   String content,
  //   List<(String, String)> attributes,
  // ) {
  //   var element = HtmlElement(HtmlTag.paragraphText)..withChild(Raw(content));
  //   for (var (key, value) in attributes) {
  //     element.addAttribute(key, value);
  //   }
  //   addHtml(element);
  // }

  HtmlElement withChild(HtmlChild content) {
    addChild(content);
    return this;
  }

  HtmlElement withAttribute(String key, String value) {
    attributes.add((key, value));
    return this;
  }

  // HtmlElement withParagraph(String content) {
  //   addParagraph(content);
  //   return this;
  // }

  // HtmlElement withLink(String href, String text) {
  //   addLink(href, text);
  //   return this;
  // }

  // HtmlElement withLinkWithAttributes(
  //   String href,
  //   String text,
  //   List<(String, String)> attributes,
  // ) {
  //   addLinkWithAttributes(href, text, attributes);
  //   return this;
  // }

  // HtmlElement withParagraphWithAttributes(
  //   String content,
  //   List<(String, String)> attributes,
  // ) {
  //   addParagraphWithAttributes(content, attributes);
  //   return this;
  // }

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
