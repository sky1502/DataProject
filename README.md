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
    1. Determine whether specific bus routes have consistently worse service than others.
    2. Assess whether low-income, minority, or underserved communities are disproportionately affected by poor bus service.
4. Compare Historical Data & Trends
    1. Compare 2015-2017 MBTA data with recent 2023-2024 data to track long-term trends.
    2. Understand whether transit equity has improved, worsened, or remained stagnant.
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

# Data Modeling 

Used supervised Learning to create the following Models:
1. Modelled Regression and Classification Models to predict OTP (On Time Performance).
2. Time-Series Forecasting to predict the ridership per season. 

# Visualization Approach

## Time-Based Visualizations
   1. Ridership trends over time (pre-pandemic vs. post-pandemic). - Only fall data avail
   2. Monthly/seasonal changes in bus delays.
   3. Route delay patterns by time of day, like rush hour and off-peak.
   
## Geographic/Spatial Visualizations
   1. Visualize service reliability (e.g., delays, wait times) by neighborhood or bus route.
   2. Ridership per route: Compare ridership levels across routes.
   
## Interactive Visualizations
All the visualisations are interactive in the Jupyter notebooks we have provided.


# Model Testing & Validation

We Split the data into training and test sets (80/20 split).

## Reliability prediction

* Predict MBTA bus reliability to enhance service quality.
* MBTA Reliability Dataset: On-Time Performance (OTP), Cancellation rates,  Route-specific details
* Extracted temporal attributes on weekday and month
* Model: XGBoost Classifier
* Predict ridership volumes by route and time period
* Optimize bus frequencies and schedules.

## Ridership prediction:
* Forecast MBTA bus ridership for better service planning and equity.
* Historical Ridership Dataset: Yearly ridership totals, Day types (Weekday, Weekend), Time-of-day periods (peak, off-peak)
* Extracted Yearly, daily, and hourly ridership patterns, Time-of-day and day-type categorization, Route-specific ridership totals
* Model: Random forest regressor
* Identify and target unreliable routes.
* Guide proactive resource allocation.

# Methodology

## Data Preprocessing:

1. We downloaded the data from MBTA’s open source datasets available online.
2. We tried to identify each dataset's missing and null values. The data was almost complete. 
     1. We found data that was temporally missing, like in the Bus Arrival and Departure Times Datasets; some dates are absent for the arrival and departure data.
     2. For Ridership Data, we could only find the ridership data for each fall from Fall 2016 to Fall 2024 and Spring 2020 and Spring 2021.
     3. For reliability data, there are minor data losses due to human error during collection by the MBTA. A total of 5 days worth of data is missing - Oct 10, 11 2015 and June 1, 2, 3 2018. We also filtered out the bus data which was almost 87% of the whole dataset since this analysis only focuses on bus data unless specified otherwise.
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
     3. For the Reliabilty metric data, the raw features have the nunmerator and denominator seperated out for the [On time performance metric](/docs/Notes%20on%20Reliability%20Metric.md) so we have aggregated the metrics on the fly based on the granulairty for that specific exploration. 
    


## Exploratory Data Analysis:

1. Identify short and medium-term delay patterns at various time granularities.
    1. Grouped the data by ['service_date', 'route_id', 'stop_id'] and computed the mean of the 'delay' column.
    2. Calculated average delays for each route:
        1. Weekly: Grouped by week and route.
        2. Monthly: Grouped by month and route.
        3. Quarterly: Grouped by quarter and route.
    3. Calculated average delay per route at each stop by grouping the data on ['route_id', 'stop_id'] and averaging the delay.
    4. Computed frequency of delays per stop per route by counting how often delays occurred (delay > 0), grouped by ['route_id', 'stop_id'].
2. For reliability data, we employed two different granualirity with respect to routes:
    1. We first aggregated all the routes' data with monthly granularity and seperated off peak hours and peak hours seperately since on time performance metric has different formulation in these times of the day. Definition of peak hours are:
        1. Off-Peak hours: 9:00 p.m. to 8:00 a.m. weekdays, and all day on Saturdays, Sundays, and holidays. 
        2. Peak hours: 8:00 a.m. to 9:00 p.m. daily on weekdays, excluding holidays.
    2. We also seperated out data for each bus irrespective of time of the day and only considered the most important routes for trend in the on-time-performance with year granulairty in time period. 

  
# Results

Notes:

-> Delays are reported in minutes.
-> For each oresult, you may find the interactive plots in the Plots Directory.


