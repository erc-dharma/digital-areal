# Commencer avec l'XML
XML : eXtensible markup language. Il s'agit d'un language à balise, comme latex, l'html ou même le markdown.

```
exemple d'\emph{italique} en laTex
exemple d'<i>italique</i> en htlm
exemple d'*italique* en markdown
```

## Définition
XML est un métalangage, standardisé par une norme de W3C, qui repose principalement sur du texte, c’est-à-dire qu’il est construit avec des characters ASCII (*American Standard Code for Information Interchange*). Il ne propose pas de balise prédéfinie, mais met en place un ensemble de règles déterminant si un fichier est bien formé (*well-formed*) et valide. Il permet ainsi de définir son propre jeu de balises.

```
<monExemple>
  <partie1>
    <paragraph>mon paragraph</paragraph>
    </partie1>
  <partie2>ma partie 2</partie2>
</monExemple>
```

## Pourquoi utiliser l'XML?
C'est un langage facile à adapter pour les documents textuels, mais aussi pour des bases de données. Il dispose d'une importante communauté d'utilisateurs, notamment dans les sciences humaines.
Mais ce n'est pas un langage de programmation, ni de gestion de bases de données.
- Il est stable et pérenne
- Il est lisible par l'humain et l'ordinateur
- Il a de multiples usages: mise en forme, exploitation et réutilisation.
- Il dispose d'un environnement de travail et de technologie, stable et développé
  - feuilles de styles: **CSS**, **XSL-FO**
  - localiser et identifier des parties du document: **Xpath**
  - lier des parties de document: **Xlink**
  - combiner plusieurs documents: **XInclude**
  - interroger les documents comme dans une base de données: **XQuery**
  - transformations: **XSLT**

## Les éléments
### La syntaxe
Un élément se signale par des chevrons et se compose de deux parties :   
- la première partie de l'élément (*balise ouvrante*) se forme : **`<` + nom + `>`**  
- la partie qui vient le terminer (*balise fermante*) : **`<` + `/` + nom + `>`**  
Les noms d'éléments doivent toujours se limiter à des caractères latins basiques définis par l'ASCII, soit des caractères alphnumériques. Les seuls caractères de ponctuation autorisés sont le point `.`, le tiret `-` et l'*underscore* `_`. Ils peuvent être en minuscules ou en majuscules. Le nom doit être identique dans les deux parties de la balise, d'autant qu'il est sensible à la case.

Un élément peut contenir du texte (*PCDATA*)
```
<jour>Lundi</jour>
```

Du contenu mixte
```
<personne>
  <prenom>Jean</prenom>
  <nom>Dupont</nom>
</personne>
```
Tout ce qui en compris entre les deux parties de la balise forme le contenu de celle-ci.   
Un élément peut aussi être vide.
```
<pb/>
```
Un élément vide fusionne les deux parties de la balise en une seule: : **`<` + nom + `/` + `>`**  

### Quelques règles d'usage
Les éléments ne peuvent pas s'entrecroiser ou se chevaucher. Les éléments doivent être fermés afin de respecter l'arborescence.

**XML mal formé**:
```
<personne>
  <nom>Dupont</personne>
  </nom>
```

**XML bien formé**:
```
<personne>
  <nom>Dupont</nom>
</personne>
```

Si deux éléments ont un contenu commun, alors l'un doit être inclus dans l'autre.
**XML mal formé**:
```
<texte>
 <paragraph>Un premier paragraphe avec un exemple d'<gras>xml</paragraph>
 <paragraph>Mal formé</gras> qui se poursuit sur le second</paragraph>
</texte>
```
**XML bien formé**:
```
<texte>
 <paragraph>Un premier paragraphe avec un exemple d'<gras>xml</gras></paragraph>
 <paragraph><gras>Bien formé</gras> qui se poursuit sur le second</paragraph>
</texte>
```
Parfois, il est nécessaire de segmenter certains éléments pour respecter la hiérarchie de la structure.

## Les attributs
Les attributs se mettent dans la première partie de la balise (*balise ouvrante*) et se distinguent du nom de la balise par l'ajout d'un **espace**, puis le nom de l'attribut suivi par un signe égal `=`. Sa valeur est donnée entre guillemets. Ils peuvent être simple ou double, même si les conventions favorisent le double guillemet droit `"` : **attribut + `=`+`"` + valeur +`"`**
Un attribut fonctionne toujours par paire: le nom et la valeur, qui doit au moins correspondre à un caractère.
```
<nom type="lieu">Fréjus</lieu>
<nom type='lieu'>Fréjus</lieu>
```

