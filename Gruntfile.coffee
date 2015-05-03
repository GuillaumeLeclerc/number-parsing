module.exports = (grunt) ->
  grunt.initConfig
    coffeelint :
      app : ['*.coffee']
    coffee :
      compile :
        expand : true
        flatten : true
        cwd : "./"
        src : ["numberParsing.coffee", "formats.coffee"]
        dest : "./"
        ext : ".js"

  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.registerTask "build", ["coffeelint", "coffee"]