1. We calculated weekly average delays:
   |     Route     | Duration          | Pre-Pandemic  | Pandemic      | Post-pandemic |
   |---------------|-------------------|---------------|---------------|---------------|
   | 111           | <3 | <2 | 2 - 5.5|
   | 14            | 3 - 5.5| 3.5 - 4.5| 3.5 - 6.5|
   | 15            | 2.5 - 4.5| 1.5 - 3.5| 3.5 - 4.5|
   | 17            | 2.5 - 5.5| 3 - 5.5| 5 - 8|
   | 22            | <4 | <2.5| 4 - 6.5|
   | 23            | <5 | 1.5 - 3.5| 5 - 7|
   | 24            | >6| 3 - 4.5| 5.5 - 7|
   | 26            | >4 | 2.5 - 3.5| 2 - 2.5|
   | 29            | 6 - 8| 3 - 4| 6.5 - 9.5|
   | 31            | 4 - 6.5 | 2 - 3| >4|
   | 33            | >4.5| 2.5 - 3.5| 2 - 4|
   | 42            | <3.5| 2 - 3.5| 3.5 - 5.5|
   | 44            | >4 | 2.5 - 3.5| >6|
   | 45            | 5 - 10 | 4.5 - 7| 10 - 12.5|
   
2. We calculated quarterly average delays:
      1. Pre-Pandemic (Aug’18 - Dec’19)
            | route_id | Q1       | Q2       | Q3       | Q4       | Avg Delay |
            |----------|----------|----------|----------|----------|-----------|
            | 111      | 1.288596 | 2.917899 | 2.890908 | 2.097849 | 2.298313  |
            | 14       | 2.386349 | 2.399822 | 2.703042 | 2.666420 | 2.538408  |
            | 15       | 2.869702 | 3.478250 | 3.877239 | 3.414911 | 3.410526  |
            | 17       | 2.884037 | 3.678044 | 3.906025 | 3.727357 | 3.548366  |
            | 22       | 4.010614 | 4.575506 | 5.136540 | 4.279313 | 4.500493  |
            | 23       | 5.316755 | 6.533370 | 5.616770 | 4.771552 | 5.559612  |
            | 24       | 4.895122 | 6.660638 | 6.866060 | 5.868020 | 6.072460  |
            | 26       | 3.962502 | 4.773193 | 4.673799 | 5.107969 | 4.629866  |
            | 29       | 5.610144 | 7.776003 | 6.988462 | 6.195791 | 6.642600  |
            | 31       | 3.756053 | 4.821534 | 4.919900 | 4.792307 | 4.572949  |
            | 33       | 4.005435 | 4.658024 | 4.605572 | 4.711697 | 4.495182  |
            | 42       | 2.192999 | 2.853612 | 3.402426 | 2.678909 | 2.781487  |
            | 44       | 3.796324 | 4.634802 | 4.333281 | 4.143676 | 4.227521  |
            | 45       | 6.637209 | 7.228933 | 7.787080 | 7.087597 | 7.185705  |
       2. Pandemic  (Jan'20 - Dec'22):
            | route_id | Q1       | Q2       | Q3       | Q4       | Avg Delay |
            |----------|----------|----------|----------|----------|-----------|
            | 111      | 1.820918 | 1.550403 | 2.372889 | 2.432350 | 2.044640  |
            | 14       | 2.448092 | 4.005241 | 4.770250 | 4.274718 | 3.874575  |
            | 15       | 2.321474 | 2.609725 | 2.813420 | 2.249386 | 2.498501  |
            | 17       | 2.566275 | 3.456624 | 3.798535 | 3.748309 | 3.392936  |
            | 22       | 2.099354 | 1.977321 | 2.614035 | 3.113740 | 2.451613  |
            | 23       | 1.795178 | 1.910520 | 2.547682 | 2.583072 | 2.209613  |
            | 24       | 4.039100 | 3.358559 | 4.432890 | 4.359174 | 4.047431  |
            | 26       | 2.797476 | 2.323624 | 3.115762 | 2.991923 | 2.807196  |
            | 29       | 3.293754 | 3.390611 | 4.352826 | 4.025221 | 3.765603  |
            | 31       | 2.018667 | 2.126549 | 2.900810 | 2.982670 | 2.507674  |
            | 33       | 3.102367 | 3.486355 | 3.258028 | 3.164319 | 3.252767  |
            | 42       | 2.370779 | 2.686290 | 3.111182 | 3.325470 | 2.873430  |
            | 44       | 2.859370 | 2.839491 | 3.509731 | 3.347665 | 3.139564  |
            | 45       | 5.487659 | 5.267657 | 5.909838 | 5.396397 | 5.515888  |
       3. Post - Pandemic (Jan'23 - Dec'24):
            | route_id | Q1       | Q2        | Q3        | Q4        | Avg Delay |
            |----------|----------|-----------|-----------|-----------|-----------|
            | 111      | 2.055969 | 3.530171  | 3.762091  | 3.996013  | 3.336061  |
            | 14       | 4.039252 | 4.815793  | 4.008808  | 6.185625  | 4.762870  |
            | 15       | 3.118145 | 3.981603  | 4.255666  | 4.482429  | 3.959961  |
            | 17       | 4.726855 | 6.457976  | 6.819533  | 7.012817  | 6.254295  |
            | 22       | 4.467541 | 6.419716  | 6.692498  | 6.618021  | 6.049944  |
            | 23       | 4.219770 | 5.946770  | 6.086173  | 6.576760  | 5.707868  |
            | 24       | 4.763282 | 6.339250  | 6.304794  | 6.572456  | 6.004946  |
            | 26       | 1.838397 | 3.016484  | 2.339503  | 2.770983  | 2.491342  |
            | 29       | 7.091357 | 8.951422  | 9.214696  | 7.839132  | 8.274652  |
            | 31       | 3.634964 | 4.461322  | 4.388127  | 4.727024  | 4.302859  |
            | 33       | 3.836172 | 3.350322  | 3.749153  | 4.524952  | 3.865150  |
            | 42       | 3.877104 | 4.871070  | 4.715784  | 5.253976  | 4.679984  |
            | 44       | 5.336321 | 6.271245  | 6.421958  | 7.037239  | 6.266191  |
            | 45       | 9.254084 |11.558276  |10.421836  |11.811596  |10.761448  |

