import 'package:build_html/src/html_element.dart';
import 'package:build_html/src/html_tag.dart';
import 'package:test/test.dart';

void tests() {
  group('HtmlElement tests: ', () {
    test('add a link', () {
      var content = HtmlElement(HtmlTag.div)
        ..withLink('https://dart.dev/', 'Dart Homepage');
      expect(
        content.toHtml(),
        '<div><a href="https://dart.dev/">Dart Homepage</a></div>',
      );
    });
    test('add an italic paragraph', () {
      var content = HtmlElement(HtmlTag.italic)..withRaw('Dart Homepage');
      expect(content.toHtml(), '<i>Dart Homepage</i>');
    });
  });
}

void main() {
  tests();
}
