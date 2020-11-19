class Formatter

  def self.column_data(astroid_data)
    column_labels = { name: "Name", diameter: "Diameter", miss_distance: "Missed The Earth By:" }
    column_labels.each_with_object({}) do |(col, label), hash|
      hash[col] = {
        label: label,
        width: [astroid_data.map { |astroid| astroid[col].size }.max, label.size].max
        }
    end
  end

  def self.create_rows(astroid_data, column_data)
    astroid_data.each { |astroid| format_row_data(astroid, column_data) }
  end

  def self.format_row_data(row_data, column_data)
    row = row_data.keys.map { |key| row_data[key].ljust(column_data[key][:width]) }.join(' | ')
    puts "| #{row} |"
  end

end
