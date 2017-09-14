function createRow(json) {
  var row = '<tr>';
  row += `<td>${json.id}</td>`;
  row += `<td>${json.author}</td>`;
  row += `<td>${json.title}</td>`;
  row += `<td>${json.publisher}</td>`;
  row += `<td>${json.editorial}</td>`;
  row += `<td>${json.year}</td>`;
  row += `<td>${json.link}</td>`;
  row += `<td>${json.price}</td>`;
  row += '</tr>';
  return row;
}
$(function () {
  $('form').on('submit', function (event) {
    event.preventDefault();
    $form = $(this);
    $.ajax({
      type: "POST",
      url: $form.attr('action'),
      data: $form.serialize(),
      dataType: "JSON",
      success: function (result) {
        console.log(result);
        var row = createRow(result);
        $('#suggestionsTable > tbody:last-child').append(row);
        return false;
      },
      error: function (err) {
        console.log(err);
        return false;
      }
    });
    return false;
  });
});