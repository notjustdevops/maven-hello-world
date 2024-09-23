package com.myapp;

import static spark.Spark.*;
import com.google.gson.Gson; // Import Gson to handle JSON

public class App {
    public static void main(String[] args) {
        // Set the port to 8080
        port(8080);

        // Define a route for the root URL that returns the "Hello World" message
        get("/", (req, res) -> getGreeting());

        // Add a new route to return JSON data
        get("/info", (req, res) -> {
            res.type("application/json");
            // Create an info object with version and author data
            Info info = new Info("0.0.11", "Dvorkin Guy", "Dvorkin-Guy-From-Kepler-186f-App");
            // Convert the object to JSON
            return new Gson().toJson(info);
        });

        // Print a message to the console to confirm the server is running
        System.out.println("Server is running on http://localhost:8080/");
    }

    // Method that returns the greeting message with updated version string
    public static String getGreeting() {
        return "Hello World, this is Dvorkin Guy v0.0.11!";
    }
}

// Define a new class for the /info route
class Info {
    private String version;
    private String author;
    private String appName;

    public Info(String version, String author, String appName) {
        this.version = version;
        this.author = author;
        this.appName = appName;
    }

    // Getters for the fields
    public String getVersion() {
        return version;
    }

    public String getAuthor() {
        return author;
    }

    public String getAppName() {
        return appName;
    }
}
