package util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

public class ImageUtil {
    public enum ImageType { UserProfile, CourseThumbnail }
    private static ImageUtil INSTANCE;
    private static String IMAGE_ROOT_PATH;

    private ImageUtil() throws IOException {
        IMAGE_ROOT_PATH = PropertyUtil.getProperty("/private/application.properties", "files.image_location");
    }

    public static ImageUtil getInstance() throws IOException {
        if (INSTANCE == null) {
            INSTANCE = new ImageUtil();
        }
        return INSTANCE;
    }

    public String saveImage(InputStream image, String uploadPath, ImageType type) throws IOException {
        String imageName = generateImageName(type);
        if (IMAGE_ROOT_PATH == null || imageName == null) return null;
        String imageLocation = IMAGE_ROOT_PATH + File.separator + uploadPath;
        File file = new File(imageLocation, imageName);
        OutputStream fout = new FileOutputStream(file);
        final byte[] buf = new byte[1024];
        int len;
        while ((len = image.read(buf)) != -1) {
            fout.write(buf, 0, len);
        }
        image.close();
        fout.close();
        String imagePath = uploadPath == null || uploadPath.isBlank() ? imageName : uploadPath + File.separator + imageName;
        return imagePath;
    }

    public boolean deleteImage(String imagePath) {
        if (IMAGE_ROOT_PATH == null || imagePath == null || imagePath.isBlank()) return false;
        String imageLocation = IMAGE_ROOT_PATH + File.separator + imagePath;
        File file = new File(imageLocation);
        if (!file.exists()) return false;
        file.delete();
        return true;
    }

    private static String generateImageName(ImageType type) {
        String random = UUID.randomUUID().toString();
        switch (type) {
            case UserProfile:
                return "user_" + random + ".jpg";
            case CourseThumbnail:
                return "course_" + random + ".jpg";
            default:
                return null;
        }
    }
}
