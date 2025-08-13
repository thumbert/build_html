import 'package:build_html/src/html_container.dart';
import 'package:build_html/src/html_element.dart';
import 'package:build_html/src/html_tag.dart';
import 'package:build_html/src/table_cell.dart';
import 'package:build_html/src/html_child.dart';

class TableRow extends HtmlChild with HtmlContainer, Html {
  TableRow() {
    content = HtmlElement(HtmlTag.tableRow);
  }

  late final HtmlElement content;

  void addAttributes(List<(String, String)> attributes) {
    for (var (key, value) in attributes) {
      content.addAttribute(key, value);
    }
  }

  TableRow withAttributes(List<(String, String)> attributes) {
    addAttributes(attributes);
    return this;
  }

  @override
  TableRow withRaw(String text) {
    content.addChild(Raw(text));
    return this;
  }

  void addCell(TableCell cell) {
    content.addChild(cell);
  }

  TableRow withCell(TableCell cell) {
    addCell(cell);
    return this;
  }

  @override
  String toHtml() => content.toHtml();  

  @override
  void addHtml<T extends Html>(T html) {
    // TODO: implement addHtml
  }
}
