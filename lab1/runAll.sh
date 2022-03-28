#!/usr/bin/env bash
set -euo pipefail
cd `dirname ${BASH_SOURCE[0]}`

javac src/XmlToHtmlWithXSLT.java
mv src/XmlToHtmlWithXSLT.class XmlToHtmlWithXSLT.class

rm -rf out
mkdir out
for ((i = 1 ; i < 8 ; i++)); do
    cp insi/input${i}.xml input.xml
    cp transi/transformer${i}.xsl transformer.xsl
    touch output.html
    java XmlToHtmlWithXSLT

    echo test $i
    echo input
    cat input.xml
    echo
    echo transformer
    cat transformer.xsl
    echo
    echo output
    cat output.html
    echo

    mv output.html out/output${i}.html
done
rm XmlToHtmlWithXSLT.class
