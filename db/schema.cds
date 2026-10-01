namespace db;
using { cuid, managed } from '@sap/cds/common';


entity ServiceEntrySheets : cuid, managed {

    sesNumber           : String(20);
    poNumber            : String(20);
    vendorId            : String(50);
    vendorName          : String(100);
    serviceReceiver     : String(100);
    department          : String(100);
    servicePeriodFrom   : Date;
    servicePeriodTo     : Date;
    currency            : String(3);
    netAmount           : Decimal(15,2);
    taxAmount           : Decimal(15,2);
    grossAmount         : Decimal(15,2);
    status              : String(20) default 'Draft';
    description         : String(500);
    items               : Composition of many ServiceEntrySheetItems
                            on items.parent = $self;
};



entity ServiceEntrySheetItems : cuid {

    parent                  : Association to ServiceEntrySheets;
    poItemNumber            : String(10);
    serviceCode             : String(50);
    serviceDescription      : String(500);
    orderedQuantity         : Decimal(15,3);
    previouslyAcceptedQty   : Decimal(15,3);
    pendingQuantity         : Decimal(15,3);
    remainingQuantity       : Decimal(15,3);
    serviceEntryQuantity    : Decimal(15,3);
    unit                    : String(20);
    unitPrice               : Decimal(15,2);
    netAmount               : Decimal(15,2);
    taxAmount               : Decimal(15,2);
    grossAmount             : Decimal(15,2);
};


entity Notifications : cuid, managed {

    sesNumber           : String(20);
    recipient           : String(100);
    notificationType    : String(50);
    message             : String(500);
    readStatus          : Boolean default false;
};


entity StatusHistory : cuid, managed {

    sesNumber       : String(20);
    oldStatus       : String(20);
    newStatus       : String(20);
    user            : String(100);
    timestamp       : Timestamp;
    comments        : String(500);
};