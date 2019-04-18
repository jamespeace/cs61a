test = {
  'name': 'repr_str',
  'points': 0,
  'suites': [
    {
      'cases': [
        {
          'code': r"""
          >>> print("hi")
          8f58112f9b6f3b582df45d024d3a6b11
          # locked
          >>> "hi"
          324464a4cfaa4c209a2306339b9e0bef
          # locked
          >>> print(repr("hi"))
          324464a4cfaa4c209a2306339b9e0bef
          # locked
          >>> repr("hi")
          2d334acf947338d1c0d765d80caea7b1
          # locked
          """,
          'hidden': False,
          'locked': True
        },
        {
          'code': r"""
          >>> class A:
          ...     def __init__(self, x):
          ...         self.x = x
          ...     def __repr__(self):
          ...         return self.x
          >>> class B(A):
          ...     def __str__(self):
          ...         return self.x + self.x
          >>> A("hi")
          8f58112f9b6f3b582df45d024d3a6b11
          # locked
          >>> print(A("hi"))
          8f58112f9b6f3b582df45d024d3a6b11
          # locked
          >>> B("hi")
          8f58112f9b6f3b582df45d024d3a6b11
          # locked
          >>> print(B("hi"))
          bd193fbdf936023aeab9b670df1da295
          # locked
          """,
          'hidden': False,
          'locked': True
        },
        {
          'code': r"""
          >>> class C:
          ...     def __str__(self):
          ...         print('hi')
          ...         return 'hihi'
          ...     def __repr__(self):
          ...         print('hihihi')
          ...         return 'hihihihi'
          >>> C()
          da90d5a8b22a8580274876a2f5d5c1fd
          cc133c468842b554aa02e8f01f53411f
          # locked
          >>> print(C())
          8f58112f9b6f3b582df45d024d3a6b11
          bd193fbdf936023aeab9b670df1da295
          # locked
          >>> q = str(C())
          8f58112f9b6f3b582df45d024d3a6b11
          # locked
          >>> q
          2d70288e5ccd63ab6c1764a3ca347fbc
          # locked
          >>> r = repr(C())
          da90d5a8b22a8580274876a2f5d5c1fd
          # locked
          >>> r
          3e72142409e95de3a26a8b5fa5cb7178
          # locked
          """,
          'hidden': False,
          'locked': True
        }
      ],
      'scored': False,
      'type': 'wwpp'
    }
  ]
}
