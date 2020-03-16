/**
 * Created by michael.norton on 2019-06-27.
 * Structural class used for deserialization
 */

public with sharing class WorkOrder {

    public WorkOrder workOrder;

    public String identifier;
    public String status;
    public String lastupdatedate;
    public String customerid;
    public List<LineItem> lineitems;
    public String estimatedcompletiondate;

    public class LineItem {
        public Long quantity;
        public String description;
    }

}