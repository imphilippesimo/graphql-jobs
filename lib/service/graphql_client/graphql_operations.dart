class GraphQLOperations {
  String all() {
    return """ 
      query{
        jobs(input:{type:"",slug:""}){
            id
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
