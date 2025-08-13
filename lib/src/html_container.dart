import 'package:build_html/src/container.dart';
import 'package:build_html/src/html_child.dart';
import 'package:build_html/src/html_element.dart';
import 'package:build_html/src/html_tag.dart';
import 'package:build_html/src/table.dart';

mixin Html {
  /// Returns the HTML representation of the object.
  String toHtml();

  // /// Returns the HTML representation of the object with a specified indentation.
  // String toHtmlWithIndent(String indent);

  // /// Returns the HTML representation of the object with a specified indentation and line breaks.
  // String toHtmlWithIndentAndLineBreaks(String indent, bool lineBreaks);
}

/// An HTML element that can contain other HTML elements.
mixin HtmlContainer {
  void addContainer(Container container) {
    addHtml(container);
  }

  void addHeader(int level, String text) {
    _addHeaderAttr(level, text, []); 
  }

  void addHtml<T extends Html>(T html);

  void addImage(String src, String alt, {List<(String, String)> attributes = const []}) {
    var element = HtmlElement(HtmlTag.image)
      ..withAttribute('src', src)
      ..withAttribute('alt', alt);
    for (var (key, value) in attributes) {
      element.addAttribute(key, value);
    }
    addHtml(element);
  }

  void addLink(
    String href,
    String text, {
    List<(String, String)> attributes = const [],
  }) {
    var element = HtmlElement(HtmlTag.link)
      ..withAttribute('href', href)
      ..withChild(Raw(text));
    for (var (key, value) in attributes) {
      element.addAttribute(key, value);
    }
    addHtml(element);
  }

  void addParagraph(String text, {List<(String, String)> attributes = const []}) {
    var element = HtmlElement(HtmlTag.paragraphText)
      ..withChild(Raw(text));
    for (var (key, value) in attributes) {
      element.addAttribute(key, value);
    }
    addHtml(element);
  }

  void addRaw(String text) {
    addHtml(Raw(text));
  }

  void addTable(Table table) {
    addHtml(table);
  }

  HtmlContainer withContainer(Container container) {
    addContainer(container);
    return this;
  }

  HtmlContainer withHeader(int level, String text) {
    addHeader(level, text);
    return this;
  }

  HtmlContainer withHtml<T extends Html>(T html) {
    addHtml(html);
    return this;
  }

  HtmlContainer withImage(
    String src,
    String alt, {
    List<(String, String)> attributes = const [],
  }) {
    addImage(src, alt, attributes: attributes);
    return this;
  }

  HtmlContainer withLink(
    String href,
    String text, {
    List<(String, String)> attributes = const [],
  }) {
    addLink(href, text, attributes: attributes);
    return this;
  }

  HtmlContainer withParagraph(
    String text, {
    List<(String, String)> attributes = const [],
  }) {
    addParagraph(text, attributes: attributes);
    return this;
  }

  HtmlContainer withRaw(String text) {
    addRaw(text);
    return this;
  }

  HtmlContainer withTable(Table table) {
    addTable(table);
    return this;
  }

  void _addHeaderAttr(int level, String text, List<(String, String)> attributes) {
    final tag = switch (level) {
      1 => HtmlTag.heading1,
      2 => HtmlTag.heading2,
      3 => HtmlTag.heading3,
      4 => HtmlTag.heading4,
      5 => HtmlTag.heading5,
      6 => HtmlTag.heading6,
      _ => throw ArgumentError('Header level must be between 1 and 6'),
    };
    var element = HtmlElement(tag)
      ..withChild(Raw(text));
    for (var (key, value) in attributes) {
      element.addAttribute(key, value);
    }
    addHtml(element);
  }

  // void addParagraph(String text) {
  //   addHtml(Paragraph(text));
  // }
}
