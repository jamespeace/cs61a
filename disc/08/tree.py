#########
# Trees #
#########

class Tree:
    def __init__(self, entry, branches=[]) -> None:
        self.entry = entry
        for branch in branches:
            assert isinstance(branch, Tree)
        self.branches = list(branches)
    
    def is_leaf(self):
        return not self.branches

def leaves(tree):
    "The leaf values in a tree."
    if tree.is_leaf():
        return tree.entry
    else:
        return sum([leaves(b) for b in tree.branches], [])

# Question
# Expression Trees

def eval_with_add(t):
    """ Evaluate an expression tree of * and + using only addition.

    >>> plus = Tree('+', [Tree(2), Tree(3)])
    >>> eval_with_add(plus)
    5
    >>> times = Tree('*', [Tree(2), Tree(3)])
    >>> eval_with_add(times)
    6
    >>> deep = Tree('*', [Tree(2), plus, times])
    >>> eval_with_add(deep)
    60
    >>> eval_with_add(Tree('*'))
    1
    """
    if t.entry == '+':
        return sum([leaves(b) for b in t.branches])
    elif t.entry == '*':
        total = 1
        for b in t.branches:
            total, term = 0, total
            for _ in range(eval_with_add(b)):
                total = total + term
        return total
    else:
        return t.entry
