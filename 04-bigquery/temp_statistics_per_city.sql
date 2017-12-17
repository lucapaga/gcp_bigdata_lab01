SELECT city, count(*) as SAMPLES, min(temperature) AS MIN_TEMP, avg(temperature) AS AVERAGE_TEMP, max(temperature) AS MAX_TEMP
FROM [tetrapak-2017-gcp-onboard-00:DemoIoT20171213.flow_lp_restore_1]
group by city
order by 2 desc
