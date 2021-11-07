# Rapide introduction de la TEI

La TEI est un standard de partages de texte qui repose sur une stratégie d’encodage définie et constante, déclarée dans un schéma. Elle utilise, depuis la versio P5, l'XML, qui vient remplacer le SGML. Son principe fondateur est de facilité les échanges de textes entre les différents producteurs de sources textuelles, dans le cadre universitaire et de recherches.   
La TEI est une structuration des éléments sémantiques d'un texte et non une représentation typographique de celui-ci. Il permet donc de générer des fichiers dans des formats différents, mais aussi de faire plusieurs visualisations du même fichier.  

- 1987, création de la *Text Encoding Initiative* par trois sociétés savantes :
**Association for Computers and the Humanities**, **Association for Literary and
Linguistic Computing** et **Association for Computational Linguistics**
- 1990, TEI Proposal 1 (TEI P1), *Guidelines for the Encoding and Interchange of
Machine-Readable Texts*, sous la direction de Michael Sperberg-McQueen et Lou Burnard
- 1992-1993, TEI P2, phase d'expansion
- 1994, TEI P3, considérée comme la première version complète
- 2000, naissance du **TEI Consortium**
- 2001-2004, TEI P4 introduction du XML en parallèle du SGML
- 2007-..., TEI P5 (v.1.0) : abandon définitif SGML. Mise à jour annuel de la documentation. Actuellement, version 4.3.0. dont la dernière mise à jour date du 31 août 2021.

## Les principes de Poughkeepsie (1987)
La fondation de la TEI repose sur la volonté d'établir
- un format standard de données pour les échanges entre chercheurs de SHS.
- établir une syntaxe commune pour représenter les textes

```
1. provide a standard format for data interchange in humanities research.
2. suggest principles for the encoding of texts in the same format.
3. (a) define a recommended syntax for the format, (b) a metalanguage for the
description of text-encoding schemes, (c) describe the new format and
representative existing schemes both in that metalanguage and in prose ;
4. propose sets of coding conventions suited for various applications.
5. include a minimal set of conventions for encoding new texts in the format.
6. The guidelines are to be drafted by committees on text documentation, text
representation, text interpretation and analysis, metalanguage definition and
description of existing and proposed schemes, coordinated by a steering
committee of representatives of the principal sponsoring organizations.
7. Compatibility with existing standards will be maintained as far as possible.
8. A number of large text archives have agreed in principle to support the guidelines
in their function as an interchange format. We encourage funding agencies to
support development of tools to facilitate this interchange.
9. Conversion of existing machine-readable texts to the new format involves the
translation of their conventions into the syntax of the new format. No
requirements will be made for the addition of information not already coded in
the texts.
```

## TEI Consortium (2000)
Le Consortium est une fondation à but non lucratif, dont le financement se fait par les contributions de ses membres. Il se compose notamment d'un bureau, d'un conseil technique, de membres institutionnels, de groupes de travail et de groupes d'intérêt.
Son rôle principal est de maintenir les *Guidelines* et de les faire évoluer selon les besoins des communautés d'utilisateurs.

## Le modèle TEI
Il s'agit d'un modèle abstrait de données, soit un ensemble de concepts ainsi que les différentes relations entre eux. Il faut donc distinguer ce modèle de ses implémentations techniques, qu'elles soient générales par l'importation de modules entiers comme celui du théâtre ou de la transcription, ou particulières avec une sélection d'éléments pour correspondre aux besoins d'un projet.

### Les modules
Les modules correspondent aux chapitres des *Guidelines*. Ils définissent des composantes du modèle (éléments, classes, macros), les spécifications techniques et peuvent se concevoir comme des blocs que l'on conserve ou que l'on supprime notamment par rapport aux schémas.  

**les obligatoires:**
- tei (déclaration des classes, macros et types)
- textstructure (éléments de la structure du fichier)
- core (ensemble des éléments considérés comme basiques et communs à tous les encodages)
- header (métadonnées)

**les spécialisés:**
- analysis (analyse linguistique);
- certainty (certitude et responsabilité) ;
- corpus (corpus) ;
- drama (théâtre) ;
- figures (tableaux, figures et formules) ;
- gaiji (caractères non standard) ;
- iso-fs (structures de traits) ;
- linking (liens, segmentation, alignements) ;
- msdescription (description des manuscrits) ;
- namesdates (noms, dates, lieux) ;
- nets (graphes, réseaux, arbres) ;
- textcrit (apparat critique) ;
- transcr (transcription) ;
- verse (poésie).

