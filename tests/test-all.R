

## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##
## Load prerequisites
## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##

library(seqTools)

## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##
## Initialize example data
## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##

basedir<-system.file("extdata",package="seqTools")

## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##
## Run tests
## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##

filename <- "test_seqTools.R"
basedir <- system.file("extdata", package = "seqTools")
load(file.path(basedir,"test_res.RData"))



## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##
## kmerCount.fastqq
## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##

fq <- fastqq(file.path(basedir, "test_l5_N.fq"), k = 2)
if(!identical(kmerCount(fq), kmer_l5_N))
    stop("[kmerCount.fastqq] Test 1 '", filename, "' FAILED!")

fq<-fastqq(file.path(basedir, "test_l6.fq"), k = 2)
if(!identical(kmerCount(fq), kmer_l6))
    stop("[kmerCount.fastqq] Test 2 '", filename, "' FAILED!")

fq<-fastqq(file.path(basedir, "test_l6_multi_line.fq"), k = 2)
if(!identical(kmerCount(fq), kmer_l6_ml))
    stop("[kmerCount.fastqq] Test 3 '", filename, "' FAILED!")

fq<-fastqq(file.path(basedir, "test_l10_20_40.fq"),k = 2)
if(!identical(kmerCount(fq), kmer_l10_20))
    stop("[kmerCount.fastqq] Test 4 '", filename, "' FAILED!")

fq<-fastqq(file.path(basedir, "test_l10_atcg.fq"), k = 2)
if(!identical(kmerCount(fq), kmer_l10_atcg))
    stop("[kmerCount.fastqq] Test 5 '", filename, "' FAILED!")

fq<-fastqq(file.path(basedir, "test_l10_ATCGN.fq"), k = 2)
if(!identical(kmerCount(fq), kmer_l10_ATCGN))
    stop("[kmerCount.fastqq] Test 6 '", filename, "' FAILED!")

# Counting k-mers on linux ('\n') and equal windows ('\r\n')
# formatted FASTQ file should give equal results
# fq<-fastqq(file.path(basedir, c("test_l4.fq", "test_win.fq")), k = 2)
# kc <- kmerCount(fq)
# if(!all(kc[,1]==kc[,2]))
#     stop("[kmerCount.fastqq] test_l4: kmerCount unequal to test_win.fq")

## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##
## ascii2char, char2ascii
## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##

if(!identical(ascii2char(97:101, multiple = FALSE), "abcde"))
    stop("[ascii2char] Test 1 '", filename, "' FAILED!")

if(!identical(ascii2char(97:101, multiple = TRUE), letters[1:5]))
    stop("[ascii2char] Test 2 '", filename, "' FAILED!")

if(!identical(ascii2char(char2ascii("abcde")), "abcde"))
    stop("[ascii2char] Test 3 '", filename, "' FAILED!")

if(!identical(char2ascii("abcde"), 97:101))
    stop("[char2ascii] Test 1 '", filename, "' FAILED!")

## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##
## END OF FILE
## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##

