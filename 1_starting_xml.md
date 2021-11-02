# Starting with XML

XML : eXtensible markup language. Il s'agit d'un language à balise, comme latex, l'html ou même le markdown.

```
exemple d'\emph{italique} en laTex
exemple d'<i>italique</i> en htlm
exemple d'*italique* en markdown
```

## Définition
XML est un métalangage qui ne propose pas de balise prédéfinie, mais met en place un ensemble de règles pour déterminer si un fichier est bien formé ou s'il est valide. Il permet de définir son propre jeu de balise

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
Mais ce n'est pas un langage de programmation, ni de gestion des bases de données.
- Il est stable et pérenne
- Il est lisible par l'humain et l'ordinateur
- Il a de multiples usages: mise en fore, exploitation et réutilisation.
- Il dispose d'un environnement de travail et de technologie, stable et développé
  - feuilles de styles: CSS, XSL-FO
  - localiser et identifier des parties du document: Xpath
  - lier des parties de document: Xlink
  - combiner plusieurs documents: XInclude
  - interroger les documents comme dans une base de données: XQuery
  - transformations: XSLT

### Quelques exemples d'XML
- TEI pour l'édition scientifique
- EAD pour les descriptions archivistiques
- MEI pour les notations musicales
- MathXML pour les formules mathématiques

## Les éléments
### La syntaxe
Un élément se signale par des chevrons et compose de deux parties :   
- la première partie de l'élément se forme : **`<` + nom + `>`**  
- la partie qui vient le terminer : **`<` + `/` + nom + `>`**  

Un élément peut contenir du texte (PCDATA)
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

ou peut-être vide
```
<pb/>
```
Un élément vide fusionne les deux parties de la balise en une seule: : **`<` + nom + `/` + `>`**  

### Quelques règles d'usage:
Les éléments ne peuvent pas s'entrecroisés ou se chevaucher. Les éléments doivent être fermés afin de respecter l'arborescence.

**XML bien formé**:
```
<personne>
  <prenom>Jean</prenom>
  <nom>Dupont</nom>
</personne>
```
**XML mal formé**:
```
<personne>
  <nom>Dupont</personne>
  </nom>
```
Si deux éléments ont un contenu commun, alors l'un doit être inclus dans l'autre.
**XML mal formé**:
```
<texte>
 <paragraph>Un premier paragraphe avec un exemple d'<gras>xml</paragraph>
 <paragraph>Mal formé</gras> qui se poursuit sur le second</paragraph>
</texte>
```
Parfois, il est nécessaire parfois de segmenter certains élements pour respecter la hiérarchie de la structure.

## Les attributs
Les attributs se mettent dans la première partie de la balise et se distinguent du nom de la balise par l'ajout d'un **espace**, son nom suivi par un signe égal `"`. Sa valeur est donnée entre guillements, qui peuvent être simple ou double, même si les conventions favorisent le double guillement droit `"` : **attribut + `=`+`"` + valeur +`"`**
```
<nom type="lieu">Fréjus</lieu>
<nom type='lieu'>Fréjus</lieu>
```

Il n'y a pas de limites au nombre d'attributs. Il faut ajouter un **espace** entre chaque attribute attribut.
```
<nom type="lieu" subtype="reel">Fréjus</lieu>
<nom type="lieu" subtype="fictif">Atlantide</lieu>
```
 ni même au nombre de valeurs que peut contenir un attribut, on les distingue par un **espace**.
 ```
<hi rend="souligne gras italique">mon texte à mettre en forme</hi>
 ```
Il n'y a pas d'ordre nécessaire dans les attributs lorsqu'il y en a plusieurs, ni dans les valeurs d'attributs.

## Règles d'héritage
Un document XML se présente sous la forme d'une arborescence. Tout le corps du document doit être compris dans le contenu d'un unique élément appelé élément **racine**. En tei, il s'agit de la racine/balise: `<TEI>`.
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

Dans l'exemple ci-dessus, le contenu de l'élément self s'étend de la balise ouvrante <child1> jusqu'à la balise de fin </child3>. Ce contenu comprend tous les éléments child1, child2 et child3 ainsi que les éléments desc1, desc2, desc3 et desc4. Tous les éléments qu'il contient sont appelés *descendants* de l'élément self.
Parmi ces *descendants*, les éléments child1, child2 et child3 qui sont directement inclus dans self sans élément intermédiaire sont appelés les *enfants* de l'élément self. Inversement, l'élément *parent* qui contient directement self est appelé le parent de l'élément self. Les autres éléments qui contiennent l'élément self sont appelés les *ancêtres* de l'élément self. Les autres *enfants* sibling1, sibling2 et sibling3 de l'élément *parent* sont appelés les frères de l'élément self.