3. For each day of the week, following avg. delays were observed over all routes combined:
   |     Weekday    | Pre-Pandemic  | Pandemic      | Post-pandemic |
   |----------------|---------------|---------------|---------------|
   | Monday         | 3.6           |  2.5          |  5            |
   | Tuesday        | 4.15          |  2.7          |  5.25         |
   | Wednesday      | 4.25          |  2.7          |  5.35         |
   | Thursday       | 4.35          |  2.9          |  5.8          |
   | Friday         | 4.9           |  3.3          |  6.05         |
   | Saturday       | 5.15          |  2.8          |  5.35         |
   | Sunday         | 4.7           |  3.3          |  6.3          |

4. We calculated the avg delay at each stop at each route observed the number of stops that were causing delays > 4 minutes:
    | route_id | Pre-Pandemic | Pandemic | Post-Pandemic |
    |----------|--------------|----------|----------------|
    | 111      | 5            | 0        | 5              |
    | 14       | 0            | 9        | 12             |
    | 15       | 6            | 1        | 8              |
    | 17       | 4            | 1        | 7              |
    | 22       | 18           | 5        | 21             |
    | 23       | 17           | 1        | 19             |
    | 24       | 11           | 14       | 12             |
    | 26       | 6            | 1        | 1              |
    | 29       | 18           | 9        | 18             |
    | 31       | 5            | 0        | 5              |
    | 33       | 11           | 5        | 9              |
    | 42       | 0            | 1        | 4              |
    | 44       | 9            | 4        | 13             |
    | 45       | 10           | 7        | 14             |

5. We calculated the frequency of the buses being late and being on time for each route:

    |          | Pre-Pandemic|             | Pandemic    |             | Post-Pandemic|               |
    |----------|-------------|-------------|-------------|-------------|--------------|---------------|
    | route_id | Delayed     | On_Time     | Delayed     | On_Time     | Delayed      | On_Time       |
    |----------|-------------|-------------|-------------|-------------|--------------|---------------|
    | 111      | 2299        | 7898        | 3224        | 16379       | 4510         | 8665          |
    | 14       | 1581        | 5036        | 5061        | 7697        | 5150         | 4018          |
    | 15       | 3501        | 5870        | 3279        | 15435       | 5558         | 6993          |
    | 17       | 1625        | 2503        | 3366        | 5237        | 4561         | 1287          |
    | 22       | 5815        | 5436        | 3928        | 18335       | 10180        | 5497          |
    | 23       | 7093        | 2687        | 3471        | 16780       | 9510         | 4328          |
    | 24       | 4811        | 1897        | 7944        | 9428        | 7219         | 2284          |
    | 26       | 2116        | 1332        | 1592        | 5265        | 733          | 2922          |
    | 29       | 6660        | 1511        | 7212        | 9694        | 8050         | 1662          |
    | 31       | 2517        | 1611        | 1567        | 7036        | 3277         | 2571          |
    | 33       | 3776        | 3587        | 4891        | 10481       | 4363         | 5855          |
    | 42       | 567         | 2529        | 1760        | 4693        | 2510         | 1876          |
    | 44       | 3875        | 3349        | 5002        | 10051       | 7865         | 2369          |
    | 45       | 4353        | 3435        | 6812        | 10139       | 8508         | 2658          |

