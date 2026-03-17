package com.healthcare.models;

import java.sql.Timestamp;

public class Appointment {
    private int id;
    private String patientName;
    private String consultationType;
    private String mobile;
    private String patientType;
    private Timestamp createdAt;
    private boolean completed;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }

    public String getConsultationType() { return consultationType; }
    public void setConsultationType(String consultationType) { this.consultationType = consultationType; }

    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }

    public String getPatientType() { return patientType; }
    public void setPatientType(String patientType) { this.patientType = patientType; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public boolean isCompleted() { return completed; }
    public void setCompleted(boolean completed) { this.completed = completed; }

    @Override
    public String toString() {
        return "Appointment{" +
                "id=" + id +
                ", patientName='" + patientName + '\'' +
                ", consultationType='" + consultationType + '\'' +
                ", mobile='" + mobile + '\'' +
                ", patientType='" + patientType + '\'' +
                ", createdAt=" + createdAt +
                ", completed=" + completed +
                '}';
    }
}
