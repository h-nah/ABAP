@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel and Customer'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z05_TravelWithCustomer  
  as select from Z05_Customer as c

    inner join   Z05_Travel   as t on c.CustomerId = t.CustomerId

{
  key t.TravelId,

      t.AgencyId,
      t.BeginDate,
      t.EndDate,
      dats_days_between(t.BeginDate, t.EndDate) as Duration, //Funktion die die Differenz ausrechnet 
      @Semantics.amount.currencyCode: 'CurrencyCode'
      t.BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      t.TotalPrice,
      t.CurrencyCode,
      t.Description,
      t.Status as Statustext,
      t.CustomerId,
      case when c.Title is initial then concat_with_space(c.FirstName, c.LastName, 1)
      else concat_with_space(concat_with_space(c.Title, c.FirstName, 1), c.LastName, 1) end as CustomerName,
      c.FirstName,
      c.LastName,
      c.Title,
      c.Street,
      c.PostalCode,
      c.City,
      c.CountryCode,
            
      
@Semantics.amount.currencyCode: 'CurrencyCode'
currency_conversion( amount => t.BookingFee,
 source_currency => t.CurrencyCode, 
 target_currency => cast('EUR' as abap.cuky),
  exchange_rate_date => $session.system_date, 
  error_handling => 'SET_TO_NULL')as NBookingFee,
  
@Semantics.amount.currencyCode: 'CurrencyCode'
currency_conversion( amount => t.TotalPrice,
 source_currency => t.CurrencyCode, 
 target_currency => cast('EUR' as abap.cuky),
  exchange_rate_date => $session.system_date, 
  error_handling => 'SET_TO_NULL')as NTotalPrice
  

       
}
where c.CountryCode = 'DE'

