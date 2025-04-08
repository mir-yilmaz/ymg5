pipeline {
    agent any

    triggers {
        githubPush()
    }

    environment {
        PATH = "C:\\Program Files\\Docker\\Docker\\resources\\bin;C:\\Windows\\System32;C:\\Windows;C:\\Windows\\System32\\Wbem"
        IMAGE_NAME = 'test'
        CONTAINER_NAME = 'ngix-test'
    }

    stages {
        stage('Repo Klonla') {
            steps {
                echo ' GitHub reposu klonlanıyor...'
                git url: 'https://github.com/mir-yilmaz/ymg5.git/', branch: 'main'
            }
        }

        stage('Docker Image Oluştur') {
            steps {
                echo ' Docker image oluşturuluyor...'
                bat "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Eski Container Durdur') {
            steps {
                echo ' Eski container kaldırılıyor (varsa)...'
                bat "docker rm -f ${CONTAINER_NAME} || exit 0"
            }
        }

        stage('Yeni Container Oluştur') {
            steps {
                echo ' Yeni container başlatılıyor...'
                bat "docker run -d --name ${CONTAINER_NAME} -p 4444:80 ${IMAGE_NAME}"
            }
        }
    }

    post {
        success {
            echo ' Yayın başarılı!'
        }
        failure {
            echo ' Yayın başarısız.'
        }
    }
}

