package com.example.temperatureconverter;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    EditText et1;
    Spinner sp1,sp2;
    Button b1;
    TextView tv3;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        et1=findViewById(R.id.et1);
        sp1=findViewById(R.id.sp1);
        sp2=findViewById(R.id.sp2);
        b1=findViewById(R.id.b1);
        tv3=findViewById(R.id.tv3);

        String[] from= {"Celsius", "Fahrenheit"};
        ArrayAdapter ad1=new ArrayAdapter<String>(this,R.layout.support_simple_spinner_dropdown_item,from);
        sp1.setAdapter(ad1);

        String[] to= {"Fahrenheit", "Celsius"};
        ArrayAdapter ad2=new ArrayAdapter<String>(this,R.layout.support_simple_spinner_dropdown_item,to);
        sp2.setAdapter(ad2);

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Double tot;
                Double t1=Double.parseDouble(et1.getText().toString());

                if(sp1.getSelectedItem().toString()=="Celsius" && sp2.getSelectedItem().toString()=="Fahrenheit")
                {
                    tot=(t1*9/5)+32;
                    tv3.setText(String.valueOf(tot));
                }
                else if(sp1.getSelectedItem().toString()=="Fahrenheit" && sp2.getSelectedItem().toString()=="Celsius")
                {
                    tot=(t1-32)*5/9;
                    tv3.setText(String.valueOf(tot));
                }
                else if(sp1.getSelectedItem().toString()=="Fahrenheit" && sp2.getSelectedItem().toString()=="Fahrenheit")
                {
                    tot=t1;
                    tv3.setText(String.valueOf(tot));
                }
                else if(sp1.getSelectedItem().toString()=="Celsius" && sp2.getSelectedItem().toString()=="Celsius")
                {
                    tot=t1;
                    tv3.setText(String.valueOf(tot));
                }
            }
        });
    }
}
