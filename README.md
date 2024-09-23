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

2.  **Helm Chart Development:** (Optional)
    For an advanced challenge, create a Helm chart to simplify application deployment and management within Kubernetes environments.

**Bonus Objective: Multi-Stage Docker**

For an additional challenge, optimize your Docker image size by implementing a multi-stage build process. Explore resources on "Multi-stage Docker builds" using your trusty "Google" device.

        --> Completed.

**Remember:** Throughout this operation, if you encounter difficulties, leverage the vast knowledge repository known as "Google" for assistance.

**Upon successful program execution, a beacon will be activated, and a rescue mission will be dispatched. Prepare for an imminent departure from your curious planet, Terran!**


# Additional Implemethations.

  - Added Tests
  - Added 2 Images Upload. Latest and $Patch_Version
  - Keeping last 5 Images Only in DockerHub
  - All variables set Dynamically
  - Optimized the Docker image using multistage builds to minimize the final image size.

