# Encoder un texte avec Manu

## Eléments généraux de structure
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

## Structuration de la poésie
- `<lg>` (line group) pour les groupes et sous-groupes de vers (poèmes, strophes, etc.) avec un `@type`
- `<l>` pour chacun des vers

## Structuration du théâtre
- `<sp>`(speech) pour du texte parlé, dont  
  - `<speaker> `pour celui qui parle  
  - `<stage>` pour les didascalies  
  - `<p>` ou `<lg>` le cas échéant pour ce qui est dit  

## Structuration de la correspondance

## Éléments de représentation de la source
### Structuration matérielle
- `<pb/>` pour les changements de page avec `@n` pour donner le numéro de page
- `<cb/>` pour un changement de colonne
- `<lb/>` pour les changements de ligne avec `@n` pour donner le numéro de ligne et `@break="no"` lorsqu'une ligne ne coincide pas avec la fin d'un mot orthographique.

```
ajouter un exemple
```

### Difficulté de lecture
`<unclear>` en spécifiant
-
-
```
<unclear reason="illegible"></unclear>
```
### Passage impossible à transcrire pour diverses raisons
`<gap>` en spécifiant
- la raison avec l'attribut `@reason`
- les dimensions, si besoin, avec les attributs `@unit` et `@quantity`
```
ajouter un exemple
```

### Interventions par le describe
#### Additions
```
<add place="above"></add>
```
#### Ratures
```
<del rend="strikethrough"></del>
```

#### Combinaison des deux
```
<subst><add place="above"></add><del rend="strikethrough"></del></subst>
```

## Régularisation et correction
Distinguer :
- nature/objectif de l'intervention (correction, régularisation,...) ;
- responsabilité, source, justification de cette intervention

### Choice
### <reg> et <orig>

## abbreviation
```
17
 <choice>
 <abbr>oc<hi rend="sup">bre</hi></abbr>
 <expan>octobre</expan>
 </choice>
 1822
```

## Cractères spéciaux
<g>

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

## Elements d'indexation
### Noms et personnes
```
<persName>Benjamin</persName>
```
### Lieux
```
<placeName>Hull</placeName>
```

### Dates
```
<date when="1822-10-17"> 17 octobre 1822 </date>
```
