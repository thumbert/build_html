import 'package:build_html/src/html_child.dart';
import 'package:build_html/src/html_element.dart';
import 'package:build_html/src/html_tag.dart';
import 'package:build_html/src/table_cell.dart';
import 'package:build_html/src/table_row.dart';

class Table {
  /// Create an empty table.
  Table() {
    table = HtmlElement(HtmlTag.table);
    thead = HtmlElement(HtmlTag.tableHeader);
    tbody = HtmlElement(HtmlTag.tableBody);
    tfoot = HtmlElement(HtmlTag.tableFooter);
  }

  late final HtmlElement table;
  late final HtmlElement thead;
  late final HtmlElement tbody;
  late final HtmlElement tfoot;
  HtmlElement? caption;

  /// Create a table from a list of lists.
  Table.from(List<List<dynamic>> source);

  Table withAttributes(List<(String, String)> attributes) {
    for (var (key, value) in attributes) {
      table.addAttribute(key, value);
    }
    return this;
  }

  Table withCaption(String caption) {
    this.caption = HtmlElement(HtmlTag.tableCaption).withChild(Raw(caption));
    return this;
  }

  Table withCustomHeaderRow(TableRow row) {
    thead.addChild(row);
    return this;
  }

  Table withHeaderRow(List<String> headerRow) {
    var row = TableRow();
    for (var header in headerRow) {
      row.addCell(
        TableCell(TableCellType.header)..withRaw(header),
      );
    }
    tbody.addChild(row);
    return this;
  }

  String toHtml() {
    var tbl = table
      ..withChild(thead)
      ..withChild(tbody);

    if (tfoot.children.isNotEmpty || tfoot.attributes.isNotEmpty) {
      tbl.addChild(tfoot);
    }

    if (caption != null) {
      tbl.addChild(caption!);
    }
    return tbl.toHtml();
  }
}
