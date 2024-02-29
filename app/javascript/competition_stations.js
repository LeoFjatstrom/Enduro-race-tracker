document.addEventListener("turbo:load", function() {
    var competitionTypeSelect = document.getElementById('competition_type_select');
    var checkpointCountContainer = document.getElementById('checkpoint_count_container');
    
    function toggleCheckpointCount() {
      checkpointCountContainer.style.display = competitionTypeSelect.value === 'Enduro' ? 'block' : 'none';
    }
  
    if (competitionTypeSelect) {
      competitionTypeSelect.addEventListener('change', toggleCheckpointCount);
      toggleCheckpointCount(); // Initialize on page load or Turbo visit
    }
  });