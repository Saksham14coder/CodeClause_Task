package com.sakt.shortnote;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.Dialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    RecyclerView recyclerView;

    FloatingActionButton btn1;
    //AdView adView;
    DatabaseHelper databaseHelper;
    TextView txtcreate;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        databaseHelper = DatabaseHelper.getDB(this);
        btn1 = findViewById(R.id.btn1);
        //adView = findViewById(R.id.adView);
        txtcreate =findViewById(R.id.textcreate);
        recyclerView = findViewById(R.id.recycleNote);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));


        showData();


        btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Dialog dialog = new Dialog(MainActivity.this);
                dialog.setContentView(R.layout.set_notes);

                EditText edt1,edt2;
                Button btn2;

                edt1 = dialog.findViewById(R.id.edt1);
                edt2= dialog.findViewById(R.id.edt2);
                btn2 = dialog.findViewById(R.id.btn2);

                btn2.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {

                        String title = edt1.getText().toString();
                        String description = edt2.getText().toString();

                        if (!description.equals("")){
                            databaseHelper.expenseDao().addTxt(
                                    new Expense(title,description)
                            );
                            showData();
                            dialog.dismiss();

                        }else {
                            Toast.makeText(MainActivity.this, "Please enter Content", Toast.LENGTH_SHORT).show();
                        }
                    }
                });
                dialog.show();



            }
        });



    }
    public void showData() {

        ArrayList<Expense> arrNotes = (ArrayList<Expense>) databaseHelper.expenseDao().getAllExpense();

        if (arrNotes.size() > 0) {

            recyclerView.setVisibility(View.VISIBLE);
            txtcreate.setVisibility(View.GONE);

            recyclerView.setAdapter(new Recycle_notes(arrNotes, this,databaseHelper));
        }else {
            recyclerView.setVisibility(View.GONE);
            txtcreate.setVisibility(View.VISIBLE);
        }
    }
}



