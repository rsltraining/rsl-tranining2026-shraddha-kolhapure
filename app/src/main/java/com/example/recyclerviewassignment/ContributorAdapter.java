package com.example.recyclerviewassignment;

import android.app.AlertDialog;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;
import java.util.List;

public class ContributorAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private static final int TYPE_A = 0;
    private static final int TYPE_B = 1;

    private final List<Contributor> contributorList;
    private final int screenHeight;

    public ContributorAdapter(List<Contributor> contributorList, int screenHeight) {
        this.contributorList = contributorList;
        this.screenHeight = screenHeight;
    }

    @Override
    public int getItemViewType(int position) {
        return (position % 3 == 0) ? TYPE_A : TYPE_B;
    }

    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        if (viewType == TYPE_A) {
            View view = inflater.inflate(R.layout.item_cell_a, parent, false);
            return new ViewHolderA(view);
        } else {
            View view = inflater.inflate(R.layout.item_cell_b, parent, false);

            ViewGroup.LayoutParams params = view.getLayoutParams();
            params.height = screenHeight / 2;
            view.setLayoutParams(params);

            return new ViewHolderB(view);
        }
    }

    @Override
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder holder, int position) {
        Contributor contributor = contributorList.get(position);
        Context context = holder.itemView.getContext();

        if (holder.getItemViewType() == TYPE_A) {
            ViewHolderA holderA = (ViewHolderA) holder;
            holderA.tvName.setText(contributor.getName());
            holderA.tvFollowers.setText("Followers: " + contributor.getFollowers());
            holderA.tvContributions.setText("Contributions: " + contributor.getContributions());

            holderA.itemView.setOnClickListener(v -> Toast.makeText(context,
                    "Type#a: followers: " + contributor.getFollowers() + ", contributions: " + contributor.getContributions(),
                    Toast.LENGTH_SHORT).show());
        } else {
            ViewHolderB holderB = (ViewHolderB) holder;
            holderB.tvName.setText(contributor.getName());
            holderB.tvFollowers.setText("Followers: " + contributor.getFollowers());
            holderB.tvContributions.setText("Contributions: " + contributor.getContributions());
            holderB.tvLocation.setText("Location: " + contributor.getLocation());

            holderB.itemView.setOnClickListener(v -> Toast.makeText(context,
                    "Type#b: followers: " + contributor.getFollowers() + ", contributions: " + contributor.getContributions(),
                    Toast.LENGTH_SHORT).show());
        }

        holder.itemView.setOnLongClickListener(v -> {
            new AlertDialog.Builder(context)
                    .setTitle("Delete Item")
                    .setMessage("Remove " + contributor.getName() + " from the list?")
                    .setPositiveButton("Delete", (dialog, which) -> {
                        int currentPos = holder.getAdapterPosition();
                        if (currentPos != RecyclerView.NO_POSITION) {
                            contributorList.remove(currentPos);
                            notifyItemRemoved(currentPos);
                            notifyItemRangeChanged(currentPos, contributorList.size());
                        }
                    })
                    .setNegativeButton("Cancel", null)
                    .show();
            return true;
        });
    }

    @Override
    public int getItemCount() {
        return contributorList.size();
    }

    static class ViewHolderA extends RecyclerView.ViewHolder {
        TextView tvName, tvFollowers, tvContributions;
        ViewHolderA(@NonNull View itemView) {
            super(itemView);
            tvName = itemView.findViewById(R.id.tvNameA);
            tvFollowers = itemView.findViewById(R.id.tvFollowersA);
            tvContributions = itemView.findViewById(R.id.tvContributionsA);
        }
    }

    static class ViewHolderB extends RecyclerView.ViewHolder {
        TextView tvName, tvFollowers, tvContributions, tvLocation;
        ViewHolderB(@NonNull View itemView) {
            super(itemView);
            tvName = itemView.findViewById(R.id.tvNameB);
            tvFollowers = itemView.findViewById(R.id.tvFollowersB);
            tvContributions = itemView.findViewById(R.id.tvContributionsB);
            tvLocation = itemView.findViewById(R.id.tvLocationB);
        }
    }
}