### Les classes
Les classes organisent les éléments et les attributs du modèle TEI et permettent de fixer les propriétés et les règles d'héritage partagés par plusieurs éléments et attributs.   
Les classes sont identifiables par le préfixe `att.` pour les attributs et par `model.` pour les modèles d'éléments.

### Les macros  
Les macros sont des raccourcis qui permettent de spécifier le contenu, en particulier pour le contenu d'un élément ou pour les valeurs d'un attribut. Elles sont employées lors de la création des schémas. Elles débutent par le préfixe `macro.`.

### TEI Conformance
La notion de  *TEI Conformance* correspond à un ensemble de règles et de contraintes devant permettre l'échange et le traitement des fichiers dans un cadre commun. Ce n'est pas une mesure ou un jugement des mérites académiques d'un document.  Il est définit par la TEI comme étant:
- XML bien-formé
- XML valide par rapport à un schéma, qui est un dérivé des *Guidelines TEI*.
- conforme au modèle abstrait de la TEI
- utilisation conforme des espaces de noms
- documentation pr la biais d'un ODD, lui conforme aux attentes fixées par la TEI.

Cela signifie qu'il ne faut adhérer aux définitions des éléments TEI, afin de ne pas altérer leur dimension sémantique, et qu'il vaut mieux éviter d'être plus large dans l'appréciation d'un élément que la TEI. Il est plutôt recommandé d'être plus restrictif, ou au moins équivalent, afin de ne pas basculer dans une modification "sale" (*unclean modification*) de la TEI. Cela ne veut pas dire que ce choix est intrinsèquement mauvais, ou qu'il n'est pas nécessaire, mais qu'il empêche la validation contre le schéma de la TEI dans sa forme originelle.

* * *
NB: il doit y avoir aujourd'hui plus de 600 éléments disponibles dans le modèle TEI. Aucun projet ne les mobilise tous; c'est pourquoi le modèle théorique est souvent "réduit" aux seuls éléments nécessaires aux objectifs d'un projet. Cela peut aussi s'accompagner de la création d'éléments propres à un projet, lorsque la TEI n'offre pas de solution, ou que l'on ne les trouve pas satisfaisantes.
Un exemple: le [projet Menota](https://www.menota.org/HB3_index.xml). Les éléments créés fonctionnent avec l'espace de nom `me:`
  - `<me:all>` pour encoder les allitérations dans un vers
  - `<me:ass>`	pour encoder les changements de rythmes dans un vers
  - `<me:textSpan/>` pour encoder des structures qui se chevauchent
    - `@me:category` pour qualifier le type de l'élément problématique par rapport à la structure. La liste des valeurs d'attributs est fermée.

**C'est pourquoi un travail de modélisation est nécessaire lorsque l'on établit un modèle TEI pour un ou des corpus.**
La modélisation est une : « opération par laquelle on établit le modèle d'un système complexe, afin d'étudier plus commodément et de mesurer les effets sur ce système des variations de tel ou tel de ses éléments composants » Source: J. Giraud, P. Pamart, J. Riverain, *Les nouveaux mots « dans le vent »*, Paris, France, 1974.
* * *

## Epidoc, une modélisation de la TEI
Epidoc est un projet collaboratif qui a vu le jour en 2000 à l'initiative de Tom Elliot et qui vise à établir des normes d'encodage en TEI pour les documents anciens. L'idée initiale était d'établir un standard afin de favoriser l'interopérabilité et la constance des encodages entre les documents anciens afin de permettre des regroupements de corpus issus de plusieurs projets.
Cette personnalisation offre une documentation assez complète avec des schémas de validation et des feuilles de style pour les transformations.
Actuellement, Epidoc migre vers la version 9.3 et l'ensemble de son contenu est accessible en open-source : (https://epidoc.stoa.org/gl/latest/index.html).

## Quelques exemples de normes utilisant l'XML
- EAD pour les descriptions archivistiques
- MEI pour les notations musicales
- MathXML pour les formules mathématiques
- METS/MODS pour les métadonnées d'archivage patrimonial

## Pourquoi faire?
- L'XML-TEI permet de traduire la dimension sémantique d'un document et de la rendre compréhensible à un ordinateur.
- Distingue la mise en forme du document qui correspond à l'affichage et la structuration du texte lui-même.
- Autorise les traitements et des exploitations des informations encodées.
- Offre un format pérenne, stable et bien documenté, avec une importante communauté d'utilisateurs.
