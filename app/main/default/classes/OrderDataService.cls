
public with sharing class OrderDataService {

    public static String queryWorkOrderStatus( String workOrderId ) {
        String workOrderStatus = '';

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint( 'callout:MuleSoft_Work_Orders/workorders/' + workOrderId );
        request.setMethod( 'POST' );
        System.debug( 'Sending POST Request' );
        HttpResponse response = http.send( request );
        // If the request is successful, parse the JSON response.
        if ( response.getStatusCode() == 200 ) {
            System.debug( 'Body [' + response.getBody() + ']' );

            try {
                WorkOrder workOrder = ( WorkOrder ) JSON.deserialize( response.getBody(), WorkOrder.class );
                workOrderStatus = workOrder.status;
            } catch ( Exception e ) {
                System.debug( 'try again buddy ' + e.getMessage() );
            }
        } else {
            System.debug( 'Received response [' + response.getStatusCode() + ']' );
        }
        return workOrderStatus;
    }

    @AuraEnabled(cacheable=false)
    public static List<Work_Order__c> queryWorkOrdersByCustomer( String searchKey ) {
        System.debug( 'Searching for customer id ' + searchKey );
        List<Work_Order__c> workOrders = new List<Work_Order__c>();

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        // TODO: Have another service that returns work order collection
        request.setEndpoint( 'callout:MuleSoft_Work_Orders/customerworkorders/' + searchKey );
        request.setMethod( 'POST' );
        System.debug( 'Sending POST Request' );
        HttpResponse response = http.send( request );
        // If the request is successful, parse the JSON response.
        if ( response.getStatusCode() == 200 ) {
            System.debug( 'Body [' + response.getBody() + ']' );

            try {
                List<WorkOrder> queriedWorkOrders = ( List<WorkOrder> ) JSON.deserialize( response.getBody(), List<WorkOrder>.class );
                for ( WorkOrder workOrder : queriedWorkOrders ) {
                    workOrders.add( new Work_Order__c( Name = workOrder.identifier, Status__c = workOrder.status, Customer_Id__c = workOrder.customerid, Last_Update_Date__c = workOrder.lastupdatedate, Estimated_Completion_Date__c = workOrder.estimatedcompletiondate ) );
                }
            } catch ( Exception e ) {
                System.debug( 'try again buddy ' + e.getMessage() );
            }
        } else {
            System.debug( 'Received response [' + response.getStatusCode() + ']' );
        }

        return workOrders;
    }
}

