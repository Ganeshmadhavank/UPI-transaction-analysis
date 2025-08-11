create database UPI_Analytics;

select * from [dbo].[upi_transactions_2024];

-- 1 Total success transaction status
select sender_bank,transaction_status,COUNT(*) as total_succes_transaction ,format(SUM(amount_inr),'N0')as Total_Sending_Amount
from [dbo].[upi_transactions_2024]
where transaction_status='Success'
group by sender_bank,transaction_status
order by Total_Sending_Amount desc

-- 2 Total Failed Transaction status

select sender_bank,transaction_status,COUNT(*) as total_Failed_transaction ,format(SUM(amount_inr),'N0')as Total_Failed_Amount
from [dbo].[upi_transactions_2024]
where transaction_status='Failed'
group by sender_bank,transaction_status
order by Total_Failed_Amount desc



-- 3 Top 5 bank to bank transaction 

select top(5)
CONCAT(sender_bank ,'-',receiver_bank)as Top_5_bank_to_bank,
SUM(amount_INR)as Total_Amount
from [dbo].[upi_transactions_2024] 
where transaction_status='Success'
group by CONCAT(sender_bank ,'-',receiver_bank)
order by Total_Amount desc


---4 Monthly Transactions

select sender_bank,MONTH(timestamp)as Month_numbers,SUM(amount_INR)as Amount from [dbo].[upi_transactions_2024] 
group by sender_bank,MONTH(timestamp)
order by MONTH(timestamp) asc,SUM(amount_INR) desc;


select * from [dbo].[upi_transactions_2024];

-- 5 Monthly Transactions using Stored procedure 
create  procedure Monthly_Transaction
@Month_number int,
@transaction_status varchar(50)
as
begin
select 
sender_bank,MONTH(timestamp)as month,count(*)as count_of_transaction,SUM(amount_INR)as Monthly_amount
from [dbo].[upi_transactions_2024] 
where MONTH(timestamp)= @Month_number and 
(
@transaction_status='All' or
transaction_status=@transaction_status
)
group by sender_bank,MONTH(timestamp)
order by count_of_transaction desc,Monthly_amount desc
end;

exec Monthly_Transaction @Month_number=3,@transaction_status='All';

exec Monthly_Transaction @Month_number=3,@transaction_status='Success';

exec Monthly_Transaction @Month_number=3,@transaction_status='Failed';


-- 6 Average transaction value per city

select sender_state,sum(amount_INR)as Total_amount,count(*)as Avg_Transaction ,AVG(amount_INR)as Avg_amount_Transaction
from [dbo].[upi_transactions_2024]
group by sender_state
order by Avg_Transaction desc;

--7 Day vies transaction using stored procedure

create procedure day_of_week 
@transaction_status varchar(20),
@day_of_week varchar(20)
as
begin 
select day_of_week , count(*)transaction_count,sum(amount_inr)as Total_amount_day_view from [dbo].[upi_transactions_2024]
where day_of_week= @day_of_week and 
(
@transaction_status='All' or 
transaction_status=@transaction_status
)
group by day_of_week
end;

exec day_of_week @transaction_status='Success' , @day_of_week='Sunday';

exec day_of_week @transaction_status='Failed' , @day_of_week='Sunday';

exec day_of_week @transaction_status='Failed' , @day_of_week='Monday';

exec day_of_week @transaction_status='All' , @day_of_week='Friday';

exec day_of_week @transaction_status='success' , @day_of_week='Friday';

