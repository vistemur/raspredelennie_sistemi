package Servlets;

import MessageServices.Producer;

import javax.jms.JMSException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Enumeration;
import java.util.LinkedList;

@WebServlet(name = "ProducerServlet", value = "/ProducerServlet")
public class ProducerServlet extends HttpServlet {

    Producer producer = new Producer();
    LinkedList<String> messages = new LinkedList<String>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();

        HtmlWriter.writeProducerPage(writer);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String error = "";
        PrintWriter writer = response.getWriter();
        String message = request.getParameter("message");
        try {
            producer.produceMessage(message);
            messages.add(message);
        } catch (Exception e) {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            error = sw.toString();
        }

        HtmlWriter.writeProducerPage(writer, error, messages.toArray(new String[0]));
    }
}