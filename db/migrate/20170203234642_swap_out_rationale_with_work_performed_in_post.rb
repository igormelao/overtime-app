class SwapOutRationaleWithWorkPerformedInPost < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :rationale, :work_permormed
  end
end
