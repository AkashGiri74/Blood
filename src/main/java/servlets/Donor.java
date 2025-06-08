package servlets;

public class Donor {
    private int id;
    private String name;
    private String city;
    private String bloodGroup;
    private String email;
    private String mobileNumber; // Corrected variable name

    // Constructor including MobileNumber
    public Donor(int id, String name, String email, String city, String bloodGroup, String mobileNumber) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.city = city;
        this.bloodGroup = bloodGroup;
        this.mobileNumber = mobileNumber; // Initialize mobile number
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCity() {
        return city;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public String getEmail() {  // Add getter for email
        return email;
    }

    public String getMobileNumber() {  // Add getter for mobile number
        return mobileNumber;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setMobileNumber(String mobileNumber) {  // Add setter for mobile number
        this.mobileNumber = mobileNumber;
    }
}
