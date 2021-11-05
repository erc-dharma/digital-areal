# Rapide introduction de la TEI

- 1987, naissance de la *Text Encoding Initiative* par trois sociétés savantes :
**Association for Computers and the Humanities**, **Association for Literary and
Linguistic Computing** et **Association for Computational Linguistics**
- 1990, TEI Proposal 1 (TEI P1), *Guidelines for the Encoding and Interchange of
Machine-Readable Texts*, sous la direction de Michael Sperberg-McQueen et Lou Burnard,
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
4.propose sets of coding conventions suited for various applications.
5.include a minimal set of conventions for encoding new texts in the format.
6.The guidelines are to be drafted by committees on text documentation, text
representation, text interpretation and analysis, metalanguage definition and
description of existing and proposed schemes, coordinated by a steering
committee of representatives of the principal sponsoring organizations.
7.Compatibility with existing standards will be maintained as far as possible.
8.A number of large text archives have agreed in principle to support the guidelines
in their function as an interchange format. We encourage funding agencies to
support development of tools to facilitate this interchange.
9.Conversion of existing machine-readable texts to the new format involves the
translation of their conventions into the syntax of the new format. No
requirements will be made for the addition of information not already coded in
the texts.
```

## TEI Consortium (2000)
Le Consortium est une fondation à but non lucratif, dont le financement se fait par les contributions de ses membres. Il se compose notamment d'un bureau, d'un conseil technique, de membres institutionnels et des groupes de travail et de groupes d'intérêt.
Son rôle principal est de maintenir les guidelines et de les faire évoluer selon les besoins des communautés d'utilisateurs.

## Le modèle TEI
Il s'agit d'un modèle abstrait de données, soit un ensemble de concepts ainsi que les différentes relations entre eux. Il faut donc distinguer ce modèle des implémentations techniques, qu'elles soient générales par l'importation de modules entiers comme celui du théâtre ou de la transcription, ou particulières avec une sélection d'éléments pour correspondre aux besoins d'un projet.
Les modules correspondent aux chapitres des Guidelines. Ils définissent des composantes du modèle (éléments, classes, macros), les spécifications techniques et peuvent se concevoir comme des blocs que l'on conserve ou que l'on supprime notamment par rapport aux schémas.

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

## Epidoc, une personnalisation de la TEI
Epidoc est un projet collaboratif qui a vu le jour en 2000 à l'initiative de Tom Elliot et qui vise à établir des normes d'encodage en TEI pour les documents anciens. L'idée initiale était d'établir un standard afin de favoriser l'interopérabilité et la constance des encodages entre les documents anciens afin de permettre des regroupements de corpus issus de plusieurs projets.
Cette personnalisation offre une documentation assez complète avec des schémas de validation et des feuilles de style pour les transformations.
Actuellement, Epidoc migre vers la version 9.3 et l'ensemble du contenu est en open-source : (https://epidoc.stoa.org/gl/latest/index.html).

## Quelques exemples de normes utilisant l'XML
- EAD pour les descriptions archivistiques
- MEI pour les notations musicales
- MathXML pour les formules mathématiques
- METS/MODS pour les métadonnées d'archivage patrimonial

## Pourquoi faire?
- L'XML-TEI permet de traduire la dimension sémantique d'un document et de la rendre compréhensible à un ordinateur.
- Distingue la mise en forme du document qui correspond à l'affichage et la structuration du texte lui-même.
- Autorise les traitements et des exploitations des informations encodées.
