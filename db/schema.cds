namespace mall.saas;

using { cuid, managed } from '@sap/cds/common';
using { mall.saas.types as t } from './type';

/* ===================================================== */
/*  TENANTS (VENDORS) — MASTER DATA                    */
/* ===================================================== */
entity Tenants : cuid, managed {
    name        : String(120) @title: 'Vendor Name' @mandatory ;
    category    : String(200) @mandatory ;
    contactNo   : String(450) @mandatory;
    status      : t.TenantStatus;

    assets       : Composition of many Assets
                     on assets.tenant = $self;

    subscription : Association to Subscriptions;
}

/* ===================================================== */
/*  USERS — MASTER DATA                                */
/* ===================================================== */
entity Users : cuid, managed {
    fullName    : String(120) @title: 'User Name';
    email       : String(120);
    role        : t.UserRole;

    tenant      : Association to Tenants;
}

/* ===================================================== */
/* ASSET TYPES — MASTER DATA                          */
/* ===================================================== */
entity AssetTypes : cuid {
    name        : String(100) @title: 'Asset Type';
    description : String(255);
}

/* ===================================================== */
/*  LOCATIONS — MASTER DATA                            */
/* ===================================================== */
entity Locations : cuid {
    name        : String(120) @title: 'Location Name';
    floor       : String(40);
    description : String(255);
}

/* ===================================================== */
/*  SUBSCRIPTIONS — TRANSACTIONAL DATA                 */
/* ===================================================== */
entity Subscriptions : cuid, managed {
    planName    : String(80) @title: 'Subscription Plan';
    assetLimit  : Integer;
    expiryDate  : Date;

    tenant      : Association to Tenants;
}

/* ===================================================== 
        ASSETS — TRANSACTIONAL DATA                        
===================================================== */
entity Assets : cuid, managed {
    assetName   : String(150) @title: 'Asset Name';
    serialNo    : String(100);
    status      : t.AssetStatus;
    value       : Decimal(12,2);

    tenant      : Association to Tenants;
    assetType   : Association to AssetTypes;
    location    : Association to Locations;

    logs        : Composition of many AuditLogs
                     on logs.asset = $self;
}

/* ===================================================== 
  AUDIT LOGS — TRANSACTIONAL (ITEM LEVEL)            
 ===================================================== */
entity AuditLogs : cuid {
    action      : t.AuditAction;
    changedBy   : String(120);
    changedAt   : Timestamp;

    asset       : Association to Assets;
}

/* ===================================================== *
  SERVICE REQUESTS — HEADER (TRANSACTIONAL)          
 ===================================================== */
entity ServiceRequests : cuid, managed {
    requestNo    : String(50);
    requestDate  : Date;
    status       : t.RequestStatus;

    tenant       : Association to Tenants;

    items        : Composition of many ServiceItems
                     on items.request = $self;
}

/* ===================================================== 
  SERVICE ITEMS — ITEM (TRANSACTIONAL)               
/* ===================================================== */
entity ServiceItems : cuid, managed {
    description  : String(255);
    cost         : Decimal(10,2);

    asset        : Association to Assets;
    request      : Association to ServiceRequests;
}

/* ===================================================== 
    INVOICES — TRANSACTIONAL (HEADER)                  
/* ===================================================== */
entity Invoices : cuid, managed {
    invoiceNo   : String(50);
    invoiceDate : Date;
    totalAmount : Decimal(12,2);
    status      : t.InvoiceStatus;

    request     : Association to ServiceRequests;
    tenant      : Association to Tenants;
}