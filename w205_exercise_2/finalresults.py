import argparse
import psycopg2


class FinalResults:
    """docstring for ClassName"""

    def __init__(self):
        self.conn = psycopg2.connect(database="tcount", user="postgres",
                                     password="pass", host="localhost", port="5432")
        self.cur = self.conn.cursor()

    def getWordCount(self, word):
        self.cur.execute(
            "SELECT count from Tweetwordcount where word = '{0}'".format(word))
        records = self.cur.fetchone()
        if records:
            print 'Total number of occurences of "{0}": {1}'.format(word, records[0])
        else:
            print 'There are no instances of "{0}"'.format(word)
        self.conn.commit()

    def getAllWordCounts(self):
        self.cur.execute(
            "SELECT word, count from Tweetwordcount order by word asc")
        records = self.cur.fetchall()
        for rec in records:
            print "(<{0}>, {1}), ".format(rec[0], rec[1])
        self.conn.commit()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("word", nargs='?',
                        help="display the word frequency from twitter stream")
    args = parser.parse_args()

    if args.word:
        wordCounts = FinalResults()
        wordCounts.getWordCount(args.word)
    else:
        wordsCounts = FinalResults()
        wordsCounts.getAllWordCounts()
