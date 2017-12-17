SELECT city, count(*)
FROM [tetrapak-2017-gcp-onboard-00:DemoIoT20171213.flow_lp_restore_1]
group by city
order by 2 desc
