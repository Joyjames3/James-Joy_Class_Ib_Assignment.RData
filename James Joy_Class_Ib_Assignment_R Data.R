# Create common subfolders for project organization
dir.create("data")
dir.create("script")
dir.create("results")

#### How R Code Works ####
print("Biotechnology")
gene_expression <- c(2.3, 3.8, 3.9, 5.6, 9.4)

# Calculate the mean of the vector
mean(gene_expression)
mean_result <- mean(gene_expression)

# Basic visualizations
plot(gene_expression) 
hist(gene_expression) 
barplot(gene_expression)

# Summary statistics
summary(gene_expression)

#### R Data Types ####

# 1. Numeric (decimal numbers) 

x <- 24.5
class(x)

y <- -40.4
class(y)

# 2. Integer (whole numbers) 

z <- 24L 
class(z)

numeric <- c(2, 3, 4)
class(numeric)

integer <- c(2L, 3L, 4L)
class(integer)

# Example vector of numeric values
var_1 <- c(28.4, 23.7, 2.9)
class(var_1)

# Convert numeric to integer
var_2 <- as.integer(var_1)
class(var_2)

#R truncates the decimal part when converting numeric to integer.

# Convert integer back to numeric
var_3 <- as.numeric(var_2)
class(var_3)

# 3. Character / String Data 

var_4 <- c("gene1", "gene2", "gene3")
class(var_4)

# Incorrect example (gene1 is unquoted and will throw error if not defined)
var_5 <- c(gene1, "gene2", "gene3")

var_6 <- c("3.8", "4.6", "5.9")
class(var_6)

# Proper numeric vector
var_7 <- c(3.8, 4.6, 5.9)
class(var_7)
mean(var_7)

# 4. Factor (Categorical) Data 

# Categorical vector with string labels
disease_status <- c("cancer", "normal", "cancer", "cancer", "normal")
class(disease_status)

# Convert character vector to factor
disease_status <- as.factor(disease_status)
class(disease_status)
disease_status

# Set factor level order manually
disease_status <- factor(disease_status, 
                         levels = c("normal", "cancer"))
disease_status

# 5. Logical Data Type 

age <- c(23, 25, 28)
var_8 <- age < 25 
print(var_8   )

# Import Data from CSV

data <- read.csv(file.choose())

# View data in spreadsheet format
View(data)

# Check structure of the dataset
str(data)

# Convert 'height' column to factor
data$height_fac <- as.factor(data$height)
str(data)

# Reorder factor levels manually
data$height_fac <- factor(data$height_fac, 
                          levels = c("Tall", "Medium", "Short"))
levels(data$height_fac)

# Convert character/factor to numeric using factor() function
# Example # 0 = Short, 1 = Medium & 2 = Tall

data$height_num <- factor(data$height_fac,
                          levels = c("Short", "Medium", "Tall"),
                          labels = c(0, 1, 2)) 

# Convert 'gender' to factor
data$gender_fac <- as.factor(data$gender)
str(data)

# Convert factor to numeric using ifelse statement (Female = 1, Male = 0)
data$gender_num <- ifelse(data$gender_fac == "Female", 1, 0)
class(data$gender_num)

# Convert numeric gender code to factor
data$gender_num <- as.factor(data$gender_num)
class(data$gender_num)
