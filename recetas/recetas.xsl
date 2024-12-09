<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Recetas - Delicias Kitchen</title>
        <link rel="stylesheet" href="../css/receta2.css"/>
      </head>
      <body>
        <header>
          <div class="logo">
            <img src="../imatges/Logo-Delicias.png" alt="Logo"/>
          </div>
          <nav>
            <ul>
              <li><a href="../index.html">INICIO</a></li>
              <li><a href="../aboutME/aboutME.html">SOBRE MI</a></li>
              <li><a href="recetasp1.html">RECETAS</a></li>
              <li><a href="../contacto/contacto.html">CONTACTO</a></li>
              <li><a href="../otrasCosas/otrasCosas.html">OTRAS COSAS</a></li>
              <li><a href="#">Iker Blazquez V.</a></li>
            </ul>
          </nav>
        </header>

        <main>
          <section class="recipe">
            <h2><xsl:value-of select="receptes/recepta/nom"/></h2>
            <img>
              <xsl:attribute name="src"><xsl:value-of select="receptes/recepta/imatge/@src"/></xsl:attribute>
              <xsl:attribute name="alt"><xsl:value-of select="receptes/recepta/imatge/@alt"/></xsl:attribute>
            </img>
            <p><strong>Tiempo:</strong> <xsl:value-of select="receptes/recepta/temps"/></p>
            <p><strong>Dificultad:</strong> <xsl:value-of select="receptes/recepta/dificultat"/></p>
            <h3>Ingredientes</h3>
            <ul>
              <xsl:for-each select="receptes/recepta/ingredients/ingredient">
                <li><xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>
            <h3>Pasos</h3>
            <ol>
              <xsl:for-each select="receptes/recepta/preparacio/pas">
                <li><xsl:value-of select="."/></li>
              </xsl:for-each>
            </ol>
          </section>
        </main>

        <footer>
          <ul>
            <li><a href="#">FACEBOOK</a></li>
            <li><a href="#">TWITTER</a></li>
            <li><a href="#">INSTAGRAM</a></li>
            <li><a href="#">PINTEREST</a></li>
            <li><a href="#">EMAIL</a></li>
            <li><a href="#">RSS</a></li>
          </ul>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
