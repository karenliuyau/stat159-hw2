# STAT 159 Homework 2: Reproducing Serena Williams's Plot

## Homework Overview

For this homework, I reproduced a scatter plot showing Serena Williams's age compared with her opponents' ages during her professional tennis matches.

I used match data from Tennis Abstract, cleaned the data using R, and created the graph using ggplot2.

## Homework Structure

- `data/raw/`: Original downloaded data
- `data/clean/`: Cleaned CSV data
- `scripts/download.sh`: Downloads the original data
- `scripts/clean.R`: Cleans the data and calculates age differences
- `scripts/plot.R`: Creates the scatter plot
- `figures/serena_plot.png`: Reproduced graph
- `report.qmd`: Quarto report
- `environment.yml`: Software environment
- `Makefile`: Automates the workflow
- `ai_documentation.txt`: Documents my use of AI

## How to Reproduce

After installing the required software and packages listed in `environment.yml`, run the following command from the stat159-hw2 folder:

```bash
make all
```

This command will download the data, clean it, generate the plot, and create the HTML and PDF reports.

To remove generated files, run:

```bash
make clean
```

## Data Source

The original match data comes from Tennis Abstract:

https://www.tennisabstract.com/jsmatches/SerenaWilliamsCareer.js

## Tools Used

- R
- ggplot2
- jsonlite
- Quarto
- Git and GitHub
- Make