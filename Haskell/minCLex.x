{ 
module Main (main) where
}

%wrapper "basic"

$digit = 0-9              -- digits
$idC   = [_a-zA-Z]		  -- valid identifier characters 

tokens :- 
	
	$white+					;
	$digit+					{\s -> IntValT (read s)}
	int 					{\s -> IntT}
	float                   {\s -> FloatT}
	if  					{\s -> IfT}
	else 					{\s -> ElseT}
	do 						{\s -> DoT}
	while 					{\s -> WhileT}
	for 					{\s -> ForT}
	return 					{\s -> ReturnT}
	"{"						{\s -> LBrace}
	"}"						{\s -> RBrace}
	"("						{\s -> LParen}
	")"						{\s -> RParen}
	";"						{\s -> Semi}
	"==" 					{\s -> EqualT}
	"="						{\s -> AssignT}
	"<="					{\s -> LessEqT}
	"<"						{\s -> LessT}
	">="					{\s -> GreatEqT}
	">"						{\s -> GreatT}
	$idC+					{\s -> IdT s}


{
-- token type
-- probably best for the surface syntax to only support integer and double vals,
-- then handle conversion to the correct datatype within the abstract syntax based
-- on variable type
data Token = IdT String
		   | IntValT Int
		   | DoubleValT Double
		   | CharValT Char
		   | StringValT String
		   | VoidT
		   | IntT
		   | FloatT
		   | DoubleT
		   | CharT
		   | StringT
		   | IfT
		   | ElseT
		   | DoT
		   | WhileT
		   | ForT
		   | ReturnT
		   | LParen
		   | RParen
		   | LBrace
		   | RBrace
		   | Semi
		   | AssignT
		   | EqualT
		   | LessT
		   | GreatT
		   | LessEqT
		   | GreatEqT
		   deriving(Show)


main = do
	s <- getContents
	print (alexScanTokens s)
}





