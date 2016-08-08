import argparse
import psycopg2


class Histogram():
    def __init__(self):
        self.conn = psycopg2.connect(database="tcount", user="postgres",
                                     password="pass", host="localhost", port="5432")
        self.cur = self.conn.cursor()

    def getWordsInRange(self, lower, upper):
        self.cur.execute("SELECT word, count from Tweetwordcount where count between {0} and {1}".format(lower, upper))
        records = self.cur.fetchall()
        if records:
            for rec in records:
                print "<{0}>: {1}".format(rec[0], rec[1])
        else:
            print 'There are no words with counts between bounds {0} and {1}'.format(lower, upper)
        self.conn.commit()


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("lower", nargs='?',
                        help="Display words from twitter stream with counts between two integers. Lower bound.",
                        type=int)
    parser.add_argument("upper", nargs='?',
                        help="Display words from twitter stream with counts between two integers. Uppser bound.",
                        type=int)
    args = parser.parse_args()

    if args.lower and args.upper:
        histogram = Histogram()
        histogram.getWordsInRange(args.lower, args.upper)
    else:
        print "Please supply two integer arguments, a lower and upper bound, to retrieve words with counts between"