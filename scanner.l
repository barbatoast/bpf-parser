%option yylineno
%option noyywrap

N           ([0-9]+|(0X|0x)[0-9A-Fa-f]+)

V4          {N}\.{N}\.{N}\.{N}

%%
dst         return DST;
src         return SRC;

ip          return IP;
tcp         return TCP;
udp         return UDP;

host        return HOST;

{V4}        return ADDR4;

<<EOF>>     { return 0; }
%%
