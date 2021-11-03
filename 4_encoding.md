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
### <reg> et <orig>

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
