pipeline {
	agent {
		label 'any'
	}
	stages {
		stage('Build') {
			steps {
				container('maven') {
					sh """
						mvn package -DskipTests
						"""
				}
			}
		}
		stage('Test') {
			steps {
				container('maven') {
					sh """
						mvn test
						"""
				}
			}
		}
		stage('Push') {
			steps {
				container('docker') {
					sh """
						docker build -t onek0708/jpetstore2:$BUILD_NUMBER .
						"""
				}
			}
		}
	}
}
