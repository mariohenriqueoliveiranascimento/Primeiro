
--Split Cash
SELECT * FROM MessageSource WHERE MessageIdentifier = '9553E7E2-AD02-4448-9E90-AA6831D62BF6'

SELECT * FROM MessageSource WHERE MessageSourceId = 'D9A6A2E7-F19C-4766-8AA1-C3CC9F22EF57'

--larissa

SELECT * FROM Message 
WHERE MessageSourceId 
IN (SELECT MessageSourceId FROM MessageSource WHERE MessageIdentifier IN ('1CA52AAD-82A3-4D55-926C-1A6F3CF11841','E38A7078-79BB-47DC-B9CB-B6ECDE05C6C0'))

SELECT * FROM MessageSource WHERE MessageSourceId IN ('3A0B32D6-710D-45C6-BB79-5705619F1355','CB9903C8-35CF-42C7-8F17-9F419B213FBC')
----------------------------------------
--Atila
--retail
SELECT * FROM Message 
WHERE MessageSourceId 
IN (SELECT MessageSourceId FROM MessageSource WHERE MessageIdentifier IN ('FA2ADFEA-1B7D-42E4-A93E-538AAF1C21F5'))
ORDER BY UpdateDate DESC

--fatura
SELECT * FROM Message 
WHERE MessageSourceId 
IN (SELECT MessageSourceId FROM MessageSource WHERE MessageIdentifier IN ('FA2ADFEA-1B7D-42E4-A93E-538AAF1C21F5'))
ORDER BY UpdateDate DESC


--fatura nova
SELECT * FROM Message 
WHERE MessageSourceId 
IN (SELECT MessageSourceId FROM MessageSource WHERE MessageIdentifier IN ('A7CC2FAF-5033-4E9E-B36D-9D3FFE709D3B'))
ORDER BY UpdateDate DESC




SELECT * FROM Message where ProtheusMessageIdentifier in ('4535b6e9-45aa-4adc-bd05-ff6acc6eccaf')

--teste transfer
SELECT * FROM MessageSource WHERE MessageSourceId = '72EFABD5-734F-4B25-A4AF-30FF628CF31F'


--teste transf cash

SELECT * FROM Message WHERE MessageId IN( 'DAAB2139-7F78-4B7A-AD89-3AC154C02EFE')

SELECT * FROM IdentifierMapping WHERE PMSIdentifier = '294069'

 

UPDATE Message SET CurrentStatusId = 1 WHERE MessageId = '78A939F7-8CEF-4BB3-AEC7-9064792187A5'

------





SELECT * FROM IdentifierMapping WHERE PMSIdentifier = '412574'
SELECT * FROM OperationType

SELECT * FROM IdentifierMapping WHERE PMSIdentifier ='412619'

UPDATE Message SET CurrentStatusId = 1 WHERE MessageId IN ('4396FB2D-F752-4128-9926-0CBAC89E2B2C','61D79318-5F5C-4737-937F-226AB7BC6F7A')
SELECT * FROM MessageDependencies 


SELECT T.IdentifierMappingTypeId





SELECT * FROM IdentifierMappingType

SELECT * FROM Status


INSERT INTO OperationType VALUES (29, 'AdjustmentF100')


UPDATE MessageSource SET CurrentStatusId = 11 WHERE CurrentStatusId = 10