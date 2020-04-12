// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

  $(document).ready(function() {
    $("p").text("jQuery稼働テスト(稼働中)");
  });



(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);
