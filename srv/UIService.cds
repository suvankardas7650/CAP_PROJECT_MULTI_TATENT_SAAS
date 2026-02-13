using { mall.saas as dd } from '../db/schema';
service UIService {
  @odata.draft.enabled
  entity Assets as projection on dd.Assets;

  entity Tenants         as projection on dd.Tenants;
  
}
