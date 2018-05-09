INPUTFILE  = ./res/papers.txt
OUTPUTFILE = ./out/test-res.txt
STOPWORDS  = ./res/stop_words.txt

ARGS       = $(INPUTFILE) $(OUTPUTFILE) $(STOPWORDS)

FLAGS =

all: run

build:
	crystal build mainc.cr -o kwic

run:
	crystal main.cr $(FLAGS) -- $(ARGS)