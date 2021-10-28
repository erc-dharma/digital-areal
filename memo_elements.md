# DHARMA List of Elements for Critical Editions

An official full length release is to be published soon, you can find the candidate release [here](https://docs.google.com/document/d/15HFxHJTOzIU1UDyVrB2yQYJ5wI6JyEshEkYgg5qwj8M/edit?usp=sharing)

|Elements name|Attributes|Status|Description|Reference|
|:-----:|:-----:|:-----:|:-----:|:-----:|
|ab|-@xml:lang -@xml:id -type(values: invocation, colophon, speaker) -@prev -@next -@rend(value: check)||Anonymous Block. Contains any arbitrary component-level unit of text, acting as an anonymous container for phrase or inter level elements analogous to, but without the semantic baggage of a paragraph.|§3.2; §3.3.2; §3.3.2.1, §3.3.2.2; §3.5.3; §4.8.1; §6.2.2; §7.3.1|
|abbr|-@type (values: siglum, hand) -@rend(value: check)|Recommended|Abbreviation. Contains an abbreviation of any sort. In the context of the critical edition, it is used to provide the expected rendering display of any witnesses sigla.|§2.1.3; §7.2.3; §8.6.5; §9.3.2.3|
|add|-@place(values:inline, below, above, top, bottom, left, right, overstrike, unspecified -mandatory) -@hand -@rend(values: mark, check)||Addition. Contains premodern correction and insertion in the source text made by an author, scribe, or a previous annotator or corrector. Can work as twin with `<del>` by being wrapped in `<subst>`.|§5.5.12.1|
|anchor|-@xml:id||Allows to provide a anchoring point in the edited text|§6.2.4.2|
|app|-@xml:id -@prev -@next -@type(values: imitation, adaptation) -@from -@to -@loc -@rend(value: check)||Apparatus. Contains one entry in a critical apparatus, with a lemma `<lem>`  and usually one or more readings `<rdg>` or notes `<note>` on the relevant passage. Each apparatus entry must be individually wrapped in the element `<app>` .|§5.1.1; §5.1.2; §5.1.5; §5.2.4; §5.3; §5.4; §6.2.1; §6.2.4.2; §6.3; §7.3.2; §8.2.1|
|author|||Identify an author.|§2.1.3|
|authority||Mandatory|Release Authority. Supplies the name of a person or other agency responsible for making a work available, other than a publisher or distributor. By default, contain "DHARMA".|§2.1.2|
|availability||Mandatory|A description of the conditions for the distribution and use of the text. Contains `<licence>`.|§2.1.2|
|back|||Comes after the edited text, mostly for appendices|§3.1; §10; §10.2|
|bibl|-@n -@corresp -@xml:id -@rend(values: omitname, ibid)||Bibliographic citation. Used for each bibliographic reference. Contains `<ptr>` and possibly `<citedRange>`.|§2.1.3; §7.2.3; §8.3.1; §8.4.1; §9.3.2.2; §9.3.2.3|
|biblFull||Mandatory for translation(s), commentary, bibliography|Fully-structured bibliographic citation, used to declare a previous project or linked external files to the main one.|§9.1.1; §9.2.1; §9.3.1|
|biblStruct||Mandatory if you reproduce an already published translation|Structured bibliographic citation|§9.1.1; §9.2.1; §9.3.1|
|body||Mandatory|The main body of the text. This element is required in any TEI conformant document.|§3.1; §9.1.2.1; §9.2.2.1; §9.3.2.1|
|certainty|-@match(Xpath) -@locus(values: value or name)||Indicates the degree of certainty associated with some aspect of the text markup. If a text in damaged and you cannot identify the metre with absolute certainty. To be used as child of `<gap reason="lost">` or of first child of `<lg>`|§8.7.2|
|change|-@status -@when -@who|Mandatory|Records a change or set of changes made during the production of a source document, or during the revision of an electronic file.|§2.2.3; §9.1.1; §9.2.1; §9.3.1|
|choice|-@rend(value: check)||Used to declare any encoding alternative with unclear and abbreviations.|§5.5.6; §8.6.5|
|cit|||Citation. Encodes a direct quotation from a published source.|§8.3.1|
|citedRange|-@unit(values: page, part, volume, note, item, entry, line, figure, plate, table, appendix, section, book, stanza)||To refer to page numbers.|§2.1.3; §8.4.1|
|collection|||Declares a collection for a manuscript|Rsisasana|
|colophon|-@xml:lang (mandatory)||Record scribal statements not shared between your different witnesses.|§2.1.3|
|correction|||Give specifications regarding the correction principles within your edition|§2.2.1.1|
|date|-@from -@to|Mandatory|Contains a date in any format.|§2.1.2|
|del|-@rend (values: strikeout, dots, ui, check)||Purposeful deletion. Text deleted by scribe.|§5.5.12.2|
|div|-@type(values:chapter, canto, dyad, section, group, interpolation) - @n(Recommended) -@met -@real -@xml:id -@rend(value: check) -@corresp -@resp -@source|Mandatory|Text division. Contains a subdivision of the text.|§3.2; §3.4.2; §4.4; §4.6; §4.7; §4.8; §4.8.1; §5.6.1; §9.1.2.2; §9.1.3.1; §9.1.3.2; §9.2.2.2|
|editor|-@ref(Mandatory) -@xml:id|Recommended|The `<editor>` element is allowed to record the editors of the critical edition. It must contained either `<forename>`and `<surname>`, either `<name>`. |§2.1.1.2; §9.1.1; §9.2.1; §9.3.1|
|editorialDecl||Recommended|Formulates methodological choices underlying your edition. It is especially useful if you need to give more detail than, or need to make exceptions from DHARMA Guides and practices.|§2.2.1.1; §5.2.2|
|encodingDesc||Recommended|Use to document the encoding process and work.|§2.2; §7.2; §9.1.1; §9.2.1; §9.3.1|
|expan|-@rend(value: check)||Resolves an abbreviation|§8.6.5|
|fileDesc||Mandatory|File Description. Contains information on the title, on the publication and on the source. This element is a mandatory part of the header and is treated in two separate subsections, one dealing with the meta-level information on the file history, `<titleStmt>`, the other concerning the source from which the XML-file is created `<sourceDesc>`.|§2.1; §7.2.1|
|filiation|||Provides information on the relationship between the manuscript and other surviving manuscripts of the same text, either specifically or in a general way.|§2.1.3|
|foreign|-@xml:lang -@rend(value: check)||Identifies a word or phrase as belonging to some language other than that of the surrounding text. Note that in the context of the DHARMA, this element is used to encode any element identified as foreign, even under the level of the word and that should be italicized in the render of the edition.|§8.9.2; §9.1.4|
|forename|||The first name of a person, contained in the `<persName>` element. Used with `<surname>`.||
|front|||Contains any prefatory matter (headers, abstracts, title page, prefaces, dedications, etc.) found before the body|§3.1; §10; §10.1|
|g|-@type(values: numeral, filler, symbol) -@subtype||Glyph or Gaiji. Represents a non-standard character. This element indicates that no equivalent is available in DHARMA transliteration system.|§8.6.1.2|
|gap|-@reason(values: omitted, lost, illegible, ellipsis) -@quantity -@unit(values: character, component) -@precision(value: low) -@extent(value: unknown) -@rend(value: check)||Indicates a point where material has been omitted in a transcription because it is physically missing for whatever reason.Can contained `<certainty/>`.|§5.1.3; §5.1.5; §5.5.4; §5.5.6; §5.5.7; §5.5.8; §5.5.9; §5.5.9.1; §5.5.11; §5.5.11.1; §5.5.12.2; §8.7.1; §9.1.4.2|
|gloss|-@rend(value: check)-@rend(value: check)||Identifies a phrase or word used to provide a translation within an inscription. Must be used in correlation with `<term>`.|§4.9|
|handDesc|-@hands|Mandatory|Description of hands. Contains a description of all the different hands used in a manuscript. The description may be encoded as one or more paragraphs, `<p>`, but more commonly, the various paragraphs are structured as a series of `<handNote>` elements, each containing a prose description of the hands.|§2.1.3; §2.1.3.1; §8.6.1.2|
|handNote|-@xml:id(Mandatory) -@scriptRef(Mandatory)||Note on a hand. Contains a prose description of one of the hands, containing one or more paragraphs, `<p>`.|§2.1.3; §2.1.3.1|
|head|-@xml:lang -@type(value:editorial - mandatory if editorial header) -@rend(value: check)||Heading. Contains headings on all levels of the document. Allows you to give an editorial title to a part of your edition. This element can contained only `<foreign>` as child.|§3.2.1; §9.1.2.2; §9.2.2.2|
|hi|-@rend (values: superscript, subscript, italic, bold, check) -@xml:lang||Distinguishes graphical features when there is not pre-existing element.|§2.1.3; §8.8.1; §9.1.4|
|history||Recommended|Describes the history of a manuscript|§2.1.3|
|idno|-@type(Mandatory in teiHeader with value filename)|Mandatory|Identifier.|§2.1.2; §2.1.3; §9.1.1; §9.2.1; §9.3.1|
|institution|||Identifies an institution|§2.1.3|
|interpretation|||Describe any additions you are making to the text edition that relate to issues of analysis or interpretation|§2.2.1.1|
|item|-@rend(value: check)||Element as a container for each list item.|§8.8.2|
|join|-@result -@scope -@target||Element used to recreate a fragmented text|§4.8.1; §4.8.2|
|keywords||Recommended|List containing keywords.|§2.2.2|
|l|-@n (mandatory) -@real -@enjamb(value: yes) -@corresp -@rend(value: check)|Mandatory in `<lg>`|Individual verse line.|§3.2; §3.4.3; §3.4.4; §3.4.5; §3.7; §4.5; §5.8.3; §6.2.2|
|label|-@rend(value: check)||Heading used to identify changes of interlocutor in a dialogue context|§3.5.3; §8.8.2|
|lacunaEnd|||Marks the end of a lacuna|§5.5.10.2|
|lacunaStart|||Marks the start of a lacuna|§5.5.10.2|
|language|-@ident(mandatory)|Mandatory|Declare a language used in the file.|§2.2.2|
|langUsage||Mandatory|Record the languages used in the file.|§2.2.2|
|lb|-@n -@break(value: no) -@source||Line beginning. An empty element which marks the beginning of a new line.|§5.5.1; §8.1; §8.1.1|
|lem|-@wit -@type(values: emn, conj, norm, absent_elsewhere, reformulated_elsewhere) -@rend(values: hyphenfront, hyphenback, hyphenaround,circlefront, circleback, circlearound, check) -@hand -xml:id -@varSeq(values: 1 ou 2) -@resp ||Lemma. Contains a lemma for an apparatus entry. First child of the element `<app>`.|§5.1.1; §5.1.2; §5.1.5; §5.3; §5.3.1.1; §5.3.1.2; §5.3.1.3; §5.3.2; §5.3.3; §5.4; §5.5.4; §5.5.5; §5.5.5.1; §5.5.10.1; §6.2.4.1; §6.3; §7.3.2; §8.5|
|lg|-@met(mandatory/ might be changing) -@n(mandatory for edited text, not for supplied text) -@xml:id -@xml:lang -@part(values: I, M, F) -@prev -@next -@rend(value: check)||Line group. Marks the stanza as a whole.|§3.2; §3.2.1; §3.6; §3.7; §4.5; §4.8.2; §6.2.2|
|licence| -@target(Mandatory)|Mandatory|Licence set by default to a Creative Commons licence identifying the author|§2.1.2; §3.4; §3.4.1|
|list|-@rend(values: bulleted, numbered, check)||Contains any sequence of items organized as a list.|§8.8.2|
|listApp|@type(values: parallels, apparatus)||Contains a list of apparatus entries.|§4.5; §6.2.1; §6.2.4; §6.3|
|listBibl|||Citation list. Contains a list of bibliographic citations of any kind regarding the manuscript as a whole. Inside the `<listBibl>` element, one or more `<bibl>` elements are used for each bibliographic reference.|§9.3.2.2|
|listPrefixDef||Mandatory|List of paths to external file containing some data relevant to the edition.|§2.2; §7.2|
|listWit||Mandatory|container for all the witnesses that you will be referring to in the critical apparatus|§2.1.3; §5.2.1; §5.4|
|locus|-@type(value: displacement) -@from -@to||Indicates locations inside manuscripts|§2.1.3; §5.8.1|
|measure|-@type (values: volume, weight, currency...) -@quantity -@unit -@commodity -@rend(value: check)||Encodes quantity references.|§8.6.3|
|msContents||Recommend|Describes the intellectual content of any manuscript or part of it|§2.1.3|
|msDesc||Recommended|Manuscript description. Contains a description of a single identifiable manuscript. Within this element six sub-elements are available: `<msIdentifier>`, `<msContents>`, `<physDesc>`, `<history>`, `<additional>` and `<msPart>`.|§2.1.3|
|msFrag|||To declare if your text is transmitted in a fragmented manuscript|§2.1.3|
|msIdentifier||Mandatory|Manuscript identifier.|§2.1.3|
|msItem|-@n||Describes an individual work or item within the intellectual content of a manuscript|§2.1.3|
|msName|-@xml:lang||Unstructured alternative name used for a manuscript|§2.1.3|
|msPart|||Declares that your witness belongs to a manuscript composed of parts that were originally separated and that have been bound together at a later stage|§2.1.3|
|name|||Contains a name, i.e. a proper noun or a noun phrase.|§2.1.1.2|
|normalization|||Explain the extent of normalization and regularization applied on the text as critically edited|§2.2.1.1; §6.1|
|note|-@type(values: altLem, prosody) -@copyOf -@corresp -@sameAs -@resp -@source -@rend(value: check)||Contains comments to the text by the editor. It can be in a freeform text pertaining to a particular lemma.|§5.1.1; §5.1.2; §5.1.5; §5.3.1.1; §5.3.1.2; §6.2.1; §6.2.2; §6.2.3; §6.2.3.1; §6.2.3.2; §7.2.3; §7.4; §8.2.1; §8.5; §9.1.4; §9.1.4.4|
|notesStmt|||Gathers any notes or remarks providing information about additions to that recorded in other parts of the bibliographic description|§9.1.1; §9.2.1; §9.3.1|
|num|-@value -@cert(value:low) -@rend(value: check)||Numeral. Contains a numeral, including any delimiters. It does not replace the <g> element.|§8.6.1.2; §8.6.4; §8.7.1|
|objectDesc|||Description of the physical components of your manuscript|§2.1.3|
|origDate|@when||Date of creation of your manuscript|§2.1.3|
|origPlace|||Place of creation of your manuscript|§2.1.3|
|p|-@xml:id -@next -@prev -@part(values: I, M, F) -@rend(value: check, stanza) -@n -@corresp -@cource -@resp||Paragraph. Marks paragraphs in prose of at least one complete sentence or the equivalent of a semantic paragraph.|§2.1.2; §2.1.3; §3.2; §3.3.1; §3.6; §3.7; §4.5; §4.7; §4.8.1; §6.2.2; §8.2.1; §9.1.2.2; §9.1.3.1; §9.1.3.2; §9.2.2.3; ; §9.2.2.4|
|pb|-@n -@break(value: no) -@source -@wit -@edRef||Page beginning. An empty element which marks the beginning of a new page in a paginated document. It is also used in foliated documents (having numbers like ‘1r’, ‘1v’, ‘2r’, ‘2v’, and so on.)|§5.5.1; §8.1; §8.1.1; §8.1.2|
|persName|-@ref(mandatory in the teiHeader) -@type(values: divine, human, personification) -@subtype(values: coronation, sobriquet, title, other) -@key -@rend(value: check)||Personal name. Contains a proper noun or a proper noun phrase referring to a person, consisting of one or more words. For Occidental names, use `<forename>` and `<surname>` structures and for others `<name>`.|§2.1.1.2; §3.5.3; §7.2.1; §8.6.2.1|
|physDesc||Mandatory|Physical description of a manuscript|§2.1.3|
|placeName|-@type(values: district, site, sitePart) -@subtype (values: temple, shrine, monastery, feedingHall, tank, pavillion, garden) -@ref -@key||A name of a specific location.|§8.6.2.3|
|prefixDef|-@ident(mandatory) -@matchPattern(mandatory) -@replacementPattern(mandatory)|Mandatory|Path toward some data to complete the edition|§2.2|
|profilDesc|||Provide metadata related to non-bibliographic aspects of the text|§2.2.2|
|projectDesc||Recommended|Use to state your project|§2.2; §2.2.1; §9.1.1; §9.2.1; §9.3.1|
|ptr|-@target -@rend(values:title, siglum)||Pointer for bibliographical data and citing witnesses, sigla and hands|§2.1.3; §2.1.4; §7.2.3; §7.2.3.1; §7.4; §7.4.2.2; §8.4.1; §9.3.2.2|
|publicationStmt||Mandatory|Publication statement. Groups information concerning the publication or distribution of an electronic or other text.|§2.1.2; §9.1.1; §9.2.1; §9.3.1|
|pubPlace||Mandatory|Publication place for legal matters stating the edition.|§2.1.2; §9.1.1; §9.2.1; §9.3.1|
|punctuation|||Explain the degree of correspondence between punctuation of your constituted text and the punctuation found in the witnesses|§2.2.1.1|
|q|-@rend(value: check)||Quoted text not attributed to a publish source.|§8.3.2|
|quote|-@xml:lang -@rend(values: block, check) -@type(value: base-text))||Quotation. Contains a quotation from another source or a base text segment|§3.7; §4.1; §4.2; §4.3; §4.4; §4.5; §4.6; §8.3; §8.3.1|
|rdg|-@wit -@cause(values:eye-skip, line_omission, haplography, dittography, lexical, morphological, ordinal, syntatic, subtrative, additive) -@hand -@varSeq(values: 1 ou 2) -@sameAs -@type(values: paradosis, transposition) -@resp -@rend(value: check)||Reading. Contains an alternative reading. Must be wrapped inside the element `<app>` and follow a `<lem>`.|§5.1.1; §5.1.2; §5.1.5; §5.4; §5.5.3; §5.5.4; §5.5.5.2; §5.5.8; §5.5.11.2; §5.8.2; §5.8.3; §6.3; §8.5|
|ref|@target -@cRef -@rend(value: check)||Reference. Defines a reference to another inscription in the DHARMABase.|§2.2; §7.4; §7.4.1; §7.4.2; §8.3.1|
|repository||Mandatory|Contains the name of a repository which stored the inscription.|§2.1.3|
|resp||Recommended|Responsibility. Contains a phrase describing the type of responsibility, e.g. transcription, conversion, proof-reading.|§2.1.1.2|
|respStmt||Recommended|Statement of responsibility. Particularly important when listing the contributors to an edition.|§2.1.1.2|
|revisionDesc||Mandatory|Revision description. Summarizes the revision history of the text.|§2.2.3; §7.2.1; §9.1.1; §9.2.1; §9.3.1|
|roleName|-@type(values: king, subordinateRuler, landlord,godLegalEntity, priest, brahmin, monk, merchant, artisan, brahminDelegate, regionalDelegate, officer, dancer, singer, peasant, shepherd, unknown) -@subtype(values: donor, donee, founder, administrator, inChargeDonation, witness, orderIssuer, orderAddressee, auditor, beneficiaryMerit, commemoratedPerson, scribe, composer, handwriter, engraver, sealer/solderer) -@rend(value: check)||Contains a name component which indicates that the referent has a particular role or position in society, such as an official title or rank.|§8.6.2.2|
|said|-@who(recommended in case of ambiguity) -@rend(value: check)||Direct speech quotations|§3.5.2|
|samplingDesc|||Record free-text information about inclusion or omission of portions of the text, manuscripts, or witnesses|§2.2.1.2|
|schemaRef|-@type -@key @url(mandatory)|Mandatory|Point to any external customization file of the TEI.|§2.2; §2.2.1.3|
|secl|-@rend(value: check)||Secluded. Genuine interpolation for which you can't determine a position in the text|§5.6.4|
|seg|-@type(value: highlight, interpolation) -@met -@cert(value:low) -@rend(values: check, pun)||Segment. Groups one or more strings of text, e.g. words.|§5.5.2; §5.5.9.1; §5.6.2; §8.7.1; §9.1.4.3; §9.1.4.4|
|settlement|||Name of a settlement such as a city, town, or village identified as an administrative unit|§2.1.3|
|sic|-@rend(value: check)||Contains a passage reproduced as is although apparently incorrect or inaccurate. By EpiDoc convention, this markup is used for text that is legible but does not seem intelligible.|§5.9; §9.1.4.3|
|sourceDesc||Mandatory|Source description. Mandatory part of the header and describes the source material. Sub-element of `<fileDesc>`. Record details about the original manuscripts and printed texts used as witnesses in establishing your critical edition|§2.1.3; §9.1.1; §9.2.1; §9.3.1|
|sp|-@rend(value: check)||Individual speech in a dramatic text|§3.5.1|
|space|-@type(values: vacat, binding-hole, defect, feature, ascender, descender, other) -@unit(values: characters) -@quantity||Space is an empty element which indicates a "blank space". DHARMA does not follow regular TEI practice and is not Epic conformant either regarding the attributes.|§8.6.1.1; §8.6.1.1.1; §§8.6.1.1.2|
|span|-@type(values: omissionStart, omissionEnd)||Mark the start and the end of a scribal omission|§5.5.11.2|
|speaker||Mandatory child of `<sp>`|Specialized heading or label, giving the name of one or more speakers in a dramatic text|§3.5.1|
|stage|||Identify content that can be identified as a stage direction|§3.5.1|
|subst|||Substitution. Wraps the combination of deletion and addition.|§5.5.12.3|
|summary|-@xml:lang||Provides a summary of the edition|§2.1.3|
|supplied|-@reason (mandatory - values: implied, omitted, lost, undefined, subaudible, explanation) -@evidence(values: internal, external, conjectural) -@cert(value:low) -@rend(value: check)||Signifies text supplied by the transcriber, encoder or editor either in place of text which is missing or to clarify a reading.|§4.2; §4.3; §5.7; §5.7.1; §8.7.1; §9.1.4.1; §9.1.4.2|
|supportDesc|||Description of the materials etc. which make up the physical support for the written part of a manuscript|§2.1.3|
|surname|||Contains a family (inherited) name of a person, excluding patronyms and metronyms.|§2.1.1.2|
|surplus|-@rend(value: check)||Characters were erroneously added by the scribe, and you correct the text by suppressing the superfluous segment.|§5.6.3|
|TEI|-@corresp (mandatory for external files) -@type (values: bibliography, commentary, edition and translation- Mandatory) -@xml:id (mandatory on the main file) -xml:lang (by default eng) ||The element `<TEI>` must wrap all TEI-compliant content as a root tag. The `<TEI>` element must contain two sub-elements, `<teiHeader>` and `<text>`.|§1; §7.3; §8.9.1; §9.1.2.1; §9.2.2.1; §9.3.2.1|
|teiHeader||Mandatory|The TEI-based header contains additional descriptive information (metadata) about the digital document and is a mandatory component of every TEI document.|§2; §9.1.1; §9.2.1; §9.3.1|
|term|-@xml:lang -@xml:id -@rend(value: check)||Contains a single-word, multi-word, or symbolic designation which is regarded as a technical term. Use it to wrap a foreign element followed by its translation into a local language that can be encoded as `<gloss>`.|§2.2.2; §4.9; §7.3.2|
|text|-@xml:space(Default value must be ‘preserve’) -@xml:lang|Mandatory|Contains a single text of any kind.|§3.1; §7.3; §8.9.1; §9.1.2.1; §9.2.2.1; §9.3.2.1|
|textClass|||Contain the element `<keywords>`.|§2.2.2|
|textLang|-@mainLang (Recommended)||Describes the languages and writing systems identified in the manuscript|§2.1.3|
|title|-@type (values: main, sub) -@subype (values: editorial, base-text, commentary, translation) -@xml:lang (only if the title isn't in English) -@n (Only if more than one title bear the same @subtype) -@level(values: a) -@rend(values: plain, check)|Mandatory in the `<teiHeader>`|Contains a title for any kind of work.|§2.1.1.1; §2.1.3; §7.2.3; §8.4.2; §9.1.1; §9.2.1; §9.3.1|
|titleStmt||Mandatory|Title statement. Contains information on the title, editor and other people who have been involved in the edition.|§2.1.1; §9.1.1; §9.2.1; §9.3.1|
|unclear|-@reason (values: eccentric_ductus) -@cert(values: low) -@rend(value: check)||Stands in EpiDoc for any character “of which at least traces survive, but not adequately to identify the letter unambiguously outside of its context”.|§2.1.1; §5.5.6; §8.7.1|
|variantEncoding|-@method(mandatory; values: parallel-segmentation, double-end-point and location-referenced) -@location(mandatory; values: internat, external)|Mandatory|Declare the methodology chosen to encode the apparatus|§2.2.1.4|
|witDetail|-@wit -@type(values: pc, ac) -@rend(value: check)||Specialized type of note, used to declare an ante and post correctionem|§5.5.4; §8.2.2|
|witness|-@xml:id (Mandatory)|Mandatory|Declaration of witnesses|§2.1.3|
