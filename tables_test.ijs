projects_home=:> (<1 1){UserFolders_j_
load projects_home,'/jtick/tables.ijs'

table_test=:assert@:*./&,@:=

t=:('num';'char') tabulate ((i.10) ; 'ABCDEFGHIJ')
t_exp=:2 2 $ ('num';i.10) , ('char';'ABCDEFGHIJ')
t table_test t_exp

tv=:t valCol (<'char')
tv_exp=:'ABCDEFGHIJ'
tv table_test tv_exp

tf=:(e.&2 3 5 7) filter t;'num'
tf_exp=:2 2 $ ('num';2 3 5 7) , ('char';'CDFH')
tf table_test tf_exp

tp=:t append (10 11;'KL')
tp_exp=:2 2 $ ('num';i.12) , ('char';'ABCDEFGHIJKL')
tp table_test tp_exp

td=:t delIdxs 4 5 6
td_exp=:2 2 $ ('num';0 1 2 3 7 8 9) , ('char';'ABCDHIJ')
td table_test td_exp

tl=:t delCol (<'num')
tl_exp=:('char';'ABCDEFGHIJ')
assert (#tl)=1
(, tl) table_test tl_exp

tm=:t , ('rev';|.i.10)
tm_exp=:3 2 $ ('num';i.10) , ('char';'ABCDEFGHIJ') , ('rev';|.i.10)
tm table_test tm_exp

tdf=:(e.&2 3 5 7) dfilter t;'num'
tdf_exp=:2 2 $ ('num';0 1 4 6 8 9) , ('char';'ABEGIJ')
tdf table_test tdf_exp

ta=:tolower transCol t;'char'
ta_exp=:2 2 $ ('num';i.10) , ('char';'abcdefghij')
ta table_test ta_exp

tt=:t appendTable t
tt_exp=:2 2 $ ('num';(i.10) , i.10) , ('char';'ABCDEFGHIJABCDEFGHIJ')
tt table_test tt_exp