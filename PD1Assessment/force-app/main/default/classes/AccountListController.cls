public class AccountListController {
    public String accid{get; set;}

    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Name, BillingStreet, Industry, AnnualRevenue, NumberOfEmployees, Description FROM Account]));
            }
            return setCon;
        }
        set;
    }

    public List<Account> getAccounts() {
        return (List<Account>) setCon.getRecords();
    }

    public pagereference GoToDetail() {
        PageReference pg = new PageReference('/apex/ServiceVendorAccountDetail');
        pg.getParameters().put('id', accid);
        return pg;
    }

    public pagereference GoToLightningPage()
    {
        PageReference cancel = setCon.cancel();
        return cancel;
    }
}
