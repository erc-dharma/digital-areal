# Encoder l'en-tête d'un fichier TEI avec Manu

Les métadonnées sont toutes les informations qui décrivent le fichier et qui permettent ainsi de l'identifier de manière pérenne. Le teiHeader regroupe plusieurs informations de nature différente:
- description du fichier électronique
- description de la source
- description de contenu de la source - certains éléments rélèvant déjà du commentaire et de l'analyse scientifique.
- description de l'encodage du contenu de la source  

**L'une des grandes difficultés du teiHeader est de discerné les éléments qui relèvent de la source et les éléments qui documentent le fichier électronique lui-même, et de trouver l'équilibre entre la prose pour l'exploitation humaine et la structuration pour l'exploitation machine**.   

* * *
NB : Leur dénomination peut vous donner des éléments d'informations sur leur usage et/ou leur contenu .   
Parmi les 3 suffixes présents dans le teiHeader:
- `-Stmt` : appelle un contenu structuré en souséléments
- `-Decl` : une série de déclarations, associant structuration en sous-éléments et description en
prose
- `-Desc` : description, en prose courante, pouvant être structurée en sous-éléments
* * *

## fileDesc
Élément obligatoire, il contient la notice biliographique complète du fichier électronique. Son modèle copie les standards établis pour le catalogage.
### titleStmt
Le `<titleStmt>` groupe les informations relatives au titre et l'ensemble des personnes ou institutions impliquées dans la production du fichier.
- `<title>` (titre) contient le titre complet du fichier. Il peut être repété pour donner plusieurs titres, parfois en plusieurs langues, et typé avec un attribut pour distinguer le titre principal du sous-titre par exemple.
```
<titleStmt>
            <title type="main" xml:lang="san-Latn">Naimittikakriyānusandhāna</title>
            <title type="main">Exposition of Occasional Rites</title>
            <title type="sub" subtype="editorial">Digital Critical Edition and Translation of a Śaiva Ritual Manual</title>
 </titleStmt>
```

Les rôles de chacun peuvent être indiqué de manière générale en utilisant les éléments respStmt et resp, ou bien en mobilisant des éléments plus précis. Il n'y a pas de limites à la mention de responsabilité, mais il est recommendé de citer au moins l'auteur de l'œuvre, lorsqu'il est connu, et le créateur du fichier.
- `<author>` (auteur) dans une référence bibliographique contient le nom de la (des) personne(s) physique(s) ou du collectif, auteur(s) d'une oeuvre ; par exemple dans la même forme que celle utilisée par une référence bibliographique reconnue.
- `<editor>` mention de responsabilité secondaire pour un item bibliographique, par exemple le nom d'une personne, d'une institution ou d'un organisme (ou de plusieurs d'entre eux) comme éditeur scientifique, compilateur, traducteur, etc.
- `<sponsor>` (commanditaire) indique le nom d’une institution ou d’un organisme partenaires.
- `<funder>` (financeur) désigne le nom d’une personne ou d’un organisme responsable du financement d’un projet ou d’un texte.
- `<principal>` (chercheur principal) contient le nom du chercheur qui est principalement responsable de la création d’un texte électronique.
- `<respStmt>` (mention de responsabilité) indique la responsabilité quant au contenu intellectuel d'un texte, d'une édition, d'un enregistrement ou d'une publication en série, lorsque les éléments spécifiques relatifs aux auteurs, éditeurs, etc. ne suffisent pas ou ne s'appliquent pas.
- `<resp>` (responsabilité) contient une expression décrivant la nature de la responsabilité intellectuelle d'une personne.

