from collections import Counter

D = len(open('wordVecArticles.txt').readlines())
articles = [ line.rstrip('\n') for line in open ('wordVecArticles.txt')]
corpus = " ".join(articles)
words = list(Counter(corpus.split()).keys())
words.sort()
W = len(words)
lexicon = {k: v for v, k in enumerate(words)}

# Initialize frequency matrix
fterms = []
for i in range(W):
    fterms.append([0]*D)

# Fill in word frequency in each document
for i in range(D):
    wordcounts = Counter(articles[i].split())
    for word, wordcount in wordcounts.items():
        fterms[lexicon[word]][i]=wordcount

# for i in range(W):
#     print(fterms[i])

print(fterms[684]) # this shows number of times "he" appears in each document. It matches the given fterms output.
