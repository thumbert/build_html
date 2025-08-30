import 'package:build_html/src/table_cell.dart';
import 'package:test/test.dart';

void tests() {
  group('TableCell tests: ', () {
    test('empty cell', () {
      expect(TableCell(TableCellType.data).toHtml(), '<td/>');
      expect(TableCell(TableCellType.header).toHtml(), '<th/>');
    });

    test('with attributes', () {
      var cell = TableCell(TableCellType.data)
        ..withAttributes([('id', 'first-cell')])
        ..withParagraph('Hello, World!');
      expect(cell.toHtml(), '<td id="first-cell"><p>Hello, World!</p></td>');
    });
  });
}

void main() {
  tests();
}
