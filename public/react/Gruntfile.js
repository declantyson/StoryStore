module.exports = function(grunt) {
	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		uglify: {
			options: {
 	 			banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
			},
			build: {
	  			src: ['app/_scripts/*.js', '!**/*.min.js'],
	  			dest: 'app/_scripts/script.min.js'
			}
		},
		watch : {
			scripts: {
				files: ['app/_scripts/*.js', 'app/_css/*.less', '!**/*.min.js'],
				tasks: ['less', 'cssmin'],
				options: {

				}
			}
		},
		less : {
			development: {
				options : {
					paths: ['app/_css/*.css']
				},
				files : {
					'app/_css/styles.css': 'app/_css/*.less'
				}
			}
		},
		cssmin : {
			options : {
				
			},
			target: {
				files : [{
					expand: true,
				    cwd: 'app/_css',
				    src: ['*.css', '!*.min.css'],
				    dest: 'app/_css',
				    ext: '.min.css'
				}]
			}
		},
		qunit: {
			options: {
				'--ignore-ssl-errors':true,
			      	'--max-disk-cache-size':100000,
			      	'--load-images':false,
			      	'--local-to-remote-url-access':true,
			      	'--ssl-protocol':'any'		       
			},
			all: {
				options: {
					urls : ['http://localhost:3000/_tests/index.html']
				}
			}
		},
		connect: {
			server : {
				options: {
					port: 3000,
					base: '.'
				}
			}
		}
	});

	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-less');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-cssmin');
	grunt.loadNpmTasks('grunt-contrib-qunit');
	grunt.loadNpmTasks('grunt-contrib-connect');
	grunt.loadNpmTasks('grunt-notify');
	grunt.registerTask('default', ['watch']);

};