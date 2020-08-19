@echo off
del *.xzap *.zap *.z?
zilf -w necklace.zil
zapf -ab necklace.zap > necklace_freq.xzap
del necklace_freq.zap
zapf necklace.zap