6. Explore ridership patterns over time to understand pandemic impact and long-term trends.
    1. We observed the following bus ridership trends across every 6 months (H1: Jan-Jun, H2: Jul - Dec):

        |   Year    |   Period  |   Ridership (M)   |
        |-----------|-----------|-------------------|
        |   2018    |   H2      |   116 |
        |   2019    |   H1      |   115 |  
        |   2019    |   H2      |   118 |
        |   2020    |   H1      |   68  |
        |   2020    |   H2      |   52  |
        |   2021    |   H1      |   55  |
        |   2021    |   H2      |   75  |
        |   2022    |   H1      |   77  |
        |   2022    |   H2      |   85  |
        |   2023    |   H1      |   86  |
        |   2023    |   H2      |   90  |  
        |   2024    |   H1      |   91  |
        |   2024    |   H2      |   96  |
    
    2. We also observed the following percentage change in average ridership before and after the pandemic

        | Route or Line | After Pandemic | Before Pandemic | Percent Change (%) |
        |---------------|----------------|-----------------|---------------------|
        | Silver Line   | 327,979.40     | 485,536.40      | -32.45              |
        | All Bus       | 3,230,676.00   | 4,846,938.00    | -33.35              |
        | Private Bus   | 26,989.79      | 75,959.08       | -64.47              |

7. Following table visualizes the top 5 routes that incured the most losses and gains in pre-covid, covid and post-covid era:

| Period                        | Change Type | Route ID | Total Change   |
|-------------------------------|-------------|----------|----------------|
| **Pre-pandemic (2016-2020)**  | Gain        | 39       | 3,934.7        |
|                               | Gain        | 21       | 3,772.7        |
|                               | Gain        | 66       | 3,503.5        |
|                               | Gain        | 743      | 2,933.2        |
|                               | Gain        | 57       | 2,248.8        |
|                               | **Loss**    | 1        | −13,369.0      |
|                               | Loss        | 28       | −12,984.9      |
|                               | Loss        | 111      | −10,701.3      |
|                               | Loss        | 23       | −9,928.8       |
|                               | Loss        | 32       | −7,777.3       |
| **Pandemic (2020-2022)**      | Gain        | 66       | 10,867.5       |
|                               | Gain        | 741      | 9,735.1        |
|                               | Gain        | 57       | 7,622.1        |
|                               | Gain        | 743      | 6,833.76       |
|                               | Gain        | 749      | 5,864.38       |
|                               | **Loss**    | 23       | −9,937.8       |
|                               | Loss        | 1        | −8,696.9       |
|                               | Loss        | 22       | −7,771.2       |
|                               | Loss        | 32       | −5,486.7       |
|                               | Loss        | 111      | −4,936.0       |
| **Post-pandemic (2023-2024)** | Gain        | 743      | 3,110.2        |
|                               | Gain        | 426      | 2,893.7        |
|                               | Gain        | 39       | 1,573.4        |
|                               | Gain        | 9        | 1,420.7        |
|                               | Gain        | 34E      | 1,340.1        |
|                               | **Loss**    | 1        | −12,703.3      |
|                               | Loss        | 23       | −9,105.3       |
|                               | Loss        | 28       | −9,100.3       |
|                               | Loss        | 111      | −8,343.3       |
|                               | Loss        | 16       | −5,704.5       |

8. We identified the important infliction points(points where the rate of change changes direction (decreasing -> increasing)) in the time series data and understand the properties of the trends in reliability metric On-Time-Performance
    1. This table lists out some the infliction points with surrounding points to understand the changes (Check out [this](./Plots/Reliability/Month_wise_OTP_Peak.html) plot for all the points). These points mark a trend change which are crucial in analyzing time series analysis. We brief the significance in the Analysis section:

    | Infliction point | Month    | On-Time-Performance |
    | ---------------- | -------- | ------------------- |
    | Sep 2016         | Aug 2016 |  0.679              |
    |                  | Sep 2016 |  0.579              |
    |                  | Oct 2016 |  0.598              |
    | Sep 2017         | Aug 2017 |  0.678              |
    |                  | Sep 2017 |  0.589              |
    |                  | Oct 2017 |  0.587              |
    | Sep 2018         | Aug 2018 |  0.686              |
    |                  | Sep 2018 |  0.595              |
    |                  | Oct 2018 |  0.607              |
    | Sep 2019         | Aug 2019 |  0.694              |
    |                  | Sep 2019 |  0.614              |
    |                  | Oct 2019 |  0.634              |
    | Sep 2022         | Aug 2022 |  0.711              |
    |                  | Sep 2022 |  0.625              |
    |                  | Oct 2022 |  0.638              |

    2. We also visualize the OTP performance for the important routes over 8 years [here](./Plots/Reliability/OTP_performance.html). Due to the interest of space of this report, tabularization of this data is not possible. 


  
