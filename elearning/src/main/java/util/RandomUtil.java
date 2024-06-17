package util;

public class RandomUtil {
    public static String generateOTP() {
        String str = "0123456789";
        int len = 6;
        String otp = "";
        for (int i = 0; i < len; i++) {
            otp += str.charAt(((int) (Math.random() * 10)) % 10);
        }
        return otp;
    }
}
