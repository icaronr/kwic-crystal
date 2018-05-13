INPUTFILE  = ./res/papers.txt
OUTPUTFILE = ./res/teste.txt
STOPWORDS  = ./res/stop_words.txt

ARGS       = $(INPUTFILE) $(OUTPUTFILE) $(STOPWORDS)

# possisveis flags de entrada:
ENTRADA = 
# possiveis flags de saida: 
TERMINAL = --define terminal
ARQUIVO = --define arquivo

FLAGS	= $(ENTRADA) $(TERMINAL) $(ARQUIVO)

all: run

build:
	crystal build mainc.cr -o kwic

run:
	crystal main.cr $(FLAGS) -- $(ARGS)
