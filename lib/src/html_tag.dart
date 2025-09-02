enum HtmlTag {
  address,
  article,
  aside,
  bold,
  blockquote,
  canvas,
  cite,
  codeText,
  descriptionList,
  descriptionListDescription,
  descriptionListTerm,
  div,
  figCaption,
  figure,
  footer,
  header,
  heading1,
  heading2,
  heading3,
  heading4,
  heading5,
  heading6,
  headingGroup,
  horizontalRule,
  iframe,
  image,
  inlineQuote,
  italic,
  lineBreak,
  link,
  listElement,
  main,
  navigation,
  orderedList,
  paragraphText,
  preformattedText,
  section,
  span,
  table,
  tableBody,
  tableCaption,
  tableCell,
  tableColumn,
  tableColumnGroup,
  tableFooter,
  tableHeader,
  tableHeaderCell,
  tableRow,
  unorderedList,
  video;

  @override
  String toString() {
    switch (this) {
      case HtmlTag.address:
        return 'address';
      case HtmlTag.article:
        return 'article';
      case HtmlTag.aside:
        return 'aside';
      case HtmlTag.blockquote:
        return 'blockquote';
      case HtmlTag.bold:
        return 'b';
      case HtmlTag.canvas:
        return 'canvas';
      case HtmlTag.cite:
        return 'cite';
      case HtmlTag.codeText:
        return 'code';
      case HtmlTag.descriptionList:
        return 'dl';
      case HtmlTag.descriptionListDescription:
        return 'dd';
      case HtmlTag.descriptionListTerm:
        return 'dt';
      case HtmlTag.div:
        return 'div';
      case HtmlTag.figCaption:
        return 'figcaption';
      case HtmlTag.figure:
        return 'figure';
      case HtmlTag.footer:
        return 'footer';
      case HtmlTag.header:
        return 'header';
      case HtmlTag.heading1:
        return 'h1';
      case HtmlTag.heading2:
        return 'h2';
      case HtmlTag.heading3:
        return 'h3';
      case HtmlTag.heading4:
        return 'h4';
      case HtmlTag.heading5:
        return 'h5';
      case HtmlTag.heading6:
        return 'h6';
      case HtmlTag.headingGroup:
        return 'hgroup';
      case HtmlTag.horizontalRule:
        return 'hr';
      case HtmlTag.iframe:
        return 'iframe';
      case HtmlTag.image:
        return 'img';
      case HtmlTag.italic:
        return 'i';
      case HtmlTag.inlineQuote:
        return 'q';
      case HtmlTag.lineBreak:
        return 'br';
      case HtmlTag.link:
        return 'a';
      case HtmlTag.listElement:
        return 'li';
      case HtmlTag.main:
        return 'main';
      case HtmlTag.navigation:
        return 'nav';
      case HtmlTag.orderedList:
        return 'ol';
      case HtmlTag.paragraphText:
        return 'p';
      case HtmlTag.preformattedText:
        return 'pre';
      case HtmlTag.section:
        return 'section';
      case HtmlTag.span:
        return 'span';
      case HtmlTag.table:
        return 'table';
      case HtmlTag.tableBody:
        return 'tbody';
      case HtmlTag.tableCaption:
        return 'caption';
      case HtmlTag.tableCell:
        return 'td'; // or th for header cells
      case HtmlTag.tableColumn:
        return 'col';
      case HtmlTag.tableColumnGroup:
        return 'colgroup';
      case HtmlTag.tableFooter:
        return 'tfoot';
      case HtmlTag.tableHeader:
        return 'thead';
      case HtmlTag.tableHeaderCell:
        return 'th';
      case HtmlTag.tableRow:
        return 'tr';
      case HtmlTag.unorderedList:
        return 'ul';
      case HtmlTag.video:
        return 'video';
    }
  }
}
