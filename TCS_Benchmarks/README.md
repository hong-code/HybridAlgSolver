# Benchmarks

We use two benchmarks for evaluation:

The **SMT** benchmark is selected from [ZaligVinder](https://onlinelibrary.wiley.com/doi/full/10.1002/smr.2400), [Z3seq](https://dl.acm.org/doi/abs/10.1145/3453483.3454066), and [Z3str3RE](https://www.sciencedirect.com/science/article/abs/pii/S030439752200723X), which involve either multiple regular expression constraints on the same string or explicit regular expression intersection constraints. The instances (i.e., problems) with assertions in the form of `(not (str.in.re X _))` are not included, since those problems are outside the scope of this paper[^1]. **SMT** is composed of 3,290 unique problems, with 36 satisfiable problems and 3,254 unsatisfiable problems. We also use another benchmark originated from a practical application:

The **ReDoS** benchmark is generated from [ReDoSHunter](https://www.usenix.org/conference/usenixsecurity21/presentation/li-yeting), which checks regular expression intersection non-emptiness using the [Brics automata library](https://www.brics.dk/automaton/) to identify whether a regular expression is ReDoS vulnerable and generate a witness of the intersection. We hijack the input of the Brics automata library during vulnerability detection and translate the regular expression intersection queries into SMT-LIB format. 

**ReDoS** is obtained by performing ReDoS detection using ReDoSHunter on the [RegexLib](https://regexlib.com) and [Snort](https://www.snort.org) datasets. **ReDoS** is composed of 6,662 unique problems, with 6,593 satisfiable and 69 unsatisfiable. Notice that since the support for Unicode encoding of the baselines is incomplete, the Unicode range is restricted to U+00–U+FF.

[^1]: Though regular expressions with negation (i.e., extended regular expressions) denote [regular languages](https://link.springer.com/book/10.1007/978-3-642-59136-5), negation is not a part of the regular expressions.

