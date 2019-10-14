package ifmo.pip.lab2;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.json.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import static ifmo.pip.lab2.Point.checkArea;

@WebServlet(name = "AreaCheckServlet", urlPatterns = "/checking")
public class AreaCheckServlet extends HttpServlet {

    private ServletConfig config;
    private List<Point> list = null;

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.config = config;
    }

    @Override
    public void destroy() {
    }

    @Override
    public ServletConfig getServletConfig() {
        return config;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (list == null) {
            list = new ArrayList<Point>();
            config.getServletContext().setAttribute("list", list);
        }
        try {
            String xString = request.getParameter("x");
            String yString = request.getParameter("y");
            String RString = request.getParameter("r");

            xString = xString.replace(',', '.');
            yString = yString.replace(',', '.');
            RString = RString.replace(',', '.');
            Double R = Double.parseDouble(RString);
            if (R == 1 || R == 1.5 || R == 2 || R == 2.5 ||  R == 3) {
            Point p = new Point(Double.parseDouble(xString),
                    Double.parseDouble(yString), Double.parseDouble(RString));
            p.isInArea = checkArea(p.x, p.y, p.R);
            list.add(p);
            }
            else {
                request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        //todo потестить
        //setStatus(302) без setHeader
//        response.sendRedirect("/response");
        request.getServletContext().getRequestDispatcher("/response.jsp").forward(request, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("control");
    }

}