# # Analysis
## Bus Arrival; and Departure Data
#### Pre-Pandemic (Aug’18 - Dec’19)
1. **Weekly**
    1. Delays were stable and moderate across most routes, generally ranging between **3–6 minutes**.
    2. We see the delay spikes mostly during weekends, especially **Saturdays**.
    3. **Route 29** and **Route 45** were the most delayed.
    4. **Routes 14** and **111** had the lowest delays.

2. **Monthly**
    1. Delays were stable and moderate across most routes, generally ranging between **3–6 minutes**.
    2. **Route 45** was the most delayed, hovering consistently around **7–9 minutes** — setting a trend that continued post-pandemic. **Route 29** followed second.
    3. **Routes 14** and **111** had the lowest delays, typically below **3 minutes**, indicating strong schedule adherence.
    4. A minor spike occurred mid-2019 for several routes. Reasons yet to be known.
    5. Delay variability across routes was lower, suggesting a more uniform, well-controlled system.

3. **Quarterly**
    1. Most routes had moderate delays, typically averaging between **2–5 minutes**.
    2. Lowest delays: **Route 111 (~2.3 min)**, **Route 42 (~2.78 min)**.
    3. Highest delays: **Route 45 (~7.19 min)**, **Route 29 (~6.64 min)**, **Route 24 (~6.07 min)**.
    4. Patterns were relatively stable across quarters, with no major seasonal spikes.
    5. Chronic underperformers (like **Route 45**) were already visible before COVID impacts.

4. **Stops Analysis**
    1. **Most affected routes**:
        - **Route 22**, **23**, and **29** each recorded **18 worst performing stops**.
        - **Route 24** and **33** followed with **11 worst performing stops** each.
    2. **Least affected routes**:
        - **Route 14** and **42** had **zero worst performing stops**.
        - **Routes 31** and **111** had relatively low counts (**5 worst performing stops** each).
5. **Delay Frequency**
    1. **Most delayed routes**:
    - Route 23 (**7093 delayed**), Route 22 (**5815 delayed**), and Route 29 (**6660 delayed**) topped the late frequency.
    - Route 45 and 15 also showed consistently high delay counts.
    2. **Most on-time routes**:
    - Route 111 (**7898 on-time**), Route 15 (**5870 on-time**), and Route 33 (**3587 on-time**) had strong on-time records.
    - Route 42, though small in total counts, showed a good on-time ratio relative to delays.
    3. **Observation**:
    - Certain routes (like 22, 23, 29) consistently struggled, combining high service volume with frequent delays.
    - Route 111 stood out for strong on-time performance despite heavy ridership.
---

#### **Pandemic (Jan'20 - Dec'22)**

1. **Weekly**
    1. Delays dropped significantly during the pandemic for all routes and all days of the week.
    2. **Route 14** and **111** remained the best performers, while **29** started to show delays.
    3. **Route 14** showed elevated delays on **Saturdays**.
    4. **Route 29** and **Route 45** were still the most delayed, with **Route 23** and **24** showing delays too.

2. **Monthly**
    1. Delays dropped significantly in early 2020, especially during lockdown phases — likely due to reduced traffic and ridership.
    2. **Route 15** experienced a massive spike in mid-2021, peaking above **10 minutes**, possibly due to staffing or service cuts.
    3. **Route 45** continued to show elevated delays, though slightly lower than pre-COVID at times.
    4. Most routes had smoother, flatter trends in 2020, followed by a gradual rise through 2021–2022 as the city reopened.
    5. System-wide delay spikes occurred in mid-2022, suggesting operational challenges during recovery (e.g., increased demand, limited resources).

3. **Quarterly**
    1. Many routes saw reduced delays due to lower traffic and reduced ridership.
    2. Routes improving significantly:
        - **Route 22 (from ~4.5 min to ~2.45 min)**,
        - **Route 23 (from ~5.56 min to ~2.21 min)**,
        - **Route 26 (from ~4.63 min to ~2.81 min)**.
    3. Exceptions: **Route 14** saw a delay increase (~**3.87 min** vs ~**2.54 min** pre-pandemic).
    4. Even high-delay routes like **Route 45** improved slightly (~**7.19 → ~5.52 min**), but still remained among the worst.

4. **Stops Analysis**
    1. **Most affected routes**:
        - **Route 24** recorded the highest with **14 worst performing stops**.
        - **Route 14** and **29** each had **9 worst performing stops**.
    2. **Least affected routes**:
        - **Route 111** and **31** had **zero worst performing stops**.
        - **Route 23**, **26**, and **17** had just **1 worst performing stop** each.
    3. **Observation**: System-wide delay reductions were seen, likely due to lower traffic, but some isolated routes (notably **Route 24**) still struggled.
