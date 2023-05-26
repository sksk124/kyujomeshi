class ChangeAdminIdToZero < ActiveRecord::Migration[6.1]
  def up
    change_column_default :admins, :id, from: nil, to: 0
  end

  def down
    change_column_default :admins, :id, from: 0, to: nil
  end
end
