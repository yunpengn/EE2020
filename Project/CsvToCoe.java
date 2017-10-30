import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

public class CsvToCoe {
    public static void main(String[] args) throws Exception {
        if (args.length != 2) {
            return;
        }

        List<String> data = Files.readAllLines(Paths.get(args[0]));

        StringBuilder builder = new StringBuilder();
        builder.append("MEMORY_INITIALIZATION_RADIX=10;\n");
        builder.append("MEMORY_INITIALIZATION_VECTOR=\n");

        for (String line: data) {
            String[] parts = line.split(",");
            if (parts.length == 6) {
                builder.append(parts[4]);
                builder.append(",\n");
            }
        }

        int lastComma = builder.lastIndexOf(",");
        builder.replace(lastComma, lastComma + 1, ";");
        builder.append("\n\n");

        OutputStream result = new FileOutputStream(args[1]);
        result.write(builder.toString().getBytes());
        result.close();
    }
}
