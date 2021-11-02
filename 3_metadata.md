# Encoder les métadonnées d'un fichier TEI

Ajouter une définition des métadonnées.

* * *
NB : Leur dénomination peut vous donner des éléments d'informations sur leur usage et/ou leur contenu .   
Parmi les 3 suffixes présents dans le teiHeader:
- Stmt : appelle un contenu structuré en souséléments
- Decl : une série de déclarations, associant structuration en sous-éléments et description en
prose
- Desc : description, en prose courante, pouvant être structurée en sous-éléments
* * *

## fileDesc
### titleStmt
### editionStmt
### publicationStmt
### sourceDesc

#### Cas particulier: un dérivé d'un fichier numérique

```
<sourceDesc>
 <biblFull>
 <!-- Copie complète du fileDesc du
fichier d'origine -->
 <titleStmt>
 <title/>
 <!-- [...] -->
 </titleStmt>
 <!-- [...] -->
 </biblFull>
 </sourceDesc>
 ```
## encodingDesc

## profilDesc

## revisionDesc
Présente une sucession d'éléments `<change>`, par ordre antéchronologique, qui documente les différentes interventions faites dans les fichiers, et qui peuvent être groupés par `<list>` ou par `<listChange>`. Fonctionne souvent avec les attributes `@who` et `@when`, ou avec les sous-éléments `<name>` et `<date>`.

```
<revisionDesc>
   <change who="part:axja" when="2021-06-30">Beta version 4: adding facsimile for Chloe's encoding</change>
   <change who="part:axja" when="2021-06-02">Beta version 4 : starting adding elements to handle the resolution for ids linked to thesaurus concepts</change>
   <change who="part:axja" when="2020-10-12">Version 3.2 : movinng the xml:lang to the root</change>
   <change who="part:axja" when="2020-07-02">Version 3.1: adding the encodingDesc and linking the template with the DHARMA Schema</change>
   <change who="part:axja" when="2020-03-18">Version 2: addition of handDesc and summary</change>
   <change who="part:axja" when="2019-12-18">Creation of the
      template</change>
</revisionDesc>
```
