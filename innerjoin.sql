-- inner join task
SELECT c.CustomerID, 
CONCAT(c.CustomerFirstName, ' ', c.CustomerLastName ) AS CustomerFullName,
o.OrderID, o.TotalCost, m.Cuisine AS MenuName, i.ItemName, i.ItemType
FROM customers AS c, bookings AS b, orders AS o, menus as m, menuitems as i
WHERE c.CustomerID = b.CustomerID
AND b.BookingID = o.BookingID
AND o.MenuID = m.MenuID
AND m.MenuItemID = i.MenuItemID
AND i.ItemType != 'Dessert'
AND i.ItemType != 'Drink'
AND o.TotalCost > 150 order by o.TotalCost ASC;