package com.sakt.shortnote;

import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Insert;
import androidx.room.Query;
import androidx.room.Update;

import java.util.List;

@Dao
public interface ExpenseDao {

    @Query("Select * from expense")
    List<Expense> getAllExpense();

    @Insert
    void addTxt(Expense expense);

    @Update
    void updateTxt(Expense expense);

    @Delete
    void deleteTxt(Expense expense);


}

