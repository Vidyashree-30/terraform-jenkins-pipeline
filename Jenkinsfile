pipeline {
    agent none

    stages {
        stage('Run on Linux Agent') {
            agent { label 'node1' }

            steps {
                git branch: 'qa', url: 'https://github.com/Vidyashree-30/terraform-jenkins-pipeline.git'

                sh '''
                    terraform workspace new linux || terraform workspace select linux
                    terraform init
                    terraform validate
                    terraform plan -var-file=terraform.tfvars -out=tfplan.out
                    terraform apply -auto-approve tfplan.out
                    ls -l a/filea.txt b/fileb.txt
                    ls -ld a b
                '''
            }
        }

        stage('Run on Windows Agent') {
            agent { label 'windows_node' }

            steps {
                git branch: 'main', url: 'https://github.com/Vidyashree-30/terraform-jenkins-pipeline.git'

                bat '''
                    terraform workspace new windows || terraform workspace select windows
                    terraform init
                    terraform validate
                    terraform plan -var-file=terraform.tfvars -out=tfplan.out
                    terraform apply -auto-approve tfplan.out
                    dir a\\filea.txt
                    dir b\\fileb.txt
                    dir a
                    dir b
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
