defmodule XmlTest.ReservationRequestMock do
  def sweet_xml_example do
    """
    <?xml version="1.05" encoding="UTF-8"?>
    <game>
      <matchups>
        <matchup winner-id="1">
          <name>Match One</name>
          <teams>
            <team>
              <id>1</id>
              <name>Team One</name>
            </team>
            <team>
              <id>2</id>
              <name>Team Two</name>
            </team>
          </teams>
        </matchup>
        <matchup winner-id="2">
          <name>Match Two</name>
          <teams>
            <team>
              <id>2</id>
              <name>Team Two</name>
            </team>
            <team>
              <id>3</id>
              <name>Team Three</name>
            </team>
          </teams>
        </matchup>
        <matchup winner-id="1">
          <name>Match Three</name>
          <teams>
            <team>
              <id>1</id>
              <name>Team One</name>
            </team>
            <team>
              <id>3</id>
              <name>Team Three</name>
            </team>
          </teams>
        </matchup>
      </matchups>
    </game>
    """
  end

  def error_response do
    """
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema">
      <soap:Body>
        <OTA_HotelResNotifRS TimeStamp="2017-07-17T15:27:13"
      xmlns="http://www.opentravel.org/OTA/2003/05">
          <Errors>
            <Error ShortText="User not found"/>
          </Errors>
        </OTA_HotelResNotifRS>
      </soap:Body>
    </soap:Envelope>
    """
  end

  def success_response do
    """
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema">
      <soap:Body>
        <OTA_HotelResNotifRS TimeStamp="2017-07-12T09:21:17" ResResponseType="Booked"
        xmlns="http://www.opentravel.org/OTA/2003/05">
          <Success/>
          <HotelReservations>
            <HotelReservation>
              <ResGlobalInfo>
                <HotelReservationIDs>
                  <HotelReservationID ResID_Type="14" ResID_Value="7789456"/>
                  <HotelReservationID ResID_Type="3" ResID_Value="DNG7789456"/>
                </HotelReservationIDs>
              </ResGlobalInfo>
            </HotelReservation>
          </HotelReservations>
        </OTA_HotelResNotifRS>
      </soap:Body>
    </soap:Envelope>
    """
  end

  def full_booking do
    """
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <soap:Body>
    <OTA_HotelResNotifRS TimeStamp="2017-07-12T09:21:17" ResResponseType="Booked"
    xmlns="http://www.opentravel.org/OTA/2003/05">
      <HotelReservations>
        <HotelReservation ResStatus="Book" CreatorID="" CreateDateTime="2016-09-27T09:21:00">
          <TimeSpan Start="2017-12-01" End="2017-12-06"/>
          <RoomStays>
            <RoomStay>
              <Comments>
                <Comment>
                  <Text>Remark comments</Text>
                </Comment>
              </Comments>
              <RoomRates>
                <RoomRate RoomTypeCode="DBL" RoomDescription="Double" RatePlanCode="BAR" RatePlanDescription="Best Available Room" MealPlanCode="AI" MealPlanDescription="All Inclusive"/>
                <Rates>
                  <Rate UnitMultiplier="3" RateTimeUnit="Day" EffectiveDate="2017-12-01" ExpireDate="2017-12-03">
                    <Base AmountAfterTax="120.00" CurrencyCode="USD"/>
                  </Rate>
                  <Rate UnitMultiplier="2" RateTimeUnit="Day" EffectiveDate="2017-12-04" ExpireDate="2017-12-05">
                    <Base AmountAfterTax="150.00" CurrencyCode="USD"/>
                  </Rate>
                </Rates>
              </RoomRates>
              <GuestCounts>
                <GuestCount AgeQualifyingCode="10" Count="2" Age="30"/>
                <GuestCount AgeQualifyingCode="8" Count="1" Age="6"/>
              </GuestCounts>
              <TimeSpan Start="2017-12-01" End="2017-12-06"/>
              <Total AmountAfterTax="660.00" CurrencyCode="USD"/>
              <ResGuestRPHs RPH="1"/>
            </RoomStay>
          </RoomStays>
          <Services>
            <Service ServiceRPH="1" ServiceInventoryCode="PARKING" Quantity="1">
              <Price EffectiveDate="2017-12-01">
                <Total AmountAfterTax="12.00"/>
              </Price>
              <Price EffectiveDate="2017-12-02">
                <Total AmountAfterTax="12.00"/>
              </Price>
              <Price EffectiveDate="2017-12-03">
                <Total AmountAfterTax="12.00"/>
              </Price>
              <Price EffectiveDate="2017-12-04">
                <Total AmountAfterTax="12.00"/>
              </Price>
              <Price EffectiveDate="2017-12-05">
                <Total AmountAfterTax="12.00"/>
              </Price>
              <ServiceDetails>
                <TimeSpan Start="2017-12-01" End="2017-12-05"/>
                <Description>
                  <Text>Name: Car Park, Description: Undercover Parking</Text>
                </Description>
              </ServiceDetails>
            </Service>
          </Services>
          <ResGuests>
            <ResGuest PrimaryIndicator="true" ResGuestRPH="1" AgeQualifyingCode="10">
              <Profiles>
                <ProfileInfo>
                  <Profile ProfileType="1">
                    <Customer>
                      <Email>info@mail.com</Email>
                      <PersonName>
                        <NamePrefix>Mr</NamePrefix>
                        <GivenName>James </GivenName>
                        <Surname>Bond</Surname>
                      </PersonName>
                      <Telephone PhoneNumber="0034971505044"/>
                      <Address>
                        <AddressLine>Marjory Street</AddressLine>
                        <CityName>Palma</CityName>
                        <PostalCode>07009</PostalCode>
                        <StateProv StateCode="Baleares"/>
                        <CountryName Code="ES"/>
                      </Address>
                    </Customer>
                  </Profile>
                </ProfileInfo>
              </Profiles>
              <ArrivalTransport Type="Air" ID="UX4090" Time="2017-12-01T09:00:00"/>
              <DepartureTransport Type="Air" ID="UX4091" Time="2017-12-06T11:00:00"/>
            </ResGuest>
            <ResGuest PrimaryIndicator="false" ResGuestRPH="1" AgeQualifyingCode="10">
              <Profiles>
                <ProfileInfo>
                  <Profile ProfileType="1">
                    <Customer>
                      <PersonName>
                        <NamePrefix>Mrs</NamePrefix>
                        <GivenName>Jane</GivenName>
                        <Surname>MoneyPenny</Surname>
                      </PersonName>
                    </Customer>
                  </Profile>
                </ProfileInfo>
              </Profiles>
            </ResGuest>
            <ResGuest PrimaryIndicator="false" ResGuestRPH="1" AgeQualifyingCode="8">
              <Profiles>
                <ProfileInfo>
                  <Profile ProfileType="1">
                    <Customer>
                      <PersonName>
                        <NamePrefix>Mrs</NamePrefix>
                        <GivenName>Harry</GivenName>
                        <Surname>Potter</Surname>
                      </PersonName>
                    </Customer>
                  </Profile>
                </ProfileInfo>
              </Profiles>
            </ResGuest>
          </ResGuests>
          <ResGlobalInfo>
            <Total AmountAfterTax="720.00" CurrencyCode="EUR"/>
            <Guarantee>
              <GuaranteesAccepted>
                <GuaranteeAccepted>
                  <PaymentCard CardType="VI" CardNumber="1111222233334444" ExpireDate="11/2018" CardCode="">
                    <CardHolderName>James Bond</CardHolderName>
                  </PaymentCard>
                </GuaranteeAccepted>
              </GuaranteesAccepted>
            </Guarantee>
            <BasicPropertyInfo HotelCode="BN1" HotelName="Hotel Alpha"/>
            <HotelReservationIDs>
              <HotelReservationID ResID_Type="14" ResID_Value="7789456"/>
            </HotelReservationIDs>
          </ResGlobalInfo>
          <TPA_Extensions>
            <ChannelInfos>
              <ChannelInfo Code="Source" Value="B2B"/>
              <ChannelInfo Code="Market" Value="UK"/>
            </ChannelInfos>
          </TPA_Extensions>
        </HotelReservation>
      </HotelReservations>
    </OTA_HotelResNotifRS>
    </soap:Body>
    </soap:Envelope>
    """
  end

  def request do
    """
    <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP- ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-
    instance"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <SOAP-ENV:Body>
    <m:OTA_HotelResNotifRQ xmlns:m="http://www.opentravel.org/OTA/2003/05" TimeStamp="2017-07-
    12T09:21:00" Version="1">
      <m:POS>
        <m:Source>
          <m:RequestorID ID="user" MessagePassword="pass"/>
        </m:Source>
      </m:POS>
      <m:HotelReservations>
        <m:HotelReservation ResStatus="Book" CreatorID="" CreateDateTime="2016-09-27T09:21:00">
          <m:TimeSpan Start="2017-12-01" End="2017-12-06"/>
          <m:RoomStays>
            <m:RoomStay>
              <m:Comments>
                <m:Comment>
                  <m:Text>Remark comments</m:Text>
                </m:Comment>
              </m:Comments>
              <m:RoomRates>
                <m:RoomRate RoomTypeCode="DBL" RoomDescription="Double" RatePlanCode="BAR" RatePlanDescription="Best Available Room" MealPlanCode="AI" MealPlanDescription="All Inclusive"/>
                <m:Rates>
                  <m:Rate UnitMultiplier="3" RateTimeUnit="Day" EffectiveDate="2017-12-01" ExpireDate="2017-12-03">
                    <m:Base AmountAfterTax="120.00" CurrencyCode="USD"/>
                  </m:Rate>
                  <m:Rate UnitMultiplier="2" RateTimeUnit="Day" EffectiveDate="2017-12-04" ExpireDate="2017-12-05">
                    <m:Base AmountAfterTax="150.00" CurrencyCode="USD"/>
                  </m:Rate>
                </m:Rates>
              </m:RoomRates>
              <m:GuestCounts>
                <m:GuestCount AgeQualifyingCode="10" Count="2" Age="30"/>
                <m:GuestCount AgeQualifyingCode="8" Count="1" Age="6"/>
              </m:GuestCounts>
              <m:TimeSpan Start="2017-12-01" End="2017-12-06"/>
              <m:Total AmountAfterTax="660.00" CurrencyCode="USD"/>
              <m:ResGuestRPHs RPH="1"/>
            </m:RoomStay>
          </m:RoomStays>
          <m:Services>
            <m:Service ServiceRPH="1" ServiceInventoryCode="PARKING" Quantity="1">
              <m:Price EffectiveDate="2017-12-01">
                <m:Total AmountAfterTax="12.00"/>
              </m:Price>
              <m:Price EffectiveDate="2017-12-02">
                <m:Total AmountAfterTax="12.00"/>
              </m:Price>
              <m:Price EffectiveDate="2017-12-03">
                <m:Total AmountAfterTax="12.00"/>
              </m:Price>
              <m:Price EffectiveDate="2017-12-04">
                <m:Total AmountAfterTax="12.00"/>
              </m:Price>
              <m:Price EffectiveDate="2017-12-05">
                <m:Total AmountAfterTax="12.00"/>
              </m:Price>
              <m:ServiceDetails>
                <m:TimeSpan Start="2017-12-01" End="2017-12-05"/>
                <m:Description>
                  <m:Text>Name: Car Park, Description: Undercover Parking</m:Text>
                </m:Description>
              </m:ServiceDetails>
            </m:Service>
          </m:Services>
          <m:ResGuests>
            <m:ResGuest PrimaryIndicator="true" ResGuestRPH="1" AgeQualifyingCode="10">
              <m:Profiles>
                <m:ProfileInfo>
                  <m:Profile ProfileType="1">
                    <m:Customer>
                      <m:Email>info@mail.com</m:Email>
                      <m:PersonName>
                        <m:NamePrefix>Mr</m:NamePrefix>
                        <m:GivenName>James </m:GivenName>
                        <m:Surname>Bond</m:Surname>
                      </m:PersonName>
                      <m:Telephone PhoneNumber="0034971505044"/>
                      <m:Address>
                        <m:AddressLine>Marjory Street</m:AddressLine>
                        <m:CityName>Palma</m:CityName>
                        <m:PostalCode>07009</m:PostalCode>
                        <m:StateProv StateCode="Baleares"/>
                        <m:CountryName Code="ES"/>
                      </m:Address>
                    </m:Customer>
                  </m:Profile>
                </m:ProfileInfo>
              </m:Profiles>
              <m:ArrivalTransport Type="Air" ID="UX4090" Time="2017-12-01T09:00:00"/>
              <m:DepartureTransport Type="Air" ID="UX4091" Time="2017-12-06T11:00:00"/>
            </m:ResGuest>
            <m:ResGuest PrimaryIndicator="false" ResGuestRPH="1" AgeQualifyingCode="10">
              <m:Profiles>
                <m:ProfileInfo>
                  <m:Profile ProfileType="1">
                    <m:Customer>
                      <m:PersonName>
                        <m:NamePrefix>Mrs</m:NamePrefix>
                        <m:GivenName>Jane</m:GivenName>
                        <m:Surname>MoneyPenny</m:Surname>
                      </m:PersonName>
                    </m:Customer>
                  </m:Profile>
                </m:ProfileInfo>
              </m:Profiles>
            </m:ResGuest>
            <m:ResGuest PrimaryIndicator="false" ResGuestRPH="1" AgeQualifyingCode="8">
              <m:Profiles>
                <m:ProfileInfo>
                  <m:Profile ProfileType="1">
                    <m:Customer>
                      <m:PersonName>
                        <m:NamePrefix>Mrs</m:NamePrefix>
                        <m:GivenName>Harry</m:GivenName>
                        <m:Surname>Potter</m:Surname>
                      </m:PersonName>
                    </m:Customer>
                  </m:Profile>
                </m:ProfileInfo>
              </m:Profiles>
            </m:ResGuest>
          </m:ResGuests>
          <m:ResGlobalInfo>
            <m:Total AmountAfterTax="720.00" CurrencyCode="EUR"/>
            <m:Guarantee>
              <m:GuaranteesAccepted>
                <m:GuaranteeAccepted>
                  <m:PaymentCard CardType="VI" CardNumber="1111222233334444" ExpireDate="11/2018" CardCode="">
                    <m:CardHolderName>James Bond</m:CardHolderName>
                  </m:PaymentCard>
                </m:GuaranteeAccepted>
              </m:GuaranteesAccepted>
            </m:Guarantee>
            <m:BasicPropertyInfo HotelCode="BN1" HotelName="Hotel Alpha"/>
            <m:HotelReservationIDs>
              <m:HotelReservationID ResID_Type="14" ResID_Value="7789456"/>
            </m:HotelReservationIDs>
          </m:ResGlobalInfo>
          <m:TPA_Extensions>
            <m:ChannelInfos>
              <m:ChannelInfo Code="Source" Value="B2B"/>
              <m:ChannelInfo Code="Market" Value="UK"/>
            </m:ChannelInfos>
          </m:TPA_Extensions>
        </m:HotelReservation>
      </m:HotelReservations>
    </m:OTA_HotelResNotifRQ>
    </SOAP-ENV:Body>
    </SOAP-ENV:Envelope>
    """
  end
end
