# Commencer avec la TEI

## Ajouter un prologue: la déclaration XML et les instructions de traitements
```
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
```

## Ajouter une structure de départ pour un fichier TEI
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

![Structuration logique d'un texte](/assets/images/structure.png)
*[Jean-Baptiste Camps, Structuration des données et des documents : balisage XML](https://halshs.archives-ouvertes.fr/cel-01706530)*

## Division logique du texte
### `<div>`
Permet de diviser le texte contenu dans le `<body>`, `<front>`  et `<back>`,  en sous-unité que l'on peut qualifier à l'aide de l'attribut `@type`.

```
<body>
 <div type="part" n="1">
  <div type="chapter" n="1">
<!-- text of part 1, chapter 1 -->
  </div>
  <div type="chapter" n="2">
<!-- text of part 1, chapter 2 -->
  </div>
 </div>
 <div type="part" n="2">
  <div n="1" type="chapter">
<!-- text of part 2, chapter 1 -->
  </div>
  <div n="2" type="chapter">
<!-- text of part 2, chapter 2 -->
  </div>
 </div>
</body>
```
### `<div1>`, `<div2>`...
Une division en sous-unité avec une numérotation intégrée de 1 à 7. Une division ne peut contenir que des niveaux inférieurs. Ainsi, un `<div4>` ne peut avoir comme élément enfant les éléments: `<div1>`, `<div2>` et `<div3>`

```
<body>
 <div1 type="part" n="1">
  <div2 type="chapter" n="1">
<!-- text of part 1, chapter 1 -->
  </div2>
  <div2 type="chapter" n="2">
<!-- text of part 1, chapter 2 -->
  </div2>
 </div1>
 <div1 type="part" n="2">
  <div2 n="1" type="chapter">
<!-- text of part 2, chapter 1 -->
  </div2>
  <div2 n="2" type="chapter">
<!-- text of part 2, chapter 2 -->
  </div2>
 </div1>
</body>
```

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

## Memo des éléments présentés  
|Elements name|Attributes|Description|
|:------:|:------:|:------:|
|back|att.global (@xml:id, @n, @xml:lang, @xml:base, @xml:space) (att.global.rendition (@rend, @style, @rendition)) (att.global.linking (@corresp, @synch, @sameAs, @copyOf, @next, @prev, @exclude, @select)) (att.global.analytic (@ana)) (att.global.facs (@facs)) (att.global.change (@change)) (att.global.responsibility (@cert, @resp)) (att.global.source (@source)) att.declaring (@decls)|(texte annexe) contient tout supplément placé après la partie principale d'un texte : appendice, etc.|
|body|att.global (@xml:id, @n, @xml:lang, @xml:base, @xml:space) (att.global.rendition (@rend, @style, @rendition)) (att.global.linking (@corresp, @synch, @sameAs, @copyOf, @next, @prev, @exclude, @select)) (att.global.analytic (@ana)) (att.global.facs (@facs)) (att.global.change (@change)) (att.global.responsibility (@cert, @resp)) (att.global.source (@source)) att.declaring (@decls)|(corps du texte) contient la totalité du corps d’un seul texte simple, à l’exclusion de toute partie pré- ou post-liminaire.|
|div|att.global (@xml:id, @n, @xml:lang, @xml:base, @xml:space) (att.global.rendition (@rend, @style, @rendition)) (att.global.linking (@corresp, @synch, @sameAs, @copyOf, @next, @prev, @exclude, @select)) (att.global.analytic (@ana)) (att.global.facs (@facs)) (att.global.change (@change)) (att.global.responsibility (@cert, @resp)) (att.global.source (@source)) att.divLike (@org, @sample) (att.metrical (@met, @real, @rhyme)) (att.fragmentable (@part)) att.typed (@type, @subtype) att.declaring (@decls) att.written (@hand)|(division du texte) contient une subdivision dans le texte préliminaire, dans le corps d’un texte ou dans le texte postliminaire.|
|front|att.global (@xml:id, @n, @xml:lang, @xml:base, @xml:space) (att.global.rendition (@rend, @style, @rendition)) (att.global.linking (@corresp, @synch, @sameAs, @copyOf, @next, @prev, @exclude, @select)) (att.global.analytic (@ana)) (att.global.facs (@facs)) (att.global.change (@change)) (att.global.responsibility (@cert, @resp)) (att.global.source (@source)) att.declaring (@decls)|(texte préliminaire) contient tout ce qui est au début du document, avant le corps du texte : page de titre, dédicaces, préfaces, etc.|
|TEI|att.global (@xml:id, @n, @xml:lang, @xml:base, @xml:space) (att.global.rendition (@rend, @style, @rendition)) (att.global.linking (@corresp, @synch, @sameAs, @copyOf, @next, @prev, @exclude, @select)) (att.global.analytic (@ana)) (att.global.facs (@facs)) (att.global.change (@change)) (att.global.responsibility (@cert, @resp)) (att.global.source (@source)) att.typed (@type, @subtype)|(document TEI) contient un seul document conforme à la TEI, qui comprend un en-tête TEI et un texte, soit de façon isolée, soit comme partie d’un élément teiCorpus.|
|teiCorpus|	att.global (@xml:id, @n, @xml:lang, @xml:base, @xml:space) (att.global.rendition (@rend, @style, @rendition)) (att.global.linking (@corresp, @synch, @sameAs, @copyOf, @next, @prev, @exclude, @select)) (att.global.analytic (@ana)) (att.global.facs (@facs)) (att.global.change (@change)) (att.global.responsibility (@cert, @resp)) (att.global.source (@source)) att.typed (@type, @subtype)|(TEI corpus) contient la totalité d'un corpus encodé selon la TEI, comprenant un seul en-tête de corpus et un ou plusieurs éléments TEI dont chacun contient un seul en-tête textuel et un texte.|
|teiHeader|att.global (@xml:id, @n, @xml:lang, @xml:base, @xml:space) (att.global.rendition (@rend, @style, @rendition)) (att.global.linking (@corresp, @synch, @sameAs, @copyOf, @next, @prev, @exclude, @select)) (att.global.analytic (@ana)) (att.global.facs (@facs)) (att.global.change (@change)) (att.global.responsibility (@cert, @resp)) (att.global.source (@source))| (en-tête TEI) fournit des informations descriptives et déclaratives qui constituent une page de titre électronique au début de tout texte conforme à la TEI.|
|text|att.global (@xml:id, @n, @xml:lang, @xml:base, @xml:space) (att.global.rendition (@rend, @style, @rendition)) (att.global.linking (@corresp, @synch, @sameAs, @copyOf, @next, @prev, @exclude, @select)) (att.global.analytic (@ana)) (att.global.facs (@facs)) (att.global.change (@change)) (att.global.responsibility (@cert, @resp)) (att.global.source (@source)) att.declaring (@decls) att.typed (@type, @subtype) att.written (@hand)|(texte) contient un seul texte quelconque, simple ou composite, par exemple un poème ou une pièce de théâtre, un recueil d’essais, un roman, un dictionnaire ou un échantillon de corpus|  
