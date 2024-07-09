package util;

import java.util.Locale;
import org.apache.commons.validator.routines.DateValidator;
import org.apache.commons.validator.routines.EmailValidator;
import org.apache.commons.validator.routines.RegexValidator;

public class ValidationUtil {
    private static ValidationUtil INSTANCE;

    private ValidationUtil() {
    }

    public static ValidationUtil getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new ValidationUtil();
        }
        return INSTANCE;
    }

    public boolean validateInt(String id) {
        return id != null && !id.isEmpty() && id.matches("^[0-9]+$");
    }
    
    public boolean validateEmail(String email) {
        EmailValidator validator = EmailValidator.getInstance();
        return validator.isValid(email);
    }

    /**
     * Validate password, a password should have at least 8 characters, at least one lowercase letter, one uppercase letter, one digit, and one special character.
     * @param password The password that need to check
     * @return whether the password is valid or not
     */
    public boolean validatePassword(String password) {
        if (password == null || password.length() < 8) {
            return false;
        }
        boolean hasLower = false;
        boolean hasUpper = false;
        boolean hasDigit = false;
        boolean hasSymbol = false;
        for (char c : password.toCharArray()) {
            if (Character.isLowerCase(c)) {
                hasLower = true;
            }
            else if (Character.isUpperCase(c)) {
                hasUpper = true;
            }
            else if (Character.isDigit(c)) {
                hasDigit = true;
            }
            else if (!Character.isLetterOrDigit(c)) {
                hasSymbol = true;
            }
            if (hasLower && hasUpper && hasDigit && hasSymbol) {
                return true;
            }
        }
        return false;
    }

    public boolean validateName(String name) {
        RegexValidator validator = new RegexValidator("^[a-zA-Z ]+$");
        return validator.isValid(name);
    }

    public boolean validateDate(String date, String pattern) {
        DateValidator validator = DateValidator.getInstance();
        return validator.isValid(date, pattern);
    }

    public <E extends Enum<E>> boolean validateEnum(Class<E> enumClass, String value) {
        try {
            Enum.valueOf(enumClass, value);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean validateCountry(String country) {
        if (country == null || country.isEmpty()) return false;
        for (String countryCode : Locale.getISOCountries()) {
            Locale obj = new Locale("", countryCode);
            if (obj.getDisplayCountry().equals(country)) {
                return true;
            }
        }
        return false;
    }

    public boolean validateLanguage(String language) {
        if (language == null || language.isEmpty()) return false;
        for (String langCode : Locale.getISOLanguages()) {
            Locale obj = new Locale(langCode);
            if (obj.getDisplayLanguage().equals(language)) {
                return true;
            }
        }
        return false;
    }
}
