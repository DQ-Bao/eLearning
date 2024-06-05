package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertyUtil {
    public static String getProperty(String fileName, String propertyName) 
            throws IOException {
        InputStream in = PropertyUtil.class.getResourceAsStream(fileName);
        Properties props = new Properties();
        props.load(in);
        return props.getProperty(propertyName);
    }
}
