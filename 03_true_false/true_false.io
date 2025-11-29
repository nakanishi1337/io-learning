// Ioの真偽値テスト - 0, 空文字, nilの評価

// 1. 数値0の真偽値
"0の真偽値:" println
if(0, "0は真", "0は偽") println

// 2. 空文字列の真偽値
"空文字列の真偽値:" println
if("", "空文字列は真", "空文字列は偽") println

// 3. nilの真偽値
"nilの真偽値:" println
if(nil, "nilは真", "nilは偽") println

// 4. 比較のため、明確な真偽値も確認
"比較用:" println
if(true, "trueは真", "trueは偽") println
if(false, "falseは真", "falseは偽") println

// 5. 追加テスト - 他の値も確認
"その他の値:" println
if(1, "1は真", "1は偽") println
if("hello", "文字列\"hello\"は真", "文字列\"hello\"は偽") println