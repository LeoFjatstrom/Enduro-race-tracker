document.addEventListener("click", function(e) {
    console.log("Clicked:", e.target)
    if (e.target.classList.contains("add_fields")) {
        e.preventDefault();
        var id = e.target.dataset.id;
        var fields = e.target.dataset.fields.replace(/new_row/g, new Date().getTime());
        document.querySelector('#' + id).insertAdjacentHTML('beforeend', fields);
    }
  
    if (e.target.classList.contains("remove_fields")) {
        e.preventDefault();
        const fieldContainer = e.target.closest(".field");
        const destroyInput = fieldContainer.querySelector("input[type=hidden][name*='_destroy']");
        if (destroyInput) {
          destroyInput.value = '1';
        }
        fieldContainer.style.display = 'none';
      }
  });