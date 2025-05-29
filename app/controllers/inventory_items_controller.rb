class InventoryItemsController < ApplicationController
  def index
    @inventory_items = InventoryItem.includes(:ingredient, :staff_member).all
    @staff_members = StaffMember.all
    @update_reasons_increase = InventoryItem::UPDATE_REASONS_INCREASE
    @update_reasons_decrease = InventoryItem::UPDATE_REASONS_DECREASE
  end

  def show
    @inventory_item = InventoryItem.find(params[:id])
    @inventory_item_history = @inventory_item.audits
    @update_reasons_increase = InventoryItem::UPDATE_REASONS_INCREASE
    @update_reasons_decrease = InventoryItem::UPDATE_REASONS_DECREASE
    @staff_members = StaffMember.all
  end

  def create
    # TODO: Implement create later
  end

  def update
    @inventory_item = InventoryItem.find(params[:id])

    Audited.current_user_method = :staff_member

    if @inventory_item.update(inventory_item_params)
      respond_to do |format|
        format.html { redirect_to inventory_items_path, notice: "Inventory item was successfully updated." }
        format.json { render json: @inventory_item }
      end
    else
      respond_to do |format|
        format.html { redirect_to inventory_items_path, alert: "Failed to update inventory item." }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def inventory_item_params
    params.require(:inventory_item).permit(:quantity, :updated_by_id, :audit_comment)
  end

  def staff_member
    StaffMember.find(inventory_item_params[:updated_by_id])
  end
end
