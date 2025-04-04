# Video Link: [Link](https://youtu.be/Td8LB_Ot2tg)


# Project Description

Public transportation in Boston dates back nearly 400 years, with the first ferry services in the 1600s. Today, MBTA serves over 1 million people daily in the Massachusetts Bay area and contributes approximately $11.5 billion per year to the local economy. Public transit plays a crucial role in economic mobility, environmental sustainability, and equitable access to opportunities, which is why it is important to analyze it’s usage and performance.

# Project Objectives and Goals
1. Analyze Bus Ridership Trends
    1. Examine how MBTA bus ridership has changed over time, particularly pre-pandemic vs. post-pandemic.
    2. Identify which routes have gained or lost riders over the years.
2. Assess Bus Service Performance
    1. Measure end-to-end travel times for each bus route.
    2. Analyze average wait times and delays (on-time vs. delayed arrivals).
    3. Identify which routes experience the most frequent and severe delays.
3. Identify Service Disparities & Equity Gaps
    1. Determine whether certain bus routes have consistently worse service than others.
    2. Assess whether low-income, minority, or underserved communities are disproportionately affected by poor bus service.
4. Compare Historical Data & Trends
    1. Compare 2015-2017 MBTA data with recent 2023-2024 data to track long-term trends.
    2. Understand whether transit equity has improved, worsened, or remained stagnant.
5. Develop Data-Driven Recommendations
    1. Identify key problem areas in Boston’s bus network.
    2. Provide visualizations and statistical insights to inform policy decisions.
    3. Suggest potential improvements to enhance bus reliability and equity.

