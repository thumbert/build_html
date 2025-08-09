This package is a port of the Rust crate [build_html](https://docs.rs/build_html/latest/build_html/index.html). 

## Example

See the `/test` folder for a complete list of the functionality implemented. 

Here is how to generate an HTML table:
```dart
var table = Table()
    ..withAttributes([('id', 'my-table')])
    ..withCaption('A demo table')
    ..withHeaderRow(['date', 'location', 'tMax', 'tMin'])
    ..withBodyRow(['2025-01-01', 'BWI', 41, 22])
    ..withBodyRow(['2025-01-02', 'BWI', 40, 25]);
print(table.toHtml());    
``` 



