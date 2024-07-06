package controller;

import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Account;
import model.AccountRequest.AccountData;
import model.Message;
import model.Request;
import util.MailUtil;
import util.PropertyUtil;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.commonmark.node.Node;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.HtmlRenderer;

import com.opencsv.bean.CsvToBeanBuilder;
import com.opencsv.enums.CSVReaderNullFieldIndicator;

import data_access.RequestDataAccess;
import data_access.UserDataAccess;

public class AdminRequestController extends HttpServlet {
    private RequestDataAccess reqDAO;
    private UserDataAccess userDAO;

    @Override
    public void init() throws ServletException {
        reqDAO = RequestDataAccess.getInstance();
        userDAO = UserDataAccess.getInstance();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr == null || idStr.isEmpty() || !idStr.matches("^[0-9]+$")) {
            resp.sendError(404);
            return;
        }
        int id = Integer.parseInt(idStr);
        Request request = reqDAO.getRequestById(id);
        if (request == null) {
            resp.sendError(404);
            return;
        }
        req.setAttribute("req", request);
        req.getRequestDispatcher("/WEB-INF/admin/request_detail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            resp.sendError(404);
            return;
        }
        if (action.equals("add_account")) {
            addAccounts(req);
            resp.sendRedirect(req.getContextPath() + "/admin/home");
        }
        else if (action.equals("send_contact_reply")) {
            String verifyEmail = req.getParameter("email");
            Parser parser = Parser.builder().build();
            String mdReply = req.getParameter("reply_message");
            Node document = parser.parse(mdReply);
            HtmlRenderer htmlRenderer = HtmlRenderer.builder().build();
            String replyHtml = htmlRenderer.render(document);
            try {
                String fromEmailAddress = PropertyUtil.getProperty("/private/application.properties", "system.mail");
                MailUtil mail = MailUtil.getInstance();
                mail.sendEmail(verifyEmail, fromEmailAddress, "Thank for contacting us!", replyHtml, "text/html");
            } catch (IOException | MessagingException e) {
                e.printStackTrace();
            }

            String idStr = req.getParameter("id");
            if (idStr == null || idStr.isEmpty() || !idStr.matches("^[0-9]+$")) {
                resp.sendError(404);
                return;
            }
            int id = Integer.parseInt(idStr);
            String status = req.getParameter("status");
            try {
                reqDAO.updateRequest(id, Request.Status.valueOf(status), mdReply);
            } catch (Exception e) {
                e.printStackTrace();
            }
            resp.sendRedirect(req.getContextPath() + "/admin/home");
        }
        else if (action.equals("send_account_reply")) {
            String idStr = req.getParameter("id");
            if (idStr == null || idStr.isEmpty() || !idStr.matches("^[0-9]+$")) {
                resp.sendError(404);
                return;
            }
            int id = Integer.parseInt(idStr);
            String reply = req.getParameter("reply_message");
            String statusStr = req.getParameter("status");
            try {
                Request.Status status = Request.Status.valueOf(statusStr);
                if (status == Request.Status.Accepted) {
                    addAccounts(req);
                }
                reqDAO.updateRequest(id, status, reply);
            } catch (Exception e) {
                e.printStackTrace();
            }
            resp.sendRedirect(req.getContextPath() + "/admin/home");
        }
        else if (action.equals("remove_request")) {
            String idStr = req.getParameter("id");
            if (idStr == null || idStr.isEmpty() || !idStr.matches("^[0-9]+$")) {
                resp.sendError(404);
                return;
            }
            int id = Integer.parseInt(idStr);
            reqDAO.deleteRequest(id);
            resp.sendRedirect(req.getContextPath() + "/admin/home");
        }
    }
    private void addAccounts(HttpServletRequest req) throws IOException, ServletException {
        List<AccountData> addList = new ArrayList<>();
        if (req.getContentType() != null && req.getContentType().toLowerCase().indexOf("multipart/form-data") > -1) {
            Part filePart = req.getPart("acc_file");
            if (filePart != null && filePart.getSize() > 0) {
                addList = new CsvToBeanBuilder<AccountData>(new InputStreamReader(filePart.getInputStream()))
                    .withType(AccountData.class)
                    .withFieldAsNull(CSVReaderNullFieldIndicator.BOTH)
                    .build().parse();
            }
        }

        int cnt = 0;
        while (req.getParameter("email_" + cnt) != null) {
            AccountData data = new AccountData();
            data.setEmail(req.getParameter("email_" + cnt));
            data.setRole(Account.stringToRole(req.getParameter("role_" + cnt)));
            data.setManager(req.getParameter("manager_" + cnt));
            data.setCountry(req.getParameter("country_" + cnt));
            data.setPosition(req.getParameter("position_" + cnt));
            addList.add(data);
            cnt++;
        }
        HttpSession session = req.getSession();
        if (!userDAO.addAccountList(addList)) {
            session.setAttribute("message", new Message(Message.Type.Error, "Add accounts failed!"));
        }
        else {
            session.setAttribute("message", new Message(Message.Type.Success, "Accounts added!"));
        }
    }
}
