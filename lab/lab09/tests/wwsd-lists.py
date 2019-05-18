test = {
  'name': 'What Would Scheme Print?',
  'points': 1,
  'suites': [
    {
      'cases': [
        {
          'code': r"""
          scm> (cons 1 (cons 2 nil))
          437da7fcde2856663fa0002aab0f0b14
          # locked
          """,
          'hidden': False,
          'locked': True
        },
        {
          'code': r"""
          scm> (car (cons 1 (cons 2 nil)))
          d912fc844d1dbaeea8a84b3ec8b315bc
          # locked
          """,
          'hidden': False,
          'locked': True
        },
        {
          'code': r"""
          scm> (cdr (cons 1 (cons 2 nil)))
          4c4505b119f53fac68e1f7117354f1e1
          # locked
          """,
          'hidden': False,
          'locked': True
        },
        {
          'code': r"""
          scm> (list 1 2 3)
          7585771ecc8eac10b0735a645ecb8a79
          # locked
          """,
          'hidden': False,
          'locked': True
        },
        {
          'code': r"""
          scm> '(1 2 3)
          7585771ecc8eac10b0735a645ecb8a79
          # locked
          """,
          'hidden': False,
          'locked': True
        },
        {
          'code': r"""
          scm> (cons 1 '(list 2 3))  ; Recall quoting
          826da030368e185a23a1a70897995e88
          # locked
          """,
          'hidden': False,
          'locked': True
        }
      ],
      'scored': True,
      'setup': r"""
      
      """,
      'teardown': '',
      'type': 'scheme'
    },
    {
      'cases': [
        {
          'code': r"""
          scm> '(cons 4 (cons (cons 6 8) ()))
          6117e327e7d53413652889593b49dd33
          # locked
          """,
          'hidden': False,
          'locked': True
        }
      ],
      'scored': True,
      'setup': r"""
      
      """,
      'teardown': '',
      'type': 'scheme'
    }
  ]
}
