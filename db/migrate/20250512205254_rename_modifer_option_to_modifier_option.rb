class RenameModiferOptionToModifierOption < ActiveRecord::Migration[8.0]
  def change
    rename_table :modifer_options, :modifier_options
  end
end
