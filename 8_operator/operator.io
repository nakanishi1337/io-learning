// XOR
OperatorTable addOperator("xor", 11)
OperatorTable println

true xor := method(bool, if(bool, false, true))
false xor := method(bool, if(bool, true, false))

(true xor (true)) println
(true xor (false)) println
(false xor (true)) println
(false xor (false)) println


// 分母が0の時に0をかえす/演算子
Number originalDiv := Number getSlot("/") clone

Number / := method(den,
    if(den == 0,
        0,
        originalDiv(den)
    )
)

(10 / 2) println
(10 / 0) println