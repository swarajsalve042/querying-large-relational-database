# Zomato SQL Data Analytics Project

## Project Overview
This project analyzes a Zomato-style restaurant dataset for a food-delivery platform. The goal is to use SQL to extract business insights and generate client-ready reports.

## Assignment Tasks
1. Create a user-defined function to return the label **Chicken Quick Bites**.
2. Find the restaurant name and cuisine type with the maximum number of ratings/votes.
3. Create a Rating Status column:
   - Excellent: rating > 4
   - Good: rating > 3.5
   - Average: rating > 3
   - Bad: rating <= 3
4. Apply CEIL, FLOOR and ABS to the rating and display the current date, year, month name and day.
5. Display restaurant type and total average cost using ROLLUP.

## Technologies
- MySQL 8+
- SQL
- Aggregate functions
- CASE expressions
- User-defined functions
- Date and numeric functions
- GROUP BY WITH ROLLUP

## Files
- `zomato_analysis.sql` — assignment SQL queries
- `Zomato_SQL_Analytics_Project_Presentation.pptx` — professional project presentation

## Dataset Fields Used
`restaurant_name`, `cuisines`, `rating`, `votes`, `restaurant_type`, `average_cost_for_two`.

> Replace the table/column names if the supplied Zomato dataset uses different schema names.
