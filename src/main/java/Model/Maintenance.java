package Model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

//CREATE TABLE maintenance (
//        maintenanceId INT IDENTITY(1,1) PRIMARY KEY,
//maintenanceName VARCHAR(255) NOT NULL,
//maintenanceDescription TEXT,
//maintenanceDate DATE,
//maintenanceTime TIME,
//maintenanceStatus BIT DEFAULT 0,
//userId INT,
//createdDate DATETIME DEFAULT GETDATE(),
//updatedDate DATETIME DEFAULT GETDATE(),
//FOREIGN KEY (userId) REFERENCES users(userID)
//        );
public class Maintenance {
    private int maintenanceId;
    private String maintenanceName;
    private String maintenanceDescription;
    private String maintenanceDate;
    private String maintenanceTime;
    private boolean maintenanceStatus;
    private int userId;
    private String createdDate;
    private boolean isCancel;

    public boolean isCancel() {
        return isCancel;
    }

    public void setCancel(boolean cancel) {
        isCancel = cancel;
    }

    public boolean isStatusString() {
        return statusString;
    }


    public String getExpectedReturnDate() {
        return expectedReturnDate;
    }

    public void setExpectedReturnDate(String expectedReturnDate) {
        this.expectedReturnDate = expectedReturnDate;
    }

    private String expectedReturnDate;

    public Boolean getStatus() {
        return statusString;
    }

    public void setStatus(Boolean statusString) {
        this.statusString = statusString;
    }

    private String updatedDate;
    private Boolean statusString;

    public Maintenance() {
    }

    public Maintenance(int maintenanceId, String maintenanceName, String maintenanceDescription, String maintenanceDate, String maintenanceTime, boolean maintenanceStatus, int userId, String createdDate, boolean isCancel) {
        this.maintenanceId = maintenanceId;
        this.maintenanceName = maintenanceName;
        this.maintenanceDescription = maintenanceDescription;
        this.maintenanceDate = maintenanceDate;
        this.maintenanceTime = maintenanceTime;
        this.maintenanceStatus = maintenanceStatus;
        this.userId = userId;
        this.createdDate = createdDate;
        this.isCancel = isCancel;
        SetExpectedReturnDate();
    }

    public boolean isMaintenanceStatus() {
        return maintenanceStatus;
    }

    public void setMaintenanceStatus(boolean maintenanceStatus) {
        this.maintenanceStatus = maintenanceStatus;
    }

    public void setMaintenanceId(int maintenanceId) {
        this.maintenanceId = maintenanceId;
    }

    public String getMaintenanceName() {
        return maintenanceName;
    }

    public void setMaintenanceName(String maintenanceName) {
        this.maintenanceName = maintenanceName;
    }

    public String getMaintenanceDescription() {
        return maintenanceDescription;
    }

    public void setMaintenanceDescription(String maintenanceDescription) {
        this.maintenanceDescription = maintenanceDescription;
    }

    public String getMaintenanceDate() {
        return maintenanceDate;
    }

    public void setMaintenanceDate(String maintenanceDate) {
        this.maintenanceDate = maintenanceDate;
    }

    public String getMaintenanceTime() {
        return maintenanceTime;
    }

    public void setMaintenanceTime(String maintenanceTime) {
        this.maintenanceTime = maintenanceTime;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }

    public Maintenance(int maintenanceId, String maintenanceName, String maintenanceDescription, String maintenanceDate, String maintenanceTime, boolean maintenanceStatus, int userId, String createdDate, String updatedDate) {
        this.maintenanceId = maintenanceId;
        this.maintenanceName = maintenanceName;
        this.maintenanceDescription = maintenanceDescription;
        this.maintenanceDate = maintenanceDate;
        this.maintenanceTime = maintenanceTime;
        this.maintenanceStatus = maintenanceStatus;
        this.userId = userId;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        SetExpectedReturnDate();
    }

    public int getMaintenanceId() {
        return maintenanceId;
    }

    public void SetExpectedReturnDate() {
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss.SSSSSSS");

        String maintenanceTime = getMaintenanceTime().toString();
        LocalDate date = LocalDate.parse(getMaintenanceDate(), dateFormatter);
        LocalTime time = LocalTime.parse(maintenanceTime, timeFormatter); // Updated to use the new formatter

        LocalDateTime maintenanceDateTime = LocalDateTime.of(date, time);

        LocalDateTime expectedReturnDateTime = maintenanceDateTime.plusDays(3);

        this.expectedReturnDate = expectedReturnDateTime.format(DateTimeFormatter.ofPattern("HH:mm - dd/MM/yyyy "));
    }

}
