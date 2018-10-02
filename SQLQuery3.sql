--delete from IdentifierMapping
--delete from MessageDependencies
--delete from Message
--delete from MessageSource 
--delete from MessageHistory

--SELECT * FROM Message WHERE MessageId = 'F8D1C412-853E-47C2-9A60-B8A027701329'

--UPDATE Message SET CurrentStatusId = 1 WHERE MessageId = 'EE28D860-A25A-4E2E-A64A-FB84BD4FE9B7'

SELECT * FROM [dbo].[MessageDependencies]



SELECT 
 M.ProtheusMessageIdentifier as UUID_ATLAS,
 T.Description AS TIPO_MENSAGEM, 
 S.Description AS STATUS_PROCESSAMENTO, 
 IM.PMSIdentifier AS ID,
 IM.ProtheusIdentifier AS ID_PROTHEUS,
 M.MessageId,
 M.JsonSent,
 M.JsonReturned,m.UpdateDate,
 M.MessageSourceId
FROM Message M
join messagesource ms
on m.MessageSourceId = ms.MessageSourceId
INNER JOIN Status S ON S.StatusId=M.CurrentStatusId
INNER JOIN IdentifierMapping IM ON IM.MessageId = M.MessageId
INNER JOIN IdentifierMappingType T ON T.IdentifierMappingTypeId = IM.IdentifierMappingTypeId
where ms.messageidentifier in ('A7CC2FAF-5033-4E9E-B36D-9D3FFE709D3B')





SELECT * FROM [dbo].[MessageDependencies]


SELECT MD.MessageId, M.CurrentStatusId, MS.MessageIdentifier, MD.Identifier
FROM MessageDependencies MD
INNER JOIN  Message M ON M.MessageId = MD.MessageId
INNER JOIN MessageSource MS ON MS.MessageSourceId = M.MessageSourceId
WHERE Identifier =( SELECT TOP 1 IM.PMSIdentifier
FROM IdentifierMapping IM
INNER JOIN Message M ON M.MessageId = IM.MessageId
INNER JOIN MessageSource MS ON MS.MessageSourceId = m.MessageSourceId
INNER JOIN Property P ON P.PropertyId = MS.PropertyId
WHERE IM.PMSIdentifier = '414098' AND P.CNPJ = '82373077000171' ORDER BY IM.CreationDate DESC )            
AND MessageDependencieTypeId = 1 
AND M.CurrentStatusId <> 3 AND M.CurrentStatusId <> 7 AND M.CurrentStatusId <> 8
GROUP BY MD.MessageId, M.CurrentStatusId, MS.MessageIdentifier, MD.Identifier



select MessageId, Identifier, count(*)
from MessageDependencies
group by MessageId, Identifier
having count(*) > 1