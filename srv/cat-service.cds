using { Country, managed } from '@sap/cds/common';

service CatalogService {

    entity Books {
        key ID  : Integer;
        title   : localized String;
        author  : Association to Authors;
        stock   : Integer
    }
    
    entity Authors {
        key ID  : Integer;
        name    : String;
        books   : Association to many Books on books.author = $self;
    }

    entity Orders : managed {
        key ID  : UUID;
        books   : Association to Books;
        country : Country;
        amount  : Integer; 
    }

}