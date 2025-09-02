import 'package:build_html/src/html_container.dart';
import 'package:build_html/src/html_element.dart';
import 'package:build_html/src/html_tag.dart';
import 'package:build_html/src/html_child.dart';

enum ContainerType {
  /// Corresponds to `<address>` tags
  address,

  /// Corresponds to `<article>` tags
  article,

  /// Corresponds to `<div>` tags
  ///
  /// This type is also the default for `Container`s
  div,

  /// Corresponds to `<footer>` tags
  footer,

  /// Corresponds to `<header>` tags
  header,

  /// Corresponds to `<main>` tags
  main,

  /// Corresponds to `<ol>` tags
  orderedList,

  /// Corresponds to `<ul>` tags
  unorderedList,

  /// Corresponds to `<nav>` tags
  nav,

  /// Corresponds to `<section>` tags
  section;

  HtmlTag toTag() {
    switch (this) {
      case ContainerType.address:
        return HtmlTag.address;
      case ContainerType.article:
        return HtmlTag.article;
      case ContainerType.div:
        return HtmlTag.div;
      case ContainerType.footer:
        return HtmlTag.footer;
      case ContainerType.header:
        return HtmlTag.header;
      case ContainerType.main:
        return HtmlTag.main;
      case ContainerType.orderedList:
        return HtmlTag.orderedList;
      case ContainerType.unorderedList:
        return HtmlTag.unorderedList;
      case ContainerType.nav:
        return HtmlTag.navigation;
      case ContainerType.section:
        return HtmlTag.section;
    }
  }
}

class Container extends HtmlChild with HtmlContainer, Html {
  Container({ContainerType containerType = ContainerType.div}) {
    tag = containerType.toTag();
    content = HtmlElement(tag);
  }

  late final HtmlTag tag;
  late final HtmlElement content;

  @override
  void addContainer(Container container) {
    addHtml(container);
  }

  @override
  void addHtml<T extends Html>(T html) {
    switch (tag) {
      case HtmlTag.orderedList || HtmlTag.unorderedList:
        content.addChild(HtmlElement(HtmlTag.listElement)..withHtml(html));
      default:
        content.addHtml(html);
    }
  }

  Container withAttributes(List<(String, String)> attributes) {
    for (var (key, value) in attributes) {
      content.addAttribute(key, value);
    }
    return this;
  }

  @override
  Container withContainer(Container container) {
    withHtml(container);
    return this;
  }

  @override
  Container withHtml<T extends Html>(T html) {
    addHtml(html);
    return this;
  }

  @override
  String toHtml() => content.toHtml();
}
