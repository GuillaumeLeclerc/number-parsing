module.exports = (grunt) ->
  grunt.initConfig
    nodeunit :
      all : ['test/*_test.js']
    coffeelint :
      app : ['*.coffee']
    coffee :
      test :
        expand : true
        flatten : true
        cwd : "./"
        src : ["test/*.coffee"]
        dest : "./test"
        ext : ".js"
      compile :
        expand : true
        flatten : true
        cwd : "./"
        src : ["numberParsing.coffee", "formats.coffee"]
        dest : "./"
        ext : ".js"

  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-nodeunit"

  grunt.registerTask "build", ["coffeelint", "coffee"]
  grunt.registerTask "default", ["coffeelint", "coffee"]
  grunt.registerTask "test", ["default", "coffee:test", "nodeunit"]