Il n'y a pas de limites au nombre d'attributs, mais il est nécessaire d'ajouter un **espace** entre chaque attribut pour les séparer.
```
<nom type="lieu" subtype="reel">Fréjus</lieu>
<nom type="lieu" subtype="fictif">Atlantide</lieu>
```
Il n'y a pas non plus de limites au nombre de valeurs que peut contenir un attribut, on les distingue aussi par un **espace**.
 ```
<hi rend="souligne gras italique">mon texte à mettre en forme</hi>
 ```
Il n'y a pas d'ordre nécessaire entre les attributs lorsqu'il y en a plusieurs, ni dans les valeurs d'attributs.

## Règles d'héritage
Un document XML se présente sous la forme d'une arborescence. Tout le corps du document doit être compris dans le contenu d'un unique élément appelé élément **racine**. En TEI, il s'agit de la racine/balise: `<TEI>`.
Exemple de l'arbre XML minimal de la TEI:
![TEI Tree](/assets/images/tei-tree.png)

Exemple de l'arbre XML minimal d'Epidoc:
![Epidoc Tree](/assets/images/epidoc-tree.png)

```
<parent xml:lang="eng">
  <sibling1> ... </sibling1>
  <sibling2> ... </sibling2>
  <self>
    <child1> ... <desc1></desc1> ... <desc2 xml:lang="fra"></desc2> ... </child1>
    <child2> ... </child2>
    <child3> ... <desc3><desc4> ... </desc4></desc3> ... </child3>
  </self>
  <sibling3> ... </sibling3>
</parent>
```
![Liens de parenté en XML](/assets/images/parente.png)
*[source](https://www.irif.fr/~carton/Enseignement/XML/Cours/support.html#idm140605729164112)*

Dans l'exemple ci-dessus, le contenu de l'élément `<self>` s'étend de la balise ouvrante `<child1>` jusqu'à la balise de fin `</child3>`. Il comprend tous les éléments `<child1>`, `<child2>` et `<child3>` ainsi que les éléments `<desc1>`, `<desc2>`, `<desc3>` et `<desc4>`. Tous les éléments qu'il contient sont appelés *descendants* de l'élément self.
Parmi ces *descendants*, les éléments child1, `<child1>`, `<child2>` et `<child3>`qui sont directement inclus dans `<self>` sans élément intermédiaire sont appelés les *enfants* de l'élément `<self>`. Inversement, l'élément *parent* qui contient directement `<self>` est appelé le *parent* de l'élément `<self>`. Les autres éléments qui contiennent l'élément `<self>` sont appelés les *ancêtres* de l'élément `<self>`. Les autres *enfants* `<sibling1>`, `<sibling2>` et `<sibling3>` de l'élément *parent* sont appelés les *frères* de l'élément `<self>`.

Les attributs déclarés sur les éléments *ancêtres* ou *parents* sont transmis aux éléments *enfants*, ainsi qu'à tous les *descendants*. Ainsi l'attribut `@xml:lang` s'appplique à tous les éléments contenus par `<parent>`. Cela signifie que tous ont du contenu en anglais, sauf l'élément `<desc2>` qui porte son propre attribut `@xml:lang` et qui par conséquent remplace l'anglais par le français.

* * *
NB: Ces principes d'héritages des attributs par les *descendants** d'un élément permettent d'éviter les répétitions des attributs et de leur valeur. Néanmoins, il faut faire attention qu'un élément n'hérite pas de caractèristiques que nous ne souhaitons pas lui attribuer.
* * *

## Faire des commentaires dans un fichier XML
Il est possible d'ajouter des commentaires dans votre fichier.
Le commentaire est encadré par des chevrons. La partie d'ouverture se distingue par l'ajout d'un point d'exclamation suivi par deux tirets, la partie de fermeture par deux tirets seulement.

```
<!-- votre commentaire -->
```

Il n'y a pas de restriction sur l'usage des commentaires, mais
- ils ne peuvent être utilisés avant la declaration XML
- ils ne peuvent pas apparaître dans les valeurs d'attributs
- ils ne peuvent pas être imbriqués les uns dans les autres.

* * *
NB: Il faut néanmoins faire attention à l'usage des commentaires, ils ont tendance à générer des espaces ou des erreurs lors des transformations des fichiers d'un format à l'autre.
* * *

## Caractères spéciaux en XML  
Certains caractères spéciaux ont besoin d'être échappés afin de ne pas se confondre avec les éléments formant la syntaxe du XML, comme les chevrons par exemple.  
En XML, il y a 5 éléments avec des valeurs prédéfinies qui s'échappent en débutant avec une esperluette et en terminant avec un point-virgule: `&`+ nom+`;`.

|nom|caractère|description|échappement|
|:-----:|:-----:|:-----:|:-----:|
|quot|"|Guillemet droit, délimiteur d'attribut en XML|`&quot;`|
|amp|&|Esperluette (« et commercial »), délimiteur de référence en XML|`&amp;`|
|apos|'|Apostrophe, délimiteur d'attribut en XML|`&apos;`|
|lt|<|Signe inférieur à, délimiteur de balise en XML|`&lt;`|
|gt|>|Signe supérieur à, délimiteur de balise en XML|`&gt;`|

## La déclaration XML
Un fichier XML, TEI ou non, débute toujours par la déclaration XML. Elle se signale par des chevrons et des points d'interrogation. Tout de suite après le point d'interrogation du début doit se trouver xml (en minuscules). Elle peut se composer de plusieurs mentions qui reprennent la syntaxe des attributs.
- la déclaration de la version: `version="1.0"` (mention obligatoire)
- la déclaration de l'encodage des caractères: `encoding="utf-8"` (recommandée)
- enfin, `@standalone` pour signaler la localisation du schéma, c'est-à-dire s'il existe des déclarations externes qui affectent le document ou si le fichier fonctionne de manière autonome. Avec `standalone="yes"` vous mentionnez que la DTD (*Document Type Definition*) se trouve dans le fichier actuel. Avec `standalone="no"` vous faites savoir que la DTD se trouve dans un fichier séparé. Dans ce cas, vous devez mentionner la source à l'aide de la déclaration de type de document. (Rarement utilisé)

Si vous utilisez tous ces attributs, il y a un ordre à respecter. Il s'agit d'un des rares cas en XML pour lequel l'ordre des attributs à de l'importance pour le système.
```
<?xml version="1.0" encoding="utf-8"?>
```

Exemple avec une DTD interne
```

<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!DOCTYPE Bonjour [
  <!ELEMENT Bonjour (#PCDATA)>
]>
<Bonjour>Salut Jupiter!</Bonjour>
```

**Notez que la déclaration XML ne contient pas de barre oblique pour fermer la balise.**

## Instructions de traitement
Les instructions de traitement sont des lignes à destination du logiciel/éditeur de codes. Elles s'écrivent sur le même modèle que la déclaration xml avec des chevrons suivis par des points d'interrogation.   
Les plus courantes permettent de déclarer le ou les schémas de validation ou encore une feuille de style de transformation.

Exemple de la déclaration des schémas pour les inscriptions dans le projet DHARMA
```
<?xml-model href="https://raw.githubusercontent.com/erc-dharma/project-documentation/master/schema/latest/DHARMA_Schema.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="https://raw.githubusercontent.com/erc-dharma/project-documentation/master/schema/latest/DHARMA_Schema.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="https://raw.githubusercontent.com/erc-dharma/project-documentation/master/schema/latest/DHARMA_SQF.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
```

Exemple avec une feuille de style XSLT
```
<?xml-stylesheet href="transformation.xsl" type="text/xsl"?>
```

Exemple avec une feuille de style CSS
```
<?xml-stylesheet href="style.css" type="text/css"?>
```

Plusieurs attributs sont possibles. Il faut au moins l'attribut `@href`. Celui-ci peut contenir:
- une URL
- le chemin relatif entre votre xml et le fichier (par rapport à votre position dans l'ordinateur)
- le chemin absolu depuis la racine de l'ordinateur vers le fichier (par rapport à la racine de l'ordinateur)
Selon la technologie mobilisée, il peut-être nécessaire de déclarer une URI pour l'identifier. C'est le cas avec les schémas et l'attribut `@schematypens` notamment.

* * *
NB: Les schémas permettent de valider l'encodage de votre fichier selon les règles spécifiques que vous avez fixées pour votre projet.
Il existe plusieurs technologies: DTD, xml schema, Relax NG, Schematron.
**Un projet d'édition numérique en TEI se doit d'avoir son schéma et sa documentation**
* * *

## Rapide point sur les espaces en XML
En XML, quatre caractères sont considérés comme des espaces: le retour à la ligne, l'indentation de tabulation, le passage à la ligne et l'espace classique.
Dans les documents XML, vous retrouverez à la fois des *espaces signifiants* et des *espaces insignifiants* utilisés afin de rendre le contenu plus lisible. En l'absence d'un schéma, on considère par défaut tous les espaces comme ayant leur importance.
La présence de plusieurs espaces entre le nom d'un élément et un attribut par exemple n'est pas un soucis:

```
<title     type = "main" >
```
mais l'absence d'espace est faux.

```
<titletype = "main" >
```

 De même dans les contenus textuels, les espaces sont particulièrement important. En XML,
```
 <name>EmmanuelFrancis</name>
```
et
```
<name>Emmanuel Francis</name>
```
ne sont donc pas équivalents. Mais le même exemple avec les différents types d'espaces reconnus peuvent être considérés comme identiques.
```
<name>Emmanuel Francis</name>
```
```
<name>Emmanuel
Francis</name>
```
```
<name>Emmanuel    Francis</name>
```
De nombreux processeurs XML sont en mesure de supprimer les espaces en avant et après le contenu textuel. Ainsi
```
<name>   Emmanuel Francis</name>
```
```
<name>
Emmanuel Francis</name>
```
```
<name>
Emmanuel
Francis
</name>
```
sont considérés comme des équivalents de  `<name>Emmanuel Francis</name>`.
Néanmoins, il vaut mieux normaliser les espaces, si possible pour éviter les conflits et les erreurs au moment de la transformation, pour lesquels quelques explications sont données dans la partie (transformation)[https://erc-dharma.github.io/digital-areal/6_transformation] du site.

## Vers un document XML bien formé et valide
C'est deux notions sont essentielles pour obtenir un fichier exploitable.

### Vers un XML bien formé
Pour avoir un document XML bien formé, il faut qu'il respecte tous les préceptes de la syntaxe XML:
- une déclaration XML ;
- un ou plusieurs éléments ;
- un élément racine encapsulant tous les autres éléments et leurs attributs (`<TEI> ... </TEI>`) ;
- les éléments ont une balise de début et de fin ;
- les éléments sont correctement imbriqués (`<P> <EM> ... </EM> </P>`) ;
- les deux parties de la balise ont toutes les deux le même nom;
- les éléments vides sont bien fermés par le `/`;
- un attribut apparaît uniquement dans la balise ouvrante et une seule fois dans cette balise ;
- les valeurs des attributs sont entre guillemets (simple ou double) ;
- les caractères spéciaux sont échappés ;

### Vers un XML valide
Un document valide est un document en conformité avec une grammaire préétablie. Il suppose donc que le modèle d'encodage soit déclaré dans une DTD ou un schéma.
Pour avoir un document valide, il faut qu'un modèle soit déclaré. Dans le cas de la TEI, cela signifie qu'une référence doit être faite à un schéma:
- il est bien formé
- il est conforme au schéma auquel il fait référence (DTD ou autre)

* * *
NB: Un fichier XML bien-formé et valide ne veut pas pour autant dire que le fichier ne contient pas d'erreurs. Cela veut dire qu'il est au moins conforme aux règles de syntaxe de l'XML et qu'il suit l'ensemble des règles exprimées dans le schéma. Il peut donc y avoir du contenu que vous avez oublié de tester.
* * *

## Conclusion
1- L'XML est une métalangue qui repose sur le balisage sémantique et structuré du contenu.  
2- L'XML est un ensemble de règles qui détermine ce que doit être un document bien formé et valide. Il ne donne pas de vocabulaire caractérisé mais permet d'en créer.  
3- Il peut s'appliquer à toutes sortes de données textuelles, mais il n'est pas pour autant la réponse à tout. Il faut songer dès l'élaboration de l'encodage aux attentes et enjeux pour l'utilisation finale et surtout à l'exploitation des données.
