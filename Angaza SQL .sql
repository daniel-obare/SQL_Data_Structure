SELECT 
A.ID RECEIPT_ID
,C.ID ACC_ID
,CAST(C.[CREATED_WHEN]  AS date) CREATED_WHEN
,substring([NOMINAL_TERM], 13, 3) NORMINAL_TERM
,D.PRICE_UPFRONT
,D.PRICE_UNLOCK
,substring(DOWN_PAYMENT_PERIOD, 13, 1) DOWN_PAYMENT_PERIOD
,A.CURRENCY
,CAST(A.EFFECTIVE_WHEN  AS date) AS EFFECTIVE_DATE
,substring(A.[EFFECTIVE_WHEN], 12, 2) AS [HOUR]
,substring(A.[EFFECTIVE_WHEN], 15, 2) AS [MINUTE]
,A.AMOUNT
,F.UNIT_TYPE
,F.NAME PRODUCT_NAME
,G.NAME ORG_NAME
,G.TIER
FROM [Angaza Test].[dbo].[receipts] A
JOIN [Angaza Test].[dbo].[payments] B ON A.ID=B.RECEIPT_ID
JOIN [Angaza Test].[dbo].[accounts] C ON B.ACCOUNT_ID=C.ID
JOIN [Angaza Test].[dbo].[billings] D ON C.BILLING_ID=D.ID
JOIN [Angaza Test].[dbo].[groups] E ON C.GROUP_ID=E.ID
JOIN [Angaza Test].[dbo].[products] F ON E.PRODUCT_ID=F.ID
JOIN [Angaza Test].[dbo].[organizations] G ON G.ID=C.ORGANIZATION_ID