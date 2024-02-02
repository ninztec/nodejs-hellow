// vars/buildDockerImage.groovy

def call() {
    echo "Building Docker Image..."
    sh 'docker build . -t rjshk013/node-hellow:latest'
    sh 'docker image list'
}

