package Initial;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

@WebServlet(name = "Init", value = "/Init")
public class InitialServlet extends HttpServlet {

    private String[] parameterNames = {"name", "surname", "email"};

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();

        InitialPageWriter.writeStart(writer);
        InitialPageWriter.formStart(writer);
        for (String paramName : parameterNames) {
            InitialPageWriter.writeInput(writer, paramName);
        }
        InitialPageWriter.formEnd(writer);
        InitialPageWriter.writeEnd(writer);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();

        InitialPageWriter.writeStart(writer);
        for (String paramName : parameterNames) {
            String paramValue = request.getParameter(paramName);
            if (paramValue.isEmpty()) {
                InitialPageWriter.writeParameterMissing(writer, paramName);
            } else {
                InitialPageWriter.writeParameter(writer, paramName, paramValue);
            }
        }

        InitialPageWriter.writeEnd(writer);
    }
}
