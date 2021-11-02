# Commencer avec la TEI: créer un premier fichier.

## Ajouter un prologue: la déclaration XML et les instructions de traitements
```
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
```

## Ajouter unestructure de départ pour un fichier TEI
Exemple de la structure minimal obligatoire d'un fichier TEI
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
La racine du fichier est toujours `TEI`, avec la déclaration de son namespace (nom de domaine). Il y a ensuite deux éléments enfants:
- le `teiHeader` pour déclarer les métadonnées
- la partie `text` pour contenir l'edition.

La division du `teiHeader` ne requiert qu'un `fileDesc` dans leqeul vous pouvez déclarer le nom du fichier, les informations de publication, une information de la source publiée et ainsi de suite.  
La division du `text` se fait en trois éléments:
- `front`
- `body`
- `back`  

Le body est la seule partie obligatoire. C'est celle qui contient votre édition. Le front est disponible dans les cas où vous souhaitez faire une édition "facsimilé" d'un imprimé avec des pièces prélimianires. A l'inverse, le back va permettre de stocker des pages comme les index, si vous souhaitez les conserver.

## Exception à la structure du fichier TEI
Il existe une exception à la structure basique d'un fichier tei: le `teiCorpus` dans lequel vous pouvez agreger plusieurs structures TEI.  
Dans ces circonstances, il faut noter que le `teiCorpus` a besoin de son propre `teiHeader` et que chacun des éléments d'édition se compose d'une balise `TEI` avec pour enfant la structure vue si dessus avec `teiHeader`, `text`.

```
<teiCorpus xmlns="http://www.tei-c.org/ns/1.0">
<teiHeader>
<!-- header du corpus complet -->
</teiHeader>
  <TEI>
    <teiHeader>
<!-- header du premier texte -->
    </teiHeader>      
    <text>
<!-- contenu du premier texte -->
    </text>
</TEI>
<TEI>
    <teiHeader>
    <!-- header du second texte  -->
    </teiHeader>
    <text>
    <!-- contenu du second texte -->
    </text>
</TEI>
<!-- Plus d'éléments TEI  -->
</teiCorpus>
```

## Memo  
|Elements name|Attributes|Description|
|:-----:|:-----:|:-----:|
|body|att.global (@xml:id, @n, @xml:lang, @xml:base, @xml:space) (att.global.rendition (@rend, @style, @rendition)) (att.global.linking (@corresp, @synch, @sameAs, @copyOf, @next, @prev, @exclude, @select)) (att.global.analytic (@ana)) (att.global.facs (@facs)) (att.global.change (@change)) (att.global.responsibility (@cert, @resp)) (att.global.source (@source)) att.declaring (@decls)|The main body of the text. This element is required in any TEI conformant document.|
|TEI|att.global (@xml:id, @n, @xml:lang, @xml:base, @xml:space) (att.global.rendition (@rend, @style, @rendition)) (att.global.linking (@corresp, @synch, @sameAs, @copyOf, @next, @prev, @exclude, @select)) (att.global.analytic (@ana)) (att.global.facs (@facs)) (att.global.change (@change)) (att.global.responsibility (@cert, @resp)) (att.global.source (@source)) att.typed (@type, @subtype)|The element `<TEI>` must wrap all TEI-compliant content as a root tag. The `<TEI>` element must contain two sub-elements, `<teiHeader>` and `<text>`.|
|teiCorpus|	att.global (@xml:id, @n, @xml:lang, @xml:base, @xml:space) (att.global.rendition (@rend, @style, @rendition)) (att.global.linking (@corresp, @synch, @sameAs, @copyOf, @next, @prev, @exclude, @select)) (att.global.analytic (@ana)) (att.global.facs (@facs)) (att.global.change (@change)) (att.global.responsibility (@cert, @resp)) (att.global.source (@source)) att.typed (@type, @subtype)|Contient un corpus encodé en TEI. Il se compose d'un header propre et d'un ou plusieurs fichiers TEI, chacun avec leur header propre et leur section `text`.|
|teiHeader|att.global (@xml:id, @n, @xml:lang, @xml:base, @xml:space) (att.global.rendition (@rend, @style, @rendition)) (att.global.linking (@corresp, @synch, @sameAs, @copyOf, @next, @prev, @exclude, @select)) (att.global.analytic (@ana)) (att.global.facs (@facs)) (att.global.change (@change)) (att.global.responsibility (@cert, @resp)) (att.global.source (@source))|The TEI-based header contains additional descriptive information (metadata) about the digital document and is a mandatory component of every TEI document.|
|text|att.global (@xml:id, @n, @xml:lang, @xml:base, @xml:space) (att.global.rendition (@rend, @style, @rendition)) (att.global.linking (@corresp, @synch, @sameAs, @copyOf, @next, @prev, @exclude, @select)) (att.global.analytic (@ana)) (att.global.facs (@facs)) (att.global.change (@change)) (att.global.responsibility (@cert, @resp)) (att.global.source (@source)) att.declaring (@decls) att.typed (@type, @subtype) att.written (@hand)|Contains a single text of any kind.|
