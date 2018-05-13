pipeline {
	agent {
		label 'master'
    }
    environment {
		MAJOR_VERSION = 1
    }
    stages {
        stage('deploy-development') {
            agent {
                label 'master'
            }
            when {
                branch 'development'
            }
            steps {
                sh "echo Branch: ${env.BRANCH_NAME}"
                sh "terraform init -input=false -backend-config=backend.${BRANCH_NAME}.tfvar"
                sh "terraform plan  -var 'envparm=${BRANCH_NAME}' -var 'bucketname=${BRANCH_NAME}-devops-terraform-state' -out=${BRANCH_NAME}.${BUILD_NUMBER}.plan"
                sh "terraform apply -var 'envparm=${BRANCH_NAME}' -auto-approve"
            }
        }
        stage('deploy-test') {
            agent {
                label 'master'
            }
            when {
                branch 'test'
            }
            steps {
                sh "echo Branch: ${env.BRANCH_NAME}"
                sh "terraform init -input=false -backend-config=backend.${BRANCH_NAME}.tfvar"
                sh "terraform plan  -var 'envparm=${BRANCH_NAME}' -var 'bucketname=${BRANCH_NAME}-devops-terraform-state' -out=${BRANCH_NAME}.${BUILD_NUMBER}.plan"
                sh "terraform apply -var 'envparm=${BRANCH_NAME}' -auto-approve"
            }
        }
        stage('deploy-prod') {
            agent {
                label 'master'
            }
            when {
                branch 'production'
            }
            steps {
                sh "echo Branch: ${env.BRANCH_NAME}"
                sh "terraform init -input=false -backend-config=Prodbackend.tfvar"
                sh "terraform plan -var 'bucketname=prodenv-devops-terraform-state'"
            }
        }


    }
    post {
    	failure {
        	emailext(
        	  subject: "${env.JOB_NAME} [env.${BUILD_NUMBER}] Failed!",
        	  body: "check ${env.JOB_NAME} [env.${BUILD_NUMBER}]",
              to: "wangnan.alvin@gmail.com"
        )
      } 

    	success {
        	emailext(
        	  subject: "${env.JOB_NAME} [env.${BUILD_NUMBER}] Succeeded!",
        	  body: "check ${env.JOB_NAME} [env.${BUILD_NUMBER}]",
              to: "wangnan.alvin@gmail.com"
        )
      } 
    } 
}

