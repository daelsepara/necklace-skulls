all: clean
	zilf -w necklace.zil
	-zapf -ab necklace.zap > necklace_freq.xzap
	rm necklace_freq.zap
	zapf necklace.zap

test: clean
	zilf -w necklace.zil
	zapf necklace.zap

clean:
	rm -f *.xzap *.zap *.z?
