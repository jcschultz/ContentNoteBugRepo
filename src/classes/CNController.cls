public class CNController {
    
    /**
     * @description This method is called by the lightning GoToContentNote
     * controller method. It creates a case record, a content note record,
     * and a ContentDocumentLink record that relates the note to the case.
     * And it returns the id of the newly created content note.
     *
     * @return The new note record id.
     */
    @AuraEnabled
    public static String createNote() {
        // creating a case that the note will be related to.
        Case c = new Case();
        insert c;
        
        // generating a note title and content.
        String noteTitle = 'Testing ' + String.valueOf(Datetime.now());
        
        // create the note record.
        ContentNote newNote = new ContentNote(
            Title = noteTitle,
            Content = Blob.valueOf(noteTitle)
        );
        insert newNote;
        
        // link the note to the case.
        ContentDocumentLink newLink = new ContentDocumentLink(
            ContentDocumentId = newNote.Id,
            LinkedEntityId = c.Id,
            ShareType = 'I',
            Visibility = 'AllUsers'
        );
        insert newLink;
        
        // returning the note record id back to the lightning component.
        return newNote.Id;
    }
}