```
<titleStmt>
				<title>Tiruppattūr stela 1</title>
				<respStmt>
					<resp>EpiDoc encoding</resp>
					<persName ref="part:emfr">
						<forename>Emmanuel</forename>
						<surname>Francis</surname>
					</persName>
					<persName ref="part:vagi">
						<forename>Valérie</forename>
						<surname>Gillet</surname>
					</persName>
				</respStmt>
				<respStmt>
					<resp>intellectual authorship of edition</resp>
					<persName ref="part:emfr">
						<forename>Emmanuel</forename>
						<surname>Francis</surname>
					</persName>
					<persName ref="part:vagi">
						<forename>Valérie</forename>
						<surname>Gillet</surname>
					</persName>
				</respStmt>
			</titleStmt>
```
```
<titleStmt>
				<title type="main" xml:lang="kaw-Latn">R̥ṣiśāsana</title>
				<title type="main">Ordinance for the Sages</title>
				<title type="sub">Digital Critical Edition and Translation of an Old Javanese Legal text</title>
				<editor ref="part:masc">
					<forename>Marine</forename>
					<surname>Schoettel</surname>
				</editor>
				<respStmt>
					<resp>EpiDoc encoding</resp>
					<persName ref="part:masc">
						<forename>Marine</forename>
						<surname>Schoettel</surname>
					</persName>
				</respStmt>
			</titleStmt>
```

### editionStmt
regroupe les informations relatives à l’édition d’un texte, ses changements ou ses révisions par exemple. Il est optionnel, mais est recommandé par la TEI.

- `<edition>` (édition) décrit les particularités de l’édition d’un texte.
- `<respStmt>` (mention de responsabilité) indique la responsabilité quant au contenu intellectuel d'un texte, d'une édition, d'un enregistrement ou d'une publication en série, lorsque les éléments spécifiques relatifs aux auteurs, éditeurs, etc. ne suffisent pas ou ne s'appliquent pas.
- `<resp>` (responsabilité) contient une expression décrivant la nature de la responsabilité intellectuelle d'une personne.

