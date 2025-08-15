import 'package:build_html/src/table.dart';
import 'package:build_html/src/table_cell.dart';
import 'package:build_html/src/table_row.dart';
import 'package:test/test.dart';

void tests() {
  group('table tests', () {
    test('test attributes', () {
      var table = Table()
        ..withAttributes([('id', 'my-table')])
        ..toString();
      expect(table.toHtml(), '<table id="my-table"><thead/><tbody/></table>');
    });
    test('test caption', () {
      var table = Table()..withCaption('A demo table');
      expect(
        table.toHtml(),
        '<table><thead/><tbody/><caption>A demo table</caption></table>',
      );
    });
    test('test header row', () {
      var table = Table()..withHeaderRow(['a', 'b']);
      expect(
        table.toHtml(),
        '<table><thead><tr><th>a</th><th>b</th></tr></thead><tbody/></table>',
      );
    });
    test('test data row', () {
      var table = Table()..withBodyRow(['a', 'b']);
      expect(
        table.toHtml(),
        '<table><thead/><tbody><tr><td>a</td><td>b</td></tr></tbody></table>',
      );
    });
    test('test custom data row', () {
      var table = Table();
      table.addCustomBodyRow(
        TableRow()
          ..withCell(TableCell(TableCellType.data)..withRaw('a'))
          ..withCell(TableCell(TableCellType.data)..withRaw('b')),
      );
      expect(
        table.toHtml(),
        '<table><thead/><tbody><tr><td>a</td><td>b</td></tr></tbody></table>',
      );
    });
  });
}

void main() {
  tests();
}
