

**ByteStore** is an in-memory column-store where byte is the first-class citizen. 
It is primarily designed for highly efficient ordinal comparison based *scan* and *lookup*.
It also enables fast multi-column sorting when there are multiple attributes in SQL 
operators such as GROUP BY, ORDER BY, and SQL:2003 PARTITION BY.





In-memory Store where byte is the first class citizen
please see the [architecture](https://github.com/cswxu/ByteStore/blob/master/system-architecture.pdf)

![alt text](https://github.com/cswxu/ByteStore/blob/master/system-architecture.pdf)
