
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.StringTokenizer;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;


public class SalesTotal {

    public static class SalesMapper extends Mapper<Object, Text, Text, Text> {

        private Text mapDate = new Text();
        private Text mapMoney = new Text();

        public void map(Object key, Text value, Context context) throws IOException, InterruptedException {

            String[] dateMoney = value.toString().split(",");

            String date = dateMoney[0];
            String money = dateMoney[1];

            SimpleDateFormat fromDate = new SimpleDateFormat("dd/MM/YYYY");
            SimpleDateFormat toDate = new SimpleDateFormat("YYYY");

            try {
                date = toDate.format(fromDate.parse(dateMoney[0]));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            mapDate.set(date);
            mapMoney.set(money);
            context.write(mapDate, mapMoney);
        }
    }

    public static class SalesReducer extends Reducer<Text, Text, Text, Text> {

        private Text result = new Text();

        public void reduce(Text key, Iterable<Text> values, Context context)
                throws IOException, InterruptedException {

            // String sum = "";
            Float money = 0f;
            for (Text val : values) {
                // sum += val.toString() + "; ";
                money += Float.parseFloat(val.toString());
            }

            // result.set(sum);
            result.set(Float.toString(money));
            context.write(key, result);
        }
    }

    public static void main(String[] args) throws Exception {

        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, "Sales Total");
        job.setJarByClass(SalesTotal.class);
        job.setMapperClass(SalesMapper.class);
        job.setCombinerClass(SalesReducer.class);
        job.setReducerClass(SalesReducer.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(Text.class);
        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));
        System.exit(job.waitForCompletion(true) ? 0 : 1);

    }
}
