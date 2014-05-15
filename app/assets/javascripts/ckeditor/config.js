CKEDITOR.disableAutoInline = true;
CKEDITOR.editorConfig = function( config )
{
  config.height = "300";
  // medium
  config.toolbar_medium =
    [
      { name: 'document', items : [ 'NewPage','Preview' ] },
      { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
      { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','Scayt' ] },
      { name: 'insert', items: [ 'Table', 'HorizontalRule', 'Smiley' ] },
      { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
      { name: 'tools', items : [ 'Maximize' ] },
      '/',
      { name: 'styles', items : [ 'Styles','Format','FontSize' ] },
      { name: 'basicstyles', items : [ 'Bold','Italic', 'Underline', '-', 'RemoveFormat' ] },
      { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] }
    ];

  config.toolbar = 'medium';
};

