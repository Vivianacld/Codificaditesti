<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Progetto di Codifica di Testi - Diari di E. Artom</title>
                <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css" />
                <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
                <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
                <script src="script.js"></script>
                <link href="stile.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <header>
                    <div>
                        <h1 class="it">
                            <xsl:value-of select="//tei:title[@xml:lang='it']" />
                        </h1>
                    </div>
                </header>

                <nav class="navMenu">
                    <ul>
                        <li>
                            <a href="#info">Informazioni</a>
                        </li>
                        <li>
                            <a href="#p67">Pagina 67</a>
                        </li>
                        <li>
                            <a href="#p68">Pagina 68</a>
                        </li>
                        <li>
                            <a href="#p69">Pagina 69</a>
                        </li>
                        <li>
                            <a href="#append">Riferimenti</a>
                        </li>
                    </ul>
                </nav>
                <div>
                    <div id="info">
                        <article>
                            <div>
                                <div>
                                    <h2>Storia editoriale</h2>
                                    <xsl:apply-templates select="//tei:history" />
                                </div>
                                <div>
                                    <h2>Descrizione fisica</h2>
                                    <xsl:apply-templates select="//tei:physDesc" />
                                </div>
                            </div>
                        </article>

                        <article>
                            <h3>Legenda dei fenomeni notevoli</h3>
                            <ul>
                                <li>
                                    <span class="gap"></span>Gap</li>
                                <li>
                                    <span class="del"></span>Elementi cancellati</li>
                                <li>
                                    <span class="add"></span>Aggiunte</li>
                            </ul>

                            <div id="bottoni">
                                <h3>Visualizza fenomeni notevoli</h3>
                                <button id="btn-add">Aggiunte</button>
                                <button id="btn-gap">Gap</button>
                                <button id="btn-del">Elementi cancellati</button>
                                <button id="btn-hide">Nascondi tutti i fenomeni notevoli</button>
                            </div>
                        </article>


                    </div>
                </div>
                <article id="p67">
                    <h2> Pagina 67 </h2>
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='Pag67']" />
                        </div>
                        <div class="text">
                            <xsl:apply-templates select="//tei:body/tei:div[@n = '67']" />
                        </div>

                    </div>

                </article>
                <article id="p68">
                    <h2> Pagina 68 </h2>
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='Pag68']" />
                        </div>
                        <div class="testo">
                            <xsl:apply-templates select="//tei:body/tei:div[@n = '68']" />
                        </div>

                    </div>
                </article>
                <article id="p69">
                    <h2> Pagina 69 </h2>
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='Pag69']" />
                        </div>
                        <div class="testo">
                            <xsl:apply-templates select="//tei:body/tei:div[@n = '69']" />
                        </div>

                    </div>
                </article>
                <article>
                    <h3>Bibliografia</h3>
                    <xsl:apply-templates select="//tei:listBibl" />
                </article>

                <div id="append">
                    <h3 id="about">Riferimenti</h3>
                    <xsl:apply-templates select="//tei:editionStmt"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:listBibl">
        <xsl:for-each select="current()/tei:bibl">
            <xsl:apply-templates />
            <br />

        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:editionStmt">
        <p>
            <xsl:value-of select="current()/tei:edition"></xsl:value-of>
        </p>
        <p>Progetto a cura di: <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='VC']"></xsl:value-of>
        </p>
        <p>Coordinato da: <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='AMDG']"></xsl:value-of>
        </p>
    </xsl:template>


    <xsl:template match="tei:history">
        <xsl:element name="div">
            <xsl:attribute name="id">history</xsl:attribute>
            <xsl:element name="h4">Origine della bozza</xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">info</xsl:attribute>
                <xsl:attribute name="id">docOrigin</xsl:attribute>
                <xsl:apply-templates select="current()/tei:origin" />
            </xsl:element>
            <xsl:element name="h4">Acquisizione</xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">info</xsl:attribute>
                <xsl:attribute name="id">docAcq</xsl:attribute>
                <xsl:apply-templates select="current()/tei:acquisition" />
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!-- Templates dei fenomeni del documento -->


    <xsl:template match="tei:del">
        <del>
            <xsl:apply-templates />
        </del>
    </xsl:template>

    <xsl:template match="tei:persName">
        <persName>
            <xsl:apply-templates />
        </persName>
    </xsl:template>


    <xsl:template match="tei:add">
        <add>
            <xsl:apply-templates />
        </add>
    </xsl:template>

    <xsl:template match="tei:gap">
        <gap>**</gap>
    </xsl:template>


    <xsl:template match="tei:pb">
        <xsl:element name="div">
            <xsl:attribute name="id">pagina_<xsl:value-of select="current()/@n" />
            </xsl:attribute>
        </xsl:element>
    </xsl:template>


    <xsl:template match="tei:lb">
        <br />
        <xsl:element name="span">
            <xsl:attribute name="class">numeroRiga</xsl:attribute>
            <b>
                <xsl:value-of select="@n" />
            </b>
        </xsl:element>
    </xsl:template>


    <xsl:template match="tei:surface">
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="concat(@xml:id, '.jpg')" />
            </xsl:attribute>
        </xsl:element>
    </xsl:template>



</xsl:stylesheet>
