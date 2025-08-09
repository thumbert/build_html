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

  TableCell withParagraph(String content) {
    this.content.addChild(
      HtmlElement(HtmlTag.paragraphText)..withChild(Raw(content)),
    );
    return this;
  }

  TableCell withRaw(String data) {
    content.addChild(Raw(data));
    return this;
  }

  @override
  String toHtml() => content.toHtml();

  @override
  void addHtml<T extends Html>(T html) {
    // TODO: implement addHtml
  }
}
