u := 10pt;

outputtemplate := "line.mps";
beginfig(1);
draw (0,0)--(4u,0)--(2u,2u)--(0,0) withpen pencircle scaled .8pt;
pickup pencircle scaled .8pt;
draw (5u,0)--(9u,0)--(7u,2u)--cycle;
pickup pencircle scaled 3pt;
drawdot (10u,0);
drawdot (14u,0);
drawdot (12u,2u);
endfig;

outputtemplate := "predefined.mps";
beginfig(2);
pickup pencircle scaled .8pt;
draw fullcircle scaled 2u;
draw halfcircle scaled 2u shifted (3u,0);
draw quartercircle scaled 2u shifted (5u,0);
draw fullcircle xscaled 4u yscaled 2u shifted (9u,0);
draw unitsquare scaled 2u shifted (12u,-u);
draw unitsquare xscaled 4u yscaled 2u shifted (15u,-u);
endfig;

outputtemplate := "curve.mps";
beginfig(3);
pickup pencircle scaled .8pt;
draw (0,0)..(4u,1u)..(8u,0);
draw (9u,0){up}..(13u,1u){right}..(17u,0){down};
draw (18u,0){up}...(22u,1u){right}...(26u,0){down};
draw (0,2u)..(2u,3u)..(6u,3u)..(8u,2u);
draw (9u,2u)..(11u,3u)..tension 1.5..(15u,3u)..(17u,2u);
draw (18u,2u)..(20u,3u)..tension 1.5 and 1..(24u,3u)..(26u,2u);
draw (0,4u)..(4u,5u)..(8u,4u);
draw (9u,4u){curl 0}..(13u,5u)..{curl 0}(17u,4u);
draw (18u,4u){curl 100}..(22u,5u)..{curl 100}(26u,4u);
pickup pencircle scaled 3pt;
drawdot (0,0); drawdot (4u,1u); drawdot (8u,0);
drawdot (9u,0); drawdot (13u,1u); drawdot (17u,0);
drawdot (18u,0); drawdot (22u,1u); drawdot (26u,0);
drawdot (0,2u); drawdot (2u,3u); drawdot (6u,3u); drawdot (8u,2u);
drawdot (9u,2u); drawdot (11u,3u); drawdot (15u,3u); drawdot (17u,2u);
drawdot (18u,2u); drawdot (20u,3u); drawdot (24u,3u); drawdot (26u,2u);
drawdot (0,4u); drawdot (4u,5u); drawdot (8u,4u);
drawdot (9u,4u); drawdot (13u,5u); drawdot (17u,4u);
drawdot (18u,4u); drawdot (22u,5u); drawdot (26u,4u);
endfig;

outputtemplate := "dashed.mps";
beginfig(4);
pickup pencircle scaled .8pt;
draw (0,0)--(10u,0) dashed withdots;
draw (0,1u)--(10u,1u) dashed withdots scaled 2;
draw (0,2u)--(10u,2u) dashed evenly;
draw (0,3u)--(10u,3u) dashed evenly scaled 2;
endfig;

outputtemplate := "arrow.mps";
beginfig(5);
pickup pencircle scaled .8pt;
drawarrow (0,0)--(10u,0);
drawarrow reverse ((0,1u)--(10u,1u));
drawdblarrow (0,2u)--(10u,2u);
endfig;

outputtemplate := "color.mps";
beginfig(6);
pickup pencircle scaled .8pt;
draw (0,0)--(10u,0) withcolor red;
draw (0,1u)--(10u,1u) withcolor green;
draw (0,2u)--(10u,2u) withcolor blue;
endfig;

outputtemplate := "fill.mps";
beginfig(7)
path p;
p := (0,0)--(2,0)--(1,1.732)--cycle;
fill p scaled u;
fill p scaled u shifted (3u,0) withcolor red;
fill p scaled u shifted (6u,0) withcolor green;
fill p scaled u shifted (9u,0) withcolor blue;
endfig;

outputtemplate := "transform.mps";
beginfig(8);
pickup pencircle scaled .8pt;
draw p scaled u;
draw p scaled u shifted (3u,0) rotated 30;
draw p scaled u rotated 30 shifted (5u,0);
draw p scaled u rotatedaround ((2u,0),30) shifted (7u,0) ;
draw p scaled u slanted 1 shifted (10u,0);
draw p scaled u reflectedabout ((0,0),(2u,0)) shifted (13u,0);
draw p xscaled 2u yscaled u shifted (16u,0);
endfig;

outputtemplate := "loop.mps";
beginfig(10);
pickup pencircle scaled .8pt;
drawarrow (0,0)--(10u,0);
drawarrow (0,0)--(0,4u);
draw (0,0) %注意这里没有分号
for x=1 upto 3: 
    ..(x*x,x)*u 
endfor;
endfig;

prologues:=3;
outputtemplate := "label.mps";
beginfig(9);
pickup pencircle scaled .8pt;
draw unitsquare xscaled 8u yscaled 4u;
label.top ("top", (4u,4u));
label.bot ("bottom", (4u,0));
label.lft ("left", (0,2u));
label.rt ("right", (8u,2u));
label.ulft ("upper left", (0,4u));
label.urt ("upper right", (8u,4u));
label.llft ("lower left", (0,0));
label.lrt ("lower right", (8u,0));
label.rt (btex $E=mc^2$ etex, (2u,2u));
drawarrow (16u,0)--(22u,0);
drawarrow (16u,0)--(16u,4u);
dotlabel.bot ("(0,0)", (16u,0));
label.bot (btex $x$ etex, (22u,0));
label.lft (btex $y$ etex, (16u,4u));
endfig;

end
