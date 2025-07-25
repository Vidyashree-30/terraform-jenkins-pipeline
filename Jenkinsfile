pipeline {
    agent any

    environment {
        TF_DIR = "${WORKSPACE}"
    }

    stages {
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
                sh 'terraform plan -var-file="terraform.tfvars"'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve -var-file="terraform.tfvars"'
            }
        }
    }

    post {
        success {
            echo '✅ Terraform resources created successfully!'
        }
        failure {
            echo '❌ Something went wrong.'
        }
    }
}
