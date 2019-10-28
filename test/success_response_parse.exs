defmodule XmlTest.SuccessResponseTest do
  use ExUnit.Case
  alias XmlTest.ReservationRequestMock
  import SweetXml

  test "Can parse for list of parameters in XML - l" do
    # XML Response
    # <HotelReservationID ResID_Type="14" ResID_Value="7789456"/>
    res = ReservationRequestMock.success_response()

    long_hand_xpath =
      res
      |> xpath(
        ~x"//HotelReservations/HotelReservation/ResGlobalInfo/HotelReservationIDs/HotelReservationID/@ResID_Value"l
      )

    short_hand_xpath = res |> xpath(~x"//HotelReservationID/@ResID_Value"l)

    assert long_hand_xpath == ['7789456', 'DNG7789456']
    assert short_hand_xpath == ['7789456', 'DNG7789456']
  end

  test "Can parse to Strings -- lS" do
    # XML Response
    # <HotelReservationID ResID_Type="14" ResID_Value="7789456"/>
    res = ReservationRequestMock.success_response()

    short_hand_xpath = res |> xpath(~x"//HotelReservationID/@ResID_Value"lS)

    assert short_hand_xpath == ["7789456", "DNG7789456"]
  end

  test "Can map list of parameters in XML" do
    # XML Response
    # <HotelReservationID ResID_Type="14" ResID_Value="7789456"/>
    res = ReservationRequestMock.success_response()

    mapped_path =
      res
      |> xpath(
        ~x"//HotelReservations/HotelReservation/ResGlobalInfo/HotelReservationIDs/HotelReservationID"l,
        booking_ref: ~x"./@ResID_Value"
      )

    assert mapped_path == [%{booking_ref: '7789456'}, %{booking_ref: 'DNG7789456'}]
  end

  test "Mapping to a structure" do
    # XML Response
    # <HotelReservationID ResID_Type="14" ResID_Value="7789456"/>
    res = ReservationRequestMock.success_response()

    mapped_path =
      res
      |> xpath(
        ~x"//HotelReservations/HotelReservation/ResGlobalInfo/HotelReservationIDs/HotelReservationID"l
      )
      |> Enum.map(fn li_node ->
        %{
          booking_ref: xpath(li_node, ~x"./@ResID_Value")
        }
      end)

    assert mapped_path == [%{booking_ref: '7789456'}, %{booking_ref: 'DNG7789456'}]
  end

  test "Returns list of xml elements and remaps - le" do
    # XML Response
    # <HotelReservationID ResID_Type="14" ResID_Value="7789456"/>
    res = ReservationRequestMock.success_response()
    xml_elements = res |> xpath(~x"//HotelReservationID"le)

    assert xml_elements == [
             {:xmlElement, :HotelReservationID, :HotelReservationID, [],
              {:xmlNamespace, :"http://www.opentravel.org/OTA/2003/05",
               [
                 {'soap', :"http://schemas.xmlsoap.org/soap/envelope/"},
                 {'xsi', :"http://www.w3.org/2001/XMLSchema-instance"},
                 {'xsd', :"http://www.w3.org/2001/XMLSchema"}
               ]},
              [
                HotelReservationIDs: 2,
                ResGlobalInfo: 2,
                HotelReservation: 2,
                HotelReservations: 4,
                OTA_HotelResNotifRS: 2,
                "soap:Body": 2,
                "soap:Envelope": 1
              ], 2,
              [
                {:xmlAttribute, :ResID_Type, [], [], [],
                 [
                   HotelReservationID: 2,
                   HotelReservationIDs: 2,
                   ResGlobalInfo: 2,
                   HotelReservation: 2,
                   HotelReservations: 4,
                   OTA_HotelResNotifRS: 2,
                   "soap:Body": 2,
                   "soap:Envelope": 1
                 ], 1, [], '14', false},
                {:xmlAttribute, :ResID_Value, [], [], [],
                 [
                   HotelReservationID: 2,
                   HotelReservationIDs: 2,
                   ResGlobalInfo: 2,
                   HotelReservation: 2,
                   HotelReservations: 4,
                   OTA_HotelResNotifRS: 2,
                   "soap:Body": 2,
                   "soap:Envelope": 1
                 ], 2, [], '7789456', false}
              ], [], [], '/home/mthomps4/Code/xml_test', :undeclared},
             {:xmlElement, :HotelReservationID, :HotelReservationID, [],
              {:xmlNamespace, :"http://www.opentravel.org/OTA/2003/05",
               [
                 {'soap', :"http://schemas.xmlsoap.org/soap/envelope/"},
                 {'xsi', :"http://www.w3.org/2001/XMLSchema-instance"},
                 {'xsd', :"http://www.w3.org/2001/XMLSchema"}
               ]},
              [
                HotelReservationIDs: 2,
                ResGlobalInfo: 2,
                HotelReservation: 2,
                HotelReservations: 4,
                OTA_HotelResNotifRS: 2,
                "soap:Body": 2,
                "soap:Envelope": 1
              ], 4,
              [
                {:xmlAttribute, :ResID_Type, [], [], [],
                 [
                   HotelReservationID: 4,
                   HotelReservationIDs: 2,
                   ResGlobalInfo: 2,
                   HotelReservation: 2,
                   HotelReservations: 4,
                   OTA_HotelResNotifRS: 2,
                   "soap:Body": 2,
                   "soap:Envelope": 1
                 ], 1, [], '3', false},
                {:xmlAttribute, :ResID_Value, [], [], [],
                 [
                   HotelReservationID: 4,
                   HotelReservationIDs: 2,
                   ResGlobalInfo: 2,
                   HotelReservation: 2,
                   HotelReservations: 4,
                   OTA_HotelResNotifRS: 2,
                   "soap:Body": 2,
                   "soap:Envelope": 1
                 ], 2, [], 'DNG7789456', false}
              ], [], [], '/home/mthomps4/Code/xml_test', :undeclared}
           ]

    booking_refs =
      Enum.map(xml_elements, fn element ->
        xpath(element, ~x"//HotelReservationID/@ResID_Value"S)
      end)

    assert booking_refs == ["7789456", "DNG7789456"]
  end

  test "Can create List of Guest Profiles" do
    res = ReservationRequestMock.full_booking()

    guests =
      res
      |> xpath(~x"//ResGuests/ResGuest"l,
        primary: ~x"./@PrimaryIndicator"S |> transform_by(&boolean_response/1),
        person_type: ~x"./@AgeQualifyingCode"S |> transform_by(&get_person_type/1),
        profile: [
          ~x"./Profiles/ProfileInfo/Profile/Customer/PersonName",
          name_prefix: ~x"./NamePrefix/text()"S,
          first_name: ~x"./GivenName/text()"S,
          last_name: ~x"./Surname/text()"S
        ]
      )

    assert guests == [
             %{
               person_type: "ADULT",
               primary: true,
               profile: %{first_name: "James ", last_name: "Bond", name_prefix: "Mr"}
             },
             %{
               person_type: "ADULT",
               primary: false,
               profile: %{first_name: "Jane", last_name: "MoneyPenny", name_prefix: "Mrs"}
             },
             %{
               person_type: "CHILD",
               primary: false,
               profile: %{first_name: "Harry", last_name: "Potter", name_prefix: "Mrs"}
             }
           ]
  end

  def boolean_response('true'), do: true
  def boolean_response('false'), do: false
  def boolean_response("true"), do: true
  def boolean_response("false"), do: false
  def boolean_response(_unknown), do: false

  def get_person_type("10"), do: "ADULT"
  def get_person_type("8"), do: "CHILD"
  def get_person_type("7"), do: "BABY"
  def get_person_type(_age)
end
