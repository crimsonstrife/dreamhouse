trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> toProcess = null;
    // if stage is closed won
 if (Trigger.isAfter) {
  for (Opportunity opportunity : Trigger.new) {
   if (opportunity.StageName == 'Closed Won') {
    // create task associated to the opportunity
    Task task = new Task();
    task.Subject = 'Follow Up Test Task';
    task.WhatId = opportunity.Id;

    // add task to the database using list to bulkify
    if (toProcess == null) {
     toProcess = new List<Task>();
        toProcess.add(task);
    } else {
        toProcess.add(task);
    }
   }
  }
      // insert tasks
      if (toProcess != null) {
        insert toProcess;
       }
 }
}