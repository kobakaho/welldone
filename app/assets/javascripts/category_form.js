document.addEventListener("turbo:load", function() {
  function appendOption(category) {
    let html = `<option value='${category.id}' data-category='${category.id}'>${category.name}</option>`;
    return html;
  }

  function appendChildrenBox(insertHTML) {
    let childrenSelectHtml = '';
    childrenSelectHtml = `
      <div id='children-wrapper'>
        <select id='children-category' class='form-control' name='[childen_id]'>
          <option value='---' data-category='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    $('.category-form').append(childrenSelectHtml);
  }

  function appendGrandchildrenBox(insertHTML) {
    let grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `
      <div id='grandchildren-wrapper'>
        <select id='grandchildren-category' class='form-control' name='[grandchilden_id]'>
          <option value='---' data-category='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
      `;
      $('.category-form').append(grandchildrenSelectHtml);
  }

  document.addEventListener("turbo:load", function() {
    $('#parent-category').on('change', function() {
      let parentId = document.getElementById('parent-category').value;
      if (parentId != '---') {
        $.ajax({
          url: '/get_category/children',
          type: 'GET',
          data: {
            parent_id: parentId
          },
          dataType: 'json',
        })
          .done(function(children) {
            $('#children-wrapper').remove();
            $('#grandchildren-wrapper').remove();
            let insertHTML = '';
            children.forEach(function(children) {
              insertHTML += appendOption(children);
            });
            appendChildrenBox(insertHTML);
          })
          .fail(function() {
            alert('カテゴリー取得に失敗しました');
          });
      } else {
        $('#children-wrapper').remove();
        $('#grandchildren-wrapper').remove();
      }
    });
  });

  document.addEventListener("turbo:load", function() {
    $('.category-form').on('change', '#children-category', function() {
      let childrenId = $('#children-categoy option:selected').data('category');
      if (childrenId != '---') {
        $.ajax({
          url: '/get_category/grandchildren',
          type: 'GET',
          data: {
            children_id: childrenId
          },
          dataType: 'json',
        })
          .done(function(grandchildren) {
            if (grandchildren.length != 0) {
              $('#grandchildren-wrapper').remove();
              let insertHTML = '';
              grandchildren.forEach(function(grandchildren) {
                insertHTML += appendOption(grandchildren);
            });
            appendGrandchildrenBox(insertHTML);
            }
          })
          .fail(function() {
            alert('カテゴリー取得に失敗しました');
          });
      } else {
        $('#grandchildren-wrapper').remove();
      }
    });
  });
});