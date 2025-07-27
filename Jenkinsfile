pipeline {
    agent none

    stages {
        stage('Run on Linux Agent') {
            agent { label 'node1' }

            steps {
                git branch: 'main', url: 'https://github.com/Vidyashree-30/terraform-jenkins-pipeline.git'

                sh '''
                    terraform workspace new linux || terraform workspace select linux
                    terraform init
                    terraform validate
                    terraform plan -var-file=terraform.tfvars -out=tfplan.out
                    terraform apply -auto-approve tfplan.out
                    ls -l file1.txt file2.txt
                    ls -ld dir1 dir2
                '''
            }
        }

        stage('Run on Windows Agent') {
            agent { label 'windows-node' }

            steps {
                git branch: 'main', url: 'https://github.com/Vidyashree-30/terraform-jenkins-pipeline.git'

                bat '''
                    terraform workspace new windows || terraform workspace select windows
                    terraform init
                    terraform validate
                    terraform plan -var-file=terraform.tfvars -out=tfplan.out
                    terraform apply -auto-approve tfplan.out
                    dir file1.txt
                    dir file2.txt
                    dir dir1
                    dir dir2
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Terraform execution completed on both Linux and Windows nodes."
        }
        failure {
            echo "❌ Terraform pipeline failed."
        }
    }
}
