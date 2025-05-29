document.addEventListener('DOMContentLoaded', function() {
  // Initialize Foundation
  $(document).foundation();

  // Handle quantity field changes
  $('.quantity-field').on('change', function() {
    const $field = $(this);
    const currentQuantity = parseFloat($field.data('current'));
    const newQuantity = parseFloat($field.val());
    const $reasonSelect = $(`#${$field.data('modal-id')} .audit-reason-select`);
    
    // Get the reasons from data attributes
    const increaseReasons = $field.data('increase-reasons');
    const decreaseReasons = $field.data('decrease-reasons');
    
    // Clear current options
    $reasonSelect.empty();
    
    // Add appropriate options based on quantity change
    if (newQuantity > currentQuantity) {
      // Increase
      increaseReasons.forEach(reason => {
        $reasonSelect.append(new Option(reason, reason));
      });
    } else if (newQuantity < currentQuantity) {
      // Decrease
      decreaseReasons.forEach(reason => {
        $reasonSelect.append(new Option(reason, reason));
      });
    } else {
      // Same quantity - show both sets of reasons
      const allReasons = [...new Set([...increaseReasons, ...decreaseReasons])];
      allReasons.forEach(reason => {
        $reasonSelect.append(new Option(reason, reason));
      });
    }
    
    // Add prompt option
    $reasonSelect.prepend(new Option("Select a reason", ""));
    $reasonSelect.val(""); // Reset to prompt
  });
}); 