## Function that converts the OpenSesame combiTVA ouput into the stucture that is needed for parameter estimation in the libtva Matlab library

libTVA <- function(x, filename, filepath) {
  # Write trial number into the output file
  output.name <- paste0(filepath, filename, ".dat")
  expblockdata <- subset(x, Block != 0) # Exclude practice trials
  write.table(length(expblockdata$Block), file = output.name, quote = FALSE, col.names = FALSE, row.names = FALSE, sep = "\t", append = TRUE)
  
  # Whole report data
  for(cond in c(1:3)) { # 1 = whole report 6; 2 = whole report 2; 3 = partial report (2 targets, 4 distractors)
    whole_rep <- subset(expblockdata, expblockdata$Condition == cond)
    whole_rep$Letter_duration <- whole_rep$Letter_duration + 5 # Correct to represent actual presentation times
    whole_rep[, paste0("L", 1:6)] <- apply(whole_rep[, paste0("L", 1:6)], 2, as.character)
    
    ## Reformat responses (this should be fixed in OpenSesame!)
    whole_rep$response <- toupper(whole_rep$response) # Convert to upper case
    whole_rep$response <- gsub(" ", "", whole_rep$response)
    whole_rep$response[whole_rep$response == "NONE" | whole_rep$response == ""] <- "-" # Code missing as "-"
    
    ## Sort targets by position (1-3 top left - bot left, 4-6 top right - bot right)
    positions <- whole_rep[, paste0("pLetter", c(1:6))]
    letters <- whole_rep[, paste0("L", c(1:6))]
    
    if(cond %in% c(2,3)) letters[, paste0("L", c(3:6))] <- 0 # This should be fixed in OpenSesame!
    
    t1 <- t(letters)[t(positions == "top left")]
    t2 <- t(letters)[t(positions == "left")]
    t3 <- t(letters)[t(positions == "bot left")]
    t4 <- t(letters)[t(positions == "top right")]
    t5 <- t(letters)[t(positions == "right")]
    t6 <- t(letters)[t(positions == "bot right")]
    
    targets <- paste0(t1, t2, t3, t4, t5, t6)
    
    if(cond %in% c(1:2)) {
      distractors <- rep("000000", length(whole_rep$Block)) # No distractors in whole report condition
    } else {
      ## Sort distractors by position (1-3 top left - bot left, 4-6 top right - bot right)
      letters <- whole_rep[, paste0("L", c(1:6))]
      letters[, paste0("L", c(1:2))] <- 0 # This should be fixed in OpenSesame!
      
      d1 <- t(letters)[t(positions == "top left")]
      d2 <- t(letters)[t(positions == "left")]
      d3 <- t(letters)[t(positions == "bot left")]
      d4 <- t(letters)[t(positions == "top right")]
      d5 <- t(letters)[t(positions == "right")]
      d6 <- t(letters)[t(positions == "bot right")]
      
      distractors <- paste0(d1, d2, d3, d4, d5, d6)
    }
    
    ## Combine variables that are needed for the TVA parameter estimate
    whole_data <- cbind(
      condition = whole_rep$Condition
      , letter_duration = whole_rep$Letter_duration
      , targets
      , distractors
      , response = whole_rep$response
    )
    
    ## Write whole report data to file
    write.table(whole_data, file=output.name, quote=FALSE, col.names=FALSE, row.names=FALSE, sep="\t", append=TRUE)
  }
}
 