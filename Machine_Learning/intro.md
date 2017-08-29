# supervised learning
클래스 레이블을 생성한다.

# 데이터 마이닝
데이터 마이닝은 unsupervised learning으로 불리고, 클래스 레이블을 생성하지 않고 패턴을 그루핑한다.

# 쿼리벡터 -> 피처벡터
예를 들어 40살, 여성, 매니지먼트라는 쿼리를 생성해서 리퀘스트를 하면 가장 가까운 데이터를 보여준다.

# 예제
어떤 사람의 키가 67인치라고 할때 이 사람이 여성인지 남성인지를 결정한다. 전체 사람중에 키가 67인치인 남성과 여성의 수를 센다. 67인 남성이 많으면 이 사람은 남성, 67인 여성이 많으면 이 사람은 여성일거라고 잠정적으로 결정할 수 있다.
확율적으로 나타내면, 남성일 확률: M/ F+M 이다.
int maleHist(h) : h는 키를 나타내며 이 키를 가진 남성의 수를 리턴한다. (*given* h, return the number of males) --> Mathematic notation : P(M|67)  ->  The final result that we are trying to calculate.
int femaleHist(h) : h는 키를 나타내며 이 키를 가진 여성의 수를 리턴한다.

# number of bins
의 의미? 데이터를 나눈 갯수.

#normalized 히스토그램
1로 노멀라이즈해서 표현할 수 있다.
float maleHist_n(h)
float femaleHist_n(h)

# PDF (Probability Density Function)
쪼갤수있는 항목이 무한대라고 하면mean과 standard deviation을 사용해서 그래프를 그릴 수 있다.
표준편차가 클수록 분포가 넓다. 같은 민이라도 표준편차에 따라 pdf가 다르다.
density는 probability와 같지않고, probability는 항목을 쪼갤때 산출할 수 있다.
density는 1을 초과할 수 있다.

#probability and 프리블런스?
프리블런스는 언컨디셔널 프로바빌리티이다.
