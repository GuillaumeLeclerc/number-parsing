parser = require "../numberParsing"

module.exports =
  areNormalized : (test) ->
    test.strictEqual parser("1·3", {fr : 0.5, tw : 0.5}), 1.3
    test.strictEqual parser("1·3", {fr : 9.5, tw : 0.5}), 1.3
    test.done()
