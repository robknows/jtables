projects_home=:> (<1 1){UserFolders_j_
load projects_home,'/jtables/lib.ijs'

teq=:*./@:,@:=

t=:('num';'char') tabulate ((i.10) ; 'ABCDEFGHIJ')
t_exp=:2 2 $ ('num';i.10) , ('char';'ABCDEFGHIJ')
assert t teq t_exp

tv=:t valCol (<'char')
tv_exp=:'ABCDEFGHIJ'
assert tv teq tv_exp

tf=:(e.&2 3 5 7) filter t;'num'
tf_exp=:2 2 $ ('num';2 3 5 7) , ('char';'CDFH')
assert tf teq tf_exp

tp=:t append (10 11;'KL')
tp_exp=:2 2 $ ('num';i.12) , ('char';'ABCDEFGHIJKL')
assert tp teq tp_exp

td=:t delIdxs 4 5 6
td_exp=:2 2 $ ('num';0 1 2 3 7 8 9) , ('char';'ABCDHIJ')
assert td teq td_exp

tl=:t delCol (<'num')
tl_exp=:('char';'ABCDEFGHIJ')
assert (#tl)=1
assert (, tl) teq tl_exp

tm=:t , ('rev';|.i.10)
tm_exp=:3 2 $ ('num';i.10) , ('char';'ABCDEFGHIJ') , ('rev';|.i.10)
assert tm teq tm_exp

tdf=:(e.&2 3 5 7) dfilter t;'num'
tdf_exp=:2 2 $ ('num';0 1 4 6 8 9) , ('char';'ABEGIJ')
assert tdf teq tdf_exp

ta=:tolower transCol t;'char'
ta_exp=:2 2 $ ('num';i.10) , ('char';'abcdefghij')
assert ta teq ta_exp

tt=:t appendTable t
tt_exp=:2 2 $ ('num';(i.10) , i.10) , ('char';'ABCDEFGHIJABCDEFGHIJ')
assert tt teq tt_exp

tui=:t updIdxs 'num';(3 4 5);(10 11 12)
tui_exp=:2 2 $ ('num';0 1 2 10 11 12 6 7 8 9) , ('char';'ABCDEFGHIJ')
assert tui teq tui_exp

tdsv=:(';';('time';'open';'high';'low';'close';'zeroes');'SNNNNX') readCsv (projects_home,'/jtables/test.csv')
assert 971=count tdsv
assert 8=(type 0 { tdsv valCol <'open')
assert 5=#tdsv
assert 0.000001 (> |) (0.610259 - ((+/ % #) transValCol tdsv;'open'))