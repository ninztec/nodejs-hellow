// vars/dockerLogin.groovy

def call(String credentialsId) {
    withCredentials([string(credentialsId: credentialsId, variable: 'PASSWORD')]) {
        script {
            sh 'docker login -u rjshk013 -p $PASSWORD'
        }
    }
}

