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

To do that, we need to add a *ByteSlice storage manager* besides its original BAT storage manager. The  reason we do not remove its original storage manager is that, operators like join and aggregate still use BAT as input.

I suggest the following to-do list in the next two weeks:

1. Compile/build the source code, and play with MonetDB to get familiar with its interface/commands (maybe you've already done this:).

2. When loading the tables into MonetDB, try to trace the source code using gdb to find those functions about BAT creation. The reason is that, we need to create ByteSlice storage along with BAT in those functions.

3. Along with Step 2, you may also need to understand BAT pool management mechanism, because we may need to implement our ByteSlice pool management.





