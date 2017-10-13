**ByteStore** is an in-memory column-store where byte is the first-class citizen. 
It is primarily designed for highly efficient ordinal comparison based *scan* and *lookup*.
It also enables fast multi-column sorting when there are multiple attributes in SQL 
operators such as GROUP BY, ORDER BY, and SQL:2003 PARTITION BY.

As shown in the [system architecture](https://github.com/cswxu/ByteStore/blob/master/system-architecture.pdf),
ByteStore is modified from MonetDB v11.27.5(July2017), where the modified/added components are shaded. 
Accordingly, the coarse-grained to-do list is as follows:

* Originally, MonetDB use BAT (Binary Association Table) as the storage layout.
We shall leave its orignal storage manager intact,  and add a *ByteSlice storage manager* that implements ByteSlice storage layout.

* We shall add four BAT algebra operators to the MonetDB execution engine (aka. Gorblin Database Kernel),
including `ByteSlice-Scan` and `ByteSlice-Lookup` that execute fast scans and lookups on ByteSlice data,
`SIMD-Sort` that carries out (single-column) sorting with SIMD and multi-threading support,
and `Code-Massage` that carries out code massaging process.
Other operators in MonetDB shall leave intact because operations other than scan and lookup manipulate
intermediate data structures (BAT in this case) instead of base column storage.

* We shall add a `Fast-MCS` (fast multi-column sorting) module in the MonetDB MAL (MonetDB Assembly Language)
optimizers framework. This module shall (a) examine an input MAL plan and identify the MAL instructions
carrying out multi-column sorting, then (b) invoke the plan search algorithm to find an optimal massaging plan, 
finally (c) re-write the MAL instructions for multi-column sorting with code massaging.

# First Milestone

The first milestone is that, ByteStore supports SQL and all the scan implementations are using `ByteSlice-Scan`.






