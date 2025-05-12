class AllowNullModifierMenuItems < ActiveRecord::Migration[8.0]
  def change
    change_column_null :menu_items, :modifier_id, true
  end
end
