package Servlets;

import MessageServices.Consumer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ConsumerServlet", value = "/ConsumerServlet")
public class ConsumerServlet extends HttpServlet {

    Consumer consumer = new Consumer();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        while (true) {
            try {
                consumer.obtainMessage();
            } catch (Exception e) {
                break;
            }
        }
        String[] messages = consumer.getMessages();

        HtmlWriter.writeConsumerPage(writer, messages);
    }
}
