## Function that converts the OpenSesame combiTVA ouput into the stucture that is needed for parameter estimation in the libtva Matlab library

libTVA <- function(x, filename, filepath) {
  # Write trial number into the output file
  output.name <- paste0(filepath, filename, ".dat")
  exp_blocks <- subset(x, Block != 0) # Exclude practice trials
  write.table(length(exp_blocks$Block), file = output.name, quote = FALSE, col.names = FALSE, row.names = FALSE, sep = "\t", append = TRUE)
  
  # Whole report data
  for(cond in c(1:3)) { # 1 = whole report 6; 2 = whole report 2; 3 = partial report (2 targets, 4 distractors)
    tva_data <- subset(exp_blocks, exp_blocks$Condition == cond)
    tva_data$Letter_duration <- tva_data$Letter_duration + 5 # Correct to represent actual presentation times
    tva_data[, paste0("L", 1:6)] <- apply(tva_data[, paste0("L", 1:6)], 2, as.character)
    
    ## Reformat responses (this should be fixed in OpenSesame!)
    tva_data$response <- toupper(tva_data$response) # Convert to upper case
    tva_data$response <- gsub(" ", "", tva_data$response)
    tva_data$response[tva_data$response == "NONE" | tva_data$response == ""] <- "-" # Code missing as "-"
    
    ## Sort targets by position (1-3 top left - bot left, 4-6 top right - bot right)
    positions <- tva_data[, paste0("pLetter", c(1:6))]
    letters <- tva_data[, paste0("L", c(1:6))]
    
    if(cond %in% c(2,3)) letters[, paste0("L", c(3:6))] <- 0 # This should be fixed in OpenSesame!
    
    t1 <- t(letters)[t(positions == "top left")]
    t2 <- t(letters)[t(positions == "left")]
    t3 <- t(letters)[t(positions == "bot left")]
    t4 <- t(letters)[t(positions == "top right")]
    t5 <- t(letters)[t(positions == "right")]
    t6 <- t(letters)[t(positions == "bot right")]
    
    targets <- paste0(t1, t2, t3, t4, t5, t6)
    
    if(cond %in% c(1:2)) {
      distractors <- rep("000000", length(tva_data$Block)) # No distractors in whole report condition
    } else {
      ## Sort distractors by position (1-3 top left - bot left, 4-6 top right - bot right)
      letters <- tva_data[, paste0("L", c(1:6))]
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
      condition = tva_data$Condition
      , letter_duration = tva_data$Letter_duration
      , targets
      , distractors
      , response = tva_data$response
    )
    
    ## Write whole report data to file
    write.table(whole_data, file=output.name, quote=FALSE, col.names=FALSE, row.names=FALSE, sep="\t", append=TRUE)
  }
}
 