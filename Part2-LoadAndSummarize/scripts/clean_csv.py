
import csv
import os
import time


def clean_csv(csv_in, csv_out):
    row_sizes = set()
    with open(csv_in, newline='', encoding='utf8') as file_reader, open(csv_out, 'w', encoding='utf8', newline='') as file_writer:
        csv_reader = csv.reader(file_reader, delimiter=',', quotechar='"')
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

    # Spain

    spain_listing = 'D:\DEV\LoadAndSummarize\data\original_Barcelona_Catalonia_Spain_listings.csv'
    spain_listing_clean = 'D:\DEV\LoadAndSummarize\data\clean_Barcelona_Catalonia_Spain_listings.csv'

    spain_calendar = 'D:\DEV\LoadAndSummarize\data\original_Barcelona_Catalonia_Spain_calendar.csv'
    spain_calendar_clean = 'D:\DEV\LoadAndSummarize\data\clean_Barcelona_Catalonia_Spain_calendar.csv'

    clean_csv(spain_listing, spain_listing_clean)
    clean_csv(spain_calendar, spain_calendar_clean)

    # Africa

    africa_listing = 'D:\DEV\LoadAndSummarize\data\original_Cape_Town_Western_Cape_South_Africa_listings.csv'
    africa_listing_clean = 'D:\DEV\LoadAndSummarize\data\clean_Cape_Town_Western_Cape_South_Africa_listings.csv'

    africa_calendar = 'D:\DEV\LoadAndSummarize\data\original_Cape_Town_Western_Cape_South_Africa_calendar.csv'
    africa_calendar_clean = 'D:\DEV\LoadAndSummarize\data\clean_Cape_Town_Western_Cape_South_Africa_calendar.csv'

    clean_csv(africa_listing, africa_listing_clean)
    clean_csv(africa_calendar, africa_calendar_clean)

    # Canada

    canada_listing = 'D:\DEV\LoadAndSummarize\data\original_Montreal_Quebec_Canada_listings.csv'
    canada_listing_clean = 'D:\DEV\LoadAndSummarize\data\clean_Montreal_Quebec_Canada_listings.csv'

    canada_calendar = 'D:\DEV\LoadAndSummarize\data\original_Montreal_Quebec_Canada_calendar.csv'
    canada_calendar_clean = 'D:\DEV\LoadAndSummarize\data\clean_Montreal_Quebec_Canada_calendar.csv'

    clean_csv(canada_listing, canada_listing_clean)
    clean_csv(canada_calendar, canada_calendar_clean)

    print(f"\nDone! ({round(time.time() - delta)}s)")
