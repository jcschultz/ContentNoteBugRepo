public class CNController {
	
    @AuraEnabled
    public static String createNote() {
        Case c = new Case();
        insert c;
        
        String noteTitle = 'Testing ' + String.valueOf(Datetime.now());
        
        // create the note record.
        ContentNote newNote = new ContentNote(
            Title = noteTitle,
            Content = Blob.valueOf(noteTitle)
        );
        insert newNote;
        
        // link the note to the related object.
        ContentDocumentLink newLink = new ContentDocumentLink(
            ContentDocumentId = newNote.Id,
            LinkedEntityId = c.Id,
            ShareType = 'I',
            Visibility = 'AllUsers'
        );
        insert newLink;
        
        return newNote.Id;
    }
}