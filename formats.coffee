module.exports = [
  {
    reg : /([0-9]+(?:\.[0-9]+)?)/
    countries : ["au", "ca", "cn", "in", "ie", "is", "jp",
    "kr", "kb", "lu", "my", "mx", "np", "pk", "nz", "sg",
    "ph", "sg", "tz", "ch", "tw", "uk", "us"]
    sep : ""
    decimalSep : "."
  }
  {
    reg : /([0-9]+(?:,[0-9]+)?)/
    countries : ["al", "ao", "am", "az", "by", "be", "bo",
    "br", "cm", "co", "cr", "hr", "fr", "de", "gr", "id",
    "it", "nl", "ro", "ru", "se", "es", "tn"]
    sep : ""
    decimalSep : ","
  }
  {
    reg : /([0-9]{1,3}(?: [0-9]{3})*(?:,[0-9]+)?)/
    countries : ["fr", "ru", "it", "es", "cz", "de", "bg",
    "al", "at", "pl", "ro", "ca", "pt", "gr", "nl"]
    sep : " "
    decimalSep : ","
  }
  {
    reg : /([0-9]{1,3}(?: [0-9]{3})*(?:\.[0-9]+)?)/
    countries : ["ca", "cn"]
    sep : " "
    decimalSep : '.'
  }
  {
    reg : /([0-9]{1,3}(?:,[0-9]{3})*(?:\.[0-9]+)?)/
    countries : ["au", "cn", "hk", "ie", "il", "jp", "kr",
    "kp", "uk", "us", "tw", "sg", "th"]
    sep : ","
    decimalSep : '.'
  }
  {
    reg : /([0-9]{1,3}(?:,[0-9]{3})*(?:·[0-9]+)?)/
    countries : ["ie", "kr", "kp", "nz", "tw", "my", "ph",
    "sg", "th", "uk", "us"]
    sep : ","
    decimalSep : "·"
  }
  {
    reg : /([0-9]{1,3}(?:\.[0-9]{3})*(?:,[0-9]+)?)/
    countries : ["tr", "at", "br", "dn", "de", "gr", "id",
    "it", "nl", "pt", "ro", "ru", "si", "es"]
    sep : "."
    decimalSep : ","
  }
  {
    reg : /([0-9]{1,3}(?:˙[0-9]{3})*(?:,[0-9]+)?)/
    countries : ["it"]
    sep : "˙"
    decimalSep : ","
  }
  {
    reg : /([0-9]{1,3}(?:'[0-9]{3})*(?:,[0-9]+)?)/
    countries : ["ch"]
    sep : "'"
    decimalSep : ","
  }
  {
    reg : /([0-9]{1,3}(?:'[0-9]{3})*(?:\.[0-9]+)?)/
    countries : ["ch"]
    sep : "'"
    decimalSep : "."
  }
]
