import "phoenix_html"

import SimpleMDE from "simplemde"

const postBody = document.getElementById("post_body");

if (postBody != null) {
  window.postEditor = new SimpleMDE({
    element: postBody
  });
}
