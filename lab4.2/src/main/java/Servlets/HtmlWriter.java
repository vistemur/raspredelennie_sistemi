package Servlets;

import java.io.PrintWriter;

public class HtmlWriter {

    public static void writeStart(PrintWriter writer) {
        writer.println("<html>");
        writer.println("<body>");
    }

    public static void writeEnd(PrintWriter writer) {
        writer.println("</body>");
        writer.println("</html>");
    }

    public static void writeForm(PrintWriter writer) {
        writer.println("<form action=\"/lab4-1.0/ProducerServlet\" method=\"post\">");
        writer.println("<p>");
        writer.println("message ");
        writer.println("<input type=\"text\" name=\"message\"/>");
        writer.println("</p>");
        writer.println("<input type=\"submit\" value=\"send\"/>");
        writer.println("</form>");
    }

    public static void writeMessages(PrintWriter writer, String[] messages) {
        writer.println("<p>");
        writer.println("messages sent");
        writer.println("<br>");
        writer.println("<p>");
        int counter = 1;
        for (String message : messages) {
            writer.println("<p>");
            writer.println("message " + counter + " - " + message);
            writer.println("<br>");
            writer.println("</p>");
            counter += 1;
        }
    }

    public static void writeError(PrintWriter writer, String error) {
        writer.println("<p>");
        writer.println("ERROR!!!");
        writer.println("<br>");
        writer.println("message send error");
        writer.println("<br>");
        writer.println(error);
        writer.println("</p>");

    }

    public static void writeConsumerPage(PrintWriter writer, String[] messages) {
        HtmlWriter.writeStart(writer);
        HtmlWriter.writeMessages(writer, messages);
        HtmlWriter.writeEnd(writer);
    }

    public static void writeProducerPage(PrintWriter writer) {
        HtmlWriter.writeStart(writer);
        HtmlWriter.writeForm(writer);
        HtmlWriter.writeEnd(writer);
    }

    public static void writeProducerPage(PrintWriter writer, String error, String[] messages) {
        if (error == null || !error.equals("")) {
            writeProducerErrorPage(writer, error, messages);
        } else {
            writeProducerPage(writer, messages);
        }
    }

    public static void writeProducerErrorPage(PrintWriter writer, String error, String[] messages) {
        HtmlWriter.writeStart(writer);
        HtmlWriter.writeForm(writer);
        HtmlWriter.writeError(writer, error);
        HtmlWriter.writeMessages(writer, messages);
        HtmlWriter.writeEnd(writer);
    }

    public static void writeProducerPage(PrintWriter writer, String[] messages) {
        HtmlWriter.writeStart(writer);
        HtmlWriter.writeForm(writer);
        HtmlWriter.writeMessages(writer, messages);
        HtmlWriter.writeEnd(writer);
    }
}