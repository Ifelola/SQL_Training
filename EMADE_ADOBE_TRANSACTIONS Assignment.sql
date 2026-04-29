
USE EmadeDev

DROP TABLE IF EXISTS EMADE_ADOBE_TRANSACTIONS;

CREATE  TABLE  EMADE_ADOBE_TRANSACTIONS (
customer_id int,
product VARCHAR(50),
revenue int
);

INSERT INTO EMADE_ADOBE_TRANSACTIONS
(customer_id, product, revenue)
VALUES
(123, 'Photoshop', 50),
(123, 'Premier Pro', 100),
(123, 'After Effects', 50),
(234, 'Illustrator', 200),
(234, 'Premier Pro', 100);

INSERT INTO EMADE_ADOBE_TRANSACTIONS
(customer_id, product, revenue)
VALUES
(562, 'Illustrator', 200),
(913, 'Photoshop', 50),
(913, 'Premier Pro', 100),
(913, 'Illustrator', 200);




/**
1: For every customer that bought photoshop, return a list of the customers, and the total spent on all products except for photoshop products.
Set your order by cusomer id in ascending order
**/

SELECT * FROM EMADE_ADOBE_TRANSACTIONS;


WITH photoshop_customers AS (
    SELECT DISTINCT customer_id
    FROM EMADE_ADOBE_TRANSACTIONS
    WHERE product = 'Photoshop'
)
SELECT
    pc.customer_id,
    COALESCE(SUM(t.revenue), 0) AS total_spent_excluding_photoshop
FROM photoshop_customers pc
LEFT JOIN EMADE_ADOBE_TRANSACTIONS t
    ON pc.customer_id = t.customer_id
    AND t.product != 'Photoshop'
GROUP BY pc.customer_id
ORDER BY pc.customer_id ASC;