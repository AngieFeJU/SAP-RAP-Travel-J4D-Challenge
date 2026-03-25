CLASS LHC_ZR_TRAVEL157732_01 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR Travel157732
        RESULT result,
      ValidateDestination FOR VALIDATE ON SAVE
            IMPORTING keys FOR Travel157732~ValidateDestination,
      ValidateTravelDate FOR VALIDATE ON SAVE
            IMPORTING keys FOR Travel157732~ValidateTravelDate,
      ValidateBasePrice FOR VALIDATE ON SAVE
            IMPORTING keys FOR Travel157732~ValidateBasePrice,
      CalculateDaysUntilDeparture FOR DETERMINE ON MODIFY
            IMPORTING keys FOR Travel157732~CalculateDaysUntilDeparture,
      CalculateTripStatus FOR DETERMINE ON MODIFY
            IMPORTING keys FOR Travel157732~CalculateTripStatus.
ENDCLASS.

CLASS LHC_ZR_TRAVEL157732_01 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.

METHOD ValidateDestination.
  READ ENTITIES OF ZR_TRAVEL157732_01 IN LOCAL MODE
    ENTITY Travel157732
      FIELDS ( Destination )
      WITH CORRESPONDING #( keys )
    RESULT DATA(lt_travel).

  LOOP AT lt_travel INTO DATA(ls_travel).
    APPEND VALUE #(
      %tky        = ls_travel-%tky
      %state_area = 'VALIDATE_DESTINATION'
    ) TO reported-travel157732.

    IF ls_travel-Destination IS INITIAL.
      APPEND VALUE #( %tky = ls_travel-%tky )
        TO failed-travel157732.

      APPEND VALUE #(
        %tky                  = ls_travel-%tky
        %state_area           = 'VALIDATE_DESTINATION'
        %msg                  = new_message_with_text(
          severity = if_abap_behv_message=>severity-error
          text     = 'Destination is mandatory' )
        %element-Destination  = if_abap_behv=>mk-on
      ) TO reported-travel157732.
    ENDIF.
  ENDLOOP.
ENDMETHOD.

  METHOD ValidateTravelDate.

  READ ENTITIES OF ZR_TRAVEL157732_01 IN LOCAL MODE
    ENTITY Travel157732
      FIELDS ( TravelDate )
      WITH CORRESPONDING #( keys )
    RESULT DATA(lt_travel).

  LOOP AT lt_travel INTO DATA(ls_travel).
    APPEND VALUE #(
      %tky        = ls_travel-%tky
      %state_area = 'VALIDATE_TRAVEL_DATE'
    ) TO reported-travel157732.


    IF ls_travel-TravelDate < cl_abap_context_info=>get_system_date( ).
      APPEND VALUE #( %tky = ls_travel-%tky )
        TO failed-travel157732.

      APPEND VALUE #(
        %tky                  = ls_travel-%tky
        %state_area           = 'VALIDATE_TRAVEL_DATE'
        %msg                  = new_message_with_text(
          severity = if_abap_behv_message=>severity-error
          text     = 'Travel date cannot be in the past' )
        %element-TravelDate   = if_abap_behv=>mk-on
      ) TO reported-travel157732.
    ENDIF.
  ENDLOOP.

  ENDMETHOD.

  METHOD ValidateBasePrice.

  READ ENTITIES OF ZR_TRAVEL157732_01 IN LOCAL MODE
    ENTITY Travel157732
      FIELDS ( BasePrice )
      WITH CORRESPONDING #( keys )
    RESULT DATA(lt_travel).

  LOOP AT lt_travel INTO DATA(ls_travel).
    APPEND VALUE #(
      %tky        = ls_travel-%tky
      %state_area = 'VALIDATE_BASE_PRICE'
    ) TO reported-travel157732.

    IF ls_travel-BasePrice <= 0.
      APPEND VALUE #( %tky = ls_travel-%tky )
        TO failed-travel157732.

      APPEND VALUE #(
        %tky                  = ls_travel-%tky
        %state_area           = 'VALIDATE_BASE_PRICE'
        %msg                  = new_message_with_text(
          severity = if_abap_behv_message=>severity-error
          text     = 'Base price must be greater than zero' )
        %element-BasePrice    = if_abap_behv=>mk-on
      ) TO reported-travel157732.
    ENDIF.
  ENDLOOP.

  ENDMETHOD.


  METHOD CalculateDaysUntilDeparture.
  "Read TravelDate from entity buffer
  READ ENTITIES OF ZR_TRAVEL157732_01 IN LOCAL MODE
    ENTITY Travel157732
      FIELDS ( TravelDate )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_travel).

  "Update DaysUntilDeparture with difference between TravelDate and system date
  MODIFY ENTITIES OF ZR_TRAVEL157732_01 IN LOCAL MODE
    ENTITY Travel157732
      UPDATE FIELDS ( DaysUntilDeparture )
      WITH VALUE #( FOR travel IN lt_travel (
        %tky                    = travel-%tky
        DaysUntilDeparture      = travel-TravelDate - cl_abap_context_info=>get_system_date( )
      ) ).

  "report changed entities for DaysUntilDeparture
    LOOP AT lt_travel INTO DATA(ls_travel).
      APPEND VALUE #(
        %tky        = ls_travel-%tky
        %state_area = 'CALCULATE_DAYS_UNTIL_DEPARTURE'
      ) TO reported-travel157732.
    ENDLOOP.

  ENDMETHOD.

  METHOD CalculateTripStatus.
  "Calculate TripStatus based on SeatsAvailable and DaysUntilDeparture
  READ ENTITIES OF ZR_TRAVEL157732_01 IN LOCAL MODE
    ENTITY Travel157732
      FIELDS ( DaysUntilDeparture SeatsAvailable )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_travel).

 "Calculate TripStatus: Sold Out if seats 0, Closing Soon if days <= 7, Hot Deal if seats < 3, else Available
  MODIFY ENTITIES OF ZR_TRAVEL157732_01 IN LOCAL MODE
    ENTITY Travel157732
      UPDATE FIELDS ( TripStatus )
      WITH VALUE #( FOR travel IN lt_travel (
        %tky                    = travel-%tky
        TripStatus              = COND #( WHEN travel-SeatsAvailable = 0 THEN 'Sold Out'
                                         WHEN travel-DaysUntilDeparture <= 7 THEN 'Closing Soon'
                                         WHEN travel-SeatsAvailable <= 3 THEN 'Hot Deal'
                                         ELSE 'Available' )
                                         )
                                         ).
  "report changed entities for TripStatus
    LOOP AT lt_travel INTO DATA(ls_travel).
      APPEND VALUE #(
        %tky        = ls_travel-%tky
        %state_area = 'CALCULATE_TRIP_STATUS'
      ) TO reported-travel157732.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
