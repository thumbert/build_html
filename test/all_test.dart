import 'container_test.dart' as container;
import 'html_container_test.dart' as html_container;
import 'html_element_test.dart' as html_element;
import 'html_page_test.dart' as html_page;
import 'table_cell_test.dart' as table_cell;
import 'table_row_test.dart' as table_row;
import 'table_test.dart' as table;

void main() {
  container.tests();
  html_container.tests();
  html_element.tests();
  html_page.tests();
  table_cell.tests();
  table_row.tests();
  table.tests();
}
