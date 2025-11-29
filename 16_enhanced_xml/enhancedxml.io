// 11_domain_specific_languageからマップを移植 /////
OperatorTable addAssignOperator(":", "atPutNumber")

curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doMessage(arg)
    )
    r
)

Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)
    )
)

Map printAsAttributes := method(
    self foreach(k, v,
        write(" " .. k .. "=\"" .. v .. "\"")
    )
)
// ここまで移植 /////



// 以下はXMLビルダーの改良版
Builder := Object clone
Builder indentLevel := 0   // ネストの深さを記録
Builder indent := method("  " repeated(indentLevel))

Builder forward := method(
    // タグ名
    tag := call message name

    // 開始タグ
    write(indent, "<", tag)

    // --- 属性を処理 ---
    call message arguments foreach(arg,
        if(arg name == "curlyBrackets",
            attrs := self doMessage(arg)
            attrs printAsAttributes
        )
    )
    writeln(">")

    // --- 中身を処理（ネスト） ---
    self indentLevel = self indentLevel + 1

    call message arguments foreach(arg,
        if(arg name != "curlyBrackets",
            content := self doMessage(arg)
            if(content type == "Sequence",
                writeln(indent, content)
            )
        )
    )

    self indentLevel = self indentLevel - 1

    // 閉じタグ
    writeln(indent, "</", tag, ">")
)

s := File with("LispML.txt") openForReading contents
doString(s)