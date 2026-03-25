@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZTravel157732_01'
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.semanticKey: [ 'TravelID' ]
define root view entity ZR_TRAVEL157732_01
  as select from ztravel157732_01 as Travel157732
{

  key uuid as UUID,
  travel_id as TravelID,
  destination as Destination,
  agency as Agency,
  travel_date as TravelDate,
  @Semantics.amount.currencyCode: 'Usd'
  base_price as BasePrice,
  seats_available as SeatsAvailable,
    // Calculated DiscountedPrice
@Semantics.amount.currencyCode: 'Usd'
cast(
  case
    when seats_available < 3 then cast(base_price as abap.dec(15,2)) * 95 / 100
    else cast(base_price as abap.dec(15,2)) * 90 / 100
  end as abap.dec(15,2)
) as DiscountedPrice,
  days_until_departure as DaysUntilDeparture,
  trip_status as TripStatus,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  usd as Usd,
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}
