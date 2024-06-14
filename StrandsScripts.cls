
DocusignHelper.DocusignDetail docusignDetail = new DocusignHelper.DocusignDetail();
docusignDetail.recordId = 'a0BVA000000ev7d2AA';
docusignDetail.templateId = '295dea30-596b-4ae2-a219-83cb1198ff86';
docusignDetail.templateName = 'Amol Test';

DocusignHelper.DocusignRecipient docusignRecipient = new DocusignHelper.DocusignRecipient();
docusignDetail.type = 'inPersonSigner';
docusignDetail.email = 'amolsable2011@gmail.com';
docusignDetail.name = 'Amol Sable';
docusignDetail.phone = '+919960149269';
docusignDetail.role = 'Customer';
docusignDetail.sequence = 1;
docusignDetail.routingOrder = 1;

docusignDetail.docusignRecipients = new List<DocusignHelper.DocusignRecipient>{docusignRecipient};

DocusignHelper.sendEnvelopeMethod(docusignDetail);

DocusignHelper.sendWithInPerson(docusignDetail);


string password = MobileAppControllerV2.getFormedPassword('CMkUW6CNIvlqN4iriNPuzL87yZZVPjBObW0x%2FHCM6lg%3D');
system.debug('password--->'+password);