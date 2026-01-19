@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 1: Projections'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z05_Demo001 as select from /dmo/connection 
//Rest der Zeile kommentieren (max. 30 Zeichen)
{ 
/*Key fields*/
 key carrier_id      as CarrierId,
 key connection_id   as ConnectionId,

/*Fields*/
      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      distance        as Distance,
      distance_unit   as DistanceUnit
}
/*Kommentarblock*/
