HTMLWidgets.widget({

  name: 'RECalendar',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
        // el.innerText = x.message;

        var myChart = echarts.init(
          document.getElementById(el.id),
          x.theme
          );
      option = x.option;
      myChart.setOption(option);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
