NB. A table is a list of columns
NB. A column is a 2 element list of boxes.
NB.   The first box contains the column name
NB.   The second box contains the column data (a list)

NB. Creation
tabulate
  x:boxed list of column names
  y:boxed list of corresponding column values

NB. Metadata
colNames
  y:table

colData
  y:table

count
  y:table

colIdx
  x:table
  y:boxed column name

NB. Query
selCol
  x:table
  y:boxed column name

selIdxs
  x:table
  y:indices

valCol
  x:table
  y:boxed column name

NB. Append
append
  x:table
  y:boxed lists corresponding to the schema of the table, to be appended to the end

appendTable
  x:table
  y:table with the same schema

NB. Helper
t_arg
  y:table boxed with a column name ie mytable;'mycol'

col_arg
  y:table boxed with a column name


NB. Transform
transValCol
  u:monadic, rank-preserving function
  y:table boxed with a column name

transCol
  u:monadic, rank-preserving function
  y:table boxed with a column name

NB. Delete
delCol
  x:table
  y:boxed column name

delIdxs
  x:table
  y:indices

delColIdxs
  x:table
  y:indices of the columns within the schema

NB. Filter
where
  u:monadic, boolean-returning function
  y:table boxed with a column name

filter
  u:monadic, boolean-returning function
  y:table boxed with a column name

dfilter
  u:monadic, boolean-returning function
  y:table boxed with a column name

NB. Update
updIdxs
  x:table
  y:boxed list of column name, indices to replace and their replacements ie 'mycol';indices;replacements