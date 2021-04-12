lodash = require "lodash"
formats = require "./formats"

escapeRegExp = (string) ->
  return string.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1")

allCountryCodes = lodash(formats)
  .map "countries"
  .flatten()
  .uniq()
  .value()

defaultPrio = lodash.zipObject(
  allCountryCodes,
  lodash.times allCountryCodes.length, -> 1.0
)

parse = (text, priorities = defaultPrio) ->
  return text if lodash.isNumber(text)
  return NaN if not lodash.isString(text)

  maxPrio = lodash(priorities).values().sum()
  priorities = lodash.mapValues priorities, (p) -> p/maxPrio

  result = lodash(formats)
    .mapValues (l) ->
      res = l.reg.exec text
      if res isnt null
        m = res[0].replace new RegExp(escapeRegExp(l.sep), 'g'), ""
        m = m.replace l.decimalSep, "."
        try
          l.match = parseFloat(m)
          l
        catch error
          false
      else
        false
    .filter (x) -> x
    .groupBy (x) -> x.match
    .mapValues (x, index) ->
      lodash(x)
        .map "countries"
        .flatten()
        .uniq()
        .value()
    .map (value, index) ->
      {
        parsed : parseFloat index
        countries : value
        length : index.replace(/[^0-9]/g, "").length
      }
    .map (v) ->
      v.score = lodash(v.countries)
        .map (c) -> priorities?[c] ? 0
        .sum()
      v.score += v.length if v.score isnt 0
      delete v.countries
      v
    .maxBy "score"
    ?.parsed
  result ?= NaN
  result

module.exports = parse
