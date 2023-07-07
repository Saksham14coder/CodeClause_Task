package com.sakt.shortnote;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.orhanobut.dialogplus.DialogPlus;
import com.orhanobut.dialogplus.ViewHolder;

import java.util.ArrayList;

public class Recycle_notes extends RecyclerView.Adapter<Recycle_notes.ViewHolder>{

    ArrayList<Expense> arrNotes = new ArrayList<>();
    Context context;
    DatabaseHelper databaseHelper;

    public Recycle_notes(ArrayList<Expense> arrNotes, Context context, DatabaseHelper databaseHelper) {
        this.arrNotes = arrNotes;
        this.context = context;
        this.databaseHelper = databaseHelper;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType){

        View view= LayoutInflater.from(context).inflate(R.layout.notes_template,parent,false);

        ViewHolder viewHolder=new ViewHolder(view);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, @SuppressLint("RecyclerView") int position){

        // Expense modal=(Expense)arrCourseList.get(position);


        holder.textTitle.setText(arrNotes.get(position).getTitle());
        holder.textDescription.setText(arrNotes.get(position).getDescription());

        holder.llRow.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {

                AlertDialog dialog =   new AlertDialog.Builder(context)
                        .setTitle("Delete")
                        .setMessage("Are you sure to delete")
                        .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {

                                databaseHelper.expenseDao().deleteTxt(new Expense(arrNotes.get(position).getId(),arrNotes.get(position).getTitle(),
                                        arrNotes.get(position).getDescription()));
                                ((MainActivity)context).showData();
                            }
                        })
                        .setNegativeButton("No", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {

                            }
                        })
                        .show();

                return true;
            }
        });

        holder.llRow.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                final DialogPlus dialogPlus = DialogPlus.newDialog(holder.textTitle.getContext())
                        .setContentHolder(new com.orhanobut.dialogplus.ViewHolder(R.layout.dialog))
                        .setExpanded(true,1200)
                        .create();

                View myview = dialogPlus.getHolderView();
                EditText tit = myview.findViewById(R.id.edt_name);
                EditText des = myview.findViewById(R.id.edt_age);
                tit.setText(arrNotes.get(position).getTitle());
                des.setText(arrNotes.get(position).getDescription());
                dialogPlus.show();
                Button btn= myview.findViewById(R.id.btn_update);
                btn.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        databaseHelper.expenseDao().updateTxt(new Expense(arrNotes.get(position).getId(),tit.getText().toString(),des.getText().toString()));
                        ((MainActivity)context).showData();
                        Toast.makeText(holder.textTitle.getContext(), "Update", Toast.LENGTH_SHORT).show();
                        dialogPlus.dismiss();
                    }
                });
            }
        });

        holder.toCall.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String num = arrNotes.get(position).getDescription();

                Intent intent = new Intent(Intent.ACTION_DIAL);
                intent.setData(Uri.parse("tel:"+num));
                holder.itemView.getContext().startActivity(intent);
            }
        });


    }
    @Override
    public int getItemCount() {

        return arrNotes.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder{


        TextView textTitle,textDescription;
        LinearLayout llRow;
        ImageView toCall;


        public ViewHolder(@NonNull View itemView){
            super(itemView);


            textTitle=itemView.findViewById(R.id.txttitle);
            textDescription=itemView.findViewById(R.id.txtdescription);
            llRow=itemView.findViewById(R.id.llRow);
            toCall = itemView.findViewById(R.id.toCall);

        }
    }
}
