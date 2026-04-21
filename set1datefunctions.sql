select sysdate from dual;

select current_date;

select add_months(sysdate,3) as future_date from dual;

select months_between(sysdate,date '2026-01-01') as months_diff from dual;

select next_day(sysdate,'friday') as next_friday from dual;

select last_day(sysdate) as last_day from dual;

select round(sysdate,'month') as rounded_month from dual;

select trunc(sysdate) as today_date from dual;

select extract(year from sysdate) as year from dual;

select extract(month from sysdate) as month from dual;

select extract(day from sysdate) as day from dual;

select to_date('21-04-2026','DD-MM-YYYY') as coverted_date from dual;

select to_char(sysdate,'DD-MM-YYYY HH24:MI:SS') as formatted_date from dual;

select current_date from dual;

select sysdate + 10 as after_10_days from dual;

select sysdate - 5 as before_5_days from dual;

select sysdate + interval '5' day as after_5_days from dual;

select sysdate + interval '2' months as after_2_months from dual;

