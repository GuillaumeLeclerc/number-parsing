parser = require "../numberParsing"

rawValues = [
  ["1234", 1234]
  ["12312.23", 12312.23]
  ["123'123.99", 123123.99]
  ["123'123,99", 123123.99]
  ["-123'123,99", -123123.99]
  ["123 123.99", 123123.99]
  ["123 123,99", 123123.99]
  ["19 999 123,999", 19999123.999]
  ["123'123", 123123]
  ["12'12", 12.12]
]

valuesWithCurrencies = [
  ["123.-", 123]
  ["USD123123", 123123]
  ["USD-123123", -123123]
  ["-123.345€", -123.345]
]

testFromArray = (test, values) ->
  test.expect values.length
  for t in values
    [toParse, expected] = t
    parsed = parser toParse
    test.strictEqual parsed, expected
  test.done()

module.exports =
  basicTests : (test) -> testFromArray test, rawValues
  testRemoveCurrencies : (test) -> testFromArray test, valuesWithCurrencies
  testAmbiguityResolution : (test) ->
    test.strictEqual parser("1,123", {us : 1}), 1123
    test.strictEqual parser("1,123", {fr : 1}), 1.123
    test.done()
  testBadNumbers : (test) ->
    test.ok isNaN(parser("aaa")), "text should be NaN"
    test.ok isNaN(parser("USD")), "currency should be NaN"
    test.ok isNaN(parser(null)), "null should be NaN"
    test.ok isNaN(parser(undefined)), "undefined should be NaN"
    test.ok isNaN parser([]), "array should be NaN"
    test.ok isNaN parser({}), "object should be NaN"
    test.done()
  testKeepAlreadyNumbers : (test) ->
    test.strictEqual parser(3245345.123), 3245345.123,
      "parsing a float should return the same float"
    test.strictEqual parser(-143), -143,
      "parsing an integer should return the same integer"
    test.done()