# Data Collection Plan
We plan to get the data from the following sources for different requirements:
1. **MBTA Bus Performance Data:** For arrival & departure times, frequency of service, historical delay patterns 
    1. MBTA Open Data Portal:  [MBTA Performance Data](https://mbta-massdot.opendata.arcgis.com/)
    2. Archived MBTA reliability data: [2018-2024](https://mbta-massdot.opendata.arcgis.com/search?q=reliability)
2. **Ridership Data:** For daily & seasonal ridership per route, changes in bus usage (2015-2024), impact of COVID-19 on ridership, people’s income levels, race, ethnicity, use of different transports by the public, correlation between bus service quality and areas 
    1. [MBTA 2023 System-Wide Passenger Survey](https://mbta-massdot.opendata.arcgis.com/datasets/faaf1295847e4673a03b40cef2c53df1_0/explore)
    2. MBTA Ridership Reports: [MBTA Ridership Data](https://mbta-massdot.opendata.arcgis.com/datasets/eec03d901d2e470ebd5758c60d793e8e_0/explore)
    3. 2020 U.S. Census: [Boston Census Data](https://data.boston.gov/dataset/2020-census-for-boston)
3. **Geographic & Infrastructure Data**: For bus stop coordinates & accessibility data, street-level infrastructure (bus lanes, stops, congestion zones)
    1. MBTA GIS Data (ArcGIS): [MBTA GIS Data](https://mbta-massdot.opendata.arcgis.com/)


# Modeling Approach

We will use descriptive analytics, supervised learning, and unsupervised learning methods to analyze MBTA bus performance and equity.

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

3. Clustering (Unsupervised Learning) for Route Classification

    1. Identify patterns in bus performance and classify routes based on service quality.
    2. K-Means or DBSCAN: Cluster routes based on delay frequency, average wait times, and reliability.
    3. Hierarchical Clustering: Group neighborhoods by ridership trends and demographic impact.

4. Supervised Learning

    1. Forecast delays and identify key factors contributing to unreliable service.
    2. Regression models to predict delay times.
    3. Classification models to categorize routes as "high delay risk" vs. "low delay risk."
    4. Feature importance analysis to identify which features contribute the most to delays (traffic, weather, demographics).

# Visualization Approach

Here are the primary ways we plan to visualize the data:
1. Time-Based Visualizations
   1. Ridership trends over time (pre-pandemic vs. post-pandemic).
   2. Monthly/seasonal changes in bus delays and ridership.
   3. Route delay patterns by time of day, like rush hour and off-peak.
   4. Bus frequency analysis for peak times and off-peak periods.
   
2. Geographic/Spatial Visualizations
   1. Visualize service reliability (e.g., delays, wait times) by neighborhood or bus route.
   2. Visualize clusters of routes with similar service issues (maybe using K-Means clustering).
   3. Bus stop density, etc.
   4. Ridership per route: Compare ridership levels across routes.
   
3. Model Visualizations
   1. Visualize which factors (weather, traffic, neighborhood demographics) contribute most to delay prediction using Random Forest or XGBoost models.
   2. Use scatter plots or radar charts to visualize clusters of routes based on performance characteristics (delays, ridership).
   
4. Dashboard/Interactive Visualizations
   1. Display key insights like delays, ridership, and disparities across different routes and neighborhoods using Power BI.



# Model Testing & Validation

We will test our predictive models and clustering algorithms to assess model accuracy and robustness.
1. Testing Steps:
   1. Split the data into training and test sets (e.g., 80/20 or 70/30) to avoid overfitting.
   2. Use K-fold cross-validation to ensure the model generalizes well across different subsets of the data.

2. Performance Metrics Evaluation:
   1. For Regression Models (e.g., Random Forest, XGBoost): Test performance using RMSE (Root Mean Squared Error), MAE (Mean Absolute Error), and R².
   2. For Classification Models (e.g., Logistic Regression, Decision Trees): Use accuracy, precision, recall, and F1-score.
   3. For Clustering: Evaluate using the Silhouette Score and Davies-Bouldin Index to ensure appropriate clustering of routes.


  
# Methodology

Data Preprocessing:

1. We downloaded the data from MBTA’s open source datasets available online.
2. We tried to identify each dataset's missing and null values. We found the data to be complete. 
     1. We found data that was temporally missing, like in the Bus Arrival and Departure Times Datasets; some dates are absent for the arrival and departure data. 
3. We combined the CSV files in the most relevant way possible. For example, we combined the Bus Arrival and Departure Times Data; we did the following:
     1. Made the columns in all the CSV files consistent. For example, we found that the 'direction' column was named differently in many CSV files.
     2. The 'earliness' column was removed because it was present in only 3 or 4 CSV files for the years 2018 and 2019 out of 46 total CSV files. 
     3. Combined the CSV files for each month into 1 CSV file for the whole year.
     4. Took the yearwise CSV files and combined them into three categories for processing them accordingly:
         1. Pre - Covid Aug'18 - Dec'19.
         2. Covid: Jan'20 - Dec'22.
         3. Post - Covid Jan'23 - Dec'24.
4. We created the following features:
     1. From the MBTA Ridership data, we added a feature to categorize whether the data point is 'before pademic' or 'after pandemic'. Also added a feature to measure the average ridership every 6 months instead of monthly, to be able to visualize it better.
    


Exploratory Data Analysis:

1.  Identify long-term trends in ridership and delays.
    1. We created a feature - 'delay'- calculated as the difference between scheduled and actual bus timings. 
    2. Then we grouped the data on ['service_date', 'route_id', 'stop_id'] and took the mean of the 'delay' column.
    3. Then we grouped the data such that we had delays for each route for each month.
    4. Then we took the important routes from the project description and plotted the avg delay times for those routes.
    5. We created the plots for pre-covid, covid, and post-covid data separately.
  
# Observations So Far

During the EDA, we made the following observations:
1.  Identify long-term trends in ridership and delays.
    1. Pre - Covid (Aug'18 - Dec'19):
        1.  Delays were stable and moderate across most routes, generally ranging between 3–6 minutes.
        2.  Route 45 was the most delayed, hovering consistently around 7–9 minutes — setting a trend that continued post-pandemic. Route 29 followed second.
        3.  Routes 14 and 111 had the lowest delays, typically below 3 minutes, indicating strong schedule adherence.
        4.  A minor spike occurred mid-2019 for several routes. Reasons yet to be known.
        5.  Delay variability across routes was lower, suggesting a more uniform, well-controlled system.
    2. Covid  (Jan'20 - Dec'22):
        1. Delays dropped significantly in early 2020, especially during lockdown phases — likely due to reduced traffic and ridership.
        2. Route 15 experienced a massive spike in mid-2021, peaking above 10 minutes — possibly due to staffing or service cuts.
        3. Route 45 continued to show elevated delays, though slightly lower than pre-COVID at times.
        4. Most routes had smoother, flatter trends in 2020, followed by a gradual rise through 2021–2022 as the city reopened.
        5. System-wide delay spikes occurred in mid-2022, suggesting operational challenges during recovery (e.g., increased demand, limited resources).
    3. Post - Covid (Jan'23 - Dec'24):
        1. Delays increased overall, with higher averages than both pre-COVID and during COVID for many routes.
        2. Route 45 remains the worst performer, consistently staying around or above 12 minutes, worsening post-pandemic.
        3. Route 29 also emerged as a high-delay route, especially from mid-2023 onward.
        4. Several routes began to diverge more in delay behavior, indicating growing inconsistency across the system.
        5. Seasonal delay patterns reappeared, with delay peaks around summer and fall, hinting at traffic volume or scheduling pressure.

     
     
