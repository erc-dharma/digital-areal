# Transformer un fichier XML-TEI

La transformation d'un fichier XML-TEI s'effectue majoritairement par XSLT 2.0, mais peut aussi se faire par XQuery, si l'on travaille avec une base de données XML.

## XSL
Le langage XSL, *XML Stylesheet Language*, a été conçu pour transformer des documents XML vers d'autres formats. En cours de développement, le projet a été divisé en deux unités: la XSLT et la XSL-FO pour faciliter le travail.  

### XSLT
La XSLT, *XML Stylesheet Language Transformation*, est un langage pour transformer le document XML. En tant que langage de l'environnement XML, il est capable de transformer tous les fichiers XML dans un autre format XML, et parfois dans des formats extérieurs au monde XML, mais pas avec le même degré de facilité ni de réussite.
Une feuille de style XSLT est un document XML qui peut lui-même être manipulé ou produit par d'autres feuilles de style.

La feuille de style se présente comme une série de règles, appliquées à un fichier XML par un processeur.
En SHS, on utilise surtout la XSLT 2.0, même si une version 3 est sortie en 2007.

### XSL-FO
La XSL-FO, *XML Stylesheet Language - Formatting Objets*, prend en charge la mise en page du document, surtout lors de la production de PDF. Dans ce cas, le processus fonctionne en deux étapes:   
  1- le document XML est transformé en un fichier lisible pour la XSL-FO par la XSLT  
  2- il est ensuite converti en un document imprimable par un processeur FO.

### Modèle de traitement
La transformation prend en compte les nœuds du fichier XML source. Chaque règle, c'est-à-dire chaque segment de la XSLT, s'applique sur un nœud qui produit un fragment du document de sortie, puis tous les fragments sont assemblés pour former le document final.  
Le processus de transformation applique des règles sur des nœuds dits **actifs** du documents source. Au départ, seule la racine est active, et la règle associée doit être écrite pour entraîner à la suite les autres nœuds. La transformation se termine lorsqu'il n'y a plus de nœuds actifs.  
Si l'on reprend la structure en arborescence déjà évoquée, cela revient à parcourir l'arbre XML, à la nuance près qu'en XSLT, le traitement d'un nœud n'entraîne pas systématiquement la transformation de ses enfants. Ceux-ci peuvent être transformés à part ou ignorés, selon les règles écrites.    

### Traitements des espaces
Avant même de commencer à appliquer les règles de transformation, le processeur XSLT fait systématiquement un premier passage de nettoyage des espaces. Cela consiste à supprimer les nœuds textuels vides, c'est-à-dire ne comprenant que des caractères d'espacement. Si le nœud contient au moins un autre caractère, il est conservé. Il est évidemment possible de prévenir ce traitement sur des parties du fichier XML-TEI en utilisant l'attribut `@xml:space` ou en donnant des règles particulières à la XSLT.  
Néanmoins, il y a certains comportements dans le traitement des espaces:
- lorsque plusieurs espaces se suivent, ils sont réduits à un unique espace. On appelle cela le `collapsing`.
- les processeurs coupent les espaces, s'ils existent, après la balise d'ouverture, et avant la balise de fermeture. Cette règle peut donc poser des problèmes dans les affichages en particulier sur des contenus très structurés ou lorsqu'il a du contenu mixte. Cette instruction s'appelle le `trimming`.