```
<editionStmt>
 <edition n="P2">Second draft, substantially
   extended, revised, and corrected.</edition>
</editionStmt>
```
```
<editionStmt>
 <edition>Student's edition, <date>June 1987</date>
 </edition>
 <respStmt>
  <resp>New annotations by</resp>
  <name>George Brown</name>
 </respStmt>
</editionStmt>
```
*source: [TEI Guidelines](https://www.tei-c.org/release/doc/tei-p5-doc/fr/html/HD.html#HD22)*

### extent
décrit la taille approximative d’un texte stocké sur son support, numérique ou non numérique, exprimé dans une unité quelconque appropriée. L'encodage de ses données est tout à fait optionnel.
```
<extent>between 1 and
 2 Mb</extent>
<extent>4.2 MiB</extent>
<extent>4532 bytes</extent>
<extent>3200 sentences</extent>
<extent>Five 90 mm High Density Diskettes</extent>
```
*source: [TEI Guidelines](https://www.tei-c.org/release/doc/tei-p5-doc/fr/html/HD.html#HD23)*  
Il est possible de structurer davantage le contenu de l'élément `<extent>`, mais c'est pas une pratique mobilisée par beaucoup de projets.

### publicationStmt
Cette section regroupe des informations concernant la publication ou la diffusion d’un texte électronique ou autre. Bien que non imposé par le schéma, **un document conforme à la TEI doit donner des informations sur le lieu de publication, l'adresse, l'identifiant, les droits de diffusion et la date dans cet ordre, après le nom de l'éditeur, du distributeur, ou de l'autorité concernée**.
- `<publisher>` (éditeur) donne le nom de l'organisme responsable de la publication ou de la distribution d'un élément de la bibliographie.
- `<distributor>` (diffuseur) donne le nom d’une personne ou d’un organisme responsable de la diffusion d’un texte.
- `<authority>` (responsable de la publication.) donne le nom de la personne ou de l'organisme responsable de la publication d’un fichier électronique, autre qu’un éditeur ou un distributeur.
- `<pubPlace>` (lieu de publication) contient le nom du lieu d'une publication.
address (address) contient une adresse postale ou d'un autre type, par exemple l'adresse d'un éditeur, d'un organisme ou d'une personne.
- `<idno>` (identifiant) donne un identifiant standardisé qui peut être utilisé pour identifier une référence bibliographique, une personne, un titre d'ouvrage ou une organisation.
  - `<@type>`	classe un numéro dans une catégorie, par exemple comme étant un numéro ISBN ou comme appartenant une autre série normalisée
- `<availability>` (disponibilité) renseigne sur la disponibilité du texte, par exemple sur toutes restrictions quant à son usage ou sa diffusion, son copyright, etc.
  - `<@status>`	(status) donne un code caractérisant la disponibilité actuelle d’un texte.
- `<date>` (date) contient une date exprimée dans n'importe quel format.
licence contient des informations légales applicables au texte, notamment le contrat de licence définissant les droits d'utilisation.

```
<publicationStmt>
            <authority>DHARMA</authority>
            <pubPlace>Lyon (France) and Lexington, VA (USA)</pubPlace>
            <idno type="filename">DHARMA_CritEdSvayambhu</idno>
            <availability>
               <licence target="https://creativecommons.org/licenses/by/4.0/">
                  <p>This work is licenced under the Creative Commons Attribution 4.0 Unported Licence. To view a copy of the licence, visit https://creativecommons.org/licenses/by/4.0/ or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.</p>
                  <p>Copyright © 2019-2025 by Arlo Griffiths and Tim Lubin.</p>
               </licence>
            </availability>
            <date from="2019" to="2025">2019-2025</date>
 </publicationStmt>
```

### serieStmt
regroupe toute information relative à la collection à laquelle appartient une publication. C'est un élément que l'on retrouve assez souvent en prose, plutôt que sous une forme structurée.
- `<seriesStmt>` (mention de collection) regroupe toute information relative à la collection (si elle existe) à laquelle appartient une publication.
Il mobilise des éléments que nous avons déjà évoqués: `<title>`, `<idno>`, `<respStmt>`, `<resp>` et `<name>`.

### notesStmt
rassemble toutes les notes fournissant des informations sur un texte, en plus des informations mentionnées dans d'autres parties de la description bibliographique. Il se structure par un ou plusieurs éléments `<note>`, chaque note correspondant à un unique sujet.
On utilise cet élément, le plus souvent, lorsque l'on ne sait pas où mettre l'information.

### sourceDesc
 Partie la plus developpée du teiHeader, elle décrit la source à partir de laquelle un texte électronique a été dérivé ou produit, habituellement une description bibliographique pour un texte numérisé, pour une édition critique, on va y déclarer la liste des témoins et ainsi de suite.

```
<sourceDesc>
            <listWit>
               <witness xml:id="A1">
                  <abbr type="siglum">A<hi rend="superscript">1</hi></abbr>
                  <msDesc>
                     <msIdentifier>
                        <settlement>Leiden</settlement>
                        <institution>Leiden University</institution>
                        <repository>Leiden University Libraries</repository>
                        <location>Special Collections</location>
                        <idno>Or. 23732</idno>
                     </msIdentifier>
                     <msContents>
                        <msItem>   
                           <author>Śāntarakṣita</author>   
                           <title>Vipañcitārthā</title>
<colophon xml:lang="san-Latn">samvata Ācū2 śrāvaṇa-kr̥ṣṇa-Ekādaśyāṁ likhitaṁ
mayā| rājādhirāja-parameśvara-parama-bhaṭṭārakaḥ śrīmad-ānandade
vapādīya-vijaya-rājye śubha-dine</colophon>
                        </msItem>
                        <summary><!-- summary of the witness’s contents --></summary>
                     </msContents>
                     <physDesc>  
                        <objectDesc>  
                           <p>Palm-leaf manuscript. 89 leaves in Siddhamātr̥kā script.</p>
                        </objectDesc>
 <handDesc>
<handNote xml:id= "A1_H1" scriptRef="class:38774 maturity:83213">
		<abbr type="hand">A<hi rend="superscript">1</hi>H<hi rend="subscript">1</hi></abbr>
			<p>main hand of the manuscript, black ink</p>
                             </handNote>
                         </handDesc>
                     </physDesc>
                     <history>
                        <p>The manuscript was apparently written in <origDate when="1152">1152 CE</origDate> and found, in June 1934, by Rāhula Sāṅkr̥tyāyana in the monastery of Kun-de-ling (Lhasa).</p>
                     </history>
                  </msDesc>
               </witness>
               <witness xml:id="A2">...</witness>
               <witness xml:id="B">...</witness>
            </listWit>
         </sourceDesc>
```

#### Cas particulier: un dérivé d'un fichier numérique
Lorsque l'on réutilise un fichier numérique, la TEI recommande de copier-coller les informations du `<fileDesc>` du fichier d'origine, dans le `<sourceDesc>` à l'aide d'un élément `<biblFull>`.
```
<sourceDesc>
 <biblFull>
 <!-- Copie complète du fileDesc du
fichier d'origine -->
 <titleStmt>
 <title/>
 <!-- [...] -->
 </titleStmt>
 <!-- [...] -->
 </biblFull>
 </sourceDesc>
 ```
 ```
 <sourceDesc>
 <biblFull>
 		<titleStmt>
 						<title>Stela from Glai Klaong Anâk</title>
 						<editor>Arlo Griffiths</editor>
 						<editor>Amandine Lepoutre</editor>
 						<editor>William Southworth</editor>
 					</titleStmt>
 					<editionStmt>
 						<p>First digital edition made by École française d'Extrême-Orient (EFEO), realized in collaboration with the Institute for the Study of the Ancient World (ISAW) at New York University as <ref target="https://isaw.nyu.edu/publications/inscriptions/campa/index.html">The Corpus of the Inscriptions of Campā, in 2010-2012.</ref>
 						</p>
 					</editionStmt>
 					<publicationStmt>
 						<authority>École française d'Extrême-Orient (EFEO)</authority>
 						<idno type="filename">CIC019</idno>
 						<availability>
 							<licence target="http://creativecommons.org/licenses/by/3.0/">
 								<p>Copyright (c) 2012 by Arlo Griffiths, Amandine Lepoutre &amp; William Southworth.</p>
 								<p>This work is licensed under the Creative Commons Attribution 3.0 Unported License. To view a copy of this license, visit http://creativecommons.org/licenses/by/3.0/ or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.</p>
 							</licence>
 						</availability>
 					</publicationStmt>
 				</biblFull>
    <msDesc>[...]</msDesc>
</sourceDesc>
```        

## encodingDesc
Il explicite la relation entre la version éléctronique du texte et la ou les sources. Il permet de clarifier des choix éditoriaux, de transcription, de sélection du texte... Il donne aussi des éléments plus techniques déclarant des styles pour le rendu, des pointeurs vers des ressources extérieures, des catégories et des vocabulaires utilisés par votre projet.
C'est une partie le plus souvent commune à tous les fichiers. Vous y trouverez souvent le système de XInclude mobilisé ici, pour toute la section ou en partie.

Parmi les éléments enfants de cette section du teiHeader, les plus utiles pour des chercheurs sont:
- `<projectDesc>` (description du projet) décrit en détail le but ou l’objectif visé dans l’encodage d’un fichier électronique, ainsi que toute autre information pertinente sur la manière dont il a été construit ou recueilli.
- `<editorialDecl>` (déclaration des pratiques éditoriales) donne des précisions sur les pratiques et les principes éditoriaux appliqués au cours de l’encodage du texte.
    - `<correction>` (règles de correction)
    - `<normalization>` (normalisation)
    - `<punctuation>` (ponctuation)
    - `<quotation>` (citation)
    - `<hyphenation>` (césurage)
    - `<segmentation>` (segmentation)
    - `<interpretation>` (Interprétation)

```
<editorialDecl>
<normalization>
    <p>Original spelling and typography is retained, except that long s and ligatured
        forms are not encoded.</p>
</normalization>
<interpretation>
<p>The asterisk * is used to flag lemmata or forms of lemmata not recorded in the <title>Old Javanese-English Dictionary</title>.</p>
</interpretation>
</editorialDecl>
```

### Un exemple avec XInclude
```
<encodingDesc>
   <projectDesc>
      <p>This project DHARMA has received funding from the European Research Council (ERC)
                  under the European Union's Horizon 2020 research and innovation programme (grant
                  agreement no 809994).</p>
   </projectDesc>
   <schemaRef type="guide"
              key="EGDv01"
              url="https://halshs.archives-ouvertes.fr/halshs-02888186"/>
   <listPrefixDef>
      <prefixDef ident="bib"
                 matchPattern="([a-zA-Z0-9\-\_]+)"
                 replacementPattern="https://www.zotero.org/groups/1633743/erc-dharma/items/tag/$1">
         <p>Public URIs with the prefix bib to point to a Zotero Group Library named
                      ERC-DHARMA whose data are open to the public.</p>
      </prefixDef>
      <prefixDef ident="part"
                 matchPattern="([a-z]+)"
                 replacementPattern="https://raw.githubusercontent.com/erc-dharma/project-documentation/master/DHARMA_IdListMembers_v01.xml#$1">
         <p>Internal URIs using the part prefix to point to person elements in the
                      <ref>DHARMA_IdListMembers_v01.xml</ref> file.</p>
      </prefixDef>
   </listPrefixDef>
</encodingDesc>
```
ou en utilisant un XInclude pour éviter de répéter le code pour les préfixes dans chaque fichier.
```
<encodingDesc>
   <projectDesc>
      <p>This project DHARMA has received funding from the European Research Council (ERC)
                  under the European Union's Horizon 2020 research and innovation programme (grant
                  agreement no 809994).</p>
   </projectDesc>
   <schemaRef type="guide"
              key="EGDv01"
              url="https://halshs.archives-ouvertes.fr/halshs-02888186"/>
<xi:include xmlns:xi="http://www.w3.org/2001/XInclude" href="(chemin_vers_le_fichier)prefixDef.xml">
            <xi:fallback>
               <p>Definitions of prefixes used.</p>
            </xi:fallback>
         </xi:include>
</encodingDesc>
```
ce qui suppose un autre fichier, que nous avons appelé prefixDef.xml, pour contenir l'information qui sera importé par le processeur XML lors du traitement du fichier.
```
<?xml version="1.0" encoding="UTF-8"?>
<listPrefixDef xmlns="http://www.tei-c.org/ns/1.0">
<prefixDef ident="bib"
           matchPattern="([a-zA-Z0-9\-\_]+)"
           replacementPattern="https://www.zotero.org/groups/1633743/erc-dharma/items/tag/$1">
   <p>Public URIs with the prefix bib to point to a Zotero Group Library named
                ERC-DHARMA whose data are open to the public.</p>
</prefixDef>
<prefixDef ident="part"
           matchPattern="([a-z]+)"
           replacementPattern="https://raw.githubusercontent.com/erc-dharma/project-documentation/master/DHARMA_IdListMembers_v01.xml#$1">
   <p>Internal URIs using the part prefix to point to person elements in the
                <ref>DHARMA_IdListMembers_v01.xml</ref> file.</p>
</prefixDef>
</listPrefixDef>
```

## profilDesc
Il contient des éléments non bibliographiques sur texte. Il peut contenir un résumé du texte, des informations sur les circonstances de création du fichier, la langue et ses variantes, une liste de mots-clés... Il offre quelques possibilités, mais la plus courante est la déclaration des langues avec les éléments `<langUsage>` et `<language>`.

```
<profileDesc>
    <langUsage>
      <language ident="san-Latn">Sanskrit, romanized</language>
      <language ident="kaw-Latn">Old Javanese, romanized</language>
    </langUsage>
  </profileDesc>
```

## revisionDesc
Présente une sucession d'éléments `<change>`, par ordre antéchronologique, qui documente les différentes interventions faites dans les fichiers, et qui peuvent être groupés par `<list>` ou par `<listChange>`. Fonctionne souvent avec les attributes `@who` et `@when`, ou avec les sous-éléments `<name>` et `<date>`.

```
<revisionDesc>
   <change who="part:axja" when="2021-06-30">Beta version 4: adding facsimile for Chloe's encoding</change>
   <change who="part:axja" when="2021-06-02">Beta version 4 : starting adding elements to handle the resolution for ids linked to thesaurus concepts</change>
   <change who="part:axja" when="2020-10-12">Version 3.2 : movinng the xml:lang to the root</change>
   <change who="part:axja" when="2020-07-02">Version 3.1: adding the encodingDesc and linking the template with the DHARMA Schema</change>
   <change who="part:axja" when="2020-03-18">Version 2: addition of handDesc and summary</change>
   <change who="part:axja" when="2019-12-18">Creation of the
      template</change>
</revisionDesc>
```
