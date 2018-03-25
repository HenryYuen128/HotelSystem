package com.crud.bean;

public class Room {
    private Integer id;

    private String roomnumber;

    private Integer size;

    private Double price;

    private Integer book;

    private Integer computer;

    private Integer garden;

    private Integer freebreakfast;

    private Integer dailyclean;

    private String pic;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoomnumber() {
        return roomnumber;
    }

    public void setRoomnumber(String roomnumber) {
        this.roomnumber = roomnumber == null ? null : roomnumber.trim();
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getBook() {
        return book;
    }

    public void setBook(Integer book) {
        this.book = book;
    }

    public Integer getComputer() {
        return computer;
    }

    public void setComputer(Integer computer) {
        this.computer = computer;
    }

    public Integer getGarden() {
        return garden;
    }

    public void setGarden(Integer garden) {
        this.garden = garden;
    }

    public Integer getFreebreakfast() {
        return freebreakfast;
    }

    public void setFreebreakfast(Integer freebreakfast) {
        this.freebreakfast = freebreakfast;
    }

    public Integer getDailyclean() {
        return dailyclean;
    }

    public void setDailyclean(Integer dailyclean) {
        this.dailyclean = dailyclean;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }
}