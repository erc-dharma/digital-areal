# Commencer avec la TEI

## La déclaration XML
Un fichier XML, TEI ou non, débute toujours par la déclaration XML. Elle se signale par des chevrons et des points d'interrogation. Tout de suite après le point d'interrogation du début doit se trouver xml (en minuscules). Elle peut se composer de plusieurs mentions qui reprennent la syntaxe des attributs.
- la declaration de la version: `version="1.0"` (mention obligatoire)
- la déclaration de l'encodage des caractères: `encoding="utf-8"` (recommendée)
- enfin standalone pour signaler la localisation du schéma.  Avec `standalone="yes"` vous mentionnez que la DTD se trouve dans le fichier actuel. Avec `standalone="no"` vous faîtes savoir que la DTD se trouve dans un fichier séparé. Dans ce cas, vous devez mentionner la source à l'aide de la déclaration de type de document. (Rarement utilisé)

Si vous utilisez tous ces attributs, il y a un ordre à respectet. Il s'agit d'un des rares cas en XML où l'ordre des attributs à de l'importance pour le système.

```
<?xml version="1.0" encoding="utf-8"?>
```

## Instructions de traitement
Les instructions de traitement sont deslignes à destinations du logiciel/éditeur de codes. Elles s'écrivent sur le même modèle que la déclaration xml avec des chevrons suivis par des points d'interrogation.   
Les plus courantes permettent de déclarer le ou les schémas de validation ou encore une feuille de style de transformation.

Exemple de la déclaration des schémas pour les inscriptions dans le projet DHARMA
```
<?xml-model href="https://raw.githubusercontent.com/erc-dharma/project-documentation/master/schema/latest/DHARMA_Schema.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="https://raw.githubusercontent.com/erc-dharma/project-documentation/master/schema/latest/DHARMA_Schema.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="https://raw.githubusercontent.com/erc-dharma/project-documentation/master/schema/latest/DHARMA_SQF.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
```

Exemple avec une DTD interne
```

<?xml version="1.0"?>
<!DOCTYPE Bonjour [
  <!ELEMENT Bonjour (#PCDATA)>
]>
<Bonjour>Salut Jupiter!</Bonjour>
```

Exemple avec une feuille de style XSLT
```
<?xml-stylesheet href="transformation.xsl"
   type="text/xsl"?>
```

Exemple avec une feuille de style css
```
<?xml-stylesheet href="style.css" type="text/css"?>
```

Plusieurs attributs sont possibles. Il faut au moins l'attribut `@href` qui peut contenir:
- une url
- un chemin relatif entre votre xml et le fichier (par rapport à votre position dans l'ordinateur)
- un chemin absolut entre votre xml et le fichier (par rapport à la racine de l'ordinateur)
Selon la technogolie mobilisée, il peut-être nécessaire de déclarer une uri pour l'identifier. C'est le cas avec les schémas et l'attribut `@schematypens` notammant.

* * *
NB: Les schémas permettent de valider l'encodage de votre fichier selon les régles spécifiques que vous avez fixé pour votre projet.
Il existe plusieurs technologies: DTD, xml schema, Relax NG, Schematron.
**Un projet d'édition numérique en TEI se doit d'avoir son schéma et sa documentation**
***

## Structure de départ d'un fichier TEI

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
