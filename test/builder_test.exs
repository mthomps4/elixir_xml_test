defmodule XmlTest.BuilderTest do
  use ExUnit.Case
  import XmlBuilder

  test "Can generate XML - Basic" do
    data = {:person, %{primary: true}, "Jim Bob"}
    generated = XmlBuilder.document(data) |> XmlBuilder.generate()

    assert generated ==
             "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<person primary=\"true\">Jim Bob</person>"
  end

  test "Can Generate XML - Nested" do
    data = {:person, %{primary: true}, first: "Jim ", last: "Bob"}
    generated = XmlBuilder.document(data) |> XmlBuilder.generate()

    assert generated ==
             "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<person primary=\"true\">\n  <first>Jim </first>\n  <last>Bob</last>\n</person>"
  end

  test "Can Generate XML - Nested with attributes" do
    data = {:person, %{primary: true}, [{:name, %{first: "Jim ", last: "Bob"}}, age: 32]}
    generated = XmlBuilder.document(data) |> XmlBuilder.generate()

    assert generated ==
             "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<person primary=\"true\">\n  <name first=\"Jim \" last=\"Bob\"/>\n  <age>32</age>\n</person>"
  end

  test "Can Generate XML - Map Person(s)" do
    persons = [
      %{
        first_name: "Jim",
        last_name: "Bob",
        age: 32,
        primary: true
      },
      %{
        first_name: "Joe",
        last_name: "Cool",
        age: 21,
        primary: false
      }
    ]

    mapped_data =
      Enum.map(persons, fn person ->
        {:person, %{primary: person.primary},
         [{:name, %{first: person.first_name, last: person.last_name}}, age: person.age]}
      end)

    data = {:persons, mapped_data}

    generated = XmlBuilder.document(data) |> XmlBuilder.generate()

    assert generated ==
             "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<persons>\n  <person primary=\"true\">\n    <name first=\"Jim\" last=\"Bob\"/>\n    <age>32</age>\n  </person>\n  <person primary=\"false\">\n    <name first=\"Joe\" last=\"Cool\"/>\n    <age>21</age>\n  </person>\n</persons>"
  end

  test "Can Generate XML - List of Data" do
    persons = [
      %{
        first_name: "Jim",
        last_name: "Bob",
        age: 32,
        primary: true
      },
      %{
        first_name: "Joe",
        last_name: "Cool",
        age: 21,
        primary: false
      }
    ]

    mapped_persons =
      Enum.map(persons, fn person ->
        {:person, %{primary: person.primary},
         [{:name, %{first: person.first_name, last: person.last_name}}, age: person.age]}
      end)

    hotel_data = {:hotel, %{id: 26}, [{:name, "Marriot"}, {:location, "Orlando, FL"}]}

    data = [{:persons, mapped_persons}, hotel_data, {:total_guest_count, %{count: 2}}]

    generated = XmlBuilder.document(data) |> XmlBuilder.generate()

    assert generated ==
             "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<persons>\n  <person primary=\"true\">\n    <name first=\"Jim\" last=\"Bob\"/>\n    <age>32</age>\n  </person>\n  <person primary=\"false\">\n    <name first=\"Joe\" last=\"Cool\"/>\n    <age>21</age>\n  </person>\n</persons>\n<hotel id=\"26\">\n  <name>Marriot</name>\n  <location>Orlando, FL</location>\n</hotel>\n<total_guest_count count=\"2\"/>"
  end
end
