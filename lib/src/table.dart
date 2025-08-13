import 'package:build_html/src/html_child.dart';
import 'package:build_html/src/html_container.dart';
import 'package:build_html/src/html_element.dart';
import 'package:build_html/src/html_tag.dart';
import 'package:build_html/src/table_cell.dart';
import 'package:build_html/src/table_row.dart';

class Table extends HtmlChild with HtmlContainer, Html {
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

  /// Create a table from a list of lists for the table body only.
  Table.from(List<List<dynamic>> source) {
    table = HtmlElement(HtmlTag.table);
    thead = HtmlElement(HtmlTag.tableHeader);
    tbody = HtmlElement(HtmlTag.tableBody);
    tfoot = HtmlElement(HtmlTag.tableFooter);

    if (source.isEmpty) return;

    for (var row in source) {
      addBodyRow(row.map((e) => e.toString()).toList());
    }
  }

  void addAttributes(List<(String, String)> attributes) {
    for (var (key, value) in attributes) {
      table.addAttribute(key, value);
    }
  }

  void addBodyRow(List<String> bodyRow) {
    var row = TableRow();
    for (var cell in bodyRow) {
      row.addCell(TableCell(TableCellType.data)..withRaw(cell));
    }
    tbody.addChild(row);
  }

  void addCaption(String caption) {
    this.caption = HtmlElement(HtmlTag.tableCaption).withChild(Raw(caption));
  }

  void addCustomBodyRow(TableRow row) {
    tbody.addChild(row);
  }

  void addCustomFooterRow(TableRow row) {
    tfoot.addChild(row);
  }

  void addCustomHeaderRow(TableRow row) {
    thead.addChild(row);
  }

  void addFooterRow(List<String> footerRow) {
    var row = TableRow();
    for (var cell in footerRow) {
      row.addCell(TableCell(TableCellType.data)..withRaw(cell));
    }
    tfoot.addChild(row);
  }

  void addHeaderRow(List<String> headerRow) {
    var row = TableRow();
    for (var header in headerRow) {
      row.addCell(TableCell(TableCellType.header)..withRaw(header));
    }
    thead.addChild(row);
  }

  void addTbodyAttributes(List<(String, String)> attributes) {
    for (var (key, value) in attributes) {
      tbody.addAttribute(key, value);
    }
  }

  void addTfootAttributes(List<(String, String)> attributes) {
    for (var (key, value) in attributes) {
      tfoot.addAttribute(key, value);
    }
  }

  void addTheadAttributes(List<(String, String)> attributes) {
    for (var (key, value) in attributes) {
      thead.addAttribute(key, value);
    }
  }

  Table withAttributes(List<(String, String)> attributes) {
    addAttributes(attributes);
    return this;
  }

  Table withBodyRow(List<String> bodyRow) {
    addBodyRow(bodyRow);
    return this;
  }

  Table withCaption(String caption) {
    addCaption(caption);
    return this;
  }

  Table withCustomBodyRow(TableRow row) {
    addCustomBodyRow(row);
    return this;
  }

  Table withCustomFooterRow(TableRow row) {
    addCustomFooterRow(row);
    return this;
  }

  Table withCustomHeaderRow(TableRow row) {
    thead.addChild(row);
    return this;
  }

  Table withFooterRow(List<String> footerRow) {
    addFooterRow(footerRow);
    return this;
  }

  Table withHeaderRow(List<String> headerRow) {
    addHeaderRow(headerRow);
    return this;
  }

  Table withTbodyAttributes(List<(String, String)> attributes) {
    addTbodyAttributes(attributes);
    return this;
  }

  Table withTfootAttributes(List<(String, String)> attributes) {
    addTfootAttributes(attributes);
    return this;
  }

  Table withTheadAttributes(List<(String, String)> attributes) {
    addTheadAttributes(attributes);
    return this;
  }

  @override
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
  
  @override
  void addHtml<T extends Html>(T html) {
    // TODO: implement addHtml
  }
}
