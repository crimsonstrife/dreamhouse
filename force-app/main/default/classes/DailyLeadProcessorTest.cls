    //test class
    @isTest
    public class DailyLeadProcessorTest {
        //In the test class, insert 200 Lead records, schedule the DailyLeadProcessor class to run and test that all Lead records were updated correctly
        @isTest
        public static void DailyLeadProcessorTest() {
            List<Lead> leads = new List<Lead>();
            for (Integer i = 0; i < 200; i++) {
                Lead l = new Lead(LastName = 'Test' + i);
                //add required company name
                l.Company = 'Test' + i;
                leads.add(l);
            }
            insert leads;
            Test.startTest();
            String jobId = System.schedule('DailyLeadProcessorTest', '0 0 23 * * ?', new DailyLeadProcessor());
            Test.stopTest();
            List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
            System.assertEquals(200, updatedLeads.size());
        }
    }