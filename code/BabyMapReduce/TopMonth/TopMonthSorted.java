
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.StringTokenizer;
import java.util.TreeMap;
import java.util.Map;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;

public class TopMonthSorted {

    public static class TopMapper extends Mapper<Object, Text, Text, Text> {

        private Text mapDate = new Text();
        private Text mapMoney = new Text();

        @Override
        public void map(Object key, Text value, Context context) throws IOException, InterruptedException {

            String[] dateMoney = value.toString().split(",");
            String money = dateMoney[1];

            String[] fullDate = dateMoney[0].split("/");
            String yearMonth = fullDate[2] + "/" + fullDate[0];

            mapDate.set(yearMonth);
            mapMoney.set(money);
            context.write(mapDate, mapMoney);
        }
    }

    public static class TopReducer extends Reducer<Text, Text, Text, Text> {

        private Text result = new Text();

        private TreeMap<String, TreeMap<Double, String>> top = new TreeMap<String, TreeMap<Double, String>>();

        public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {

            // String tabulated = "";
            Double money = 0d;
            for (Text val : values) {
                // tabulated += "\t" + val.toString();
                money += Double.parseDouble(val.toString());
            }

            String stringMoney = Long.toString(money.longValue());
            String year = key.toString().split("/")[0];

            TreeMap<Double, String> topContent = top.get(year);
            if (topContent != null) {
                topContent.put(money, key.toString());
            } else {
                topContent = new TreeMap<Double, String>();
                topContent.put(money, key.toString());
            }

            // Sort
            if (topContent.size() > 6) {
                topContent.remove(topContent.firstKey());
            }

            top.put(year, topContent);

            // result.set(stringMoney);
            // result.set(tabulated);
            // context.write(key, result);
        }

        public void cleanup(Context context) throws IOException, InterruptedException {
            for (Map.Entry<String, TreeMap<Double, String>> entry : top.entrySet()) {
                String year = entry.getKey();
                for (Map.Entry<Double, String> inside : entry.getValue().entrySet()) {
                    String month = inside.getValue();
                    Double money = inside.getKey();
                    String stringMoney = Long.toString(money.longValue());

                    Text key = new Text(month);
                    Text value = new Text(stringMoney);
                    context.write(key, value);
                }
            }
        }
    }

    public static void main(String[] args) throws Exception {

        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, "Top Month Sorted");
        job.setJarByClass(TopMonthSorted.class);
        job.setMapperClass(TopMapper.class);
        job.setCombinerClass(TopReducer.class);
        job.setReducerClass(TopReducer.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(Text.class);
        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));
        System.exit(job.waitForCompletion(true) ? 0 : 1);

    }
}