5. **Delay Frequency**
    1. **Most delayed routes**:
    - Route 29 (**7212 delayed**), Route 24 (**7944 delayed**), and Route 45 (**6812 delayed**) led in pandemic-period delays.
    - Route 23 and 22 saw notable improvements compared to pre-pandemic.
    2. **Most on-time routes**:
    - Route 111 (**16,379 on-time**), Route 15 (**15,435 on-time**), and Route 23 (**16,780 on-time**) showed strong on-time recoveries.
    - Even Route 26 saw improvements in on-time numbers relative to its size.
    3. **Observation**:
    - Pandemic effects (like reduced traffic and demand) boosted overall on-time performance, especially for routes that had been under pressure before.
    - Some routes (24, 29, 45) still struggled despite the system-wide slowdown.
---

#### **Post-Pandemic (Jan'23 - Dec'24)**

1. **Weekly**
    1. Weekends showed elevated delays again.
    2. Delays increased overall, with higher averages than both pre-COVID and during COVID for many routes.
    3. **Route 29**, **Route 45**, **Route 23**, and **24** were the most delayed.
    4. **Route 111** remained the best in terms of being least delayed.
    5. Overall, the performance was worse than pre-COVID by an average increase in delays by **1 to 3 minutes**.

2. **Monthly**
    1. Delays increased overall, with higher averages than both pre-COVID and during COVID for many routes.
    2. **Route 45** remains the worst performer, consistently staying around or above **12 minutes**, worsening post-pandemic.
    3. **Route 29** also emerged as a high-delay route, especially from mid-2023 onward.
    4. Several routes began to diverge more in delay behavior, indicating growing inconsistency across the system.
    5. Seasonal delay patterns reappeared, with delay peaks around **summer** and **fall**, hinting at traffic volume or scheduling pressure.

3. **Quarterly**
    1. Delays increased sharply across most routes, often exceeding pre-pandemic levels.
    2. Major delay jumps:
        - **Route 17 (~3.39 → ~6.25 min)**,
        - **Route 29 (~3.77 → ~8.27 min)**,
        - **Route 45 (~5.52 → ~10.76 min)**.
    3. Several routes that improved during the pandemic (e.g., **22**, **23**, **24**) bounced back to high-delay patterns (~**6 min** range).
    4. Seasonal effects are more pronounced, especially **Q4** surges in several routes (e.g., **Route 14**, **Route 17**).

4. **Stops Analysis**
    1. **Most affected routes**:
        - **Route 22** topped the list with **21 worst performing stops**.
        - **Route 23** followed closely with **19 worst performing stops**.
        - **Route 29** came in at **18 worst performing stops**.
    2. **Least affected routes**:
        - **Route 26** continued its good performance with just **1 worst performing stop**.
        - **Routes 31** and **111** maintained moderate levels (**5 worst performing stops** each).
    3. **Observation**: Many routes now experience **higher worst performing stop counts than before the pandemic**, suggesting unresolved operational bottlenecks and possibly increased post-pandemic demand.
5. **Delay Frequency**
    1. **Most delayed routes**:
    - Route 29 (**8050 delayed**), Route 45 (**8508 delayed**), and Route 22 (**10,180 delayed**) topped delays post-pandemic.
    - Route 23 also remained among the worst with **9510 delayed**.
    2. **Most on-time routes**:
    - Route 111 (**8665 on-time**), Route 15 (**6993 on-time**), and Route 33 (**5855 on-time**) continued to deliver comparatively strong on-time service.
    - Notably, overall on-time counts dropped on several routes compared to pandemic levels.
    3. **Observation**:
    - As demand and traffic rebounded post-pandemic, delays surged past pre-pandemic levels on many routes.
    - System performance became uneven, with top routes like 111 maintaining decent reliability, while others (29, 45, 22) faced worsening congestion and scheduling pressures.

## Ridership Data
1. **Exploring Ridership Patterns Over Time** to Understand Pandemic Impact and Long-Term Trends
    1. From the given data, we can see that **bus ridership experienced a significant drop in around 2020-H1**, likely due to the **COVID-19 pandemic**. There's a **gradual recovery in ridership from 2020-H2 onwards**, though it has **not yet reached pre-pandemic levels**.
    2. This **significant drop in ridership** highlights a **system-wide impact** across the entire bus network. It reflects a combination of **reduced travel demand**, changes in **work and commuting behavior** (e.g., remote work), and possible shifts to **alternative transportation modes** like biking or driving.

