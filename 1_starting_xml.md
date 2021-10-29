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

## Les éléments
Un élément se signale par des chevrons et compose de deux parties :   
- la première partie de l'élément se forme : **`<` + nom + `>`**  
- la partie qui vient le terminer : **`<` + `/` + nom + `>`**  

Un élément peut contenir du texte (PCDATA)
```
<jour>Lundi</jour>
```

Du contenu mixte
```
<person>
  <prenom>Jean</prenom>
  <nom>Dupont</nom>
</person>
```

ou peut-être vide
```
<pb/>
```
Un élément vide fusionne les deux parties de la balise en une seule: : **`<` + nom + `/` + `>`**  

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
Arboresence

## Faire des commentaires dans un fichier XML
Il est possible d'ajouter des commentaires dans votre fichier.
Le commentaire est encadré par des chevrons. La partie d'ouverture se distingue par l'ajout d'un point d'exclamation suivi par deux tirets, la partie de fermeture par deux tirets seulement.

```
<!-- votre commentaire -->
```

## Caractères spéciaux en XML  
Certains caractères spéciaux ont besoin d'être échappé afin de ne pas se confondre avec les éléments formant la syntaxe du XML, comme les chevrons par exemple.
En XML, il y a 5 éléments avec des valeurs prédéfinies qui s'échappent en débutant avec une esperluette et en terminant avec un point-virgule: `&`+ nom+`;`

|nom|caractère|description|échappement|
|:-----:|:-----:|:-----:|:-----:|
|quot|"|Guillemet droit, délimiteur d'attribut en XML|`&quot;`|
|amp|&|Esperluette (« et commercial »), délimiteur de référence en XML|`&amp;`|
|apos|'|Apostrophe, délimiteur d'attribut en XML|`&apos;`|
|lt|<|Signe inférieur à, délimiteur de balise en XML|`&lt;`|
|gt|>|Signe supérieur à, délimiteur de balise en XML|`&gt;`|

## Vers un document XML bien formé et valide
