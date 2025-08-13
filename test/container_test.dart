import 'package:build_html/src/container.dart';
import 'package:test/test.dart';

void tests() {
  group('container tests', () {
    test('with attributes', () {
      var content = Container(containerType: ContainerType.main)
        ..withHeader(1, 'My Container')
        ..withContainer(
          Container(containerType: ContainerType.article)..withContainer(
            Container(containerType: ContainerType.div)
              ..withParagraph('Inner Text'),
          ),
        );
      expect(
        content.toHtml(),
        '<main><h1>My Container</h1><article><div><p>Inner Text</p></div></article></main>',
      );
    });
  });
}

void main() {
  tests();
}
