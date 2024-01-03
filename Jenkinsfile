pipeline {
    agent any
    environment{
        DOCKERHUB_USERNAME = "rjshk013"
        APP_NAME = "gitops-demo-app"
        IMAGE_TAG = "${BUILD_NUMBER}"
        IMAGE_NAME = "${DOCKERHUB_USERNAME}" + "/" + "${APP_NAME}"
    }
    
    stages {
        stage("Git Clone") {
            steps {
                git credentialsId: 'GIT_HUB_CREDENTIALS', url: 'https://github.com/ninztec/nodejs-hellow.git', branch: 'master'
            }
        }
        
        stage("Build") {
            steps {
                script {
                    docker_image = docker.build "${IMAGE_NAME}"
                    sh 'docker image list'
                }
            }
        }

        stage("Docker Login") {
            steps {
                withCredentials([string(credentialsId: 'DOCKER_HUB_PASSWORD', variable: 'PASSWORD')]) {
                    script {
                        sh 'docker login -u rjshk013 -p $PASSWORD'
                    }
                }
            }
        }

        stage("Push Image to Docker Hub") {
            steps {
                script {
                        docker_image.push("${BUILD_NUMBER}")
                        docker_image.push('latest')
                }
            }
        }

        stage('Updating Kubernetes deployment file'){
            steps {
                  sh "cat deployment.yaml"
                  sh "sed -i 's/${APP_NAME}.*/${APP_NAME}:${IMAGE_TAG}/g' deployment.yaml"
                  sh "cat deployment.yaml"
            }
        }
        stage("Kubernetes Deployment") {
            steps {
                script {
                    sh 'sudo helm upgrade nodejs-app nodejs -f nodejs/dev-values.yaml'
                }
            }
        }
    }
}