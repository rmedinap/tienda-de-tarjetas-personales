/*
  jquery.popline.decoration.js 0.0.1

  Version: 0.0.1
  Updated: May 18th, 2013

  (c) 2013 by kenshin54
*/
/*
 * Edited for bootstrap 3 -- Jesús Sayes
 */
;(function($) {

  $.popline.addButton({
    bold: {
      // iconClass: "fa fa-bold",
      iconClass: "glyphicon glyphicon-bold",
      mode: "edit",
      action: function(event) {
        document.execCommand("bold");
      }
    },

    italic: {
      // iconClass: "fa fa-italic",
      iconClass: "glyphicon glyphicon-italic",
      mode: "edit",
      action: function(event) {
        document.execCommand("italic");
      }
    // },
    }

    /* strikethrough: { */
      // iconClass: "fa fa-strikethrough",
      // mode: "edit",
      // action: function(event) {
        // document.execCommand("strikethrough");
      // }
    // },

    // underline: {
      // iconClass: "fa fa-underline",
      // mode: "edit",
      // action: function(event) {
        // document.execCommand("underline");
      // }
    /* } */

  });
})(jQuery);
