**ByteStore** is an in-memory column-store where byte is the first-class citizen. 
It is primarily designed for highly efficient ordinal comparison based *scan* and *lookup*.
It also enables fast multi-column sorting when there are multiple attributes in SQL 
operators such as GROUP BY, ORDER BY, and SQL:2003 PARTITION BY.

As shown in the [system architecture](https://github.com/cswxu/ByteStore/blob/master/system-architecture.pdf),
ByteStore is modified from MonetDB v11.27.5, where the modified/added components are shaded. 
Accordingly, the to-do list is as follows:

* Originally, MonetDB use BAT (Binary Associated Table) as the storage layout.
We shall replace its storage manager with our *ByteSlice storage manager* that implements 
ByteSlice storage layout.






