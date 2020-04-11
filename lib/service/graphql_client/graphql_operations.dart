class GraphQLOperations {
  String all() {
    return """ 
      query{
        jobs(input:{type:"",slug:""}){
            id
            applyUrl
            description
            title
            company {
              name      
              logoUrl
            }
            commitment {
              title      
            } 
            cities {
              name
            }
            postedAt
            isFeatured
            remotes{
              name
            }    
            tags{
              name
            }
        }
    }
    """;
  }
}
