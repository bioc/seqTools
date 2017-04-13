
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
## countDnaKmers
## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##

if(!identical(countDnaKmers("ACGT", k = 1, start = 3:1, width = 1), cdk_ACGT))
    stop("[countDnaKmers] Test 1 '", filename, "' FAILED!")

if(!identical(countDnaKmers("ACGT", k = 1, start = 3, width = 1), cdk_ACGT_one))
    stop("[countDnaKmers] Test 2 '", filename, "' FAILED!")

if(!identical(
        countDnaKmers("ATTNAC", k = 2, start = 1:3, width = 1), cdk_ATTNAC))
    stop("[countDnaKmers] Test 3 '", filename, "' FAILED!")

## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##
## revCountDnaKmers
## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##

if(!identical(
        revCountDnaKmers("ACGTACGT", k = 2, start = 6:4, width = 2), rck_ACGT))
    stop("[revCountDnaKmers] Test 1 '", filename, "' FAILED!")



## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##
## END OF FILE
## + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ##
