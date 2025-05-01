# Video Link: [Link](https://youtu.be/Td8LB_Ot2tg)


# Project Description

Public transportation in Boston dates back nearly 400 years, with the first ferry services in the 1600s. Today, MBTA serves over 1 million people daily in the Massachusetts Bay area and contributes approximately $11.5 billion per year to the local economy. Public transit plays a crucial role in economic mobility, environmental sustainability, and equitable access to opportunities, which is why it is important to analyze it’s usage and performance.

# Project Objectives and Goals
1. Analyze Bus Ridership Trends
    1. Examine how MBTA bus ridership has changed over time, particularly pre-pandemic vs. post-pandemic. - Done - Fall Data Available
    2. Identify which routes have gained or lost riders over the years. - Done - Fall Data available
2. Assess Bus Service Performance
    1. Measure end-to-end travel times for each bus route.
    2. Analyze average wait times and delays (on-time vs. delayed arrivals). - Done
    3. Identify which routes experience the most frequent and severe delays. - Done
3. Identify Service Disparities & Equity Gaps
    1. Determine whether specific bus routes have consistently worse service than others. - Done
    2. Assess whether low-income, minority, or underserved communities are disproportionately affected by poor bus service. - Done
4. Compare Historical Data & Trends
    1. Compare 2015-2017 MBTA data with recent 2023-2024 data to track long-term trends. - Done - Akhil
    2. Understand whether transit equity has improved, worsened, or remained stagnant. - Done
5. Develop Data-Driven Recommendations
    1. Identify key problem areas in Boston’s bus network.
    2. Provide visualizations and statistical insights to inform policy decisions.
    3. Suggest potential improvements to enhance bus reliability and equity.

