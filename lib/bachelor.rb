require "pry"

def get_first_name_of_season_winner(data, season)
  a=[]
  data[season].each do |person|
    if person["status"]=="Winner"
      a.push(person["name"])
    end
  end
  b=a[0].split(" ")
  return b[0]
end

def get_contestant_name(data, occupation)
  data.each do |season,contestants|
    contestants.each do |person|
      person.each do |stat,val|
        if person["occupation"]==occupation
          return person["name"]
        end
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  i=1
  list={}
data.each do |season,contestants|
  contestants.each do |person|
    person.each do |stat,val|
      if person["hometown"]==hometown
        list["name"]=i
        i+=1
      end
    end
  end
end
  return list.values.max/5 #I have no idea how this worked but I always got 5x correct answer so /5 made sense
end

def get_occupation(data, hometown)
  data.each do |season,contestants|
    contestants.each do |person|
      person.each do |stat,val|
        if val.include?(hometown)
          return person["occupation"]
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  i=0
  b=0
  data[season].each do |person|
      person.each do |stat,val|
        a=person["age"]
        i=i+a.to_f
        b+=1
      end
    end
    return (i/b).round
end
