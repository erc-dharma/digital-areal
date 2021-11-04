# Encoder un texte avec Manu

## Eléments généraux
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

## Éléments pour la poèsie
- `<lg>` (line group) pour les groupes et sous-groupes de vers (poèmes, strophes, etc.) avec un `@type`
- `<l>` pour chacun des vers

## Éléments pour le théâtre
- `<sp>`(speech) pour du texte parlé, dont  
  - `<speaker> `pour celui qui parle  
  - `<stage>` pour les didascalies  
  - `<p>` ou `<lg>` le cas échéant pour ce qui est dit  

## Éléments pour la correspondance

## Éléments de représentation de la source
### Structuration matérielle
- `<pb/>` pour les changements de page avec `@n` pour donner le numéro de page
- `<cb/>` pour un changement de colonne
- `<lb/>` pour les changements de ligne avec `@n` pour donner le numéro de ligne et `@break="no"` lorsqu'une ligne ne coincide pas avec la fin d'un mot orthographique.

### Difficulté de lecture
`<unclear>` en spécifiant
- la raison avec l'attribut `@reason`

### Passage impossible à transcrire
`<gap>` en spécifiant
- la raison avec l'attribut `@reason`
- les dimensions, si besoin, avec les attributs `@unit` et `@quantity`

### Interventions par le describe
#### Additions
`<add>` en spécifiant
- la position de l'ajout avec l'attribut `@place`

#### Ratures
`<del>` en spécifiant
- la mise en forme avec l'attribut `@rend`

## Régularisation et correction
Distinguer :
- nature/objectif de l'intervention (correction, régularisation,...) ;
- responsabilité, source, justification de cette intervention

### Choice
L'élément `<choice>` permet de représenter des phénomènes qui se produisent en simultanée, le plus souvent des états du texte connus ou supposés. Si le plus commun est de représenter deux états, il n'y a pas de limites au nombre d'éléments enfants que peut avoir `<choice>`.
On le retrouve ainsi avec des éléments de correction ou de régularisation des graphies, dans des cas d'incertitude ou d'abréviations.
#### Les couples orig et reg, et sic et corr
Avant de se lancer dans la correction ou la régularisation d'un texte, il vaut mieux que les membres d'un même projet se mette d'accord sur les définitions de ces deux concepts et qu'ils décident aussi ce qu'ils corrigent et régularisent par l'encodage et ce qui est fait de manière silencieuse dans le texte.
Les éléments

## Abréviation
```
17
 <choice>
 <abbr>oc<hi rend="sup">bre</hi></abbr>
 <expan>octobre</expan>
 </choice>
 1822
```

## Caractères spéciaux
<g>
### traitement des allographes
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

2- On peut aussi déclarer le caractère spécial dans un doctype. On lui donne un nom auquel on associe un encodage
```
<!DOCTYPE TEI [
 <!ENTITY s-long
'<choice><reg>s</reg><orig>&#383;</orig></choice>' >
]>
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
Pour l'utiliser, l'encodage combine l'élément avec un attribut ce référence dont le pointer vise la déclaration faite dans le `<teiHeader>`.
```
<g ref="#s-long">s</g>
```
* * *
NB: pour se simplifier la vie, nous pouvons aussi combiner les propositions faites si dessus.
Soit un doctype avec l'élément `<g>`.
```
<!ENTITY s-long '<g ref="#s-long">s</g>' >
```
* * *

## Éléments d'indexation
### Noms et personnes
`<persName>` en spécifiant
- une typologie avec l'attribut `@type` voire avec aussi `@subtype`
- une référence pour donner une uri avec l'attribut `@ref`
- une normalisation du nom l'attribut `@key`

### Lieux
`<placeName>` en spécifiant
- une typologie avec l'attribut `@type` voire avec aussi `@subtype`
- une référence pour donner une uri avec l'attribut `@ref`
- une normalisation du nom l'attribut `@key`

`<geogName>` parfois pour des noms associés à une dimension géographique, comme une rivière ou une montagne par exemple.
