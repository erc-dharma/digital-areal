# Encoder un texte avec Manu

## Éléments généraux
- `<p>` pour des paragraphes  
- `<ab>` pour une unité de texte quelconque, de niveau "composant", faisant office de contenant anonyme pour une expression ou des éléments de niveau intermédiaire, analogue à un paragraphe mais sans sa portée sémantique
- `<seg>` pour des subdivisions internes au paragraphe ou d'analyse
- `<list>` pour des listes  contenant des `<item>`  
- `<quote>` pour les citations simples
- `<q>` pour représenter des éléments entre guillemets  
- `<cit>` avec `<quote>` et `<bibl>` pour les citations avec référence
- `<bibl>` pour des références bibliographiques
- `<table>` pour des tableaux  
- `<figure>` pour des images
- `<note>` pour les notes   

## Éléments pour la poésie
- `<lg>` (line group) pour les groupes et sous-groupes de vers (poèmes, strophes, etc.) avec un `@type`
- `<l>` pour chacun des vers

## Éléments pour le théâtre
- `<sp>`(speech) pour du texte parlé, dont  
  - `<speaker> `pour celui qui parle  
  - `<stage>` pour les didascalies  
  - `<p>` ou `<lg>` le cas échéant pour ce qui est dit  

## Éléments pour la correspondance
### Éléments que l'on peut utiliser en début d'une division
- `<opener>`	(formule de début) regroupe la date, la mention de responsabilité, la formule de politesse et d'autres expressions de ce type dans un groupe préliminaire au début d’une division, en particulier au commencement d’une lettre.
- `<signed>`	(signature) contient la dernière salutation, ajoutée à un avant-propos, à une dédicace ou à une autre division du texte.
### Éléments que l'on peut utiliser à la fin d'une division
- `<closer>`	(formule finale) regroupe une formule de politesse, une indication de date et d'autres expressions semblables figurant comme expression à la fin d’une division, en particulier à la fin d’une lettre.
- `<postscript>`	contient un post-scriptum, par exemple au bas d'une lettre.
- `<signed>`	(signature) contient la dernière salutation, ajoutée à un avant-propos, à une dédicace ou à une autre division du texte.
- `<trailer>`	contient un titre de fin ou de bas de page à la fin d’une division du texte.
### Éléments que l'on peut utiliser en début et à la fin d'une division
- `<dateline>`	(mention de date) contient une brève description des lieu, date, heure, etc. concernant la production d’une lettre, d’un article de journal ou d’un autre texte qui, placée au début ou à la fin, lui est associée comme en-tête ou annonce de fin.
- `<salute>`	(formule de politesse) contient un dédicace ou une formule de salut qui précède un avant-propos ou autre division du texte; ou bien encore la formule de politesse qui conclut une lettre, une préface, etc.

