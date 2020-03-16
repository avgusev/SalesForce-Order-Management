/**
 * Created by michael.norton on 2019-06-27.
 */

public with sharing class MuleSoftProductQuery {

    public static HttpResponse getProductInfo() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String productId = '12345';
        request.setEndpoint( 'https://anypoint.mulesoft.com/mocking/api/v1/links/a1b9aeed-cef6-40a1-85c4-70ce95e25fc9/products/' + productId);
        request.setMethod( 'GET' );
        System.debug( 'Sending GET Request');
        HttpResponse response = http.send( request );
        // If the request is successful, parse the JSON response.
        if ( response.getStatusCode() == 200 ) {
            System.debug( 'Body [' + response.getBody() + ']');
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = ( Map<String, Object> ) JSON.deserializeUntyped( response.getBody() );

            try {
                MuleProduct muleProduct = (MuleProduct)JSON.deserialize( response.getBody(), MuleProduct.class);
                System.debug( 'Mule Brand is ' + muleProduct.brand);
                System.debug( 'Identifier is ' + muleProduct.identifier);
                System.debug( 'Model is ' + muleProduct.model);
                System.debug( 'Description is ' + muleProduct.description);
                System.debug( 'Rating is ' + muleProduct.rating);
            } catch ( Exception e) {
                System.debug( 'try again buddy ' + e.getMessage());
            }
        } else {
            System.debug( 'Received response [' + response.getStatusCode() + ']');
        }
        return response;
    }

    public static HttpResponse getProductInfoWithNamedCredentials() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String productId = '12345';
        request.setEndpoint('callout:MuleSoft_Products/products/' + productId);
        request.setMethod( 'GET' );
        System.debug( 'Sending GET Request');
        HttpResponse response = http.send( request );
        // If the request is successful, parse the JSON response.
        if ( response.getStatusCode() == 200 ) {
            System.debug( 'Body [' + response.getBody() + ']');
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = ( Map<String, Object> ) JSON.deserializeUntyped( response.getBody() );

            try {
                MuleProduct muleProduct = (MuleProduct)JSON.deserialize( response.getBody(), MuleProduct.class);
                System.debug( 'Product Brand is ' + muleProduct.brand);
                System.debug( 'Identifier is ' + muleProduct.identifier);
                System.debug( 'Model is ' + muleProduct.model);
                System.debug( 'Description is ' + muleProduct.description);
                System.debug( 'Rating is ' + muleProduct.rating);
            } catch ( Exception e) {
                System.debug( 'try again buddy ' + e.getMessage());
            }
        } else {
            System.debug( 'Received response [' + response.getStatusCode() + ']');
        }
        return response;
    }

    public static HttpResponse postProductInfoWithNamedCredentials() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String productId = '12345';
        request.setEndpoint('callout:MuleSoft_Products/products/' + productId);
        request.setMethod( 'POST' );
        System.debug( 'Sending POST Request');
        HttpResponse response = http.send( request );
        // If the request is successful, parse the JSON response.
        if ( response.getStatusCode() == 200 ) {
            System.debug( 'Body [' + response.getBody() + ']');
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = ( Map<String, Object> ) JSON.deserializeUntyped( response.getBody() );

            try {
                MuleProduct muleProduct = (MuleProduct)JSON.deserialize( response.getBody(), MuleProduct.class);
                System.debug( 'Product Brand is ' + muleProduct.brand);
                System.debug( 'Identifier is ' + muleProduct.identifier);
                System.debug( 'Model is ' + muleProduct.model);
                System.debug( 'Description is ' + muleProduct.description);
                System.debug( 'Rating is ' + muleProduct.rating);
            } catch ( Exception e) {
                System.debug( 'try again buddy ' + e.getMessage());
            }
        } else {
            System.debug( 'Received response [' + response.getStatusCode() + ']');
        }
        return response;
    }

}