## Faire des commentaires dans un fichier XML
Il est possible d'ajouter des commentaires dans votre fichier.
Le commentaire est encadré par des chevrons. La partie d'ouverture se distingue par l'ajout d'un point d'exclamation suivi par deux tirets, la partie de fermeture par deux tirets seulement.

```
<!-- votre commentaire -->
```

Il n'y a pas de restrictions sur l'usage des commentaires, mais
- ils ne peuvent être utilisés avant la declaration XML
- ils ne peuvent pas apparaître dans les valeurs d'attributs
- ils ne peuvent pas être imbriqués les uns dans les autres.

## Caractères spéciaux en XML  
Certains caractères spéciaux ont besoin d'être échappé afin de ne pas se confondre avec les éléments formant la syntaxe du XML, comme les chevrons par exemple.  
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
- la declaration de la version: `version="1.0"` (mention obligatoire)
- la déclaration de l'encodage des caractères: `encoding="utf-8"` (recommendée)
- enfin standalone pour signaler la localisation du schéma.  Avec `standalone="yes"` vous mentionnez que la DTD se trouve dans le fichier actuel. Avec `standalone="no"` vous faîtes savoir que la DTD se trouve dans un fichier séparé. Dans ce cas, vous devez mentionner la source à l'aide de la déclaration de type de document. (Rarement utilisé)

Si vous utilisez tous ces attributs, il y a un ordre à respectet. Il s'agit d'un des rares cas en XML où l'ordre des attributs à de l'importance pour le système.
```
<?xml version="1.0" encoding="utf-8"?>
```

## Instructions de traitement
Les instructions de traitement sont deslignes à destinations du logiciel/éditeur de codes. Elles s'écrivent sur le même modèle que la déclaration xml avec des chevrons suivis par des points d'interrogation.   
Les plus courantes permettent de déclarer le ou les schémas de validation ou encore une feuille de style de transformation.

Exemple de la déclaration des schémas pour les inscriptions dans le projet DHARMA
```
<?xml-model href="https://raw.githubusercontent.com/erc-dharma/project-documentation/master/schema/latest/DHARMA_Schema.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="https://raw.githubusercontent.com/erc-dharma/project-documentation/master/schema/latest/DHARMA_Schema.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="https://raw.githubusercontent.com/erc-dharma/project-documentation/master/schema/latest/DHARMA_SQF.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
```

Exemple avec une DTD interne
```

<?xml version="1.0"?>
<!DOCTYPE Bonjour [
  <!ELEMENT Bonjour (#PCDATA)>
]>
<Bonjour>Salut Jupiter!</Bonjour>
```

Exemple avec une feuille de style XSLT
```
<?xml-stylesheet href="transformation.xsl"
   type="text/xsl"?>
```

Exemple avec une feuille de style css
```
<?xml-stylesheet href="style.css" type="text/css"?>
```

Plusieurs attributs sont possibles. Il faut au moins l'attribut `@href` qui peut contenir:
- une url
- un chemin relatif entre votre xml et le fichier (par rapport à votre position dans l'ordinateur)
- un chemin absolut entre votre xml et le fichier (par rapport à la racine de l'ordinateur)
Selon la technogolie mobilisée, il peut-être nécessaire de déclarer une uri pour l'identifier. C'est le cas avec les schémas et l'attribut `@schematypens` notammant.

* * *
NB: Les schémas permettent de valider l'encodage de votre fichier selon les régles spécifiques que vous avez fixé pour votre projet.
Il existe plusieurs technologies: DTD, xml schema, Relax NG, Schematron.
**Un projet d'édition numérique en TEI se doit d'avoir son schéma et sa documentation**
* * *

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
- les valeurs des attributs sont entre guillemets ou apostrophes ;
- les caractères spéciaux sont échappés ;

### Vers un XML valide
Un document valide est un document en conformité avec une grammaire préétabli. Il suppose donc que le modèle d'encodage soit déclaré dans une DTD ou un schéma.
Pour avoir un document valide, il faut qu'un modèle soit déclaré. Dans le cas de la TEI, cela signifie qu'une référence doit être faite à un schéma:
- il est bien formé
- il est conforme au schéma auquel il fait référence (DTD ou autre)

## Conclusion
1- L'XML est un métalangue qui repose sur le balisage sémantique et structuré du contenu.  
2- L'XML est un ensemble de règles qui détermine ce que doit être un document est bien formé et valide. Il ne donne pas de vocabulaire caractérisé mais permet d'en créer.  
3- Il peut s'appliquer à toutes sortes de données textuelles, mais il n'est pas pour autant la réponse à tout. Il faut songer dès l'élaboration de l'encodage aux attentes et enjeux pour l'utilisation finale et surtout à l'exploitation des données.
