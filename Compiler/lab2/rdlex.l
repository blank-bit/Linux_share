%{
enum yytokentype {
	NUMBER = 258,
	EOL = 259
};

int yylval;

%}


%%


"+" |
"-" |
"*" |
"/" |
"q" { return yytext[0]; }

[0-9]+ { yylval = atoi(yytext); return NUMBER; }


\n	{ return EOL; }
[ \t] { /* ignore whitespace */ }
. 	{ printf("Mystery character %c\n", *yytext); }


%%


int yyerror(char *s)
{
	fprintf(stderr, "error: %s\n", s);
	return 0;
}

int yywrap()
{
	return 1;
}

// void main(int argc, char **argv){
//     int tok;

// 	while(tok = yylex()) 
// 	{
// 		printf("%d", tok);
// 		if(tok == NUMBER) 
// 			printf(" = %d\n", yylval);
// 		else 
// 			printf("\n");
// 	}
// }