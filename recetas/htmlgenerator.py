from lxml import etree

# Cargar el archivo XML y XSLT
xml_file = 'recetas.xml'  # Ruta de tu archivo XML
xslt_file = 'recetas.xsl'  # Ruta de tu archivo XSLT

# Cargar los archivos XML y XSLT como bytes
with open(xml_file, 'rb') as xml_f:
    xml_content = xml_f.read()

with open(xslt_file, 'rb') as xslt_f:
    xslt_content = xslt_f.read()

# Parsear el contenido XML y XSLT
xml_tree = etree.XML(xml_content)
xslt_tree = etree.XML(xslt_content)

# Crear un objeto de transformación XSLT
transform = etree.XSLT(xslt_tree)

# Iterar sobre cada receta en el XML
for i, receta in enumerate(xml_tree.xpath('/receptes/recepta'), start=1): 
    # Crear un nombre de archivo único basado en el número (receta1.html, receta2.html, ...)
    html_filename = f"receta{i}.html"
    
    # Crear un árbol XML solo con la receta actual
    receta_xml = etree.Element("receptes")  # Usamos "receptes" para que coincida con la estructura
    receta_xml.append(receta)  # Agregar solo la receta actual
    
    # Crear un árbol XML solo con la receta actual
    receta_tree = etree.ElementTree(receta_xml)
    
    # Aplicar la transformación XSLT a la receta individual
    transformed_html = transform(receta_tree)
    
    # Guardar el archivo HTML para la receta actual
    with open(html_filename, 'wb') as html_file:
        html_file.write(bytes(str(transformed_html), 'utf-8'))

    print(f"Generado: {html_filename}")