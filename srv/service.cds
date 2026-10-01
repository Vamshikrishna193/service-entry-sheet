using { db } from '../db/schema';

@path: 'service-entry-sheets'
service ServiceEntrySheetService {

    @odata.draft.enabled
    entity ServiceEntrySheets
        as projection on db.ServiceEntrySheets
        actions {
            action submit();
            action approve();
            action reject(
                comments : String(500)
            );
            action cancel();
            action resubmit();
        };

    entity ServiceEntrySheetItems
        as projection on db.ServiceEntrySheetItems;

    entity Notifications
        as projection on db.Notifications;

    entity StatusHistory
        as projection on db.StatusHistory;
}