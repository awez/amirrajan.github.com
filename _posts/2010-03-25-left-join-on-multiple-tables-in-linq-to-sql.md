---
title: Left Join on multiple tables in Linq to SQL
category: code
layout: post
tags : [orm, linq to sql]
---
{% include JB/setup %}
<p>
Here's an example of a LEFT OUTER JOIN on multiple tables in Linq to SQL:
</p>
 
<pre name="code" class="c#">
from expense in expenseDataContext.ExpenseDtos
where expense.Id == expenseId //some expense id that was passed in
from category 
// left join on categories table if exists
in expenseDataContext.CategoryDtos
                     .Where(c =&gt; c.Id == expense.CategoryId)
                     .DefaultIfEmpty() 
// left join on expense type table if exists
from expenseType 
in expenseDataContext.ExpenseTypeDtos
                     .Where(e =&gt; e.Id == expense.ExpenseTypeId)
                     .DefaultIfEmpty()
// left join on currency table if exists
from currency 
in expenseDataContext.CurrencyDtos
                     .Where(c =&gt; c.CurrencyID == expense.FKCurrencyID)
                     .DefaultIfEmpty() 
select new 
{ 
    Expense = expense,
    // category will be null if join doesn't exist
    Category = category,
    // expensetype will be null if join doesn't exist
    ExpenseType = expenseType,
    // currency will be null if join doesn't exist
    Currency = currency  
} 
</pre>

