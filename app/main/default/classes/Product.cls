/**
 * Created by Alex.Gusev on 2020-03-16.
 */

public class Product {

    public Product product;

   /*


   */
    public String brand;
    public String identifier;
    public List<Map<String,String>> identifiers;
    public String model;
    public String description;
    public Integer rating;
    //public Price price;

    public class Price {
        public Amount amount;
        public SalesUnit salesUnit;
    }

    public class Amount {
        public String currencyField;
        public Decimal currencyValueField;
        public String name;
    }

    public class SalesUnit {
        public String code;
        public String name;
    }

}