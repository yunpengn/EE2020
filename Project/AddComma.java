import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Scanner;

public class AddComma {
    public static void main(String[] args) throws Exception {
        Scanner scanner = new Scanner(new File("sample2.csv"));
        OutputStream result = new FileOutputStream("sample2.coe");

        StringBuilder builder = new StringBuilder();
        builder.append("MEMORY_INITIALIZATION_RADIX=10;\n");
        builder.append("MEMORY_INITIALIZATION_VECTOR=\n");

        while(scanner.hasNextInt()) {
            int num = scanner.nextInt();
            if (num >= 0 && num <= 127) {
                builder.append(num);
                builder.append(",\n");
            }
        }

        int lastComma = builder.lastIndexOf(",");
        builder.replace(lastComma, lastComma + 1, ";");
        builder.append("\n\n");

        result.write(builder.toString().getBytes());
        scanner.close();
        result.close();
    }
}
