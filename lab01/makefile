all: compareText writeText
compareText: compareText.s
	as -o ./out/compareText.o compareText.s
	ld -o ./out/compareText ./out/compareText.o
writeText: writeText.s
	as -o ./out/writeText.o writeText.s
	ld -o ./out/writeText ./out/writeText.o
