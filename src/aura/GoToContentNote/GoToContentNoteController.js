({
	doNoteCreation : function(component, event, helper) {
		var action = component.get('c.createNote');
        
        action.setCallback(this, function(response){
            var newNoteEvent = $A.get('e.force:navigateToSObject');
            
            newNoteEvent.setParams({
                recordId : response.getReturnValue()
            });
            
            newNoteEvent.fire();
        });
        
        $A.enqueueAction(action);
	},
})