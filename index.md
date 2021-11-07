# Atelier TEI
Action Nationale de Formation "Digital Areal", 7-10 novembre 2021, Fréjus.
Atelier animé par Emmanuel Francis (CNRS-EHESS, CEIAS) et Axelle Janiak (CNRS-EHESS, CEIAS, ingénieure pour le projet DHARMA).  
Cours et site réalisé par Axelle Janiak, en collaboration avec Adeline Levivier (EFEO, ingénieure pour le projet DHARMA).

Pour nous contacter: [manufrancis@gmail.com](manufrancis@gmail.com), [adeline.levivier@efeo.net](adeline.levivier@efeo.net) et [axelle.janiak@ehess.fr](axelle.janiak@ehess.fr]).

## Contenu de ce repository
- Les pages de cours en format markdown
- Le dossier `asset` regroupe les scripts, images et styles utilisés dans l'ensemble des pages du site.
- Le dossier `examples` contient une proposition d'encodage pour la fable, utilisé pour générer l'exemple sur le site.
- Le dossier `facsimiles` contient des jpg, les transcriptions de la fable *Le Loup et le chien* de La Fontaine et une version du premier chapitre de *La Recherche du temps perdu* de Proust, et les médatonnées issues de *Gallica*.
- Le dossier `schema` met à disposition des schémas de validation pour Epidoc, TEI all et des exemples de schéma utilisés par DHARMA (RelaxNG et schematron).
- Le dossier `templates` propose des templates Epidoc et TEI pour aider à débuter les encodages, ainsi qu'un template d'encodage plus développé utilisé par DHARMA pour les inscritptions.
- Le dossier `XSLT` contient une XSLT pour numéroter les vers de la fable et une pour le transformer en html.
- Les autres éléments sont utilisés afin de générer la page gitHub, à l'aide du thème Cayman et de Jekyll.  
**L'ensemble est disponible en licence CC-BY, grâce au financement de l'ERC du projet DHARMA.**

## Déroulé du cours
Le cours a été conçu pour mobiliser un maximum de connaissances et de notions de l'univers de l'XML. Il se compose d'une introduction à la TEI et de cinq chapitres expliquant les principes de l'XML, la structure d'un fichier TEI, le teiHeader, l'édition d'un texte et enfin quelques principes sur la XSLT. Il est aussi accompagné d'un lexique et d'une liste d'éléments utilisés dans le cas des éditions critiques de DHARMA pour permettre aux participants ayant amené leur propre texte ou corpus d'accèder à plus d'éléments.

## Editeurs de texte et de code
Il est nécessaire d'avoir un éditeur de texte:
- soit Oxygen version d’essai (1 mois). https://www.oxygenxml.com/xml_editor/download_oxygenxml_editor.html
- soit Atom (éditeur de texte open-source) https://atom.io/ et installation du module de validation (https://atom.io/packages/linter-autocomplete-jing)
- soit votre éditeur habituel/préféré, si vous en avez un
* * *
NB: Notepad ++ ou textEdit fonctionnent, mais vous n’aurez aucune aide pour la saisie et pour valider les encodages.
* * *

## Bibliographie
### Tutoriels et introductions
“v. A Gentle Introduction to XML”, *TEI Guidelines*, Version 4.3.0: [lien](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/SG.html)  
Melissa Terras, Edward Vanhoutte, and Ron Van den Branden. *TEI by Example*. Online course: [lien](https://teibyexample.org/)  
Lou  Burnard, *What is the Text Encoding Initiative? How to add intelligent markup to digital resources*. Nouvelle édition [en ligne]. Marseille : OpenEdition Press, 2014: [lien](http://books.openedition.org/oep/426 )  
Marjorie Burghart, *Editer des sources historiques en ligne grâce à XML – Un guide pratique*. Lyon, 2010: [lien](http://mutec.huma-num.fr/sites/www.mutec-shs.fr/files/Guide%20Editer%20des%20sources%20historiques%20%20gr%C3%A2ce%20a%20XML.pdf)  
Marjorie Burghart, James Cummings & Elena Pierazzo, *Digital Editing of Medieval Manuscripts : A Textbook*. Online course: [lien](https://www.digitalmanuscripts.eu/?page_id=648)  
Jean-Baptiste Camps, *Structuration des données et des documents : balisage XML*. Paris, 2018: [lien](https://halshs.archives-ouvertes.fr/cel-01706530)  
Olivier Carton, *L'essentiel de XML*, cours pour l'université Paris-Diderot. Paris, 2015: [lien](https://www.irif.fr/~carton/Enseignement/XML/Cours/index.html)  
W3C School, *XML Tutorial*. [lien](https://www.w3schools.com/xml/)

### Guides d'encodage
*TEI Guidelines*: [lien](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/index.html)  
*EpiDoc Guidelines: Ancient documents in TEI XML*: [lien](https://epidoc.stoa.org/gl/latest/)

### Documentation du projet DHARMA
Daniel Bálogh et Arlo Griffiths, *Dharma Encoding Guide*, 2019: [lien](https://halshs.archives-ouvertes.fr/halshs-02888186)  
Daniel Bálogh et Arlo Griffiths, *Dharma Transliteration Guide*, 2019:  [lien](https://hal.archives-ouvertes.fr/halshs-02272407v3)

### Codes, templates et schémas du projet DHARMA
Tout est accessible sur le repository gitHub [Project-documentation](https://github.com/erc-dharma/project-documentation).  
