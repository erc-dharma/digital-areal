# Starting with TEI

## TEI file structure
| Elements name | Attributes | Description|
|:-----:|:-----:|:-----:|
| body || The main body of the text. This element is required in any TEI conformant document.|
| TEI|| The element `<TEI>` must wrap all TEI-compliant content as a root tag. The `<TEI>` element must contain two sub-elements, `<teiHeader>` and `<text>`.|
| teiHeader|| The TEI-based header contains additional descriptive information (metadata) about the digital document and is a mandatory component of every TEI document.|
| text|| Contains a single text of any kind.|

```
<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <teiHeader>
      <fileDesc>
         <titleStmt>
            <title>Title</title>
         </titleStmt>
         <publicationStmt>
            <p>Publication Information</p>
         </publicationStmt>
         <sourceDesc>
            <p>Information about the source</p>
         </sourceDesc>
      </fileDesc>
  </teiHeader>
  <text>
      <body>
         <p>Some text here.</p>
      </body>
  </text>
</TEI>
```
