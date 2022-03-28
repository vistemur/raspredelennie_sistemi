import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;

public class XmlToHtmlWithXSLT {

    public static void main(String[] args) {
        Source xmlInput = new StreamSource(new File("input.xml"));
        Source xsl = new StreamSource(new File("transformer.xsl"));
        Result xmlOutput = new StreamResult(new File("output.html"));

        try {
            Transformer transformer = TransformerFactory.newInstance().newTransformer(xsl);
            transformer.transform(xmlInput, xmlOutput);
        } catch (TransformerException e) {
            System.out.println("Tranform has failure");
        }
    }
}