# Data Collection
We got the data from the following sources for different requirements:
1. **MBTA Bus Performance Data:** For arrival & departure times, frequency of service, historical delay patterns 
    1. MBTA Open Data Portal:  [MBTA Performance Data](https://mbta-massdot.opendata.arcgis.com/)
    2. Archived MBTA reliability data: [2018-2024](https://mbta-massdot.opendata.arcgis.com/search?q=reliability)
2. **Ridership Data:** For daily & seasonal ridership per route, changes in bus usage (2015-2024), impact of COVID-19 on ridership, people’s income levels, race, ethnicity, use of different transports by the public, correlation between bus service quality and areas 
    1. [MBTA 2023 System-Wide Passenger Survey](https://mbta-massdot.opendata.arcgis.com/datasets/faaf1295847e4673a03b40cef2c53df1_0/explore)
    2. MBTA Ridership Reports: [MBTA Ridership Data](https://mbta-massdot.opendata.arcgis.com/datasets/eec03d901d2e470ebd5758c60d793e8e_0/explore)
    3. 2020 U.S. Census: [Boston Census Data](https://data.boston.gov/dataset/2020-census-for-boston)
3. **Geographic & Infrastructure Data**: For bus stop coordinates & accessibility data, street-level infrastructure (bus lanes, stops, congestion zones)
    1. MBTA GIS Data (ArcGIS): [MBTA GIS Data](https://mbta-massdot.opendata.arcgis.com/)


# Data Processing and EDA

1. Data Preprocessing & Feature Engineering
Clean data

    1. Handle missing values, remove duplicates, and normalize features.
    2. Feature engineering examples include:
        1. Rush hour vs. off-peak, seasonal trends.
        2. Bus frequency, historical delay rates.
        3. Income, race, transit dependency.
        4. Stop density, proximity to transit hub.
2. Exploratory Data Analysis (EDA)

    1. Summary of ridership, delays, and disparities.
    2. Use ArcGIS/Power BI to visualize service performance by region.
    3. Identify long-term trends in ridership and delays.

# Data Modeling 

Used supervised Learning to create the following Models:
    1. Modelled Regression and Classification Models to predict OTP (On Time Performance).
    2. Time-Series Forecasting to predict the ridership per season. 

# Visualization Approach

Here are the primary ways we visualized the data:
1. Time-Based Visualizations
   1. Ridership trends over time (pre-pandemic vs. post-pandemic). - Only fall data avail
   2. Monthly/seasonal changes in bus delays.
   3. Route delay patterns by time of day, like rush hour and off-peak.
   
2. Geographic/Spatial Visualizations
   1. Visualize service reliability (e.g., delays, wait times) by neighborhood or bus route.
   2. Ridership per route: Compare ridership levels across routes.
   
3. Interactive Visualizations
   1. All the visualisations are interactive in the Jupyter notebooks we have provided.



# Model Testing & Validation

We Split the data into training and test sets (80/20 split)

1. Performance Metrics Evaluation:
   1. For Regression:
   2. For Classification:
   3. For Time-Series Forecasting:

  
# Methodology

Data Preprocessing:

1. We downloaded the data from MBTA’s open source datasets available online.
2. We tried to identify each dataset's missing and null values. The data was almost complete. 
     1. We found data that was temporally missing, like in the Bus Arrival and Departure Times Datasets; some dates are absent for the arrival and departure data.
     2. For Ridership Data, we could only find the ridership data for each fall from Fall 2016 to Fall 2024 and Spring 2020 and Spring 2021.
3. We combined the CSV files in the most relevant way possible. For example, we combined the Bus Arrival and Departure Times Data; we did the following:
     1. Made the columns in all the CSV files consistent. For example, we found that the 'direction' column was named differently in many CSV files.
     2. The 'earliness' column was removed because it was present in only 3 or 4 CSV files for the years 2018 and 2019 out of 46 total CSV files. 
     3. Combined the CSV files for each month into 1 CSV file for the whole year.
     4. Took the yearwise CSV files and combined them into three categories for processing them accordingly:
         1. Pre - Covid Aug'18 - Dec'19.
         2. Covid: Jan'20 - Dec'22.
         3. Post - Covid Jan'23 - Dec'24.
4. We created the following features:
     1. From the MBTA Ridership data, we added a feature to categorize whether the data point is 'before pandemic' or 'after pandemic'. We also added a feature to measure the average ridership every six months instead of monthly to visualize it better.
     2. In the Bus Arrival and Departure Times Data:
         1. We added a feature called 'delay', calculated as the difference between scheduled and actual bus timings. 
         2. We added a feature called 'Quarterly' to group the data into quarters and measure the average delays each quarter.
         3. We added a feature called 'DayOfWeek' to group the data by days of the week and measure the average delays for each day.
         4. We added a feature called 'status' to measure the frequency of delays and on-time performance for each route. 
    


Exploratory Data Analysis:

1. Identify short and medium-term delay patterns at various time granularities.
    1. Grouped the data by ['service_date', 'route_id', 'stop_id'] and computed the mean of the 'delay' column.
    2. Calculated average delays for each route:
        1. Weekly: Grouped by week and route.
        2. Monthly: Grouped by month and route.
        3. Quarterly: Grouped by quarter and route.
    3. Calculated average delay per route at each stop by grouping the data on ['route_id', 'stop_id'] and averaging the delay.
    4. Computed frequency of delays per stop per route by counting how often delays occurred (delay > 0), grouped by ['route_id', 'stop_id'].


  
# Observations So Far

During the EDA, we made the following observations:
1.  Identify short and medium-term delay patterns in delays.
    1. We performed calculations on the following important routes:
       |     Route     | Duration          | Pre-Pandemic  | Pandemic      | Post-pandemic |
       |---------------|-------------------|---------------|---------------|---------------|
       | 111           | Weekly    | <3 | <2 | 2 - 5.5|
       | 14            | Weekly    | 3 - 5.5| 3.5 - 4.5| 3.5 - 6.5|
       | 15            | Weekly    | 2.5 - 4.5| 3- | 3.5 - 4.5|
       | 17            | Weekly    | 2.5 - 5.5| 3 - 5.5| 5 - 8|
       | 22            | Weekly    | <4 | <2.5| 4 - 6.5|
       | 23            | Weekly    | <5 | 1.5 - 3.5| 5 - 7|
       | 24            | Weekly    | >6| 3 - 4.5| 5.5 - 7|
       | 26            | Weekly    | >4 | 2.5 - 3.5| 2 - 2.5|
       | 29            | Weekly    | 6 - 8| 3 - 4| 6.5 - 9.5|
       | 31            | Weekly    | 4 - 6.5 | 2 - 3| >4|
       | 33            | Weekly    | >4.5| 2.5 - 3.5| 2 - 4|
       | 42            | Weekly    | <3.5| 2 - 3.5| 3.5 - 5.5|
       | 44            | Weekly    | >4 | 2.5 - 3.5| >6|
       | 45            | Weekly    | 5 - 10 | 4.5 - 7| 10 - 12.5|

    2. 
    3. For each day of the week, following avg. delays were observed:
        3. |     Weekday    | Pre-Pandemic  | Pandemic      | Post-pandemic |
           |----------------|---------------|---------------|---------------|
           | Monday         | 3.6           |  2.5          |  5            |
           | Tuesday        | 4.15          |  2.7          |  5.25         |
           | Wednesday      | 4.25          |  2.7          |  5.35         |
           | Thursday       | 4.35          |  2.9          |  5.8          |
           | Friday         | 4.9           |  3.3          |  6.05         |
           | Saturday       | 5.15          |  2.8          |  5.35         |
           | Sunday         | 4.7           |  3.3          |  6.3          |
            1. 111:
                1. The services 
        1.  Delays were stable and moderate across most routes, generally ranging between 3–6 minutes.
        2.  Route 45 was the most delayed, hovering consistently around 7–9 minutes — setting a trend that continued post-pandemic. Route 29 followed second.
        3.  Routes 14 and 111 had the lowest delays, typically below 3 minutes, indicating strong schedule adherence.
        4.  A minor spike occurred mid-2019 for several routes. Reasons yet to be known.
        5.  Delay variability across routes was lower, suggesting a more uniform, well-controlled system.
    4. Covid  (Jan'20 - Dec'22):
        1. Delays dropped significantly in early 2020, especially during lockdown phases — likely due to reduced traffic and ridership.
        2. Route 15 experienced a massive spike in mid-2021, peaking above 10 minutes, possibly due to staffing or service cuts.
        3. Route 45 continued to show elevated delays, though slightly lower than pre-COVID at times.
        4. Most routes had smoother, flatter trends in 2020, followed by a gradual rise through 2021–2022 as the city reopened.
        5. System-wide delay spikes occurred in mid-2022, suggesting operational challenges during recovery (e.g., increased demand, limited resources).
    5. Post - Covid (Jan'23 - Dec'24):
        1. Delays increased overall, with higher averages than both pre-COVID and during COVID for many routes.
        2. Route 45 remains the worst performer, consistently staying around or above 12 minutes, worsening post-pandemic.
        3. Route 29 also emerged as a high-delay route, especially from mid-2023 onward.
        4. Several routes began to diverge more in delay behavior, indicating growing inconsistency across the system.
        5. Seasonal delay patterns reappeared, with delay peaks around summer and fall, hinting at traffic volume or scheduling pressure.

     
     
