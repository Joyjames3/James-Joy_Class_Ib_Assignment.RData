# Define classify_gene() function
classify_gene <- function(logFC, padj) {
  if (logFC > 1 & padj < 0.05) {
    return("Upregulated")
  } else if (logFC < -1 & padj < 0.05) {
    return("Downregulated")
  } else {
    return("Not_Significant")
  }
}

# Define input and output folders
input_dir <- "Raw_Data"
output_dir <- "Results"

# Create output folder if not already exist
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# List which files to process
files_to_process <- c("DEGs_Data_1.csv", "DEGs_Data_2.csv") 

# Prepare empty list to store results in R 
result_list <- list()


for (file_name in files_to_process) {
  cat("\nProcessing:", file_name, "\n")
  
  input_file_path <- file.path(input_dir, file_name)
  
  # Import dataset
  data <- read.csv(input_file_path, header = TRUE)
  cat("File imported. Checking for missing values in padj...\n")
  
  # Handling missing padj values (replace with 1)
  missing_count <- sum(is.na(data$padj))
  cat("Missing padj values:", missing_count, "\n")
  data$padj[is.na(data$padj)] <- 1
  
  # Classify each gene
  data$status <- mapply(classify_gene, data$logFC, data$padj)
  cat("Classification completed.\n")
  
  # Save results in R object
  result_list[[file_name]] <- data
  
  # Save results in Results folder
  output_file_path <- file.path(output_dir, paste0("classified_", file_name))
  write.csv(data, output_file_path, row.names = FALSE)
  cat("Results saved to:", output_file_path, "\n")
  
  # Print summary counts
  cat("Summary counts for", file_name, ":\n")
  print(table(data$status))
}

# Access results inside R
results_1 <- result_list[["DEGs_Data_1.csv"]]
results_2 <- result_list[["DEGs_Data_2.csv"]]