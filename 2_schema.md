# Introduction aux schémas

Si ce chapitre essaie de présenter toutes les principes à l'œuvre dans la création d'un schéma et leur fonctionnement général, il n'entre pas dans les détails concrets de leur création ni même de la syntaxe de leurs langages. Il a été envisagé pour comprendre les principes de la validation et comme une entrée vers le modèle général de la tei, un détour, certes abstrait, mais à notre avis nécessaire pour s'engager dans la voie de la TEI.

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
Un schéma définit un modèle de documents que l'on peut ensuite utilisé pour vérifier les documents produits, c'est-à-dire que l'on vérifie qu'un document respecte une liste de contraintes fixées. Les schémas sont apparus avec le passage à l'XML et ont été introduits pour combler certaines lacunes des DTD, dont l'utilisation était surtout concomittante avec le SGML. Leur modèle est normé par le W3C. Ils s'écrivent en suivant les régles de la syntaxe XML ce qui permet de les parser et de les transformer avec les mêmes technologies que les autres documents XML. Ils répondent en cela à une volonté d'établir une documentation lisible à la fois pour la machine et par l'homme.
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

## ODD
Lorsque l'on travaille avec la TEI, nous sommes rapidement confronté à l'ODD: *One Document Does it all*.  Il s'agit d'un document qui centralise la documentation, le schéma de validation d'un projet, et parfois les règles de transformation et à partir duquel on génére ou regénerer plusieurs formats aussi bien pour la documentation (en xhtml, pdf, odt, epub, docx ...) que pour les schémas (RelaxNG XML ou compact, XML Schema ou DTD).

* * *
NB: Cet ODD peut se présenter avec une extension de fichier `.odd`, mais le plus souvent il se trouve en format `.xml` ce qui pourrait faire émerger des confusions lorsque l'on recherche un fichier.
* * *

