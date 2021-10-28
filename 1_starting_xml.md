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

## Règles d'héritage
Arboresence 
