module GoogleCharts
  class PieChart < GoogleVizualisation
    def initialize(options = {})
      @viz_type = "piechart"
      @class_name = "PieChart"    
      super(options)
    end
  end
end