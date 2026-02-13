using { mall.saas as db } from '../db/schema';

service OperationsService {

    entity ServiceRequests as projection on db.ServiceRequests;
    entity ServiceItems    as projection on db.ServiceItems;
    entity Invoices        as projection on db.Invoices;

}
