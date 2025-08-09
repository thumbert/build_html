import 'package:build_html/src/html_container.dart';
import 'package:build_html/src/html_element.dart';
import 'package:build_html/src/html_tag.dart';
import 'package:build_html/src/table_cell.dart';
import 'package:build_html/src/html_child.dart';

// class TableRow extends HtmlChild with HtmlContainer, Html {
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

  TableRow withRaw(String data) {
    content.addChild(Raw(data));
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
  // {
  //   var sb = StringBuffer();
  //   sb.write('<tr');
  //   if (content.attributes.isNotEmpty) {
  //     for (var (key, value) in content.attributes) {
  //       sb.write(' $key="$value"');
  //     }
  //   }
  //   sb.write('>');
  //   for (var cell in content.children) {
  //     sb.write(cell.toHtml());
  //   }
  //   sb.write('</tr>');
  //   return sb.toString();
  // }

  @override
  void addHtml<T extends Html>(T html) {
    // TODO: implement addHtml
  }
}
