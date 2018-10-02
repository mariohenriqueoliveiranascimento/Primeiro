
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
--WHERE S.statusid = '10'
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
--where M.MessageId IN ('6A7C6A20-0D67-49E2-AB47-DF8E6C5D1D97') 
--WHERE t.Description IN ('Retail Sales')
--WHERE t.Description IN ('Debit Card Entry') 
order by m.UpdateDate DESC




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
--WHERE MD.MessageId IN ('77A8FABE-9C47-44D3-B48F-6B640BE53B0B')
--WHERE MD.MessageId = 'AF000BBC-01FD-4AC7-B3AC-017825B91169'
--WHERE MD.Identifier = '294042'
--where im.IdentifierMappingTypeId=2
and MD.Json is NOT null
ORDER BY IM.CreationDate  DESC





SELECT  MD.MessageDependenciesId, MD.JSON FROM [MessageDependencies] MD 
INNER JOIN Message M ON M.MessageId = MD.MessageId 
INNER JOIN MessageSource MS ON MS.MessageSourceId = M.MessageSourceId 
INNER JOIN Property P ON P.PropertyId = MS.PropertyId 
WHERE P.CNPJ = '82373077000171' AND P.ModuleId = 25 AND P.CompanyId = 02 
AND MD.JSON IS NOT NULL AND datalength(MD.JSON) > 0 
AND (MD.CurrentStatusId = 0 OR MD.CurrentStatusId = 20) 
AND MD.MessageDependencieTypeId = 1 
