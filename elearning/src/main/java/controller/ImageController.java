package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.PropertyUtil;

public class ImageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String imageRootPath = PropertyUtil.getProperty("/private/application.properties", "files.image_location");
        String imageName = req.getPathInfo().substring(1);
        File file = new File(imageRootPath, imageName);
        if (!file.exists()) {
            resp.sendError(404);
            return;
        }
        resp.setHeader("Content-Type", req.getServletContext().getMimeType(imageName));
        resp.setHeader("Content-Length", String.valueOf(file.length()));
        Files.copy(file.toPath(), resp.getOutputStream());
    }
}
