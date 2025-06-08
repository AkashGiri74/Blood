package servlets;

import java.sql.Timestamp;

public class BloodRequest {
    private int id;
    private String name;
    private String mobileNumber;
    private String city;
    private String bloodGroup;
    private Timestamp requestDate;

    public BloodRequest(int id, String name, String mobileNumber, String city, String bloodGroup, Timestamp requestDate) {
        this.id = id;
        this.name = name;
        this.mobileNumber = mobileNumber;
        this.city = city;
        this.bloodGroup = bloodGroup;
        this.requestDate = requestDate;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public String getCity() {
        return city;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public Timestamp getRequestDate() {
        return requestDate;
    }
}
