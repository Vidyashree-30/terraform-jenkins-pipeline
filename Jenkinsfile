pipeline {
    agent any

    environment {
        TF_DIR = "${WORKSPACE}/terraform"
    }

    stages {
        stage('Clone Repository') {
            steps {
               git branch: 'dev', url: 'https://github.com/Vidyashree-30/terraform-jenkins-pipeline.git'

            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan.out'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan.out'
            }
        }
    }

    post {
        success {
            echo 'Terraform executed successfully.'
            sh 'ls -l file1.txt file2.txt'
            sh 'ls -ld dir1 dir2'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
