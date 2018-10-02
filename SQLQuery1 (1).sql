
--MESSAGE SOURCE
SELECT 
O.Description AS TIPO_MENSAGEM,
S.Description STATUS_PROCESSAMENTO, 
MS.MessageSourceId,
MS.Json, MS.CreationDate  
FROM MessageSource MS
INNER JOIN Status S ON S.StatusId=MS.CurrentStatusId
INNER JOIN OperationType O ON O.OperationTypeId = MS.OperationTypeId
--WHERE O.Description = 'Credit Card Entry'
order by MS.CreationDate DESC



--MESSAGE
SELECT 
 T.Description AS TIPO_MENSAGEM, 
 S.Description AS STATUS_PROCESSAMENTO, 
 IM.PMSIdentifier AS ID,
 IM.ProtheusIdentifier AS ID_PROTHEUS,
 M.ProtheusMessageIdentifier as UUID_ATLAS,
 M.MessageId,
 M.JsonSent,
 M.JsonReturned,m.UpdateDate,
 M.MessageSourceId
FROM Message M
INNER JOIN Status S ON S.StatusId=M.CurrentStatusId
INNER JOIN IdentifierMapping IM ON IM.MessageId = M.MessageId
INNER JOIN IdentifierMappingType T ON T.IdentifierMappingTypeId = IM.IdentifierMappingTypeId
--WHERE T.Description in ('Credit Card Transfer','Debit Card Transfer','Cash Transfer')
--where M.MessageId IN ('6CF94924-B5D6-48F8-ABF5-E8C59BB6A2A9','5B891D80-C46C-4675-A465-6EDE89719461') 
--WHERE t.Description IN ('Retail Sales')
--WHERE t.Description IN ('Debit Card Entry') 
order by m.UpdateDate DESC

--SELECT * FROM IdentifierMapping WHERE MessageId = 'ABA5830B-E2E1-4803-B7CB-F3B7E826EA96'

--SELECT * FROM IdentifierMapping WHERE PMSIdentifier IN ('294243')

--SELECT * FROM Message

----MESSAGEDEPENDENCIE
SELECT t.IdentifierMappingTypeId,
MD.CreateDate,
md.UpdateDate,
 T.Description as TIPO_MENSAGEM,
 DT.Description as ORIGEM_DEPENDENCIA,
 S.Description as STATUS_DEPENDENCIA, 
 IM.PMSIdentifier AS ID,
 MD.Identifier AS DEPENDENCIA,
 MD.Json, 
 MD.MessageId
FROM MessageDependencies MD
INNER JOIN IdentifierMappingType T ON T.IdentifierMappingTypeId = MD.IdentifierMappingTypeId
INNER JOIN MessageDependencieType DT on DT.MessageDependencieTypeId = MD.MessageDependencieTypeId
INNER JOIN IdentifierMapping IM ON IM.MessageId = MD.MessageId
LEFT JOIN Status S ON S.StatusId=MD.CurrentStatusId
WHERE MD.MessageId IN ('D04DDB03-F07D-47B2-91BB-F43BAB9C6F8F')
--WHERE MD.MessageId = 'AF000BBC-01FD-4AC7-B3AC-017825B91169'
--WHERE MD.Identifier = '294042'
--where im.IdentifierMappingTypeId=2
and MD.Json is NOT null
ORDER BY IM.CreationDate  DESC


--SELECT * FROM IdentifierMapping WHERE PMSIdentifier = '413885'
----UPDATE Property SET IPProtheus = '191.234.181.217' WHERE PropertyId = '6AB1DFEA-F5FC-4FBA-8824-98F6B00A471D'

SELECT * FROM IdentifierMappingType

--SELECT * FROM Property

