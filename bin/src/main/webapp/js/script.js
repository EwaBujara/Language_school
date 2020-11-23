document.addEventListener("DOMContentLoaded", function() {

  showHideDetails("table tr.table-info a");
});

function showHideDetails(identifier) {
    try
    {
        var obj = document.querySelectorAll(identifier);
        obj.forEach(elem => {
            // elem.innerHTML='Proposal';
            // alert(elem.innerHTML);
            elem.innerText = 'Proposal';
        });
    }
    catch (err)
    {
        alert(err);
    }
}