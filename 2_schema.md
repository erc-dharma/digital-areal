# Introduction aux schémas

Un schéma définit un modèle de documents que l'on peut ensuite utilisé pour vérifier les documents produits, c'est-à-dire que l'on vérifie qu'un document respecte une liste de contraintes fixées. Les schémas sont apparus avec le passage à l'XML et ont été introduits pour combler certaines lacunes des DTD, dont l'utilisation était surtout concomittante avec le SGML.  
Si ce chapitre essaie de présenter toutes les notions à l'œuvre avec les schémas et leur fonctionnement général, il n'entre pas dans les détails de la création ni même de la syntaxe.    

## La DTD
La DTD ou Document Type Definition définit une structure et une série de règles pour l'usage des éléments et des attributs dans un document XML. Elle est héritée de l'environnement SGML et est particulièrement adaptée pour de petits modèles, car relativement simple à écrire. Elle se débute avec l'appellation `<!DOCTYPE>` qui doit être suivie directement par le nom de l'élément racine. Ensuite, entre crochet, on peut déclarer les contraintes. Ces dernières spécifient comment les éléments s'emboîtent entre eux, l'ordre éventuel de ces éléments et la présence de texte brut. Elles définissent aussi, pour chaque élément, les attributs autorisés et les attributs obligatoires. Et enfin, elle permet de définir des raccourcis pour certaines entités, grâce à `<!ENTITY>`.

