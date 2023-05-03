-- subquery
-- Finding all menu items that has been place more then 2 times
SELECT ItemName FROM menuitems 
WHERE MenuItemID = ANY (SELECT Quantity FROM orders WHERE Quantity > 2);