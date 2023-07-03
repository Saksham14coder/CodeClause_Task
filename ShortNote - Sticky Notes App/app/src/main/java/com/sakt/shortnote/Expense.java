package com.sakt.shortnote;

import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.Ignore;
import androidx.room.PrimaryKey;

@Entity
public class Expense {

    @PrimaryKey(autoGenerate = true)
    public int id;

    @ColumnInfo(name = "titles")
    public String title;

    @ColumnInfo(name = "description")
    public String description;

    Expense(int id, String title, String description ){

        this.id= id;
        this.title = title;
        this.description =description;
    }

    @Ignore
    Expense(String title, String description ){

        this.title = title;
        this.description =description;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

