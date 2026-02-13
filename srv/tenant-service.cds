
using { mall.saas as db } from '../db/schema';

service TenantService {

    @readonly
    entity Tenants       as projection on db.Tenants;

    entity Users         as projection on db.Users;

    
    entity Subscriptions as projection on db.Subscriptions
        actions {
            action buy(planName : String);
            action upgrade(newPlan : String);
            action cancel();
        };

}
