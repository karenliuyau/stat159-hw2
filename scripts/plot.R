library(ggplot2)

# Import the cleaned data
serena = read.csv("data/clean/serena.csv")

# Remove matches with missing information
serena = serena[!is.na(serena$serena_age) & !is.na(serena$age_difference) & !is.na(serena$result),]

# Create the scatter plot
p = ggplot(serena, aes(x = serena_age, y = age_difference, color = result)) + 
    geom_point(size = 1.5, alpha = 0.7) + geom_hline(yintercept = 0, color = "gray50") + 
    labs(title = "Serena Williams's Professional Matches from Age 14 to 40", x = "Williams's age", y = "Age difference", color = "Match result", caption = "Source: Tennis Abstract") + 
    scale_color_manual(values = c("Win" = "#36C5D8", "Loss" = "#8E3B8F")) +
    theme_minimal()

# Save the plot as a PNG
ggsave("figures/serena_plot.png", plot = p, width = 10, height = 6, dpi = 300)