2. **Ridership Demographic Analysis**
    1. **Income and Economic Profile**: The majority of bus riders fall within the **low to moderate income brackets**, with most earning up to **80% of the area median income**. A large portion is concentrated in the **30%–60% income range**, indicating a **high dependency on public transportation** among lower-income populations.
    2. **Race and Ethnicity**: The ridership is predominantly composed of **White and African American individuals**, with other racial groups representing a significantly smaller share. This suggests that **outreach or equity efforts** may be necessary to understand and address potential **accessibility gaps** for underrepresented groups.
    3. **Age Distribution**: Most bus riders are in the **18–44 age group**, highlighting that public transit serves a predominantly **young to middle-aged working population**, including **students and early-career professionals**.
    4. **Gender**: **Women make up a larger share of bus riders** compared to men. This could be reflective of broader **social trends in commuting behavior** or **economic participation**.
    5. **Fare Type and Payment**: A majority of riders **pay the full fare**, indicating **limited usage of discounted programs**. However, a notable minority benefit from **employer-sponsored or student-discounted fares**, showing that **fare assistance programs** are still relevant for specific groups.
    6. **Trip Purpose**: Most riders use the bus primarily for **commuting to work**, emphasizing the role of the bus network as a **critical connector in daily economic activity**.
    7. **Car Ownership and Transit Use**: Interestingly, even among riders who **own at least one car**, the majority still **use the bus five days a week**. This suggests a **high level of preference or necessity** for public transportation, even when private alternatives are available — potentially due to **convenience, cost, or traffic/parking constraints**.

## Reliability Data
Looking at the plots of relaibility metric, there is a clear trend in the infliction points:
1. **Infliction points in overall performance**
    1. There is a seasonal infliction point occuring in September of every year. At this point, the on time performance starts increasing and lies in a certain before falling down till september. These infliction points indicate the commuter shifts that happen at the year end since lot of employees start utilizing their leaves, leading to a relaxation of congestion leading to improved performance.
    2. There is no seasonal inflicton points during the term 2020-2022 and the overall OTP is high during this period. This signifies the covid era where commuters did not come out of homes due to risk of infection.
2. **On time performance on important bus routes**
    1. The OTP of important buses indicate the buses 111 has always performed the best while 29 has been the poorest. 111 experiences the highest employee passenger traffic in all of MBTA and so a good performance denotes one of the laurels of the MBTA system. On the contrary, route 29 passes through university-heavy area with a lot of student population and therfore have higher student passenger traffic leading to a degradation in performance.
    2. There is also a stratification in the trends of top and bottom performing routes. This produces "performance tiers" which can help MBTA identify the bus groups and plan a focused measures to improve the overall system.

# 🚌 Recommendations for Improving the Bus System (Based on Analysis: 2018–2024)

## 🚍 Operational Improvements

### 1. Target Chronic Underperformers
- **Focus routes**: 45, 29, 22, 23, and 24
- **Actions**:
  - Conduct route-level audits to identify delay causes (traffic, scheduling, stop density).
  - Introduce **express or limited-stop services** during peak hours.

### 2. Optimize Weekend Service
- **Problem**: Weekends—especially Saturdays—show consistent delay spikes.
- **Actions**:
  - Adjust weekend schedules based on observed traffic patterns.
  - Allocate additional buses to high-delay routes during weekends.

### 3. Dynamic Scheduling & Real-Time Monitoring
- **Problem**: Post-pandemic delays are inconsistent and rising.
- **Actions**:
  - Use real-time GPS and historic delay data to **adapt schedules dynamically**.
  - Implement **predictive scheduling models** using machine learning.

---

## 🔧 Infrastructure & Stop-Level Improvements

### 4. Upgrade High-Delay Stops
- **Focus routes**: 22, 23, 29, and 24
- **Actions**:
  - Improve stop infrastructure (e.g., shelters, signage, lighting).
  - Deploy **transit signal priority (TSP)** at major intersections.
  - Optimize stop spacing to eliminate redundant or inefficient stops.

### 5. Expand Bus Lanes
- **Start with**: Routes 29, 45, and 22
- **Actions**:
  - Designate **dedicated bus lanes** on congested corridors.
  - Pilot shared bus-bike lanes where full bus-only lanes aren’t feasible.

---

## 👥 Equity & Ridership Support

### 6. Expand Fare Assistance Programs
- **Problem**: Majority of riders are low-income, yet many pay full fare.
- **Actions**:
  - Scale up discounted fare programs for riders below 60% AMI.
  - Partner with employers, schools, and housing agencies for **bulk pass programs**.

### 7. Multilingual & Inclusive Outreach
- **Problem**: Non-White and smaller demographic groups underrepresented.
- **Actions**:
  - Conduct outreach in multiple languages.
  - Ensure surveys, signs, and digital tools are **culturally accessible**.

### 8. Gender-Sensitive Transit Design
- **Insight**: Women represent a larger share of bus riders.
- **Actions**:
  - Improve lighting and visibility at stops.
  - Consider **safe drop-off flexibility** during evening/night hours.

---

## 📈 System Management & Policy

### 9. Performance-Based Funding
- **Action**:
  - Allocate resources based on **on-time performance** and **ridership recovery**.
  - Prioritize funding to **high-performing or improving routes**.

