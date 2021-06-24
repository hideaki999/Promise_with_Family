var i = 2;

window.addForm = function () {
  // 挿入する親のadd_fieldを取得
  var parent = document.getElementById("form");

  // コピーする要素取
  var form_area = document.getElementById("add_field");
  var clone_form_area = form_area.cloneNode(true);

  // プルダウン作成
  clone_select_area = clone_form_area.querySelector("select");
  clone_select_area.id = `family_relationship_id${i}`;
  clone_select_area.name = `family[relationship_id${i}]`;

  // label作成
  clone_label_area = clone_form_area.querySelector("label");
  clone_label_area.class = `sign_up_family_name${i}`;

  // 名前入力作成
  clone_form_area.id = `add_field${i}`;
  input_data = clone_form_area.querySelector("input");
  input_data.id = "family_name" + i;
  input_data.name = `family[name${i}]`;

  // add_fieldに入力欄追加
  parent.appendChild(clone_form_area);

  // 削除ボタン作成
  var button_data = document.createElement("button");
  button_data.id = i;
  button_data.className = "add_delete_button";
  button_data.onclick = function () {
    deleteBtn(this);
  };
  button_data.innerHTML = "削除";
  var input_area = document.getElementById(input_data.id);
  parent.appendChild(button_data);
  i++;
};

// 実際に削除する
function deleteBtn(target) {
  // button_data.id = iここが取れる
  var target_id = target.id;
  var add_parent = document.getElementById(`add_field${target_id}`);
  var tgt_id = document.getElementById(target_id);
  add_parent.remove();
  tgt_id.remove();
}
