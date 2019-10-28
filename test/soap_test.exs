defmodule XmlTest.SoapTest do
  use ExUnit.Case

  test "Soap init" do
    wsdl_path =
      "http://connectivity.dingus-services.com/services/Tazzy/CustomServices/dingus/service.asmx?wsdl"

    {:ok, wsdl} = Soap.init_model(wsdl_path, :url)

    expected = %{
      complex_types: [
        %{name: "OTA_HotelAvailRQ", type: "s0:OTA_HotelAvailRQ"},
        %{name: "OTA_HotelAvailRS", type: "s0:OTA_HotelAvailRS"},
        %{name: "OTA_HotelResNotifRQ", type: ""},
        %{name: "OTA_HotelResNotifRS", type: ""},
        %{name: "OTA_HotelResRQ", type: ""},
        %{name: "OTA_HotelResRS", type: ""},
        %{name: "OTA_CancelRQ", type: ""},
        %{name: "OTA_CancelRS", type: ""},
        %{name: "OTA_HotelDescriptiveInfoRQ", type: ""},
        %{name: "OTA_HotelDescriptiveInfoRS", type: ""},
        %{name: "OTA_ReadRQ", type: ""},
        %{name: "OTA_BookList", type: ""}
      ],
      endpoint:
        "http://connectivity.dingus-services.com/services/Tazzy/CustomServices/dingus/service.asmx",
      messages: [
        %{
          name: "AvailSoapIn",
          parts: [%{element: "s0:OTA_HotelAvailRQ", name: "OTA_HotelAvailRQ"}]
        },
        %{
          name: "AvailSoapOut",
          parts: [%{element: "s0:OTA_HotelAvailRS", name: "AvailResult"}]
        },
        %{
          name: "BookingNotificationSoapIn",
          parts: [%{element: "s0:OTA_HotelResNotifRQ", name: "OTA_HotelResNotifRQ"}]
        },
        %{
          name: "BookingNotificationSoapOut",
          parts: [%{element: "s0:OTA_HotelResNotifRS", name: "BookingNotificationResult"}]
        },
        %{
          name: "BookSoapIn",
          parts: [%{element: "s0:OTA_HotelResRQ", name: "oTA_HotelResRQ"}]
        },
        %{name: "BookSoapOut", parts: [%{element: "s0:OTA_HotelResRS", name: "BookResult"}]},
        %{name: "CancelSoapIn", parts: [%{element: "s0:OTA_CancelRQ", name: "OTA_CancelRQ"}]},
        %{
          name: "CancelSoapOut",
          parts: [%{element: "s0:OTA_CancelRS", name: "CancelResult"}]
        },
        %{
          name: "HotelDescriptiveInfoSoapIn",
          parts: [
            %{element: "s0:OTA_HotelDescriptiveInfoRQ", name: "OTA_HotelDescriptiveInfoRQ"}
          ]
        },
        %{
          name: "HotelDescriptiveInfoSoapOut",
          parts: [
            %{element: "s0:OTA_HotelDescriptiveInfoRS", name: "HotelDescriptiveInfoResult"}
          ]
        },
        %{name: "OTAReadRQSoapIn", parts: [%{element: "s0:OTA_ReadRQ", name: "OTA_ReadRQ"}]},
        %{
          name: "OTAReadRQSoapOut",
          parts: [%{element: "s0:OTA_BookList", name: "OTAReadRQResult"}]
        }
      ],
      namespaces: %{
        "http" => %{type: :soap, value: "http://schemas.xmlsoap.org/wsdl/http/"},
        "mime" => %{type: :soap, value: "http://schemas.xmlsoap.org/wsdl/mime/"},
        "s" => %{type: :soap, value: "http://www.w3.org/2001/XMLSchema"},
        "s0" => %{type: :soap, value: "http://www.opentravel.org/OTA/2003/05"},
        "soap" => %{type: :soap, value: "http://schemas.xmlsoap.org/wsdl/soap/"},
        "soap12" => %{type: :soap, value: "http://schemas.xmlsoap.org/wsdl/soap12/"},
        "soapenc" => %{type: :soap, value: "http://schemas.xmlsoap.org/soap/encoding/"},
        "tm" => %{type: :soap, value: "http://microsoft.com/wsdl/mime/textMatching/"},
        "tns" => %{type: :wsdl, value: "http://etooltech.com/CustomServices/Dingus/"},
        "wsdl" => %{type: :soap, value: "http://schemas.xmlsoap.org/wsdl/"}
      },
      operations: [
        %{
          input: %{body: nil, header: nil},
          name: "Avail",
          soap_action: "http://etooltech.com/CustomServices/Dingus/Avail"
        },
        %{
          input: %{body: nil, header: nil},
          name: "BookingNotification",
          soap_action: "http://etooltech.com/CustomServices/Dingus/BookingNotification"
        },
        %{
          input: %{body: nil, header: nil},
          name: "Book",
          soap_action: "http://etooltech.com/CustomServices/Dingus/Book"
        },
        %{
          input: %{body: nil, header: nil},
          name: "Cancel",
          soap_action: "http://etooltech.com/CustomServices/Dingus/Cancel"
        },
        %{
          input: %{body: nil, header: nil},
          name: "HotelDescriptiveInfo",
          soap_action: "http://etooltech.com/CustomServices/Dingus/HotelDescriptiveInfo"
        },
        %{
          input: %{body: nil, header: nil},
          name: "OTAReadRQ",
          soap_action: "http://etooltech.com/CustomServices/Dingus/OTAReadRQ"
        }
      ],
      schema_attributes: %{
        element_form_default: "qualified",
        target_namespace: "http://www.opentravel.org/OTA/2003/05"
      },
      soap_version: "1.1",
      validation_types: %{
        "amounttype" => %{},
        "arrayofadditionalinfo" => %{},
        "arrayofchannelinfo" => %{},
        "arrayofota_hotelresnotifrqhotelreservationresglobalinfoguaranteeguaranteeaccepted" =>
          %{},
        "arrayofota_hotelresnotifrqhotelreservationresguest" => %{},
        "arrayofota_hotelresnotifrqhotelreservationresguestprofilesprofile" => %{},
        "arrayofota_hotelresnotifrqhotelreservationroomstayroomratesrate" => %{},
        "arrayofota_hotelresnotifrserror" => %{},
        "arrayofota_hotelresnotifrshotelreservationresglobalinfohotelreservationid" => %{},
        "arrayofservicestypeservice" => %{},
        "arrayofstring" => %{},
        "datetimespantype" => %{},
        "description" => %{},
        "errorstype" => %{},
        "errortype" => %{},
        "guarantee" => %{},
        "guaranteeaccepted" => %{},
        "guaranteeacceptedpaymentcard" => %{},
        "guestcounts" => %{},
        "hotelreservations" => %{},
        "ota_hotelavailrq" => %{},
        "ota_hotelavailrs" => %{},
        "pmsroomref" => %{},
        "rescommondetailtype" => %{},
        "timeinstanttype" => %{},
        "totaltype" => %{},
        "tpa_extensionstype" => %{}
      }
    }

    assert wsdl == expected

    operations = Soap.operations(wsdl)

    assert operations == [
             %{
               input: %{body: nil, header: nil},
               name: "Avail",
               soap_action: "http://etooltech.com/CustomServices/Dingus/Avail"
             },
             %{
               input: %{body: nil, header: nil},
               name: "BookingNotification",
               soap_action: "http://etooltech.com/CustomServices/Dingus/BookingNotification"
             },
             %{
               input: %{body: nil, header: nil},
               name: "Book",
               soap_action: "http://etooltech.com/CustomServices/Dingus/Book"
             },
             %{
               input: %{body: nil, header: nil},
               name: "Cancel",
               soap_action: "http://etooltech.com/CustomServices/Dingus/Cancel"
             },
             %{
               input: %{body: nil, header: nil},
               name: "HotelDescriptiveInfo",
               soap_action: "http://etooltech.com/CustomServices/Dingus/HotelDescriptiveInfo"
             },
             %{
               input: %{body: nil, header: nil},
               name: "OTAReadRQ",
               soap_action: "http://etooltech.com/CustomServices/Dingus/OTAReadRQ"
             }
           ]
  end

  test "Soap.call with wsdl_path" do
    wsdl_path =
      "http://connectivity.dingus-services.com/services/Tazzy/CustomServices/dingus/service.asmx?wsdl"

    {:ok, wsdl} = Soap.init_model(wsdl_path, :url)
    action = "Book"
    headers = Soap.Request.Headers.build(wsdl, "Book", [])

    assert headers == [
             {"SOAPAction", "http://etooltech.com/CustomServices/Dingus/Book"},
             {"Content-Type", "text/xml;charset=utf-8"}
           ]

    # {headers, params}
    params = %{something: "Hotel"}
    {:ok, response} = Soap.call(wsdl, action, {headers, params})
  end
end
