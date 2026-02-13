namespace mall.saas.types;

/* ===================================================== */
/*  TENANT STATUS                                      */
/* ===================================================== */
type TenantStatus : String(150) enum {
    Active      = 'ACTIVE';
    Inactive    = 'INACTIVE';
    Suspended   = 'SUSPENDED';
    PendingApproval = 'PENDING_APPROVAL';
}

/* ===================================================== */
/*  USER ROLES                                         */
/* ===================================================== */
type UserRole : String(80) enum {
    Admin       = 'ADMIN';
    Manager     = 'MANAGER';
    Staff       = 'STAFF';
    Viewer      = 'VIEWER';
}

/* ===================================================== */
/*  ASSET STATUS                                       */
/* ===================================================== */
type AssetStatus : String(40) enum {
    Active      = 'ACTIVE';
    Inactive    = 'INACTIVE';
    UnderMaintenance = 'UNDER_MAINTENANCE';
    Retired     = 'RETIRED';
    Damaged     = 'DAMAGED';
}

/* ===================================================== */
/*  SERVICE REQUEST STATUS                             */
/* ===================================================== */
type RequestStatus : String(40) enum {
    Open        = 'OPEN';
    InProgress  = 'IN_PROGRESS';
    Completed   = 'COMPLETED';
    Cancelled   = 'CANCELLED';
    OnHold      = 'ON_HOLD';
}

/* ===================================================== */
/*  INVOICE STATUS                                     */
/* ===================================================== */
type InvoiceStatus : String(40) enum {
    Draft       = 'DRAFT';
    Sent        = 'SENT';
    Paid        = 'PAID';
    Overdue     = 'OVERDUE';
    Cancelled   = 'CANCELLED';
}

/* ===================================================== */
/*  AUDIT ACTION TYPES                                 */
/* ===================================================== */
type AuditAction : String(100) enum {
    Created     = 'CREATED';
    Updated     = 'UPDATED';
    Deleted     = 'DELETED';
    StatusChanged = 'STATUS_CHANGED';
    Transferred = 'TRANSFERRED';
}