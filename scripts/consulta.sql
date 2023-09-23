use adw;

-- Empleados
select 
    detail.SalesOrderDetailID,
    sales.SalesOrderID,
    sales.OrderDate,
    sales.CustomerID,
    sales.SalesPersonID,
    sales.TerritoryID,
    concat(Person.FirstName,' ', Person.LastName) as CustomerName,
    concat(employee.FirstName,' ', employee.LastName) as SalesPersonName,
    territory.name as TerritoryName  
from Sales_SalesOrderDetail as detail
    join Sales_SalesOrderHeader as sales
       on sales.SalesOrderID = detail.SalesOrderID
    join Production_Product as product 
       on detail.ProductID = product.ProductID
    join Sales_Customer as cliente
        on sales.CustomerID = cliente.CustomerID
    left outer join Person_Person as Person
       on cliente.PersonID = Person.BusinessEntityID
    left outer join Sales_SalesPerson as SalesPerson
       on sales.SalesPersonID = SalesPerson.BusinessEntityID
    left outer join Person_Person as employee
       on SalesPerson.BusinessEntityID = employee.BusinessEntityID
    join Sales_SalesTerritory as territory
       on sales.TerritoryID = territory.TerritoryID
limit 5
;
