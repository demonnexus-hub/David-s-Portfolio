# Load the dataset
student_data <- read.csv("/Users/peruano1624/Desktop/Syracuse Grad School Classes/IST 687 Introduction to Data Science /student_habits_performance.csv")

# Look at the data
head(student_data)
names(student_data)


mean(student_data$exam_score)
mean(student_data$attendance_percentage)

# Count parental education levels
table(student_data$parental_education_level)

# --- 1. Parental Education vs Exam Score ---

# Average exam scores by parental education
aggregate(student_data$exam_score, by=list(student_data$parental_education_level), mean)

# Boxplot of exam score by parental education
boxplot(student_data$exam_score ~ student_data$parental_education_level,
        main = "Exam Score by Parental Education",
        xlab = "Parental Education",
        ylab = "Exam Score")


# --- 2a. Parental Education vs Attendance ---

# Average attendance by parental education
aggregate(student_data$attendance_percentage, by=list(student_data$parental_education_level), mean)

# Boxplot of attendance by parental education
boxplot(student_data$attendance_percentage ~ student_data$parental_education_level,
        main = "Attendance by Parental Education",
        xlab = "Parental Education", 
        ylab = "Attendance Percentage")


# --- 2b. High vs Low Parental Education ---

high_ed <- student_data$parental_education_level == "Master"
low_ed <- student_data$parental_education_level == "High School"

# Compare exam scores
mean(student_data$exam_score[high_ed])
mean(student_data$exam_score[low_ed])

# Compare attendance
mean(student_data$attendance_percentage[high_ed])
mean(student_data$attendance_percentage[low_ed])

# --- 3. Attendance vs Exam Score ---

# correlation
cor(student_data$attendance_percentage, student_data$exam_score)

# scatter plot
plot(student_data$attendance_percentage, student_data$exam_score,
     main = "Attendance vs Exam Score",
     xlab = "Attendance Percentage", ylab = "Exam Score", 
     pch = 19, col = "steelblue")


model <- lm(student_data$exam_score ~ student_data$attendance_percentage)
summary(model)

# Add line to plot
abline(model)


# --- 4. Attendance Group Comparison ---

# Create attendance groups
good_attendance <- student_data$attendance_percentage >= 85
poor_attendance <- student_data$attendance_percentage < 85

# Compare exam scores by attendance groups
mean(student_data$exam_score[good_attendance])
mean(student_data$exam_score[poor_attendance])

#  t-test
t.test(student_data$exam_score[good_attendance], student_data$exam_score[poor_attendance])

# Final summary
cat("Summary Results:\n")
cat("Average exam score:", mean(student_data$exam_score), "\n")
cat("Average attendance:", mean(student_data$attendance_percentage), "\n")
cat("Correlation between attendance and exam score:", cor(student_data$attendance_percentage, student_data$exam_score), "\n")


# --- Predictive Method: Simple Linear Model ---

# Split the data (80/20)
set.seed(123) 
sample_index <- sample(1:nrow(student_data), 0.8 * nrow(student_data))
train_data <- student_data[sample_index, ]
test_data <- student_data[-sample_index, ]

predictive_model <- lm(exam_score ~ attendance_percentage, data = train_data)

predicted_scores <- predict(predictive_model, newdata = test_data)

# Actual vs Predicted
results <- data.frame(
  Actual = test_data$exam_score,
  Predicted = predicted_scores
)

head(results)

mse <- mean((results$Actual - results$Predicted)^2)
cat("Mean Squared Error on test set:", mse, "\n")

# Plot predicted vs actual scores
plot(results$Actual, results$Predicted,
     main = "Actual vs Predicted Exam Scores",
     xlab = "Actual Exam Score",
     ylab = "Predicted Exam Score",
     pch = 19, col = "blue")


abline(a = 0, b = 1, col = "red", lwd = 2)


results$Residual <- results$Actual - results$Predicted


plot(results$Predicted, results$Residual,
     main = "Residuals vs Predicted Exam Scores",
     xlab = "Predicted Exam Score",
     ylab = "Residuals (Actual - Predicted)",
     pch = 19, col = "purple")


abline(h = 0, col = "red", lwd = 2)


hist(results$Residual,
     main = "Histogram of Residuals",
     xlab = "Residuals (Actual - Predicted)",
     col = "lightgreen",
     border = "black")
