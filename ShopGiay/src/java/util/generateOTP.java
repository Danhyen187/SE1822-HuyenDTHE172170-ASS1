package util;

public class generateOTP {

    public static String generateOTP(int length) {
        String characters = "0123456789";
        String result = "";
        int charactersLength = characters.length();
        for (int i = 0; i < length; i++) {
            result += characters.charAt((int) Math.floor(Math.random() * charactersLength));
        }
        return result;
    }
}
