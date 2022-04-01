package Initial;

import java.io.PrintWriter;

public class InitialPageWriter {

    public static void writeStart(PrintWriter writer) {
        writer.println("<html>");
        writer.println("<body>");
    }

    public static void writeEnd(PrintWriter writer) {
        writer.println("</body>");
        writer.println("</html>");
    }

    public static void formStart(PrintWriter writer) {
        writer.println("<form action=\"/lab2-1.0/Init\" method=\"post\">");
    }

    public static void formEnd(PrintWriter writer) {
        writer.println("<input type=\"submit\" value=\"GO!\"/>");
        writer.println("</form>");
    }

    public static void writeInput(PrintWriter writer, String value) {
        writer.println("<p>");
        writer.println(value + " ");
        writer.println("<input type=\"text\" name=\"" + value + "\"/>");
        writer.println("</p>");
    }

    public static void writeParameterMissing(PrintWriter writer, String name) {
        writer.println("<p1>");
        writer.println(name);
        writer.println(" missing value");
        writer.println("</p1>");
        writer.println("<br>");
    }

    public static void writeParameter(PrintWriter writer, String name, String value) {
        writer.println("<p1>");
        writer.println(name);
        writer.println(" value = ");
        writer.println(value);
        writer.println("</p1>");
        writer.println("<br>");
    }
}
