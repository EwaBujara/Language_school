document.addEventListener("DOMContentLoaded", function() {

  showHideDetails("A");
});

function showHideDetails(identifier) {
    try
    {
        var obj = document.getElementsByTagName(identifier);
        obj.forEach(elem => elem.innerHTML='Proposal');
        // alert(obj.innerHTML);
        // obj.innerText = 'Proposal';
    }
    catch (err)
    {
        alert(err);
    }
}