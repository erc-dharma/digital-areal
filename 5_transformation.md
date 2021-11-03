# Transformer un XML-TEI en une page web

La transformation d'un fichier XML-TEI s'effectue majoritairement par XSLT 2.0, mais peut aussi se faire par XQuery, si l'on travaille avec une base de données XML.

## XSL
Le langage XSL, XML Stylesheet Language, a été conçu pour transformer des documents XML en d'autres formats. En cours de développement, le projet a été divisé en deux unités: la XSLT et la XSL-FO.  

### XSLT
La XSLT, XML Stylesheet Language Transformation, est un langage pour transformer le document XML. Il est capable de transformer tous les fichiers XML dans un autre format XML.
C'est un langage de l'environnement  XML. Ceci signifie qu'une feuille de style XSLT est un document XML qui peut lui-même être manipulé ou produit par d'autres feuilles de style.

La feuille de style se présente comme une série de règles, appliquées à un fichier XML par un processeur.
En SHS, on utilise surtout la XSLT 2.0, même si une version 3 est sortie en 2007.

### XSL-FO
La XSL-FO, XML Stylesheet Language - Formatting Objets, prend en charge la mise en page du document, surtout lors de la production de PDF. Dans ce cas, le processus fonctionne en deux étapes:   
  1- le document XML est transformé en un fichier lisible pour la XSL-FO par la XSLT  
  2- il est ensuite converti en un document imprimable par un processeur FO.

### Modèle de traitement
La transformation prend en compte les nœuds du fichier XML source. Chaque règle s'applique sur un nœud qui produit un fragment du document de sortie, puis tous les fragments sont assemblés pour former le document final.  
Le processus de transformation applique des règles sur des nœuds dits actifs du documents source. Au départ, seule la racine est active, qui entraîne à sa suite d'autres nœuds. La transformation se termine lorsqu'il n'y a plus de nœuds actifs.  
Si on reprend la structure en arborescence déjà évoqué, cela revient à parcourir cet arbre, à la nuance qu'en XSLT le traitement d'un nœud n'entraîne pas systématique la transformation de ses enfants, dont dépend des instructions que l'on établit.   

### Traitements des espaces
Un premier passage de nettoyage des espaces est systèmatiquement réalisé par les processeurs XSLT. Cela consiste à supprimer les nœuds textuels vides, c'est-à-dire ne comprenant que des espaces et autres caractères d'espacement. Si le nœud contient au moins un autre caractère, il est conservé. Il est évidemment possible de prévenir ce traitement sur des parties du fichier XML-TEI en utilisant l'attribut `@xml:space` ou en donnant des règles particulières à la XSLT.

Exemple d'un extrait d'une transformation en html pour le fichier ARIE, dont le résultat complet accessible sur [erc-dharma](https://erc-dharma.github.io/arie/).
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
Une page web mobilise en réalité plusieurs langages dont l'ensemble est interprété par le navigateur web. Dans les bonnes pratiques, on sépare les différents composants
- structure avec le HTML
- mise en page et stylage avec la CSS  
- les scripts avec le javaScript

### Comment générer une page html avec une XSLT
Il y a plusieur solutions pour appliquer une transformation à un fichier : lignes de commandes, l'automatisation par le biais de script, certains éditeurs disposent d'aide au lancement...

#### Transformation locale: utiliser son navigateur web
Une transformation en XSLT peut être effectué avec certains navigateurs web: IE, Mozilla/Firefox et Opera. A l'inverse, d'autres navigateurs, comme Chrome, refusent de les exécuter et il faut les déposer sur des serveurs, ou générer un serveur local.
Il faut s'assurer dans ce cas de déclarer la XSLT dans le fichier XML, à l'aide d'instructions de traitement.

* * *
NB: Le résultat n'est pas toujours le plus propre, ni le plus complet, selon la manière dont la CSS et le javascript peuvent être connectés à la XSLT.
* * *  

#### Transformation locale: lancer une transformation avec éditeur
Nous allons le faire avec Oxygen.
- `Document>Transformation>Configure Transformation Scenarios...` ou `Configure Transformation Scenarios` dans la bar d'outils
![Configure transformation scenario](/assets/images/transformationScenario01.png)
- Créer un nouveau scénario ![Click on new](/assets/images/transformationScenario02.png)
- Sélectionner `XML transformation with XSLT`![Click on XML transformation with XSLT](/assets/images/transformationScenario03.png)
- Dans l'onglet XSLT
  - Choisir un nom pour la transformation, sinon le nom par défaut sera le nom du fichier XML.
    - Mettre la valeur `${currentFileURL}` dans le champ XML URL
    - Dans le champ XSL URL, sélectionner `xslt/affichage.xsl` ![Parameters to transformation a file](/assets/images/transformationScenario04.png).
    - Sélectionner un processeur de transformation Saxon, selon la version disponible dans Oxygen. `Saxon-PE` est la version professionnelle, mais HE ou EE ne font pas de différences à notre niveau d'usage. ![Select a transformateur](/assets/images/transformationScenario04.png).
- Dans l'onglet Output
    - Cliquer sur `save as`, vous pouvez choisir le dossier que vous souhaitez. Vous pouvez nommer le fichier comme vous le souhaiter ou bien utiliser les variables disponibles dans Oxygen. En général, j'utilise `${cfn}`, le nom de fichier sans extension et j'ajoute `.html`, et selon les besoins j'aime bien utilise aussi la variable date `${date(yyyy-MM-dd)}`.
    - Cliquer sur `Òpen in Browser/System Application` et sur `Saved file`. ![Parameters the output file](/assets/images/transformationScenario06.png)
- Pour lancer une transformation, il suffit d'ouvrir le fichier XML de votre choix  et de cliquer sur le bouton `Apply the Transformation(s) scenario(s)`.![Run the transformation](/assets/images/transformationScenario07.png)

### Comment ça se passe sur un site?
Il n'y a pas vraiment de règles uniques: tout dépend des technologies utilisées par les projets et des choix qui ont été faits.

Avec un site statique, c'est-à-dire un site qui fonctionne avec des pages htmls pré-générés, les pages sont transformés en amont, puis mises en ligne. C'est le cas dans les pages gitHub du projet DHARMA par exemple. Notre transformation s'effectue en lot et de manière automatique sur les serveurs de github et on récupère l'ensemble via les fonctionnalités des pages github et de javascript par la biais de l'API (interface de programmation d'application). Nous aurions pu utilisé une solution javaScript pour les générer au fur et à mesure, et du côté "client".  

Dans le cadre d'un site dynamique, les pages peuvent être générés au fur et à mesure des demandes, la transformation peut se faire sur le serveur en php ou en XQuery par exemple.
