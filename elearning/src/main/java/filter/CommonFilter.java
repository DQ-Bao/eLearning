package filter;

import java.io.IOException;
import java.util.List;
import data_access.CourseDataAccess;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import model.Message;

public class CommonFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)request;
        List<String> list = CourseDataAccess.getInstance().getAllCategories();
        HttpSession session = req.getSession();
        Message message = (Message)session.getAttribute("message");
        if (message != null) {
            req.setAttribute("message", message);
            session.removeAttribute("message");
        }
        req.setAttribute("category_list", list);
        chain.doFilter(request, response);
    }
}
