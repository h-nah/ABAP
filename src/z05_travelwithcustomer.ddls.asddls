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
      @Semantics.amount.currencyCode: 'CurrencyCode'
      t.BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      t.TotalPrice,
      t.CurrencyCode,
      t.Description,
      t.Status,
      t.CustomerId,
      c.FirstName,
      c.LastName,
      c.Title,
      c.Street,
      c.PostalCode,
      c.City,
      c.CountryCode
}
where c.CountryCode = 'DE'
