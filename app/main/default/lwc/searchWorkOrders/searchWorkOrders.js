import { LightningElement, track } from 'lwc';
import queryWorkOrders from '@salesforce/apex/OrderDataService.queryWorkOrdersByCustomer';

export default class SearchWorkOrders extends LightningElement {
    @track searchKey = '';
    @track workOrders;
    @track error;

    handleKeyChange(event) {
        this.searchKey = event.target.value;
    }

    handleSearch() {
        queryWorkOrders({ searchKey: this.searchKey })
            .then(result => {
                this.workOrders = result;
                this.error = undefined;
            })
            .catch(error => {
                console.log( 'error is ' + error);
                this.error = error;
                this.workOrders = undefined;
            });
    }
}
