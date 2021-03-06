setwd("/media/Partek/jmsun/Java/Rune")
options(stringsAsFactors = FALSE)

# Read in rune database from google docs
SWDB <- read.table("SW_Database - RuneDB - 100915.tsv", sep = "\t", header = TRUE)

# Change all of the prefixes to the ones in column
SWDB[,7:12] <- apply(SWDB[,7:12], 2, function(col) {
  output_col <- gsub("HP \\(([[:digit:]]+)%\\)", "HPPerc \\(\\1\\)", col)
  output_col <- gsub("ATK \\(([[:digit:]]+)\\)", "ATT \\(\\1\\)", output_col)
  output_col <- gsub("ATK \\(([[:digit:]]+)%\\)", "ATTPerc \\(\\1\\)", output_col)
  output_col <- gsub("DEF \\(([[:digit:]]+)%\\)", "DEFPerc \\(\\1\\)", output_col)
  output_col <- gsub("CRIRate \\(([[:digit:]]+)%\\)", "CRT \\(\\1\\)", output_col)
  output_col <- gsub("CRIDmg \\(([[:digit:]]+)%\\)", "CRD \\(\\1\\)", output_col)
  output_col <- gsub("Accuracy \\(([[:digit:]]+)%\\)", "ACC \\(\\1\\)", output_col)
  output_col <- gsub("Resistance \\(([[:digit:]]+)%\\)", "RES \\(\\1\\)", output_col)
  return(output_col)
  })

# Construct monster dictionary
monsterDic <- c(Ahman = "1603",
                Belladeon = "1592",
                Bernard = "1600",
                Chloe = "1610",
                Copper = "1607",
                Dagora = "1605",
                Darion = "1604", 
                Konamiya = "1608",
                Lushen = "1598",
                Orochi = "1601",
                Ramagos = "1609",
                Raoq = "1602",
                Ritesh = "10157",
                Shannon = "1599",
                Sigmarus = "10156",
                Verdehile = "10155",
                Veromos = "1606")

# Construct empty matrix
SWRune <- data.frame(ID = rep("", nrow(SWDB)),
                     HeroID = rep("", nrow(SWDB)),
                     Set = "",
                     Slot = 0,
                     Star = 0,
                     HP = 0,
                     HPPerc = 0,
                     ATT = 0,
                     ATTPerc = 0,
                     DEF = 0,
                     DEFPerc = 0,
                     SPD = 0,
                     CRT = 0,
                     CRD = 0,
                     RES = 0,
                     ACC = 0)
                     
for (a in 1:nrow(SWDB)) {
  if (SWDB$Location[a] != "" & SWDB$Location[a] %in% names(monsterDic)) {
    SWRune$HeroID[a] = monsterDic[SWDB$Location[a]]
  } 
      
  SWRune$Set[a] = tolower(SWDB$TypeName[a]) 
  SWRune$Slot[a] = tolower(SWDB$Slot[a]) 
  SWRune$Star[a] = tolower(SWDB$Stars[a])
  
  attr <- unlist(SWDB[a, names(SWDB)[7:12]])
  attr <- attr[attr != ""]
  test <- sapply(attr, function(x) {
    clean_x <- gsub("\\(|\\)", "", x)
    clean_x <- unlist(strsplit(clean_x, " "))
    SWRune[a, clean_x[1]] <<- clean_x[2]
    return(SWRune)
  }) 
}

                
names(SWRune) <- c("ID", "Hero ID", "Set", "Slot", "Star", "HP", "HP %", "ATT", "ATT %",
  "DEF", "DEF %", "SPD", "CRT", "CRD", "RES", "ACC")
  
write.table(SWRune, "SWRune_Upload_100915.csv", sep = ",", row.names = FALSE, quote = FALSE)