### Créer un ODD
Il est assez rare que l'on crée un fichier ODD à la main et *ex nihilo*. Quelques outils ont été mis en place pour faciliter son écriture:
-  [Roma](https://roma.tei-c.org/), un outil maintenu par la TEI pour faire des schémas et des documentations en différents formats. Il est recommandé de faire une sauvegarde ODD, car l'outil ne prend que ce format en entrée, et est donc nécessaire pour travailler ces schémas en plusieurs séances de travail ou juste pour faire des reprises.  
-  Utiliser les feuilles de style [oddbyexample](https://github.com/TEIC/Stylesheets/blob/dev/tools/oddbyexample.xsl) pour créer un fichier ODD

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

### Lire et comprendre la documentation: un exemple avec l'élément body
<div><h3 class="oddSpec" id="body">&lt;body&gt;</h3><table class="wovenodd"><tbody><tr><td colspan="2" class="wovenodd-col2"><span class="label">&lt;body&gt; </span>(text body) contains the whole body of a single unitary text, excluding any front or back matter. [4. Default Text Structure]</td></tr><tr><td class="wovenodd-col1"><span class="label" lang="en">Module</span></td><td class="wovenodd-col2">textstructure</td></tr><tr><td class="wovenodd-col1"><span class="label" lang="en">Attributes</span></td><td class="wovenodd-col2"><span lang="en">Attributes&nbsp;</span><a class="link_odd" href="#att.global">att.global</a> (<span class="attribute">@xml:id</span>, <span class="attribute">@n</span>, <span class="attribute">@xml:lang</span>, <span class="attribute">@xml:base</span>, <span class="attribute">@xml:space</span>)  (<a class="link_odd" href="#att.global.rendition">att.global.rendition</a> (<span class="attribute">@rend</span>, <span class="attribute">@style</span>, <span class="attribute">@rendition</span>))  (<a class="link_odd" href="#att.global.linking">att.global.linking</a> (<span class="attribute">@corresp</span>, <span class="attribute">@synch</span>, <span class="attribute">@sameAs</span>, <span class="attribute">@copyOf</span>, <span class="attribute">@next</span>, <span class="attribute">@prev</span>, <span class="attribute">@exclude</span>, <span class="attribute">@select</span>))  (<a class="link_odd" href="#att.global.analytic">att.global.analytic</a> (<span class="attribute">@ana</span>))  (<a class="link_odd" href="#att.global.facs">att.global.facs</a> (<span class="attribute">@facs</span>))  (<a class="link_odd" href="#att.global.change">att.global.change</a> (<span class="attribute">@change</span>))  (<a class="link_odd" href="#att.global.responsibility">att.global.responsibility</a> (<span class="attribute">@cert</span>, <span class="attribute">@resp</span>))  (<a class="link_odd" href="#att.global.source">att.global.source</a> (<span class="attribute">@source</span>)) <a class="link_odd" href="#att.declaring">att.declaring</a> (<span class="attribute">@decls</span>) </td></tr><tr><td class="wovenodd-col1"><span class="label" lang="en">Contained by</span></td><td class="wovenodd-col2"><div class="parent"><div class="specChildren"><div class="specChild"><span class="specChildModule">textstructure: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#floatingText">floatingText</a> <a class="link_odd_elementSpec" href="#text">text</a></span></div></div></div></td></tr><tr><td class="wovenodd-col1"><span class="label" lang="en">May contain</span></td><td class="wovenodd-col2"><div class="specChildren"><div class="specChild"><span class="specChildModule">analysis: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#interp">interp</a> <a class="link_odd_elementSpec" href="#interpGrp">interpGrp</a> <a class="link_odd_elementSpec" href="#span">span</a> <a class="link_odd_elementSpec" href="#spanGrp">spanGrp</a></span></div><div class="specChild"><span class="specChildModule">certainty: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#certainty">certainty</a> <a class="link_odd_elementSpec" href="#precision">precision</a> <a class="link_odd_elementSpec" href="#respons">respons</a></span></div><div class="specChild"><span class="specChildModule">core: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#bibl">bibl</a> <a class="link_odd_elementSpec" href="#biblStruct">biblStruct</a> <a class="link_odd_elementSpec" href="#cb">cb</a> <a class="link_odd_elementSpec" href="#cit">cit</a> <a class="link_odd_elementSpec" href="#desc">desc</a> <a class="link_odd_elementSpec" href="#divGen">divGen</a> <a class="link_odd_elementSpec" href="#ellipsis">ellipsis</a> <a class="link_odd_elementSpec" href="#gap">gap</a> <a class="link_odd_elementSpec" href="#gb">gb</a> <a class="link_odd_elementSpec" href="#head">head</a> <a class="link_odd_elementSpec" href="#index">index</a> <a class="link_odd_elementSpec" href="#l">l</a> <a class="link_odd_elementSpec" href="#label">label</a> <a class="link_odd_elementSpec" href="#lb">lb</a> <a class="link_odd_elementSpec" href="#lg">lg</a> <a class="link_odd_elementSpec" href="#list">list</a> <a class="link_odd_elementSpec" href="#listBibl">listBibl</a> <a class="link_odd_elementSpec" href="#meeting">meeting</a> <a class="link_odd_elementSpec" href="#milestone">milestone</a> <a class="link_odd_elementSpec" href="#note">note</a> <a class="link_odd_elementSpec" href="#noteGrp">noteGrp</a> <a class="link_odd_elementSpec" href="#p">p</a> <a class="link_odd_elementSpec" href="#pb">pb</a> <a class="link_odd_elementSpec" href="#q">q</a> <a class="link_odd_elementSpec" href="#quote">quote</a> <a class="link_odd_elementSpec" href="#said">said</a> <a class="link_odd_elementSpec" href="#sp">sp</a> <a class="link_odd_elementSpec" href="#stage">stage</a></span></div><div class="specChild"><span class="specChildModule">dictionaries: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#entry">entry</a> <a class="link_odd_elementSpec" href="#entryFree">entryFree</a> <a class="link_odd_elementSpec" href="#superEntry">superEntry</a></span></div><div class="specChild"><span class="specChildModule">drama: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#camera">camera</a> <a class="link_odd_elementSpec" href="#caption">caption</a> <a class="link_odd_elementSpec" href="#castList">castList</a> <a class="link_odd_elementSpec" href="#move">move</a> <a class="link_odd_elementSpec" href="#sound">sound</a> <a class="link_odd_elementSpec" href="#spGrp">spGrp</a> <a class="link_odd_elementSpec" href="#tech">tech</a> <a class="link_odd_elementSpec" href="#view">view</a></span></div><div class="specChild"><span class="specChildModule">figures: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#figure">figure</a> <a class="link_odd_elementSpec" href="#notatedMusic">notatedMusic</a> <a class="link_odd_elementSpec" href="#table">table</a></span></div><div class="specChild"><span class="specChildModule">header: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#biblFull">biblFull</a></span></div><div class="specChild"><span class="specChildModule">iso-fs: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#fLib">fLib</a> <a class="link_odd_elementSpec" href="#fs">fs</a> <a class="link_odd_elementSpec" href="#fvLib">fvLib</a></span></div><div class="specChild"><span class="specChildModule">linking: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#ab">ab</a> <a class="link_odd_elementSpec" href="#alt">alt</a> <a class="link_odd_elementSpec" href="#altGrp">altGrp</a> <a class="link_odd_elementSpec" href="#anchor">anchor</a> <a class="link_odd_elementSpec" href="#join">join</a> <a class="link_odd_elementSpec" href="#joinGrp">joinGrp</a> <a class="link_odd_elementSpec" href="#link">link</a> <a class="link_odd_elementSpec" href="#linkGrp">linkGrp</a> <a class="link_odd_elementSpec" href="#timeline">timeline</a></span></div><div class="specChild"><span class="specChildModule">msdescription: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#msDesc">msDesc</a></span></div><div class="specChild"><span class="specChildModule">namesdates: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#listEvent">listEvent</a> <a class="link_odd_elementSpec" href="#listNym">listNym</a> <a class="link_odd_elementSpec" href="#listObject">listObject</a> <a class="link_odd_elementSpec" href="#listOrg">listOrg</a> <a class="link_odd_elementSpec" href="#listPerson">listPerson</a> <a class="link_odd_elementSpec" href="#listPlace">listPlace</a> <a class="link_odd_elementSpec" href="#listRelation">listRelation</a></span></div><div class="specChild"><span class="specChildModule">nets: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#eTree">eTree</a> <a class="link_odd_elementSpec" href="#forest">forest</a> <a class="link_odd_elementSpec" href="#graph">graph</a> <a class="link_odd_elementSpec" href="#listForest">listForest</a> <a class="link_odd_elementSpec" href="#tree">tree</a></span></div><div class="specChild"><span class="specChildModule">spoken: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#annotationBlock">annotationBlock</a> <a class="link_odd_elementSpec" href="#incident">incident</a> <a class="link_odd_elementSpec" href="#kinesic">kinesic</a> <a class="link_odd_elementSpec" href="#pause">pause</a> <a class="link_odd_elementSpec" href="#shift">shift</a> <a class="link_odd_elementSpec" href="#u">u</a> <a class="link_odd_elementSpec" href="#vocal">vocal</a> <a class="link_odd_elementSpec" href="#writing">writing</a></span></div><div class="specChild"><span class="specChildModule">tagdocs: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#classSpec">classSpec</a> <a class="link_odd_elementSpec" href="#constraintSpec">constraintSpec</a> <a class="link_odd_elementSpec" href="#dataSpec">dataSpec</a> <a class="link_odd_elementSpec" href="#eg">eg</a> <a class="link_odd_elementSpec" href="#egXML">egXML</a> <a class="link_odd_elementSpec" href="#elementSpec">elementSpec</a> <a class="link_odd_elementSpec" href="#listRef">listRef</a> <a class="link_odd_elementSpec" href="#macroSpec">macroSpec</a> <a class="link_odd_elementSpec" href="#moduleSpec">moduleSpec</a> <a class="link_odd_elementSpec" href="#outputRendition">outputRendition</a> <a class="link_odd_elementSpec" href="#schemaSpec">schemaSpec</a> <a class="link_odd_elementSpec" href="#specGrp">specGrp</a> <a class="link_odd_elementSpec" href="#specGrpRef">specGrpRef</a></span></div><div class="specChild"><span class="specChildModule">textcrit: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#app">app</a> <a class="link_odd_elementSpec" href="#listApp">listApp</a> <a class="link_odd_elementSpec" href="#listWit">listWit</a> <a class="link_odd_elementSpec" href="#witDetail">witDetail</a></span></div><div class="specChild"><span class="specChildModule">textstructure: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#argument">argument</a> <a class="link_odd_elementSpec" href="#byline">byline</a> <a class="link_odd_elementSpec" href="#closer">closer</a> <a class="link_odd_elementSpec" href="#dateline">dateline</a> <a class="link_odd_elementSpec" href="#div">div</a> <a class="link_odd_elementSpec" href="#div1">div1</a> <a class="link_odd_elementSpec" href="#docAuthor">docAuthor</a> <a class="link_odd_elementSpec" href="#docDate">docDate</a> <a class="link_odd_elementSpec" href="#epigraph">epigraph</a> <a class="link_odd_elementSpec" href="#floatingText">floatingText</a> <a class="link_odd_elementSpec" href="#opener">opener</a> <a class="link_odd_elementSpec" href="#postscript">postscript</a> <a class="link_odd_elementSpec" href="#salute">salute</a> <a class="link_odd_elementSpec" href="#signed">signed</a> <a class="link_odd_elementSpec" href="#trailer">trailer</a></span></div><div class="specChild"><span class="specChildModule">transcr: </span><span class="specChildElements"><a class="link_odd_elementSpec" href="#addSpan">addSpan</a> <a class="link_odd_elementSpec" href="#damageSpan">damageSpan</a> <a class="link_odd_elementSpec" href="#delSpan">delSpan</a> <a class="link_odd_elementSpec" href="#fw">fw</a> <a class="link_odd_elementSpec" href="#listTranspose">listTranspose</a> <a class="link_odd_elementSpec" href="#metamark">metamark</a> <a class="link_odd_elementSpec" href="#space">space</a> <a class="link_odd_elementSpec" href="#substJoin">substJoin</a></span></div></div></td></tr><tr><td class="wovenodd-col1"><span class="label" lang="en">Example</span></td><td class="wovenodd-col2"><div id="index.xml-egXML-d57957905e35036" class="pre egXML_valid"><span class="element">&lt;body&gt;</span><br>&nbsp;<span class="element">&lt;l&gt;</span>Nu scylun hergan hefaenricaes uard<span class="element">&lt;/l&gt;</span><br>&nbsp;<span class="element">&lt;l&gt;</span>metudæs maecti end his modgidanc<span class="element">&lt;/l&gt;</span><br>&nbsp;<span class="element">&lt;l&gt;</span>uerc uuldurfadur sue he uundra gihuaes<span class="element">&lt;/l&gt;</span><br>&nbsp;<span class="element">&lt;l&gt;</span>eci dryctin or astelidæ<span class="element">&lt;/l&gt;</span><br>&nbsp;<span class="element">&lt;l&gt;</span>he aerist scop aelda barnum<span class="element">&lt;/l&gt;</span><br>&nbsp;<span class="element">&lt;l&gt;</span>heben til hrofe haleg scepen.<span class="element">&lt;/l&gt;</span><br>&nbsp;<span class="element">&lt;l&gt;</span>tha middungeard moncynnæs uard<span class="element">&lt;/l&gt;</span><br>&nbsp;<span class="element">&lt;l&gt;</span>eci dryctin æfter tiadæ<span class="element">&lt;/l&gt;</span><br>&nbsp;<span class="element">&lt;l&gt;</span>firum foldu frea allmectig<span class="element">&lt;/l&gt;</span><br>&nbsp;<span class="element">&lt;trailer&gt;</span>primo cantauit Cædmon istud carmen.<span class="element">&lt;/trailer&gt;</span><br><span class="element">&lt;/body&gt;</span></div></td></tr><tr><td class="wovenodd-col1"><span class="label" lang="en">Content model</span></td><td class="wovenodd-col2"><pre class="eg"><span class="element">&lt;content&gt;</span><br>&nbsp;<span class="element">&lt;sequence&gt;</span><br>&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.global.html">model.global</a>"<br>&nbsp;&nbsp;&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">0</span>"/&gt;</span><br>&nbsp;&nbsp;<span class="element">&lt;sequence&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">0</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.divTop.html">model.divTop</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;<span class="element">&lt;alternate&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"<br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">0</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.global.html">model.global</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.divTop.html">model.divTop</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;<span class="element">&lt;/alternate&gt;</span><br>&nbsp;&nbsp;<span class="element">&lt;/sequence&gt;</span><br>&nbsp;&nbsp;<span class="element">&lt;sequence&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">0</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.divGenLike.html">model.divGenLike</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;<span class="element">&lt;alternate&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"<br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">0</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.global.html">model.global</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.divGenLike.html">model.divGenLike</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;<span class="element">&lt;/alternate&gt;</span><br>&nbsp;&nbsp;<span class="element">&lt;/sequence&gt;</span><br>&nbsp;&nbsp;<span class="element">&lt;alternate&gt;</span><br>&nbsp;&nbsp;&nbsp;<span class="element">&lt;sequence&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"<br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">1</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.divLike.html">model.divLike</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;alternate&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">0</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.global.html">model.global</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.divGenLike.html">model.divGenLike</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;/alternate&gt;</span><br>&nbsp;&nbsp;&nbsp;<span class="element">&lt;/sequence&gt;</span><br>&nbsp;&nbsp;&nbsp;<span class="element">&lt;sequence&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"<br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">1</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.div1Like.html">model.div1Like</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;alternate&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">0</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.global.html">model.global</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.divGenLike.html">model.divGenLike</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;/alternate&gt;</span><br>&nbsp;&nbsp;&nbsp;<span class="element">&lt;/sequence&gt;</span><br>&nbsp;&nbsp;&nbsp;<span class="element">&lt;sequence&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;sequence&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">1</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.common.html">model.common</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.global.html">model.global</a>"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">0</span>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;/sequence&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;alternate&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">0</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;sequence&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">1</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.divLike.html">model.divLike</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;alternate&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">0</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.global.html">model.global</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.divGenLike.html">model.divGenLike</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;/alternate&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;/sequence&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;sequence&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">1</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.div1Like.html">model.div1Like</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;alternate&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">0</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.global.html">model.global</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.divGenLike.html">model.divGenLike</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;/alternate&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;/sequence&gt;</span><br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="element">&lt;/alternate&gt;</span><br>&nbsp;&nbsp;&nbsp;<span class="element">&lt;/sequence&gt;</span><br>&nbsp;&nbsp;<span class="element">&lt;/alternate&gt;</span><br>&nbsp;&nbsp;<span class="element">&lt;sequence&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"<br>&nbsp;&nbsp;&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">0</span>"&gt;</span><br>&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.divBottom.html">model.divBottom</a>"/&gt;</span><br>&nbsp;&nbsp;&nbsp;<span class="element">&lt;classRef&nbsp;<span class="attribute">key</span>="<a class="link_odd" href="ref-model.global.html">model.global</a>"<br>&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">maxOccurs</span>="<span class="attributevalue">unbounded</span>"&nbsp;<span class="attribute">minOccurs</span>="<span class="attributevalue">0</span>"/&gt;</span><br>&nbsp;&nbsp;<span class="element">&lt;/sequence&gt;</span><br>&nbsp;<span class="element">&lt;/sequence&gt;</span><br><span class="element">&lt;/content&gt;</span></pre></td></tr><tr><td class="wovenodd-col1"><span class="label" lang="en">Schema Declaration</span></td><td class="wovenodd-col2"><pre class="eg"><span class="rnc_keyword">element</span> <span class="rnc_nc">body</span>
{
   tei_att.global.attributes,
   tei_att.declaring.attributes,
   (
      tei_model.global*,
      ( tei_model.divTop, ( tei_model.global | tei_model.divTop )* )?,
      ( tei_model.divGenLike, ( tei_model.global | tei_model.divGenLike )* )?,
      (
         ( tei_model.divLike, ( tei_model.global | tei_model.divGenLike )* )+
       |&nbsp;( tei_model.div1Like, ( tei_model.global | tei_model.divGenLike )* )+
       |&nbsp;(
            ( tei_model.common, tei_model.global* )+,
            (
               (
                  tei_model.divLike,
                  ( tei_model.global | tei_model.divGenLike )*
               )+
             |&nbsp;(
                  tei_model.div1Like,
                  ( tei_model.global | tei_model.divGenLike )*
               )+
            )?
         )
      ),
      ( tei_model.divBottom, tei_model.global* )*
   )
}</pre></td></tr></tbody></table></div>

## TEI Conformance
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

<!-- Je ne sais pas si c'est une bonne idée de conserver cette partie, dans tous les cas, je l'ai mis à la fin pour pouvoir la sauter au besoin -->
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
