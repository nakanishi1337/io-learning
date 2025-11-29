# Coroutine = “メソッド内部の途中で分割して実行できる”
# Actor = “メソッドを非同期に丸ごと実行するだけ（途中停止はない）”
# Actorは簡易マルチスレッドのように使える

slower := Object clone
faster := Object clone

slower start := method(wait(2); writeln("slower done"))
faster start := method(wait(1); writeln("faster done"))

"--順番に--" println
slower start; faster start

"--アクターを使って--" println
slower @@start; faster @@start; wait(3)