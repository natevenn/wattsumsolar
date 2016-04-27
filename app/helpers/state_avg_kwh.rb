class StateAvgKwh
  def self.all
    sorted = states_array.sort_by! do |state|
      state[0]
    end
    sorted.map! do |state|
      [state[0], (state[1] * 12)]
    end
  end


  def self.states_array
    [['Connecticut',	730],
      ['Maine',	549],
      ['Massachusetts', 615],
      ['New Hampshire', 619],
      ['Rhode Island', 583],
      ['Vermon', 569],
      ['New Jersey', 670],
      ['New York', 591],
      ['Pennsylvania', 854],
      ['Illinois', 745],
      ['Indiana', 1009],
      ['Michigan', 654],
      ['Ohio', 901],
      ['Wisconsin', 694],
      ['Iowa', 891],
      ['Kansas', 928],
      ['Minnesota', 810],
      ['Missouri', 1095],
      ['Nebraska', 1022],
      ['North Dakota', 1240],
      ['South Dakota', 1046],
      ['Delaware', 950],
      ['Florida', 1092],
      ['Georgia', 1152],
      ['Maryland', 1025],
      ['North Carolina', 1136],
      ['South Carolina', 1187],
      ['Virginia', 1172],
      ['West Virginia', 1158],
      ['Alabama', 1265],
      ['Kentucky', 1177],
      ['Mississippi', 1248],
      ['Tennessee', 1286],
      ['Arkansas', 1143],
      ['Louisiana', 1291],
      ['Oklahoma', 1138],
      ['Texas',	1158],
      ['Mountain', 842],
      ['Arizona',	1013],
      ['Colorado', 687],
      ['Idaho',	982],
      ['Montana',	854],
      ['Nevada', 894],
      ['New Mexico', 633],
      ['Utah',	747],
      ['Wyoming',	863],
      ['California',	562],
      ['Oregon', 930],
      ['Washington', 1005],
      ['Alaska', 605],
      ['Hawaii', 506]]
  end
end