## Éléments pour une page de titre
- `<titlePage>` (page de titre) contient la page de titre d’un texte qui figure dans les parties liminaires.
- `<docTitle>` (titre du document) contient le titre d’un document, incluant la totalité de ses composants tels qu’ils sont donnés sur la page de titre.
- `<titlePart>` (title part) contient une section ou division du titre d’un ouvrage telle qu’elle est indiquée sur la page de titre.
type	(type) précise le rôle de cette subdivision du titre. Les valeurs suggérées comprennent: 1] main (main); 2] sub (subordinate); 3] alt (alternate); 4] short (short); 5] desc (descriptive)
- `<argument>` (argument) liste formelle ou description en texte libre des sujets traités dans une subdivision d’un texte
- `<byline>` (mention de responsabilité) indique la responsabilité principale pour une œuvre donnée sur la page de titre ou au début ou à la fin de l’œuvre.
- `<docAuthor>` (auteur du document) contient le nom de l’auteur du document tel qu’il est donné sur la page de titre (ce nom est le plus souvent contenu dans une mention de responsabilité) .
- `<epigraph>` (epigraph) contient une citation, anonyme ou attribuée, et qui apparaît au début d’une section ou d’un chapitre ou sur une page de titre.
- `<imprimatur>` (imprimatur) contient une mention formalisée autorisant la publication d’un ouvrage, parfois exigée sur une page de titre ou à son verso.
- `<docEdition>` (édition du document) contient une mention d’édition telle qu’elle figure sur la page de titre d’un document.
- `<docImprint>` (mention d'impression) contient la mention d'impression de l'éditeur (lieu et date de publication, nom de l’éditeur), telle qu’elle est généralement donnée au bas de la page de titre.
- `<docDate>` (date du document) contient la date d’un document telle qu’elle est (généralement) donnée sur une page de titre.
- `<graphic>` (graphic) indique l'emplacement d'une image, d'une illustration ou d'un schéma intégrés.

## Transcrire sa source
### Structuration matérielle
- `<pb/>` pour les changements de page avec `@n` pour donner le numéro de page
- `<cb/>` pour un changement de colonne
- `<lb/>` pour les changements de ligne avec `@n` pour donner le numéro de ligne et `@break="no"` lorsqu'une ligne ne coincide pas avec la fin d'un mot orthographique.

### Difficulté de lecture
`<unclear>` contient un mot, une expression ou bien un passage qui ne peut être transcrit avec certitude parce qu'il est illisible ou inaudible dans la source.
- la raison avec l'attribut `@reason`

### Passage impossible à transcrire
`<gap>` indique une omission dans une transcription, soit pour des raisons éditoriales décrites dans l'en-tête TEI au cours d’un échantillonnage, soit parce que le matériau est illisible ou inaudible.
- la raison avec l'attribut `@reason`
- les dimensions, si besoin, avec les attributs `@unit` et `@quantity`

### Restituer un passage
`<supplied>` (texte restitué) permet d'encoder du texte restitué par l'auteur de la transcription ou par l'éditeur pour une raison quelconque, le plus souvent parce que le texte du document original ne peut être lu, par suite de dommages matériels ou de lacunes.
- la raison avec l'attribut `@reason`

### Indiquer qu'un segment de texte est superflu
`<surplus>` (Texte superflu) permet d'encoder une partie de texte présente dans la source lorsque l'éditeur la considère superflue ou redondante.
- la raison avec l'attribut `@reason`

### Interventions du scribe
#### Ajouts
`<add>` (ajout) contient des lettres, des mots ou des phrases insérés dans le texte par un auteur, un copiste, un annotateur ou un correcteur.
- la position de l'ajout avec l'attribut `@place`

#### Suppressions
`<del>` (suppression) contient une lettre, un mot ou un passage supprimé, marqué comme supprimé, sinon indiqué comme superflu ou erroné dans le texte par un auteur, un copiste, un annotateur ou un correcteur.
- la mise en forme avec l'attribut `@rend`

#### Combiner un ajout et une suppression sur un même segment de texte
`<subst>` (substitution) regroupe une ou plusieurs parties de texte supprimées et une ou plusieurs parties de texte ajoutées, lorsque cette combinaison peut être considérée comme une intervention unique sur le texte.

```
<subst>
  <del>upon</del>
  <add>over</add>
 </subst>
```

## Régularisation et correction
Distinguer :
- nature/objectif de l'intervention (correction, régularisation, etc.) ;
- responsabilité, source, justification de cette intervention

### Choice
L'élément `<choice>` permet de représenter des phénomènes qui se produisent en simultané d'un même segment de texte, le plus souvent des états du texte connus ou supposés. Si le plus commun est de représenter deux états, il n'y a pas de limites au nombre d'éléments enfants que peut avoir `<choice>`.
On le retrouve ainsi avec des éléments de correction ou de régularisation des graphies, dans des cas d'incertitude ou d'abréviations.

#### Les couples orig et reg, et sic et corr
Avant de se lancer dans la correction ou la régularisation d'un texte, il vaut mieux que les membres d'un même projet se mettent d'accord sur les définitions de ces deux concepts et qu'ils décident aussi ce qu'ils corrigent et régularisent par l'encodage et ce qui est fait de manière silencieuse dans le texte.
Les éléments de correction
- `<corr>`  (correction) contient la forme correcte d'un passage qui est considéré comme erroné dans la copie du texte.
- `<sic>` (du latin, ainsi) contient du texte reproduit bien qu'il soit apparemment incorrect ou inexact.
Lorsqu'ils sont combinés, l'encodeur souligne que le contenu de `<sic>` lui semble erroné et y apporte une correction avec `<corr>`.
- `<reg>` (régularisation) contient une partie qui a été régularisée ou normalisée de façon quelconque.
- `<orig>` (forme originale) contient une partie notée comme étant fidèle à l'original et non pas normalisée ou corrigée.

#### orig, reg, sic et corr peuvent-ils être utilisés seuls?
Ces quatre éléments peuvent être utilisés de manière indépendante. Cela arrive souvent avec `<sic>`, plus rarement pour les trois autres.

### Exprimer la certitude
Pour exprimer son degré de certitude sur une intervention, l'encodeur peut utiliser l'attribut `@cert`.
- `@cert` (certitude) donne le degré de certitude associé à l'intervention ou à l'interprétation. Trois valeurs sont couramment utilisées en TEI: low, medium et high.

### Responsabilité
A l'inverse, si vous voulez signaler l'éditeur, responsable de l'intervention, vous pouvez utiliser l'attribut `@resp`. Néanmoins, pour utiliser cet attribut, il faut que l'éditeur soit déclaré avec un `@xml:id` soit dans le `<teiHeader>`, soit dans un fichier externe. Lorsque le pointeur est interne, la convention est de le faire précéder par `#`.   
- `@resp` (responsable) indique l'agent responsable de l'intervention ou de l'interprétation, par exemple un éditeur ou un transcripteur.

```
<choice>
<sic>gruyère</sic>
<corr cert="high" resp="#aj">bruyère</corr>
</choice>
```

## Abréviations
Les abréviations
```
17
 <choice>
 <abbr>oc<hi rend="sup">bre</hi></abbr>
 <expan>octobre</expan>
 </choice>
 1822
```

## Caractères spéciaux
- `<c>` (caractère) représente un caractère.
- `<g>` (caractère ou glyphe) représente un glyphe ou un caractère non standard.
L'élément `<c>` doit se comprendre principalement comme un caractère issu de l'alphabet latin, à l'inverse `<g>`, issu du module `gaiji` et signifiant glyphe offre plus de possibilités. Il peut s'associer à des attributs `@ref` pour pointer vers une explicitation du caractère, ou encore avec `@type`, s'il s'agit d'établir une typologie.

### Traitement des allographes
Pour traiter les allographes présents dans la fable, plusieurs solutions sont possibles:
1- Utiliser `<choice>` puis déclarer systématiquement le caractère  
```
<choice>
 <reg>s</reg>
 <orig>ſ</orig>
 </choice>
 ```
 ```
 <choice>
 <reg>s</reg>
 <orig>&#383;</orig>
</choice>
```

2- On peut aussi déclarer le caractère spécial dans une DTD réduite. Pour associer un encodage à un nom que l'on utilisera comme un raccourci. Cette déclaration doit se faire après la déclaration XML et les instructions de traitement, mais avant l'élément racine `<TEI>`.
```
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml"
	schematypens="http://purl.oclc.org/dsdl/schematron"?>
<!DOCTYPE TEI [
 <!ENTITY s-long
'<choice><reg>s</reg><orig>&#383;</orig></choice>' >
]>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
```
On peut alors mobiliser `<choice><reg>s</reg><orig>&#383;</orig></choice>` en utilisant le nom donné, combiné avec la syntaxe des caractères XML spéciaux, soit `&s-long;`.
```
<l n="9"><lb n="12"/>A &s-long;e défendre hardi<supplied reason="illegible">ment</supplied>.</l>
```

3- Enfin, il y a la solution avec `<g>`. Dans ce cas, la déclaration du caractère s'effectue dans le `<teiHeader>` sous la section `<encodingDesc>`.
```
<encodingDesc>
 <charDecl>
 <glyph xml:id="s-long">
 <glyphName>LATIN SMALL LETTER LONG S EXTENDING BELOW THE
LINE</glyphName> <!-- Nom donné au glyphe -->
 <charProp> <!-- Description de ses propriétés -->
 <localName>entity</localName>
 <value>s-long</value>
 </charProp>
 <mapping type="modern">s</mapping>
 <mapping type="simplified">&#383;</mapping>
 </glyph>
 </charDecl>
 </encodingDesc>
 ```
Pour l'utiliser, l'encodage combine l'élément avec un attribut de référence dont le pointeur vise la déclaration faite dans le `<teiHeader>`.
```
<g ref="#s-long">s</g>
```
* * *
NB: Nous pouvons  combiner les propositions faites si dessus, soit une DDT avec l'élément `<g>`.
```
<!ENTITY s-long '<g ref="#s-long">s</g>' >
```
Si la TEI recommande de déclarer et préciser de nombreux choix d'encodage à l'aide d'éléments du `<teiHeader>`, force est de reconnaître que de nombreux projets et utilisateurs en font l'impasse. C'est pourquoi, vous retrouverez souvent l'attribut `<g>` sans aucune déclaration sous `<charDecl>` dans le `<teiHeader>`.
* * *

### Formater un caractère ou une chaîne de caractères
- `<hi>` (mis en évidence) distingue un mot ou une expression comme graphiquement distinct du texte environnant, sans en donner la raison.
- `@rend` (interprétation) indique comment l'élément en question a été rendu ou présenté dans le texte source.
Il est possible d'indiquer la manière typographique utilisée pour rendre un caractère, grâce à l'attribut `@rend`. Cet attribut peut s'utiliser sur l'ensemble des éléments, étant membre de la classe att.global.rendition.
```
<head rend="italic"><lb n="2"/>Le loup &amp; le chien.</head>
```
Lorsqu'une indication typographique est nécessaire, mais que vous ne disposez pas d'élément pour l'indiquer, vous pouvez faire appel à l'élément générique `<hi>`. C'est cet élément que nous avons utilisé dans l'exemple de l'abréviation.
```
<head>
  <lb n="1"/>Fable cinquiesme.
  <lb n="2"/><hi rend="italic">Le loup & le chien.</hi>
</head>
```

## Encoder des éléments en langue étrangère
- `<foreign>` (étranger) reconnaît un mot ou une expression comme appartenant à une langue différente de celle du contexte
  - `@xml:lang` pour déclarer la langue. La valeur de l'attribut correspond le plus souvent à la norme ISO 639 qui se compose de plusieurs parties, ainsi le français peut se déclarer
    - `fr` 639-1
    - `fra` 639-2/T et 639-3
    - `fre` 639-2/B
Pour les variations régionales ou historiques, voir la norme [ISO 639-3](https://iso639-3.sil.org/)
L'attribut `@xml:lang` fait partie de la classe `att.global` qui est disponible sur l'ensemble des éléments de la TEI, au même titre que `@xml:id`, `@n`, `@xml:base` et `@xml:space`.

## Encoder une image
### Décrire les facsimilés
Les facsimilés d'une édition peuvent se déclarer dans le `<teiHeader>` dans l'une des sous-sections de `<sourceDesc>`, ou peuvent aussi se déclarer entre le `<teiHeader>` et le `<text>` à l'aide de l'élément `<facsimile>`.
- `<facsimile>` contient une représentation d'une source écrite quelconque sous la forme d'un ensemble d'images plutôt que sous la forme d'un texte transcrit ou encodé.
- `<sourceDoc>` contient une transcription ou une représentation d'une source seule faisant partie d'un dossier ou d'une collection de sources <!--a transcription or other representation of a single source document potentially forming part of a dossier génétique or collection of sources.-->
```
<facsimile>
 <graphic url="LaFontaine_001.jpg"/>
 <graphic url="LaFontaine_002.jpg"/>
 <graphic url="LaFontaine_003.jpg"/>
 <graphic url="LaFontaine_004.jpg"/>
</facsimile>
```
### Lier une partie du texte avec un facsimilé
Il est possible de lier une division et une section de texte avec le facsimilé. Pour ce faire, il suffit d'utiliser l'attribut `@facs` auquel on donne comme valeur soit le chemin vers l'image, soit le nom de l'image, selon les conventions établies par le projet. Dans les pratiques TEI, on retrouve souvent l'utilisation de cet attribut avec l'élément `<pb/>`.
```
<pb n="10" facs="../facsimiles/LaFontaine_002.jpg"/>
```

### Encoder une image
Encoder une image peut se faire de plusieurs manières et avec plusieurs degrés d'information, notamment il est possible de renseigner les coordonnées de l'image sur le facsimilé, à l'aide des éléments `<surface>` et `<zone>`. Nous ne considérerons que des solutions simples dans le cadre de cette présentation.
```
<facsimile>
<surface ulx="50" uly="20" lrx="400"
lry="280">
<zone ulx="0" uly="0" lrx="500" lry="321">
 <graphic url="graphic.png "/>
</zone>
</surface>
</facsimile>
````
source: [TEI Guidelines](https://www.tei-c.org/release/doc/tei-p5-doc/fr/html/ref-zone.html)

- `<figure>` (figure) regroupe des éléments représentant ou contenant une information graphique comme une illustration ou une figure
- `<graphic>` (graphic) indique l'emplacement d'une image, d'une illustration ou d'un schéma intégrés.
  - avec l'attribut `@url` pour indiquer le chemin vers la donnée.

## Entités nommées 
### Noms et personnes
`<persName>` en spécifiant
- une typologie avec l'attribut `@type`, voire aussi avec `@subtype`
- une référence pour donner une URI avec l'attribut `@ref`
- une normalisation du nom de l'attribut `@key`

### Lieux
`<placeName>` en spécifiant
- une typologie avec l'attribut `@type`, voire aussi avec `@subtype`
- une référence pour donner une URI avec l'attribut `@ref`
- une normalisation du nom de l'attribut `@key`

`<geogName>` parfois pour des noms associés à une dimension géographique, comme une rivière ou une montagne par exemple.
