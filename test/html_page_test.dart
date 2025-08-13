import 'package:build_html/src/html_page.dart';
import 'package:test/test.dart';

void tests() {
  group('html page tests', () {
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
    test('with head link', () {
      var content = HtmlPage().withHeadLink('favicon.ico', 'icon');
      expect(
        content.toHtml(),
        '<!DOCTYPE html><html><head><link href="favicon.ico" rel="icon"/></head><body></body></html>',
      );
    });
    test('with head link with attr', () {
      var content = HtmlPage().withHeadLinkWithAttributes(
        'print.css',
        'stylesheet',
        [('media', 'print')],
      );
      expect(
        content.toHtml(),
        '<!DOCTYPE html><html><head><link href="print.css" rel="stylesheet" media="print"/></head><body></body></html>',
      );
    });
    test('with meta', () {
      var content = HtmlPage().withMeta([('charset', 'utf-8')]);
      expect(
        content.toHtml(),
        '<!DOCTYPE html><html><head><meta charset="utf-8"/></head><body></body></html>',
      );
    });
    test('with script', () {
      var content = HtmlPage().withMeta([('charset', 'utf-8')]);
      expect(
        content.toHtml(),
        '<!DOCTYPE html><html><head><meta charset="utf-8"/></head><body></body></html>',
      );
    });
  });
}

void main() {
  tests();
}
