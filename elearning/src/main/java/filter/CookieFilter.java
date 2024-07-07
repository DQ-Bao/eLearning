package filter;

import java.io.IOException;

import data_access.UserDataAccess;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import model.User;

public class CookieFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)request;

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user_login")) {
                        String token = cookie.getValue();
                        User user = UserDataAccess.getInstance().getUserByLoginToken(token);
                        if (user != null) {
                            session = req.getSession(true);
                            session.setAttribute("user", user);
                        }
                        break;
                    }
                }
            }
        }
        chain.doFilter(request, response);
    }
}
