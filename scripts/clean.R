library(jsonlite)

# Read the raw JavaScript data
raw = readLines("data/raw/SerenaWilliamsCareer.js", warn = FALSE)

raw = paste(raw, collapse = "")

# Remove the JavaScript declaration
raw = sub("^\\s*var\\s+morematchmx\\s*=\\s*", "", raw)
raw = sub(";\\s*$", "", raw)

# Convert JSON into a list of matches
matches = fromJSON(raw, simplifyVector = FALSE)

# Extract a specific field from every match
get_field = function(i) {
    sapply(matches, function(x) {
        if (length(x) >= i) {
        return(x[[i]])
        } else {
            return(NA_character_)
        }
    })
}

# Create the clean dataset
serena = data.frame(date = as.Date(get_field(1), format = "%Y%m%d"), tournament = get_field(2), surface = get_field(3), result = get_field(5), opponent = get_field(12), opponent_dob = as.Date(get_field(17), format = "%Y%m%d"))

# Calculate Serena's age
serena$serena_age = as.numeric(serena$date - as.Date("1981-09-26")) / 365.25

# Calculate opponent's age
serena$opponent_age = as.numeric(serena$date - serena$opponent_dob) / 365.25

# Calculate age difference
serena$age_difference = serena$serena_age - serena$opponent_age

# Change W and L to Win and Loss
serena$result = ifelse(serena$result == "W", "Win", ifelse(serena$result == "L", "Loss", NA))

# Save the cleaned dataset
write.csv(serena, "data/clean/serena.csv", row.names = FALSE)