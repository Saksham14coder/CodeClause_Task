package com.sakt.calculatorapp;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import org.mozilla.javascript.Context;
import org.mozilla.javascript.Scriptable;

public class MainActivity extends AppCompatActivity {

    ImageView b1,b2,b3,b4,b5,b6,b7,b8,b9,b0;
    ImageView b_dot,b_ac,b_equal,b_module,b_add,b_sub,b_multi,b_divide;
    String data;
    TextView input,output;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();




        b0= findViewById(R.id.b0);
        b1= findViewById(R.id.b1);
        b2= findViewById(R.id.b2);
        b3= findViewById(R.id.b3);
        b4= findViewById(R.id.b4);
        b5= findViewById(R.id.b5);
        b6= findViewById(R.id.b6);
        b7= findViewById(R.id.b7);
        b8= findViewById(R.id.b8);
        b9= findViewById(R.id.b9);

        b_dot= findViewById(R.id.b_dot);
        b_ac= findViewById(R.id.b_ac);
        b_add= findViewById(R.id.b_add);
        b_sub= findViewById(R.id.b_sub);
        b_multi= findViewById(R.id.b_multi);
        b_module= findViewById(R.id.b_module);
        b_equal= findViewById(R.id.b_equal);
        input =findViewById(R.id.input);
        output =findViewById(R.id.output);
        b_divide =findViewById(R.id.b_divide);


        b0.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"0");
            }
        });

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"1");
            }
        });

        b2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"2");
            }
        });

        b3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"3");
            }
        });

        b4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"4");
            }
        });

        b5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"6");
            }
        });

        b6.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"6");
            }
        });

        b7.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"7");
            }
        });

        b8.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"8");
            }
        });

        b9.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"9");
            }
        });

        b_dot.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+".");
            }
        });

        b_ac.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                input.setText("");
                output.setText("");
            }
        });


        b_add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"+");
            }
        });

        b_sub.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"-");
            }
        });

        b_module.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"%");
            }
        });

        b_multi.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"×");
            }
        });

        b_divide.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();
                input.setText(data+"÷");
            }
        });

        b_equal.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                data = input.getText().toString();

                if (data == ""){
                    Toast.makeText(MainActivity.this, "", Toast.LENGTH_SHORT).show();
                }

                data = data.replaceAll("×","*");
                data = data.replaceAll("%","/100");
                data = data.replaceAll("÷","/");

                Context rhino = Context.enter();
                rhino.setOptimizationLevel(-1);

                String finalResult="";

                Scriptable scriptable = rhino.initStandardObjects();
                finalResult = rhino.evaluateString(scriptable,data,"Javsscript",1,null).toString();

                output.setText(finalResult);
            }
        });


    }
}