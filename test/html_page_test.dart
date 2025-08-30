import 'package:build_html/build_html.dart';
import 'package:test/test.dart';

void tests() {
  group('HtmlPage tests: ', () {
    test('default', () {
      var content = HtmlPage();
      expect(
        content.toHtml(),
        '<!DOCTYPE html><html><head></head><body></body></html>',
      );
    });
    test('add header', () {
      var content = HtmlPage();
      content.addHeader(3, 'Valuation:');
      expect(
        content.toHtml(),
        '<!DOCTYPE html><html><head></head><body><h3>Valuation:</h3></body></html>',
      );
    });
    test('add script link', () {
      var page = HtmlPage();
      page.addScriptLink('myScript.js', ScriptType.plain);
      expect(
        page.toHtml(),
        '<!DOCTYPE html><html><head><script src="myScript.js"></script></head><body></body></html>',
      );
    });
    test('add script literal', () {
      var page = HtmlPage();
      page.addScriptLiteral(
        'window.onload = () => console.log("Hello World");',
      );
      expect(
        page.toHtml(),
        '<!DOCTYPE html><html><head><script>window.onload = () => console.log("Hello World");</script></head><body></body></html>',
      );
    });
    test('add style', () {
      var page = HtmlPage();
      page.addStyle('p{font-family:"Liberation Serif";}');
      expect(
        page.toHtml(),
        '<!DOCTYPE html><html><head><style>p{font-family:"Liberation Serif";}</style></head><body></body></html>',
      );
    });
    test('add stylesheet', () {
      var page = HtmlPage();
      page.addStylesheet('print.css');
      expect(
        page.toHtml(),
        '<!DOCTYPE html><html><head><link href="print.css" rel="stylesheet"></head><body></body></html>',
      );
    });

    test('with head link', () {
      var content = HtmlPage().withHeadLink('favicon.ico', 'icon');
      expect(
        content.toHtml(),
        '<!DOCTYPE html><html><head><link href="favicon.ico" rel="icon"></head><body></body></html>',
      );
    });
    test('with head link with attr', () {
      var content = HtmlPage().withHeadLink(
        'print.css',
        'stylesheet',
        attributes: [('media', 'print')],
      );
      expect(
        content.toHtml(),
        '<!DOCTYPE html><html><head><link href="print.css" rel="stylesheet" media="print"></head><body></body></html>',
      );
    });
    test('with meta', () {
      var content = HtmlPage().withMeta([('charset', 'utf-8')]);
      expect(
        content.toHtml(),
        '<!DOCTYPE html><html><head><meta charset="utf-8"></head><body></body></html>',
      );
    });
    test('with title', () {
      var content = HtmlPage().withTitle('My Page');
      expect(
        content.toHtml(),
        '<!DOCTYPE html><html><head><title>My Page</title></head><body></body></html>',
      );
    });
  });
}

void main() {
  tests();
}
