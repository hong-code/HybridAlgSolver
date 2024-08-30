

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
    public static void main(String[] args) throws IOException{
        try {
            if (args.length < 2) {
                System.out.println("Usage: java Main <regex_base64> <attack_file_path>");
                return;
            }
            // 读取第一个命令行参数保存为regex_base64, 第二个命令行参数保存为attack_file_path
            String regex_base64 = args[0];
            String attack_file_path = args[1];

            // 将regex_base64解码为regex
            String regex = new String(Base64.getDecoder().decode(regex_base64));
            // 读取文件内容
            String content = new String(Files.readAllBytes(Paths.get(attack_file_path)));

            // String regex = "(?=(?:[^\\']*\\'[^\\']*\\')*(?![^\\']*\\'))";

            // // content
            // // Attack String :" class=" + "000g" * 3750 + "&\u0000&\u0000&\u0000"
            // String content = " class=";
            // for (int i = 0; i < 10000; i++) {
            //     content += "000g";
            // }
            // content += "&\u0000&\u0000&\u0000";

            // 用regex对文件内容进行search
            Pattern pattern = Pattern.compile(regex);
            Matcher matcher = pattern.matcher(content);

            // 返回匹配结果
            if (matcher.find()) {
                System.out.println("Match found.");
            } else {
                System.out.println("No match found.");
            }
        } catch (IllegalArgumentException e) {
            System.out.println("Invalid Base64 input: " + e.getMessage());
        }
    }
}
