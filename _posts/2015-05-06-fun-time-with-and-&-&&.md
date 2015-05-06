---
layout: post
title: Fun with and/or vs &&/|| in Ruby
categories: technical
---

A fun little thing I just found out about dear Ruby.

The operators `and`, `or`, and `&&`, `||` might look like they are alias that have the exact behaviors. That is not entirely true, there's a tiny little difference between them: Operator precedence.

The `and` and `or` operators have a lower precedence than `&&` and `||`. Lets look at the examples:

`var1 = true and false`

`var2 = true && false`

They both should return `false` but guess what the values of `var1` and `var2` are? The value of `var1` is set to `true`, while the value of `var2` is `false`.

The reason behind this strange result is that the `and` operator has a lower precedence, which means that the `=` operator is being evaluated first. With that said, the first expression is actually telling Ruby to "set `var1` to `true`, then evaluates it against `false` with the `and` operator".

Now that `&&` operator has a higher precedence than `=`, so the second expression tells Ruby to "set `var2` to the returned value of the expression `true && false`"

However, if you change the first example to:

`var1 = (true and false)`

Both `var1` and `var2` will now equal to `false`.

That is all, for now.