
rm output.html
javac src/XmlToHtmlWithXSLT.java
mv src/XmlToHtmlWithXSLT.class XmlToHtmlWithXSLT.class
touch output.html
java XmlToHtmlWithXSLT
rm XmlToHtmlWithXSLT.class
echo input
cat input.xml
echo
echo output
cat output.html
