// loop
counter := 0
loop(
    "loop..." println
    counter = counter + 1
    if(counter >= 3, break)
)

// while
count := 0
while(count < 3,
    "while..." println
    count = count + 1
)

// for
for(i, 1, 3, 1,
    "for..." println
)

// fibonacci
fibonacci := method(n,
    if(n <= 1, return n)
    return fibonacci(n - 1) + fibonacci(n - 2)
)
fibonacci(10) println