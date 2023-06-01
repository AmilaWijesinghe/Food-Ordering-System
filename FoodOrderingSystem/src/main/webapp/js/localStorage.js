$(document).ready(function() {
    // Update total price when quantity changes
    $('.quantity input').on('input', function() {
        updateTotalPrice();
        saveQuantity($(this));
    });

    // Calculate and update the total price
    function updateTotalPrice() {
        var totalPrice = 0;
        $('.table tbody tr').each(function() {
            var quantity = parseInt($(this).find('.quantity input').val()) || 0; // Default to 0 if NaN
            var price = parseFloat($(this).find('.quantity input').data('price')) || 0; // Default to 0 if NaN
            var rowTotal = quantity * price;
            $(this).find('.total-price').text('Rs.' + rowTotal.toFixed(2));
            totalPrice += rowTotal;
        });

        $('#final-amount').text('Rs.' + (totalPrice || 0).toFixed(2)); // Default to 0 if totalPrice is NaN
    }

    // Save quantity to localStorage
    function saveQuantity(inputElement) {
        var productId = inputElement.closest('tr').index();
        var quantity = inputElement.val();
        localStorage.setItem('quantity_' + productId, quantity);
    }

    // Restore quantity from localStorage and calculate total price
    function restoreQuantity() {
        var totalPrice = 0;
        $('.table tbody tr').each(function() {
            var productId = $(this).index();
            var quantity = localStorage.getItem('quantity_' + productId);
            if (quantity) {
                $(this).find('.quantity input').val(quantity);
                var price = parseFloat($(this).find('.quantity input').data('price')) || 0; // Default to 0 if NaN
                var rowTotal = quantity * price;
                $(this).find('.total-price').text('Rs.' + rowTotal.toFixed(2));
                totalPrice += rowTotal;
            }
        });
        $('#final-amount').text('Rs.' + (totalPrice || 0).toFixed(2)); // Default to 0 if totalPrice is NaN
    }

    // Initialize the total price and restore quantities on page load
    restoreQuantity(); // Call restoreQuantity() on page load
    updateTotalPrice();
    
    //$('#checkout').click(function() {
       // localStorage.clear();
        // Optional: Reload the page after clearing the data
        // location.reload();
        
   // });
});