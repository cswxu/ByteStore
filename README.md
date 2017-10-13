**ByteStore** is an in-memory column-store where byte is the first-class citizen. 
It is primarily designed for highly efficient ordinal comparison based *scan* and *lookup*.

As shown in the [system architecture](https://github.com/cswxu/ByteStore/blob/master/system-architecture.pdf),
ByteStore is modified from MonetDB v11.27.5(July2017), where the modified/added components are shaded. 
Accordingly, the coarse-grained to-do list is as follows:

* Originally, MonetDB use BAT (Binary Association Table) as the storage layout.
We shall leave its orignal storage manager intact,  and add a *ByteSlice storage manager* that implements ByteSlice storage layout.

* We shall add two BAT algebra operators to the MonetDB execution engine (aka. Gorblin Database Kernel),
including `ByteSlice-Scan` and `ByteSlice-Lookup` that execute fast scans and lookups on ByteSlice data.
Other operators in MonetDB shall leave intact because operations other than scan and lookup manipulate
intermediate data structures (BAT in this case) instead of base column storage.

# First Milestone

The first milestone is that, ByteStore supports SQL and all the scan implementations are using `ByteSlice-Scan`.






