import argparse
import re
import urllib.request
import html.parser

from html.parser import HTMLParser
import requests


class MyParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.linkset = set() 

    def _isAbsUrl(self, url):
        return url.startswith("http") and "https" not in url

    def _isAbsSecureUrl(self, url):
        return url.startswith("https")

    def handle_starttag(self, tag, attrs):
        if tag == "a":
            attDict = dict(attrs)
            if "href" in attDict and self._isAbsUrl(attDict["href"]):
                self.linkset.add(attDict["href"])


class InternetIndexer:
    def __init__(self, startpageLink, depth):
        self.startpageLink = startpageLink
        self.depth = depth
        self.links = set([startpageLink]) 
        self._getMoreLinks(startpageLink)
        print(self.links)

    def _getMoreLinks(self, pagelink, depth = 0):
        htmlParser = MyParser()
        
        """
        with urllib.request.urlopen(pagelink) as p:
            htmlParser.feed(p.read().decode('utf8'))
        self.links.update(htmlParser.linkset)
        """
        #"""
        try:
            with urllib.request.urlopen(pagelink) as p:
                htmlParser.feed(p.read().decode('utf8'))
        except:
            print("error")
        #htmlParser.feed(requests.get(pagelink).text)
        self.links.update(htmlParser.linkset)
        #"""

        if self.depth - depth > 0:
            for l in htmlParser.linkset:
                self._getMoreLinks(l, depth + 1)

    def _count(self, word, url):
        try:
            return len(re.findall(word, str(urllib.request.urlopen(url).read()), flags = re.IGNORECASE))
        except:
            return 0

    def __getitem__(self, word):
        return sorted([(self._count(word, l), l)  for l in self.links], reverse = True)
        #return sorted(self.links, key = lambda l: self._count(word, l), reverse = True)


l1 = "https://en.wikipedia.org/wiki/Brilliant_arboreal_alligator_lizard"
l2 = "https://en.wikipedia.org/wiki/Monty_Python"
l3 = "http://www.basicwebsiteexample.com/"
d = 1
w = "spanish"
""
ii = InternetIndexer(l3, 2)
print(ii["and"])
