import 'package:build_html/src/html_child.dart';
import 'package:build_html/src/html_element.dart';
import 'package:build_html/src/html_tag.dart';
import 'package:test/test.dart';

void tests() {
  group('HtmlElement tests', () {
    test('simple element', () {
      var html = HtmlElement(HtmlTag.div)
        ..withParagraph('My p element');
      expect(html.toHtml(), '<div><p>My p element</p></div>');
    });

    test('constructor with nested elements', () {
      var html = HtmlElement(HtmlTag.div)
        ..withChild(
          HtmlElement(HtmlTag.heading1)
            ..withAttribute('class', 'big-text')
            ..withChild(Raw('Header Text')),
        )
        ..withChild(
          HtmlElement(HtmlTag.paragraphText)
            ..withChild(Raw('Paragraph Text'))
            ..withChild(HtmlElement(HtmlTag.lineBreak))
            ..withChild(Raw('Paragraph Text Line 2')),
        );
      expect(
        html.toHtml(),
        '<div><h1 class="big-text">Header Text</h1><p>Paragraph Text<br/>Paragraph Text Line 2</p></div>',
      );
    });
  });
}

void main() {
  tests();
}