```
<!DOCTYPE NEWSPAPER [

<!ELEMENT NEWSPAPER (ARTICLE+)>
<!ELEMENT ARTICLE (HEADLINE,BYLINE,LEAD,BODY,NOTES)>
<!ELEMENT HEADLINE (#PCDATA)>
<!ELEMENT BYLINE (#PCDATA)>
<!ELEMENT LEAD (#PCDATA)>
<!ELEMENT BODY (#PCDATA)>
<!ELEMENT NOTES (#PCDATA)>

<!ATTLIST ARTICLE AUTHOR CDATA #REQUIRED>
<!ATTLIST ARTICLE EDITOR CDATA #IMPLIED>
<!ATTLIST ARTICLE DATE CDATA #IMPLIED>
<!ATTLIST ARTICLE EDITION CDATA #IMPLIED>

<!ENTITY NEWSPAPER "Vervet Logic Times">
<!ENTITY PUBLISHER "Vervet Logic Press">
<!ENTITY COPYRIGHT "Copyright 1998 Vervet Logic Press">
]>
```
Source: [W3 schools](https://www.w3schools.com/xml/xml_dtd_examples.asp)

Elle peut se déclarer directement dans un fichier XML, ou dans un document propre, dont le suffixe sera alors `.dtd`.
```
<!DOCTYPE TEI SYSTEM "digital-areal.dtd">
```
### Ce que l'on ne peut pas faire avec une DTD
La DTD présente néanmoins quelques lacunes:
- pas de gestion des espaces de nom
- pas de typage précis du contenu des éléments (chaîne de caractères de texte, nombre entier, etc.) ou de leur sens (date, heure, nom, etc.), si l'on peut typer les attributs, cela reste de l'odre du général
- peu de contraintes sur les éléments (nombre d'occurrences, élément racine,...)
- pas écrites en XML

### Ce que permet de faire la DTD
Par contre, la DTD permet de déclarer des entités, ce qui est absent de tous les langages de schéma, et dont nous verrons un exemple dans le [chapitre 5](https://erc-dharma.github.io/digital-areal/5_encoding) pour les allographes.

## Les schémas XML
Nous avons déjà évoqué plusieur fois les schémas et leur intérêt. Leur modèle est normé par le W3C et a été pensé pour combler les lacunes de la DTD, même si son rôle principal reste le même, c'est-à-dire de vérifier les données. Ils s'écrivent en suivant les régles de la syntaxe XML ce qui permet de les parser et de les transformer avec les mêmes technologies que les autres documents XML. Ils répondent en cela à une volonté d'établir une documentation lisible à la fois pour la machine et par l'homme.
- Il est ainsi plus simple à échanger et à conserver qu'un fichier issu d'un traitement de texte ou un PDF.
- Il offre plus de possiblités pour fixer des contraintes:
  - il détermine les éléments et les attributs qui peuvent être utilisés dans le document
  - il fixe le nombre et l'odre des éléments enfants et des attributs
  - il caractérise le type de donnée que peut contenir un élément ou un attribut
  - il contient les valeurs par défaut ou les valeurs fixes ou une liste de valeurs fixes pour les éléments ou les attributs.  

### Les formats de schéma
- XML Schema (`.xs` ou `.xsd`)
  - en particulier si l'on souhaite faire un typage très fin des données
- RelaxNG (REgular LAnguage for Xml Next Generation)
  - deux syntaxes : compacte (.rnc) ou XML (.rng)
  - lié historique à la TEI
  - simple, souple et très largement utilisé, y compris par d'autres langages XML normés (Docbook, OpenDocumentFormat, EAD3)
- Schematron
  - une version 1.0 sous iso
  - définit des tests et contraintes de contenu absentes des autres langages, grâce à XPath, qui permet de se concentrer sur des parties spécifiques du document et de le confronter à des données structurées extérieures

### Combiner les schémas?
Pour un projet, on travailler avec un ou plusieurs schémas; par exemple, en RelaxNG pour définir les éléments et les attributs, mais avec les types XSD et des contraintes Schematron.
Dans le repository, vous avez des exemples de schémas faits pour DHARMA:
- RelaxNG en format XML, avec des lignes de schématrons
- Schématron autonome avec des ajouts de Schematron Quick Fix.

## Penser son schéma
Fabriquer son schéma revient à établir une modélisation particulière du modèle TEI. Il doit être conforme à ce modèle de départ, tout en étant adapté à votre corpus et à ses objectis.
Nous synthètisons et suivons ici les grandes lignes et étapes données par [Jean-Baptiste Camps](https://halshs.archives-ouvertes.fr/cel-01706530).

### Quelques éléments pour établir son modèle
- définir des éléments en partant des sources et des informations qu'elles comportent
- définir le contenu des documents, pour faciliter le travail d'encodage, assurer l'homogéneïté et ainsi permettre les traitements
ultérieurs
- en cas de création de nouveaux éléments, utliser des noms clairs aux définitions explicites
- établir une documentation
- Ce n'est pas seulement un modèle théorique et abstrait, il doit être confronté aux sources et évoluer en cas de beosin

### Modifications possibles du modèle TEI lors de la création de son schéma
1. suppression d'éléments
2. changement de nom d'éléments (*unclean modification*)
3. modification d'un modèle de contenu
4. modification d'une liste d'attributs ou de valeurs
d'attributs, d’un type de contenu
5. modification de l'appartenance à une classe
6. ajout de nouveaux éléments

## ODD
Lorsque l'on travaille avec la TEI, nous sommes rapidement confronté à l'ODD: *One Document Does it all*.  Il s'agit d'un document qui centralise la documentation, le schéma de validation d'un projet, et parfois les règles de transformation et à partir duquel on génére ou regénerer plusieurs formats aussi bien pour la documentation (en xhtml, pdf, odt, epub, docx ...) que pour les schémas (RelaxNG XML ou compact, XML Schema ou DTD).

* * *
NB: Cet ODD peut se présenter avec une extension de fichier `.odd`, mais le plus souvent il se trouve en format `.xml` ce qui pourrait faire émerger des confusions lorsque l'on recherche un fichier.
* * *

### Créer un ODD
Il est assez rare que l'on crée un fichier ODD à la main et *ex nihilo*. Quelques outils ont été mis en place pour faciliter son écriture:
-  [Roma](https://roma.tei-c.org/), un outil maintenu par la TEI pour faire des schémas et des documentations en différents formats. Il est recommandé de faire une sauvegarde ODD, car l'outil ne prend que ce format en entrée, et est donc nécessaire pour travailler ces schémas en plusieurs séances de travail ou juste pour faire des reprises.  
-  Utiliser les feuilles de style [oddbyexample](https://github.com/TEIC/Stylesheets/blob/dev/tools/oddbyexample.xsl) pour créer un fichier ODD
