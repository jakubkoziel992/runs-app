package pl.zostandevopsem.data;

import jakarta.persistence.Entity;
import java.time.LocalDate;

@Entity
public class Runs extends AbstractEntity {

    private LocalDate date;
    private Integer distance;

    public LocalDate getDate() {
        return date;
    }
    public void setDate(LocalDate date) {
        this.date = date;
    }
    public Integer getDistance() {
        return distance;
    }
    public void setDistance(Integer distance) {
        this.distance = distance;
    }

}
