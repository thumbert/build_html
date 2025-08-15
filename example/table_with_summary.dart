import 'dart:io';

import 'package:build_html/build_html.dart';

Table makeTable() {
  var table = Table()
    ..withCustomHeaderRow(
      TableRow()
        ..withCell(
          TableCell(TableCellType.header)
            ..withRaw('Hour Beginning')
            ..withAttributes([
              ("style", "border-bottom:1px solid #0d69ae;"),
            ]),
        )
        ..withCell(
          TableCell(TableCellType.header)
            ..withRaw('Price')
            ..withAttributes([
              ("style", "border-bottom:1px solid #0d69ae;"),
            ]),
        ),
    );
  var prices = [
    ('2025-07-03 00:00:00-0400', '55.29'),
    ('2025-07-03 01:00:00-0400', '53.29'),
    ('2025-07-03 02:00:00-0400', '50.87'),
    ('2025-07-03 03:00:00-0400', '51.18'),
    ('2025-07-03 04:00:00-0400', '52.76'),
    ('2025-07-03 05:00:00-0400', '51.80'),
    ('2025-07-03 06:00:00-0400', '54.20'),
  ];
  for (var (time, price) in prices) {
    table = table.withCustomBodyRow(
      TableRow()
        ..withCell(TableCell(TableCellType.data)..withRaw(time))
        ..withCell(TableCell(TableCellType.data)..withRaw(price)),
    );
  }
  table.addCustomBodyRow(
    TableRow()
      ..withCell(
        TableCell(TableCellType.data)
          ..withRaw('Max')
          ..withAttributes([
            ("style", "border-top:1px solid #0d69ae;font-weight:bold;"),
          ]),
      )
      ..withCell(
        TableCell(TableCellType.data)
          ..withRaw('55.29')
          ..withAttributes([("style", "border-top:1px solid #0d69ae;")]),
      ),
  );

  return table;
}

void main(List<String> args) {
  final page = HtmlPage()
    ..withStyle('''
    body {
        font-family: Arial, sans-serif;
        font-size: 12px;
        margin: 12px;
    }
    table {
        border-collapse: collapse;
    }
    thead tr {
        background: #eceff4;       
    }
    th, td {
        padding: 6px;
        text-align: right;
    }
''')
    ..withTable(makeTable());
  File('.tmp/table_with_summary.html').writeAsStringSync(page.toHtml());
}
