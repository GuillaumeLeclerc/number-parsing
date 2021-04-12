(function() {
  var allCountryCodes, defaultPrio, escapeRegExp, formats, lodash, parse;

  lodash = require("lodash");

  formats = require("./formats");

  escapeRegExp = function(string) {
    return string.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1");
  };

  allCountryCodes = lodash(formats).map("countries").flatten().uniq().value();

  defaultPrio = lodash.zipObject(allCountryCodes, lodash.times(allCountryCodes.length, function() {
    return 1.0;
  }));

  parse = function(text, priorities) {
    var maxPrio, ref, result;
    if (priorities == null) {
      priorities = defaultPrio;
    }
    if (lodash.isNumber(text)) {
      return text;
    }
    if (!lodash.isString(text)) {
      return NaN;
    }
    maxPrio = lodash(priorities).values().sum();
    priorities = lodash.mapValues(priorities, function(p) {
      return p / maxPrio;
    });
    result = (ref = lodash(formats).mapValues(function(l) {
      var error, m, res;
      res = l.reg.exec(text);
      if (res !== null) {
        m = res[0].replace(new RegExp(escapeRegExp(l.sep), 'g'), "");
        m = m.replace(l.decimalSep, ".");
        try {
          l.match = parseFloat(m);
          return l;
        } catch (_error) {
          error = _error;
          return false;
        }
      } else {
        return false;
      }
    }).filter(function(x) {
      return x;
    }).groupBy(function(x) {
      return x.match;
    }).mapValues(function(x, index) {
      return lodash(x).map("countries").flatten().uniq().value();
    }).map(function(value, index) {
      return {
        parsed: parseFloat(index),
        countries: value,
        length: index.replace(/[^0-9]/g, "").length
      };
    }).map(function(v) {
      v.score = lodash(v.countries).map(function(c) {
        var ref1;
        return (ref1 = priorities != null ? priorities[c] : void 0) != null ? ref1 : 0;
      }).sum();
      if (v.score !== 0) {
        v.score += v.length;
      }
      delete v.countries;
      return v;
    }).maxBy("score")) != null ? ref.parsed : void 0;
    if (result == null) {
      result = NaN;
    }
    return result;
  };

  module.exports = parse;

}).call(this);
