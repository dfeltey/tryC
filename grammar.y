%left PLUS MINUS
%left TIMES DIVIDE MOD
%left UMINUS

%start program

%%    //grammar 

program : type MAIN LPAREN RPAREN block EOF {return {tag: "main", type: $1, block: $5};};

type : INT      {$$ = "int";}
     | CHAR	{$$ = "char";}
     | FLOAT	{$$ = "float";}
     ;

block : LBRACE statements RBRACE {$$ = $2;}
      ;

statements : statement SEMI statements {$$ = [$1].concat($3);}
	   | statement SEMI { $$ = [$1];}
	   ;


statement : 
