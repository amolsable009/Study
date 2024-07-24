
DocusignHelper.DocusignDetail docusignDetail = new DocusignHelper.DocusignDetail();
docusignDetail.recordId = 'a0BVA000000ev7d2AA';
docusignDetail.flow = 'Finance Agreement';

DocusignHelper.DocusignRecipient docusignRecipient = new DocusignHelper.DocusignRecipient();
docusignRecipient.type = 'Signer';
docusignRecipient.email = 'shubhangi.sable007@gmail.com';
docusignRecipient.name = 'Tom';
docusignRecipient.phone = '+91 8605760352';
docusignRecipient.role = 'Insured';
docusignRecipient.sequence = 1;
docusignRecipient.routingOrder = 1;

DocusignHelper.DocusignRecipient docusignRecipient2 = new DocusignHelper.DocusignRecipient();
docusignRecipient2.type = 'Signer';
docusignRecipient2.email = 'amolsable1208@gmail.com';
docusignRecipient2.name = 'Jenny';
docusignRecipient2.phone = '+91 9960149269';
docusignRecipient2.role = 'Guarantor';
docusignRecipient2.sequence = 2;
docusignRecipient2.routingOrder = 2;

DocusignHelper.DocusignRecipient docusignRecipient3 = new DocusignHelper.DocusignRecipient();
docusignRecipient3.type = 'Signer';
docusignRecipient3.email = 'amolsable2011@gmail.com';
docusignRecipient3.name = 'Chris';
docusignRecipient2.phone = '+91 9960149269';
docusignRecipient3.role = 'Producer';
docusignRecipient3.sequence = 3;
docusignRecipient3.routingOrder = 3;



docusignDetail.docusignRecipients = new List<DocusignHelper.DocusignRecipient>{docusignRecipient2,/*docusignRecipient3,*/docusignRecipient};
//DocusignHelper.sendEnvelopeMethod(docusignDetail,1);
map<string,Object> responseMap = DocusignHelper.initiateEmbeddedSigningSession(docusignDetail,1);
System.debug('enevelopDocuSignId--->'+string.valueOf(responseMap.get('enevelopDocuSignId')));



map<string,Object> responseMap = DocusignHelper.initiateInPersonSigningSession(docusignDetail,1);
System.debug('envelopeId--->'+string.valueOf(responseMap.get('enevelopId')));

DocusignHelper.EnevelopeDetail EnevelopeDetail = new DocusignHelper.EnevelopeDetail();
enevelopeDetail.envelopeDocusignId = 'ecc369a4-b6cf-411f-962b-ba5f1f182159';
enevelopeDetail.redirectUrl = 'https://strandfinance--full.sandbox.lightning.force.com/lightning/r/Finance_Agreement__c/a0BVA000000ev7d2AA/view';

string embeddedUrl = DocusignHelper.getEmbeddedSigningUrl(EnevelopeDetail);
system.debug('embeddedUrl--->'+embeddedUrl);

//DocusignHelper.sendEnvelopeMethod(docusignDetail,1);


DocusignHelper.sendEnvelopeMethod(docusignDetail);

DocusignHelper.sendWithInPerson(docusignDetail);


// Emebedded code with routing 
 
URL singningUrl = dfsle.SigningService.getSigningUrl(docusignEnvelope, new URL('https://strandfinance--full.sandbox.lightning.force.com/lightning/r/Finance_Agreement__c/a0BVA000000ev7d2AA/view'), false);
system.debug('singningUrl--->'+singningUrl);




Boolean shouldSign = dfsle.SigningService.shouldSignNow(docusignEnvelope);
system.debug('shouldSign--->'+shouldSign);
Url signUrl = dfsle.SigningService.getSigningUrl(docusignEnvelope, new Url('https://strandfinance--full.sandbox.lightning.force.com/lightning/r/Finance_Agreement__c/a0BVA000000ev7d2AA/view'), false);
System.debug('signUrl--->'+signUrl.toExternalForm());
dfsle.Recipient recipient1 = dfsle.Recipient.newEmbeddedSigner();
recipient1.withRole('Insured');
recipient1.withRoutingOrder(3);

docusignEnvelope = docusignEnvelope.withRecipients(new List<dfsle.Recipient> {
    recipient1
});

dfsle.EnvelopeService.sendEnvelope(
    docusignEnvelope, // The envelope to send
    true // Send now?
);


string password = MobileAppControllerV2.getFormedPassword('KevOW7MN7k%2F9kdmMdwuDbCs6f%2B9kc5f7V5U%2FZeK49jk%3D');
system.debug('password--->'+password);

List<Finance_Agreement__c> faLt = [Select id from Finance_Agreement__c WHERE DueDate__c = :system.today()];
system.debug('faLt--->'+faLt);
Database.executeBatch(new SMSPaymentBatch());


