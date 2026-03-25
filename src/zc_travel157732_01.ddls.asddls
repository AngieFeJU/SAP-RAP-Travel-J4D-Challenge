@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZTravel157732_01', 
  semanticKey: [ 'TravelID' ]
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TRAVEL157732_01
  provider contract transactional_query
  as projection on ZR_TRAVEL157732_01
  association [1..1] to ZR_TRAVEL157732_01 as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
  TravelID,
  Destination,
  Agency,
  TravelDate,
  @Semantics: {
    amount.currencyCode: 'Usd'
  }
  BasePrice,
  SeatsAvailable,
  DiscountedPrice,
  DaysUntilDeparture,
  TripStatus,
  @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'Currency', 
      entity.name: 'I_CurrencyStdVH', 
      useForValidation: true
    } ]
  }
  Usd,
  @Semantics: {
    user.createdBy: true
  }
  LocalCreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  LocalCreatedAt,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  LocalLastChangedBy,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChangedAt,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LastChangedAt,
  _BaseEntity
}
