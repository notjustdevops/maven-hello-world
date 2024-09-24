# DevOps Maven Task
https://github.com/ido83  - ido83/maven-hello-world
https://github.com/ido83/maven-hello-world?tab=readme-ov-file


# DevOps Exercise: Escape from Kepler-186f

Greetings, Terran lifeforms! I, a highly evolved being from Kepler-186f, require your assistance. My interstellar vessel has crash-landed on your fascinating planet. To facilitate a rescue mission, I must establish communication and demonstrate my comprehension of your primitive technologies.

**Mission Objective:** Construct a "Hello World" program and deploy it within a Docker container. This beacon will alert my civilization to my location.

**Step 1: Code Retrieval and Analysis**

1.  **Fork:**  Navigate to the following repository on your "GitHub" code repository platform and create a copy (fork): [https://github.com/ido83/maven-hello-world](https://github.com/ido83/maven-hello-world)

2.  **Analyze:**  Using your "Google" knowledge retrieval device, investigate the following:
    
    * **Programming Language:** Identify the programming language used in this repository.

          Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. 
                
                - A high-level programming language is a programming language with strong abstraction from the details of the computer. In contrast to low-level programming languages, it may use natural language elements, be easier to use.

                - Class-based programming, or more commonly class-orientation, is a style of object-oriented programming (OOP) in which inheritance occurs via defining classes of objects, instead of inheritance occurring via the objects alone (compare prototype-based programming).

                - Object-oriented programming (OOP), (an object is an entity with well-defined behavior), is a programming paradigm based on the concept of objects, which can contain data and code: data in the form of fields (often known as attributes or properties), and code in the form of procedures (often known as methods). In OOP, computer programs are designed by making them out of objects that interact with one another.

                - Many of the most widely used programming languages (such as C++, Java, and Python) are multi-paradigm and support object-oriented programming to a greater or lesser degree, typically in combination with imperative programming, procedural programming and functional programming.
                
            
          It is a general-purpose programming language intended to let programmers write once, run anywhere (WORA),meaning that compiled Java code can run on all platforms that support Java without the need to recompile.
            
            Java applications are typically compiled to bytecode that can run on any Java virtual machine (JVM) regardless of the underlying computer architecture. 

            The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them. 
            
            The Java runtime provides dynamic capabilities (such as reflection and runtime code modification) that are typically not available in traditional compiled languages.

    
    * **Maven:**  Comprehend the purpose and functionality of "Maven" within this context.
        
          Apache Maven software project management and comprehension tool.
            
            Maven is a build automation tool that is used to manage and build Java projects.
            It provides a consistent and predictable way to build projects, manage dependencies, and automate common tasks.
            
            notjust@devops:Rafael us-west-2 (main) $ mvn --version
                Apache Maven 3.6.3
                Maven home: /usr/share/maven
                Java version: 17.0.12, vendor: Ubuntu, runtime: /usr/lib/jvm/java-11-openjdk-amd64
                Default locale: en_IL, platform encoding: UTF-8
                OS name: "linux", version: "6.9.3-76060903-generic", arch: "amd64", family: "unix"
            
          Configuring Maven:
                
                Maven configuration occurs at 3 levels:
                    - Project - most static configuration occurs in pom.xml
                    - Installation - this is configuration added once for a Maven installation
                    - User - this is configuration specific to a particular user

          A phase is a step in the build lifecycle, which is an ordered sequence of phases.
          When a phase is given, Maven executes every phase in the sequence up to and including the one defined.

                    - validate: validate the project is correct and all necessary information is available
                    
                    - compile: compile the source code of the project

                    - test: test the compiled source code using a suitable unit testing framework. These tests should not require the code be packaged or deployed

                    - package: take the compiled code and package it in its distributable format, such as a JAR.

                    - integration-test: process and deploy the package if necessary into an environment where integration tests can be run

                    - verify: run any checks to verify the package is valid and meets quality criteria

                    - install: install the package into the local repository, for use as a dependency in other projects locally

                    - deploy: done in an integration or release environment, copies the final package to the remote repository for sharing with other developers and projects.

                There are two other Maven lifecycles of note beyond the default list above. They are

                    - clean: cleans up artifacts created by prior builds
                    - site: generates site documentation for this project
            
          Create the Project:
                mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.5 -DinteractiveMode=false

          Build the Project:
                mvn package

          Test the newly compiled and packaged JAR:
                java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App
                
                
        References:
        https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html
        https://maven.apache.org/guides/mini/guide-configuring-maven.html


    * **pom.xml:**  Decipher the significance of the "pom.xml" file within the project structure.

        **Overall, Maven and the POM file work together to provide a consistent and predictable way to manage and build Java projects.**
        
            The Project Object Model (POM) is a critical component of Maven and is used to define the configuration and dependencies of a Maven project.    
            The POM file defines the project’s configuration and dependencies, while Maven uses this information to automate the build process and manage dependencies.

            The pom.xml file is the configuration file used by Maven. It defines the project's metadata (name, version, etc.), dependencies on other libraries, build     instructions (compilation, packaging), and plugins used for specific tasks. It's the central file for Maven to understand and manage the project.


        What is XML?

            Extensible Markup Language (XML) lets you define and store data in a shareable manner. XML supports information exchange between computer systems such as websites, databases, and third-party applications. Predefined rules make it easy to transmit data as XML files over any network because the recipient can use those rules to read the data accurately and efficiently.
            
                - Support interbusiness transactions
                - Maintain data integrity
                - Improve search efficiency
                - Design flexible applications
        

        References:
        https://medium.com/@gaganjain9319/what-is-maven-and-the-importance-of-pom-xml-8273f5cd6fd6
        https://aws.amazon.com/what-is/xml/#:~:text=An%20Extensible%20Markup%20Language%20(XML,like%20Notepad%20or%20Notepad%2B%2B
        https://maven.apache.org/guides/introduction/introduction-to-the-pom.html



**Step 2: Building and Modification**

To construct the program, we'll utilize your "GitHub Actions" continuous integration tool. 

1.  **Code Modification:**
    * Integrate your name within the "Hello World" message.
    * Update the "Jar version" to "1.0.0" in the project configuration.

2.  **Pipeline Creation:**
    Develop an automated pipeline that accomplishes the following:
        * Automatically increment the patch version of the Jar (e.g., 1.0.0 -> 1.0.1).
        * Compile the code.
        * Package it as a deployable artifact.
        * Generate a build artifact record.

    Workflow Summary:
      
      Triggers:

        This workflow will run on push and pull requests to the main branch and any feature/* branches.
      
      Job Setup:

        - The job will run on an ubuntu-latest machine.
        - It checks out the code, sets up JDK 11, and performs several actions:
            - Updates the "Hello World" message.
            - Sets the JAR version to 1.0.0.
            - Increments the patch version.
            - Compiles and packages the Java code into a JAR file.
            - Builds a Docker image containing the JAR file.
            - Pushes the Docker image to Docker Hub.
            - Runs the Docker container using the nobody user.

      What Happens at Each Step:

        Checkout Code: 
          - Pulls the latest code from your repository.

        Set Up JDK 11: 
          - Prepares the environment with Java 11 for building and compiling the application.

        Update Message:
          - Uses the sed command to dynamically modify the "Hello World" message in App.java.

        Set and Increment JAR Version:
          - Initially sets the JAR version to 1.0.0.
          - Automatically increments the patch version for every build (e.g., from 1.0.0 to 1.0.1, etc.).
          
        Compile and Package:
          - Compiles the Java code and packages it into a JAR file.
          - Skips tests during the packaging phase (-DskipTests).
        
        Upload Artifact:
          - Uploads the generated JAR file as an artifact in the GitHub Actions workflow for reference.

        Build Docker Image:
          - Builds a Docker image with the JAR file using the Dockerfile.

        Push Docker Image:
          - Pushes the Docker image to your Docker Hub account under the repository dvorkinguy/Dvorkin-Guy-From-Kepler-186f-App.

        Run Docker Container:
          - Runs the Docker container from the pushed image, exposing port 8080, and runs as the nobody user for security.

3.  **Docker Image Creation:**
    Construct a "Dockerfile" containing instructions for building a Docker image encapsulating the compiled artifact.

        --> Completed.

4.  **Docker Hub Integration:**
    * Designate the Docker image with a tag that dynamically reflects the Jar version (e.g., "my-image:1.0.0")
    * Configure the pipeline to push the created Docker image to your Docker Hub account.


    * **Security Consideration:** Ensure the Docker image doesn't execute code as the "root" user.

       --> Completed.


**Step 3: Deployment and Verification**

1.  **Docker Image Execution:**
    Download and execute the newly created Docker image to confirm successful deployment.

        --> Completed.


**Bonus Objective: Multi-Stage Docker**

For an additional challenge, optimize your Docker image size by implementing a multi-stage build process. Explore resources on "Multi-stage Docker builds" using your trusty "Google" device.

        --> Completed

# Additional Implemethations.

  - Added Tests
  - Added 2 Images Upload. Latest and $Patch_Version
  - Keeping last 5 Images Only in DockerHub
  - All variables set Dynamically
  - Optimized the Docker image using multistage builds to minimize the final image size.



---



2.  **Helm Chart Development:**
    For an advanced challenge, create a Helm chart to simplify application deployment and management within Kubernetes environments.


### Comprehensive Structure Plan for Exposing App via `kepler.notjustdevops.com` Using Terragrunt and Implementing CI/CD

#### 1. **Infrastructure Design (AWS + DNS)**
   - **Domain Setup**: Ensure that `notjustdevops.com` is managed in Route 53 and that you have control over DNS for subdomains (like `kepler.notjustdevops.com`).
   - **Hosted Zone Creation**:
     - Manually create or ensure a Route 53 hosted zone for `kepler.notjustdevops.com`.
     - Create DNS records for `argocd.kepler.notjustdevops.com` and `grafana.kepler.notjustdevops.com`.
   - **SSL Certificates**: Use ACM (AWS Certificate Manager) for obtaining SSL certificates for:
     - `kepler.notjustdevops.com`
     - `argocd.kepler.notjustdevops.com`
     - `grafana.kepler.notjustdevops.com`
   - **Ingress**:
     - Setup NGINX ingress with Let’s Encrypt or ACM to manage certificates.

#### 2. **Kubernetes Environment Setup**
   - **Cluster**: Ensure your EKS (Elastic Kubernetes Service) cluster is set up and configured.
     - If not already done, use Terragrunt for provisioning.
   - **Namespace**: Create namespaces like `kepler`, `argocd`, and `monitoring` (for Grafana/Prometheus) within your Kubernetes cluster.

#### 3. **Helm Chart Deployment Plan**
   - **Helm Chart Creation**:
     - Create a custom Helm chart for the application that includes templates for deployment, service, and ingress.
     - Add values.yaml configuration for scaling, resources, and environment-specific values.
   - **Helm Repositories**:
     - Store the Helm chart in a separate GitHub repo or a Helm Chart repository.
     - Use Helmfile to manage multiple Helm charts (App, ArgoCD, Grafana, Prometheus) for a consistent configuration.

#### 4. **ArgoCD Integration**
   - **ArgoCD Configuration**:
     - Create ArgoCD manifests or Helm chart to deploy the ArgoCD instance.
     - Expose `argocd.kepler.notjustdevops.com` via ingress.
     - Create a project and application in ArgoCD for continuous deployment (watching GitHub repository changes).
   - **Automated Sync**: 
     - Ensure ArgoCD monitors the Helm repository and syncs the `kepler` app and the services like Grafana automatically.

#### 5. **Grafana and Prometheus Setup**
   - **Grafana Deployment**:
     - Use Helm charts to deploy Grafana and Prometheus in the `monitoring` namespace.
     - Expose Grafana at `grafana.kepler.notjustdevops.com` using ingress.
   - **Monitoring**:
     - Configure Prometheus to monitor the cluster and application metrics.
     - Set up alerts for key events (e.g., Slack notifications for failures or deployments).

#### 6. **Terraform + Terragrunt for Infrastructure Automation**
   - **Terraform Modules**:
     - **Route53**: DNS records for ArgoCD and Grafana.
     - **ACM**: SSL certificate management.
     - **EKS**: Ensure your cluster configuration is handled via Terraform.
     - **Ingress**: Terraform module to handle ingress creation for `argocd` and `grafana`.
   - **Terragrunt Folder Structure**:
     ```
     notjust@devops:maven-hello-world us-west-2/(feature/helm) $ tree
    .
    ├── Dvorkin-Guy-From-Kepler-186f-App
     --- APP


    ├── helm
    │   ├── Chart.yaml
    │   ├── templates
    │   │   ├── deployment.yaml
    │   │   ├── _helpers.tpl
    │   │   ├── ingress.yaml
    │   │   └── service.yaml
    │   └── values.yaml
    ├── readme-ido.md
    ├── README.md
    ├── scripts
    │   └── create_structure.sh
    ├── terraform
    │   ├── environments
    │   │   └── dev
    │   │       ├── backend.tf
    │   │       ├── main.tf
    │   │       ├── outputs.tf
    │   │       ├── terraform.tfvars
    │   │       └── variables.tf
    │   └── modules
    │       ├── argocd
    │       │   ├── main.tf
    │       │   ├── outputs.tf
    │       │   └── variables.tf
    │       ├── eks
    │       │   ├── main.tf
    │       │   ├── outputs.tf
    │       │   └── variables.tf
    │       ├── grafana
    │       │   ├── main.tf
    │       │   ├── outputs.tf
    │       │   └── variables.tf
    │       ├── iam
    │       │   ├── main.tf
    │       │   ├── outputs.tf
    │       │   └── variables.tf
    │       ├── ingress
    │       │   ├── main.tf
    │       │   ├── outputs.tf
    │       │   └── variables.tf
    │       ├── monitoring
    │       │   ├── main.tf
    │       │   ├── outputs.tf
    │       │   └── variables.tf
    │       ├── secrets
    │       │   ├── main.tf
    │       │   ├── outputs.tf
    │       │   └── variables.tf
    │       └── vpc
    │           ├── main.tf
    │           ├── outputs.tf
    │           └── variables.tf
    └── terragrunt
        ├── dev
        │   └── terragrunt.hcl
        └── terragrunt.hcl

   - **Terragrunt Workflow**:
     - Each module (like `eks`, `argocd`, and `grafana`) should be reused via Terragrunt for consistency.
     - Store environment-specific configurations in `dev/terraform.tfvars`.
     - Make all secrets configurable via environment variables, using AWS Secrets Manager where needed.

#### 7. **CI/CD Pipeline Setup**
   - **CI (GitHub Actions)**:
     - Define the `.github/workflows/ci-pipeline.yml` for automating the Maven build and Docker image pushing process.
     - Trigger builds on pushes to `feature/helm` branch.
   - **CD (GitHub Actions for ArgoCD) Setup**:
     - Add a `cd-pipeline.yml` in `.github/workflows` for deploying the application via ArgoCD.
     - Use ArgoCD CLI or API in GitHub Actions to trigger deployments after each successful build.
     - Ensure image version bumping and tagging is consistent via GitHub Actions.
   
#### 8. **Access Control & Security**
   - **IAM Roles**: Use least privilege access for Terraform and CI/CD pipelines.
   - **Secrets Management**:
     - Store sensitive information (e.g., DockerHub credentials, ArgoCD admin password) securely in GitHub Secrets and AWS Secrets Manager.
     - Ensure SSL certificates for all endpoints are properly managed through ACM or Let’s Encrypt.
   - **Multi-Environment Setup**: Start with DEV only but plan for future PROD and STAGING environments using the same Terragrunt configuration.

### README.md Plan (Super DevOps Approach)
```
# Kepler-186f DevOps Application

## Overview
This project demonstrates a highly scalable, secure, and automated deployment of the Kepler-186f application using AWS, Kubernetes (EKS), Terragrunt, Helm, and ArgoCD for CI/CD automation.

## Features
- **Kubernetes EKS Cluster**: Managed using Terraform and Terragrunt.
- **ArgoCD Integration**: Continuous deployment monitoring GitHub repository for automatic sync.
- **Grafana & Prometheus**: Monitoring and alerting of the Kubernetes cluster and application.
- **Automated CI/CD Pipelines**: GitHub Actions for CI and ArgoCD for CD with GitOps.
- **Helm for Kubernetes**: Simplified application management and deployment.
- **SSL Encryption**: Secure SSL endpoints managed via AWS ACM for `kepler.notjustdevops.com`.

## Infrastructure Overview
- **AWS**: DNS management, SSL certificates, and Kubernetes.
- **Route53**: DNS for `kepler.notjustdevops.com`.
- **ACM**: SSL certificates for secure communication.
- **EKS**: Kubernetes cluster for running the application and services.
- **Terragrunt**: Reusable infrastructure code for DEV, STAGING, and PROD environments.
  
## Deployment Workflow
1. **Infrastructure Setup**: Use Terragrunt to provision all necessary AWS resources (Route53, ACM, EKS).
2. **Helm Deployment**: Deploy the Kepler-186f app, ArgoCD, and Grafana using Helm charts.
3. **GitOps Deployment**: ArgoCD monitors changes and auto-syncs with Kubernetes.
4. **CI/CD**: Automated build and deployment using GitHub Actions.

## Environment Variables
- `AWS_ACCESS_KEY_ID`: Access key for AWS IAM.
- `AWS_SECRET_ACCESS_KEY`: Secret key for AWS IAM.
- `DOCKER_USERNAME`: DockerHub username for pushing images.
- `DOCKER_PASSWORD`: DockerHub password for authentication.

## Future Improvements
- **Blue/Green Deployments**: For zero-downtime upgrades.
- **Multiple Environments**: Add STAGING and PROD environments with the same reusable infrastructure.
```

### Next Steps
1. **Branch Creation**: Create the `feature/helm` branch for implementing Helm chart.
2. **Terraform & Terragrunt**: Set up Terragrunt for the `dev` environment.
3. **DNS & SSL**: Set up Route 53 and ACM for SSL/TLS.
4. **CI/CD Pipeline**: Integrate GitHub Actions for automated build and deployment with ArgoCD.

This approach uses the latest DevOps best practices, ensuring a smooth and automated workflow from code commit to deployment on `kepler.notjustdevops.com`.



---

data "aws_secretsmanager_secret_version" "grafana_admin_password" {
  secret_id = "grafanaAdminPassword"
}
grafana_admin_password = data.aws_secretsmanager_secret_version.grafana_admin_password.secret_string

---

Using the AWS CLI to manually create resources like DynamoDB (for state locking), S3 (for Terraform state), and Route53 DNS can be a good approach if you prefer to manage those critical resources outside of Terraform and Terragrunt. This method can give you more granular control, but it introduces the need for Terraform and Terragrunt to reference pre-existing resources.



---

Next Steps:
**Leave the Validation Records:** They are valid and necessary for ACM to confirm the domain ownership. No need to modify them.

**Update Placeholder Records:**

Once you have your infrastructure set up (e.g., load balancers or services for Grafana and ArgoCD), you will need to update the CNAME records from example.com to the actual DNS names of your load balancers or services.
Example Command to Update a Record (When Services are Ready):
For example, if your Grafana service is deployed and you have a load balancer DNS name like my-grafana-lb-123456.elb.amazonaws.com, you can update the DNS record like this:


aws route53 change-resource-record-sets \
  --hosted-zone-id Z00790251YCFAM1WK6LNZ \
  --change-batch '{
    "Changes": [{
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "grafana.kepler.notjustdevops.com.",
        "Type": "CNAME",
        "TTL": 300,
        "ResourceRecords": [{
          "Value": "my-grafana-lb-123456.elb.amazonaws.com"
        }]
      }
    }]
  }'
You can do something similar for argocd.kepler.notjustdevops.com when your ArgoCD service is deployed.

--


{
    "ARN": "arn:aws:secretsmanager:us-west-2:864492617736:secret:argocdAdminPassword-0qNt5r",
    "Name": "argocdAdminPassword",
    "VersionId": "46953977-a9c0-4796-8a15-2a9f8fb6957c"
}


{
    "ARN": "arn:aws:secretsmanager:us-west-2:864492617736:secret:dbCredentials-QDLpBx",
    "Name": "dbCredentials",
    "VersionId": "39783ae3-0abb-4ef9-abf1-77a411417435"
}

aws secretsmanager create-secret \
  --name myAPIKey \
  --description "API key for external service" \
  --secret-string "YourAPIKey"


aws secretsmanager create-secret \
  --name apiKeys \
  --description "API keys for multiple services" \
  --secret-string '{"service1":"YourAPIKey1", "service2":"YourAPIKey2"}'


aws secretsmanager create-secret \
  --name customSSLCertificate \
  --description "Custom SSL Certificate" \
  --secret-string '{"private_key":"YourPrivateKey", "certificate":"YourCertificate", "certificate_chain":"YourCertificateChain"}'


---


When building a project that involves infrastructure as code (Terraform) and deploying services (such as NGINX Ingress for Kubernetes), the order of operations is important to ensure that everything is set up properly and that dependencies are respected.

### **Best Practices Order for Building a Project**

1. **Infrastructure Setup with Terraform Community Modules**:
   - **First**, focus on setting up your infrastructure using Terraform modules. This is foundational because the services you deploy later (like NGINX) will rely on this infrastructure.
   - Use community or custom Terraform modules to create the following resources:
     - **VPC**: Networking and security setup.
     - **EKS Cluster**: Kubernetes cluster where your applications will run.
     - **IAM Roles/Permissions**: Ensure all components have the necessary permissions.
     - **S3/DynamoDB (for Terraform state)**: Store your Terraform state in an S3 bucket and use DynamoDB for state locking.

   Example order:
   1. **VPC** (`/terraform/modules/vpc`)
   2. **IAM** (`/terraform/modules/iam`)
   3. **EKS** (`/terraform/modules/eks`)
   4. **Monitoring (if applicable)** (`/terraform/modules/monitoring`)

   Once your Terraform modules are successfully applied, your infrastructure (EKS cluster, networking, IAM roles, etc.) will be ready for service deployment.

2. **Install Kubernetes Components (like NGINX Ingress)**:
   - **After** your infrastructure is in place (EKS cluster), install the **NGINX Ingress Controller** and other Kubernetes components.
   - This ensures that any service you expose through NGINX (like Grafana or ArgoCD) has the necessary infrastructure to run on.
   
   Example steps:
   - Install the NGINX Ingress Controller in the Kubernetes cluster.
   - Deploy **Cert-Manager** for managing SSL certificates (if using Let’s Encrypt).
   - Set up Kubernetes Ingress resources for services like Grafana and ArgoCD.

   This can be done using Helm or Kubernetes manifests, depending on your setup.

3. **Deploy Applications**:
   - With your infrastructure and NGINX Ingress in place, you can start deploying your applications (such as Grafana, ArgoCD, etc.) using Helm or Kubernetes YAML files.
   - Ensure that these applications are correctly configured to use the NGINX Ingress for routing traffic.

### Detailed Project Workflow:
1. **Terraform Setup**:
   - **VPC** (create subnets, route tables, NAT gateway).
   - **EKS Cluster** (provision the cluster).
   - **IAM Roles** (create roles for accessing different AWS services).
   - **S3/DynamoDB** for state management.

2. **Kubernetes Setup**:
   - Install **NGINX Ingress** using Helm or manifests.
   - Set up **Cert-Manager** for SSL certificates.

3. **Deploy Applications**:
   - **ArgoCD**: For continuous deployment.
   - **Grafana**: For monitoring.
   - Any other services you want to expose through NGINX.

### Example Project Flow with Your Structure:
- First, apply the Terraform modules in this order:
  - `/terraform/modules/vpc/`
  - `/terraform/modules/iam/`
  - `/terraform/modules/eks/`
  
- After infrastructure is ready, install NGINX Ingress.
  
- Finally, deploy applications using the ingress configuration:
  - `/terraform/modules/grafana/`
  - `/terraform/modules/argocd/`

### Key Point:
**Infrastructure (Terraform) comes first**, and once it is ready, proceed with installing Kubernetes services (NGINX Ingress, Cert-Manager, etc.), and finally deploy your applications.




ArgoCD Module:
Dependencies: EKS (you need the Kubernetes cluster to deploy ArgoCD).
This module should set up ArgoCD in the Kubernetes cluster created by the EKS module.

Grafana Module:
Dependencies: EKS and IAM (for Grafana's roles and permissions).
You can deploy Grafana to monitor the Kubernetes cluster and set up CloudWatch integration.

Ingress Module:
Dependencies: EKS (as you'll need to deploy Ingress controllers in the cluster).
This module will configure ingress for accessing ArgoCD, Grafana, and other services externally.
After each module is populated, you'll need to make sure the corresponding variables and outputs are correctly defined in the dev environment files and properly referenced in main.tf.

Great! Your Terraform apply was successful, and the EKS cluster along with the associated resources have been provisioned. Here are some key outputs to take note of:

### Key Outputs:
- **EKS Cluster Name**: `dvorkinguy-kepler-app-eks-cluster`
- **EKS Cluster Endpoint**: `https://E199E405F1537DC4CF809FE365EB6AA9.gr7.us-west-2.eks.amazonaws.com`
- **EKS Cluster Version**: `1.24`
- **Node Group**: 
  - **ARN**: `arn:aws:eks:us-west-2:864492617736:nodegroup/dvorkinguy-kepler-app-eks-cluster/dvorkinguy-kepler-app-node-group/58c91065-af63-79e3-b17b-c25d3f7a7280`
  - **Instance Type**: `t3.medium`
  - **Status**: `ACTIVE`
- **VPC ID**: `vpc-0d33a7d81a9bea75d`
- **Public Subnets**: 
  - `subnet-0a09bc79d829eb7ca`
  - `subnet-083872dea3670ead5`
- **Private Subnets**: 
  - `subnet-059f30186aff9269e`
  - `subnet-0a420701bd8ce6aa6`
- **Ingress Domain**: `kepler.notjustdevops.com`
- **Grafana Namespace**: `monitoring`
  
### Next Steps:
1. **Configure Kubectl**: 
   Now that your EKS cluster is up and running, you should configure your `kubectl` to access the cluster. You can run the following command:
   ```bash
   aws eks --region us-west-2 update-kubeconfig --name dvorkinguy-kepler-app-eks-cluster
   ```

2. **Deploy Applications**: 
   You can now start deploying applications to your EKS cluster using Kubernetes manifests or Helm charts.

3. **Ingress Configuration**: 
   If you plan to expose services via the domain `kepler.notjustdevops.com`, you need to configure the ingress resources.

4. **Monitor Cluster**: 
   Make sure to set up monitoring, such as Prometheus or Grafana, which you have set in the `monitoring` namespace.

If you encounter any issues or need further assistance configuring your applications, feel free to reach out!




LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMvakNDQWVhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJME1Ea3lNekl3TXpjeU5Wb1hEVE0wTURreU1USXdNemN5TlZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBS0R3CjY3L09CQ0wyd05KZEc2QjdHZktiMGtXTE9DUFFUZUtuMTlsdWZ0NnlERFNnNGRPUElBUmZoNXE2NmtYUlR5eW4KRVRGSENzLzU3bVZQR3BJMUpBaGZKRU9kT1dZRlg2cHEyQjlRY2tUSVI2NFUxN2lKeVE3VEhhSmtSbFJmcmhmMAozbXcrVWtxRWQzZUNISHFlamduS1R2RGZaZTFxMmdiQnl3QllNcHQwSFdJdXhhdkl3NFBuTzRSenVXaG1rSVdyClFmK3MrM1hWditFelgvdDRBN3RjSlhlWHpjVm9FMWxoV1N6RVVxcTBpSGdnWmJlRTVxbVlQV2dzMlpNRmFYUnMKRG5Ea3B6enRPWnNRdWw3WnVONjZwNkZWTkkyUGFVc2VKNVFhbkZGVEI1RmtiMDB2YVJSU0tzVnVYT2YvYWUrVwo3aEJVaDlSRTZTekJKMnNyOUNzQ0F3RUFBYU5aTUZjd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZJYjZEcVV4c01GWGhoRlk1Q0JxV2twQ2c3V1JNQlVHQTFVZEVRUU8KTUF5Q0NtdDFZbVZ5Ym1WMFpYTXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBQWprS0ZwdlpVTyt0UTZpSU9VSApKMFowb2k4NkhzbkJKTjNJWG96aXdOcDE5b3pvRlNaRTF3LzZYTC82MU5HaVlVQjd4NVJUSVQ1VHFySW5rVW8xCldaZFlJRC9tNUR4OEFBRHFKeU5YTUtCUUJrK3gxbjBuaXp5amJSWnRmc3JFRzYvUVlhTGlYVFg3a2ZvYlZGamEKQ08rRXc4VDV3cWxBU3hObFFqLzdXVDdaTU1MNnU5NE5tTStZUkV5c3ZwMEN4ZEQxYXh3Y3lnU0NjZ01lY0pUaQp2RWMwWVpSYzNETW81OFFPQk56U1lNN2FrZ1V1N3ZPZnBNbzBRQ09YWmpJQUlvVXhlOFk0ckxEbXpSeFlnOHJ0Cnl1MEFQMzVWOEt2TjJ0WGpMd0I2cEltdHBpYW43VlY4YUE5R1hna0c1Z05EeDRTS2VXQjQ2U0syRXNZY3VObm8KNHNFPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==


https://E199E405F1537DC4CF809FE365EB6AA9.gr7.us-west-2.eks.amazonaws.com