import 'package:build_html/src/html_container.dart';
import 'package:build_html/src/html_child.dart';
import 'package:build_html/src/html_element.dart';
import 'package:build_html/src/html_tag.dart';

enum TableCellType {
  data,
  header;

  @override
  String toString() {
    switch (this) {
      case TableCellType.data:
        return 'td';
      case TableCellType.header:
        return 'th';
    }
  }
}

class TableCell extends HtmlChild with HtmlContainer, Html {
  TableCell(TableCellType type) {
    switch (type) {
      case TableCellType.data:
        content = HtmlElement(HtmlTag.tableCell);
        break;
      case TableCellType.header:
        content = HtmlElement(HtmlTag.tableHeaderCell);
        break;
    }
  }
  late final HtmlElement content;

  void addAttributes(List<(String, String)> attributes) {
    for (var (key, value) in attributes) {
      content.addAttribute(key, value);
    }
  }

  TableCell withAttributes(List<(String, String)> attributes) {
    addAttributes(attributes);
    return this;
  }

  @override
  TableCell withParagraph(
    String text, {
    List<(String, String)> attributes = const [],
  }) {
    content.addChild(HtmlElement(HtmlTag.paragraphText)..withChild(Raw(text)));
    for (var (key, value) in attributes) {
      content.addAttribute(key, value);
    }
    return this;
  }

  @override
  TableCell withRaw(String text) {
    content.addChild(Raw(text));
    return this;
  }

  @override
  String toHtml() => content.toHtml();

  @override
  void addHtml<T extends Html>(T html) {
    content.addChild(Raw(html.toHtml()));
  }
}
