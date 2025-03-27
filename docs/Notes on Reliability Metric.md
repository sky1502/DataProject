# MBTA Performance metrics: Relaibility Metric
MBTA used to calculate the reliability of a given transport mode using something called On-Time Performance(OTP). Now they have started using a new metric called Excess Trip Time (ETT) since December 2024 for Rail and subway.

## On-Time Performance (OTP)
This is calculated as a percentage of on-time trips that took place out of total trips that happened on that day. The way the count this is based on two different tests as outlined in their [service delivery policy](https://cdn.mbta.com/sites/default/files/2021-09/service-delivery-policy-june-2021.pdf) page 23 Table 9. 

For non-frequent services(longer than 15 minutes), they measure the on timeness in 3 different points(called timepoints) accross the journey:
 - **At origin**: service should start within 3 minutes
 - **Mid route**: depart 1 minute early or within 6 minutes
 - **At destination**: arrive within 5 minutes.

For frequent services, 
 - **At origin**: headway(time between two schedule buses) + 3 minutes.
 - **At destination**: actual trip time shouldn't be more that 1.2 times the expected trip time

The final percentage has two components
 - **numerator**: number of time points within standards
 - **denominator**: total number of time points.

**Note that the MBTA reliability metric dataset still publishes OTP.**


