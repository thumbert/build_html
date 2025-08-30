import 'package:build_html/src/table_cell.dart';
import 'package:build_html/src/table_row.dart';
import 'package:test/test.dart';

void tests() {
  group('TableRow tests: ', () {
    test('empty row', () {
      expect(TableRow().toHtml(), '<tr/>');
    });

    test('with attributes, empty cell', () {
      var row = TableRow()
        ..withAttributes([('id', 'first-row'), ('class', 'table-rows')])
        ..withCell(TableCell(TableCellType.data));
      expect(row.toHtml(), '<tr id="first-row" class="table-rows"><td/></tr>');
    });

    test('with attributes, cell', () {
      var row = TableRow()
        ..withAttributes([('id', 'first-row'), ('class', 'table-rows')])
        ..withCell(
          TableCell(TableCellType.data)..withParagraph('Hello, World!'),
        );
      expect(
        row.toHtml(),
        '<tr id="first-row" class="table-rows"><td><p>Hello, World!</p></td></tr>',
      );
    });
  });
}

void main() {
  tests();
}
