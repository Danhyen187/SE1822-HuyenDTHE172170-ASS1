/* global tinymce */

tinymce.init({
  selector: 'textarea',
  height: 400,
  menubar: true,
  plugins: 'advlist link image lists image code',
  tinydrive_token_provider: 'qe14wbo2e3d1morsjxg5kufktky9kvfntr0082y4w45lj1da',
    toolbar: 'undo redo | formatselect | ' +
  'bold italic backcolor | alignleft aligncenter ' +
  'alignright alignjustify | bullist numlist outdent indent | ' +
  'removeformat | help',
  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:13px }'
});

