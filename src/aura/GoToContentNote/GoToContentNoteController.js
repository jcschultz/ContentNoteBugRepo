({
    // this lightning controller method is called when the button is clicked.
    doNoteCreation : function(component, event, helper) {
        // createNote is the apex controller method that will be called.
        var action = component.get('c.createNote');
        
        action.setCallback(this, function(response){
            // after the apex controller method returns a ContentNote record id,
            // we navigate to it using the standard lightning event force:navigateToSObject.
            var newNoteEvent = $A.get('e.force:navigateToSObject');
            
            // here we're supplying the event with the record id of the newly created note.
            newNoteEvent.setParams({
                recordId : response.getReturnValue()
            });
            
            newNoteEvent.fire();
        });
        
        $A.enqueueAction(action);
    },
})