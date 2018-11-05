
import csv
import os
import time


def clean_csv(csv_in, csv_out):
    row_sizes = set()
    with open(csv_in, newline='', encoding='utf8') as file_reader, open(csv_out, 'w', encoding='utf8', newline='') as file_writer:
        csv_reader = csv.reader(file_reader, delimiter=';', quotechar='"')
        csv_writer = csv.writer(file_writer, delimiter=',', quotechar='"')
        count = 0
        for row in csv_reader:
            if count == 0:
                count += 1
                continue
            row_sizes.add(len(row))
            clean_row = []
            for i in row:
                i = i.replace('","', ',')
                if '$' in i:
                    i = i.replace('$', '').replace(',', '')
                else:
                    i = ' '.join(i.split()).replace(',', ';')
                clean_row += [i]
            # file_writer.write(f"{','.join(clean_row)}\n")
            csv_writer.writerow(clean_row)
            count += 1
    print(f"\nCleaned: {os.path.basename(csv_in)}")
    print(f"Rows count: {count}")
    print(f"Consistence in elements per row: {row_sizes}")


if __name__ == "__main__":

    delta = time.time()

    weather = 'D:\DEV\BigData-BI\Part3-ETLing\data\\no-header_Weather_Basel-City_Switzerland.csv'
    weather_clean = 'D:\DEV\BigData-BI\Part3-ETLing\data\clean_Weather_Basel-City_Switzerland.csv'

    clean_csv(weather, weather_clean)

    print(f"\nDone! ({round(time.time() - delta)}s)")
