WITH CTE AS (
   SELECT * FROM {{ ref('customer_withdrawals') }}
)
SELECT 
member_name,
string_agg(book_name::text, ',') as late_books,
discount_applied,
ROUND(SUM(fee_applied),2) as fee_to_pay
FROM CTE
GROUP BY 1,3
HAVING fee_to_pay = 0