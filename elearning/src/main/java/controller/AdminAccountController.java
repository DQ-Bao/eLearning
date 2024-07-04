package controller;

import model.Account;
import model.Message;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.ArrayList;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.exceptions.CsvException;

import data_access.UserDataAccess;

public class AdminAccountController extends HttpServlet {
    private UserDataAccess dao;

    @Override
    public void init() throws ServletException {
        dao = UserDataAccess.getInstance();
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Account> addList = new ArrayList<>();
        Part filePart = req.getPart("acc_file");
        if (filePart != null && filePart.getSize() > 0) {
            try (CSVReader reader = new CSVReaderBuilder(new InputStreamReader(filePart.getInputStream())).withSkipLines(1).build()) {
                for (String[] acc : reader.readAll()) {
                    String email = acc[0];
                    Account.Role role = Account.stringToRole(acc[1]);
                    if (email == null || email.isEmpty() || role == null) { 
                        continue;
                    }
                    addList.add(new Account(email, false, role));
                }
            } catch (IOException | CsvException e) {
                e.printStackTrace();
            }
        }

        int cnt = 0;
        while (req.getParameter("email_" + cnt) != null) {
            String email = req.getParameter("email_" + cnt);
            Account.Role role = Account.stringToRole(req.getParameter("role_" + cnt));
            if (email == null || email.isEmpty() || role == null) {
                cnt++;
                continue;
            }
            addList.add(new Account(email, false, role));
            cnt++;
        }

        if (!dao.addAccountList(addList)) {
            req.setAttribute("message", new Message(Message.Type.Error, "Add accounts failed!"));
            req.getRequestDispatcher("/WEB-INF/admin/home.jsp").forward(req, resp);
            return;
        }
        req.setAttribute("message", new Message(Message.Type.Success, "Add success!"));
        req.getRequestDispatcher("/WEB-INF/admin/home.jsp").forward(req, resp);
    }
}