```
   <p>The <emph>cat</emph> ate the <foreign>grande croissant</foreign>. I didn't!</p>
```
[source](https://wiki.tei-c.org/index.php/XML_Whitespace)

Prenons pour exemple cette phrase, les algorithmes des processeurs XML vont la traiter selon les étapes suivantes:
- `collapsing` réduisent les espaces
- `trimming`
  - si le premier caractère est un espace dans le premier nœud texte
  - si le dernier caractère est un espace dans le dernier nœud texte
  - supprime les deux dans les cas, où un nœud parent débute et se termine par un nœud texte
et permettent le résultat suivant:
```
The cat ate the grande croissant. I didn't!
```
Mais si l'on vient modifier la position des espaces par rapport aux balises, nous n'obtenons plus la même chose.
```
   <p>The<emph> cat </emph>ate the <foreign>grande croissant</foreign>. I didn't!</p>
```
Le résultat est :
```
Thecatate the grande croissant. I didn't!
```
puisque les espaces avant et après la chaîne de caractères "chat" vont être supprimés.

### Exemple d'une feuille de style XSLT
Exemple d'une règle pour l'élément racine d'un fichier XML ARIE dans une transformation en HTML, dont le résultat complet est accessible sur [erc-dharma](https://erc-dharma.github.io/arie/).
```
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="html" indent="no" encoding="UTF-8"/>

    <xsl:template match="doc">
        <xsl:element name="html">
            <xsl:call-template name="dharma-head"/>
            <xsl:element name="body">
                <xsl:attribute name="class">font-weight-light</xsl:attribute>
                <xsl:call-template name="nav-bar"/>
                <xsl:element name="div">
                    <xsl:attribute name="class">container</xsl:attribute>
                <xsl:apply-templates/>
                    <xsl:element name="footer">
                        <xsl:attribute name="class">footer mt-auto py-3</xsl:attribute>
                        <xsl:element name="div">
                            <xsl:text>©ARIE. Online display made available by DHARMA</xsl:text>
                        </xsl:element>
                    </xsl:element>
                    <xsl:call-template name="dharma-script"/>            
                </xsl:element>  
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
```    

## Produire une page Web
Une page Web mobilise en réalité plusieurs langages dont l'ensemble est interprété par le navigateur Web. Dans les bonnes pratiques, on sépare les différents composants:
- structure avec le HTML
- mise en page et stylage avec la CSS  
- les scripts avec le JavaScript

### Comment générer une page HTML avec une XSLT
Il y a plusieurs solutions pour appliquer une transformation à un fichier : lignes de commandes, l'automatisation par le biais de scripts, certains éditeurs disposent d'aide au lancement, etc.

#### Transformation locale: utiliser son navigateur Web
Une transformation en XSLT peut être effectuée avec certains navigateurs Web: IE, Mozilla/Firefox et Opera. Il faut s'assurer dans ce cas de déclarer la XSLT dans le fichier XML, à l'aide d'instructions de traitement.
A l'inverse, d'autres navigateurs, comme Chrome, refusent de les exécuter et il faut alors déposer les XLST sur des serveurs ou les générer à partir d'un serveur local.

* * *
NB: Le résultat n'est pas toujours des plus propres, ni des plus complets, selon la manière dont la CSS et le JavaScript sont rattachés à la XSLT ou selon leur accessibilité.
* * *  

#### Transformation locale: lancer une transformation avec éditeur
Nous allons le faire avec Oxygen. Voici un petit pas à pas pour paramétrer une XSLT
- `Document>Transformation>Configure Transformation Scenarios...` ou `Configure Transformation Scenarios` dans la barre d'outils
![Configure transformation scenario](/assets/images/transformationScenario01.png)
- Créer un nouveau scénario ![Click on new](/assets/images/transformationScenario02.png)
- Sélectionner `XML transformation with XSLT`![Click on XML transformation with XSLT](/assets/images/transformationScenario03.png)
- Dans l'onglet XSLT
  - Choisir un nom pour la transformation, sinon le nom par défaut sera le nom du fichier XML.
    - Mettre la valeur `${currentFileURL}` dans le champ XML URL
    - Dans le champ XSL URL, sélectionner `xslt/affichage.xsl` ![Parameters to transformation a file](/assets/images/transformationScenario04.png).
    - Sélectionner un processeur de transformation Saxon, selon la version disponible dans Oxygen. `Saxon-PE` est la version professionnelle, mais HE ou EE ne font pas de différence à notre niveau d'usage. ![Select a transformateur](/assets/images/transformationScenario04.png).
- Dans l'onglet Output
    - Cliquer sur `save as`, vous pouvez choisir le dossier que vous souhaitez. Vous pouvez nommer le fichier comme vous le souhaitez ou bien utiliser les variables disponibles dans Oxygen. En général, j'utilise `${cfn}`, le nom de fichier sans extension et j'ajoute `.html`, et selon les besoins j'utilise aussi la variable date `${date(yyyy-MM-dd)}`.
    - Cliquer sur `Òpen in Browser/System Application` et sur `Saved file`. ![Parameters the output file](/assets/images/transformationScenario06.png)
- Pour lancer une transformation, il suffit d'ouvrir le fichier XML de votre choix et de cliquer sur le bouton `Apply the Transformation(s) scenario(s)`.![Run the transformation](/assets/images/transformationScenario07.png)

### Comment ça se passe sur un site?
Il n'y a pas vraiment de règles uniques, tout dépend des technologies utilisées par les projets et des choix qui ont été faits.

Avec un site statique, c'est-à-dire un site qui fonctionne avec des pages HTML pré-générées, les pages sont transformées en amont, puis mises en ligne. C'est le cas dans les pages GitHub du projet DHARMA par exemple. Notre transformation s'effectue en lot et de manière automatique sur les serveurs de Github et on récupère l'ensemble via les fonctionnalités des pages Github, et par un script en JavaScript qui fait appel à l'API (interface de programmation d'application).  
Dans cette solution, nous utilisions un *pipeline* écrit avec ANT qui produit les HTML et les stockent sur les repositories, afin de permettre aux membres de notre projet de pouvoir les consulter et les partager, même sans connexion internet. Cette solution permet aussi à nos membres, qui n'utilisent pas Oxygen, d'avoir accès aux éditions visualisées, par le biais du site.  

 Nous aurions pu utiliser une solution JavaScript pour les générer au fur et à mesure et du côté "client". Cette solution est plus légère en terme de stockage, car les visualisations HTML sont produites sur demande, avec le chargement de la page. En utilisant, ce type de logique, nous aurions été plus proches d'un site dynamique. Dans le cadre de ce type de site, il est aussi possible de générer au fur et à mesure les pages du côté du serveur, lorsqu'un utilisateur en fait la demande. La transformation se fait alors en PHP ou en Xquery, soit en faisant lui-même appel une XSLT stockée sur le serveur, soit directement par ce langage de requête spécialement conçu pour le XML.
