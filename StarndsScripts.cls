
DocusignHelper.DocusingDetail docusingDetail = new DocusignHelper.DocusingDetail();
docusingDetail.recordId = 'a0BVA000000ev7d2AA';
docusingDetail.templateId = '295dea30-596b-4ae2-a219-83cb1198ff86';
docusingDetail.templateName = 'Amol Test';

DocusignHelper.DocusignRecipient docusignRecipient = new DocusignHelper.DocusignRecipient();
docusingDetail.type = 'inPersonSigner';
docusingDetail.email = 'amolsable2011@gmail.com';
docusingDetail.name = 'Amol Sable';
docusingDetail.phone = '+919960149269';
docusingDetail.role = 'Customer';
docusingDetail.sequence = 1;
docusingDetail.routingOrder = 1;

docusingDetail.docusignRecipients = new List<DocusignHelper.DocusignRecipient>{docusignRecipient};

DocusignHelper.sendEnvelopeMethod(docusingDetail);

DocusignHelper.sendWithInPerson(docusingDetail);