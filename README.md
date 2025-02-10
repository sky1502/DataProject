
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

















Modeling Approach
We will use descriptive analytics, supervised learning, and unsupervised learning methods to analyze MBTA bus performance and equity.
1. Data Preprocessing & Feature Engineering
Clean data: Handle missing values, remove duplicates, and normalize features.
Feature engineering examples include:
Rush hour vs. off-peak, seasonal trends.
Bus frequency, historical delay rates.
Income, race, transit dependency.
Stop density, proximity to transit hub.
2. Exploratory Data Analysis (EDA)
Summary of ridership, delays, and disparities.
Use ArcGIS/Power BI to visualize service performance by region.
Identify long-term trends in ridership and delays.
3. Clustering (Unsupervised Learning) for Route Classification
Identify patterns in bus performance and classify routes based on service quality.
K-Means or DBSCAN: Cluster routes based on delay frequency, average wait times, and reliability.
Hierarchical Clustering: Group neighborhoods by ridership trends and demographic impact.
4. Supervised Learning
Forecast delays and identify key factors contributing to unreliable service.
Regression models to predict delay times.
Classification models to categorize routes as "high delay risk" vs. "low delay risk."
Feature importance analysis to identify which features contribute the most to delays (traffic, weather, demographics).






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
