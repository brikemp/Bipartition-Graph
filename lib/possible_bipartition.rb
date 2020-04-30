def dfs(dislikes, vertex, tracker, groups)
  return groups if !vertex
  
  tracker[vertex] = true;
  currColor = groups[vertex]
  
  dislikes[vertex].each do |adjNode|  
    if !tracker[adjNode]
      if currColor == "A"
        groups[adjNode] = "B"
      else
        groups[adjNode] = "A"
      end
      dfs(dislikes, adjNode, tracker, groups)
    else
      return false if currColor == groups[adjNode]
    end
  end
  
  return groups
  
  
end

def possible_bipartition(dislikes)
  return true if dislikes.length == 0
  
  dislikes.each do |k,v|
    groups = {}
    groups[k] = "A"
    return false if dfs(dislikes, k, {}, groups) == false
  end
  
  return true
end