### 10. Rebalance Post-Pandemic Service
- **Problem**: Delays are higher post-COVID despite lower ridership in some areas.
- **Actions**:
  - Reassess service allocations based on **current demand and delay data**.
  - Shift resources from over-served routes to delay-heavy corridors.

---

## Summary: Priority Routes for Intervention

| Action Area              | Key Routes                 |
|--------------------------|----------------------------|
| High Delays              | 45, 29, 22, 23, 24         |
| Best Performers          | 111, 15, 14, 33            |
| Worst Performing Stops   | 22, 23, 29, 24             |
| On-Time Performance      | 111, 15, 23, 33            |
| Weekend Delay Spikes     | 14, 29                     |
| Fare Equity Opportunity  | All routes (esp. low-income zones) |

# Steps to Recreate
## Env setup instructions
1. Navigate to the start of this directory
2. Run the following command: 
`./env_setup.sh`

## To test the code
Open the `reliability_predictions.ipynb` and select the created environment `.venv`. Run all the cells and you should see a plotly output at the last cell.

## Visualisations
All the visualisations are interactive and will be saved in [Plots](plots) folder.

Download any relevant data files using Data Collection Section above and put into the data folder of the repo.

Just click the headings to get to the relevance notebooks.
### Arrival Departure Data
1. Run the [Preprocessing_Arr_Dep.ipynb](Preprocessing_Arr_Dep.ipynb), with any changes in the path/directory variables.
2. Then run the [csv_prep_delay_routes.ipynb](csv_prep_delay_routes.ipynb), with any path changes. Now you will be ready to get the visualisations related to the delay in bus services.
3. For the visualisations:
    1. Run [weekly_delay_visual.ipynb](weekly_delay_visual.ipynb) for weekly delay visualizations of each route and all the routes combined.
    2. Run [monthly _delay_vis.ipynb](monthly_delay_vis.ipynb) for monthly delay visualisations for each route for each month.
    3. Run [quarterly_delay_vis.ipynb](quarterly_delay_vis.ipynb) for quarterly visualisations for each route each quarter and for all routees each quarter.
    4. Run [stop_id_delays_visual.ipynb](stop_id_delays_visual.ipynb) for delays of each stop at each route and for getting the most troublesome stops that contribute the maximum delay at each route.
    5. Run the [delay_freq.ipynb](delay_freq.ipynb) to generate visualisations for the freq of times each route was late and on time.

### [Pandemic Ridership](pandemic_ridership.ipynb)
1. Download the MBTA_Monthly_Ridership_By_Mode_and_Line.csv from MBTA website and store it in the `data` directory.
2. 2. Change any relevant paths in the notebook.
3. Run all the cells in pandemic_ridership.ipynb.

### [Ridership Demographics](ridership_demographics.ipynb)
1. Download the MBTA Passenger Survey and store it in the `data` directory.
2. Change any relevant paths in the notebook.
3. Run all the cells in ridership_demographics.ipynb.
 
### [Ridership Over Years](ridership_over_years.ipynb)
1. Download the MBTA_Bus_Ridership_by_Trip_Season_Route_Line_and_Stop and store it in the `data` directory.
2. Change any relevant paths in the notebook.
3. Run all the cells in ridership_over_years.ipynb.

### [Survey Demographics](survey_demographics.ipynb)
1. Download the 2023 Systemwide Passenger Survey Data and store it in the `data` directory.
2. Change any relevant paths in the notebook.
3. Run all the cells in survey_demographics.ipynb.

### [Bus_reliability](mbta_bus_reliability_viz.ipynb)
1. Download the Bus Rapid Transit Reliability Data and store it in the `data` directory.
2. Change any relevant paths in the notebook.
3. Run all the cells in mbta_bus_reliability_viz.ipynb.

### [Reliability Predictions](reliability_predictions.ipynb)
1. Download the Bus Rapid Transit Reliability Data and store it in the `data` directory.
2. Change any relevant paths in the notebook.
3. Run all the cells in reliability_predictions.ipynb.

### [Ridership Predictions](ridership_predictions.ipynb)
1. Download the MBTA_Bus_Ridership_by_Trip_Season_Route_Line_and_Stop Data and store it in the `data` directory.
2. Change any relevant paths in the notebook.
3. Run all the cells in ridership_predictions.ipynb.

### [Demographics Comparison](demographics_2015_2023.ipynb)
1. Download the MBTA Systemwide Survey Results Data for 2015-17 from the repo and store it in the `data` directory.
2. Run [transform_survey_data.ipynb](transform_survey_data.ipynb)
3. Download the MBTA Systemwide Survey Results Data for 2023 and load transformed 2015 survey dataset from the repo and store it in the `data` directory.
4. Change any relevant paths in the notebook.
5. Run all the cells in demographics_2015_2023.ipynb.
