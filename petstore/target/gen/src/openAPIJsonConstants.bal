
function getOpenAPIs() returns map<json> {
	return {  "Swagger_Petstore_New__1_0_0" : {
  "openapi" : "3.0.0",
  "info" : {
    "title" : "Swagger Petstore New",
    "description" : "This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters.",
    "termsOfService" : "http://swagger.io/terms/",
    "contact" : {
      "email" : "apiteam@swagger.io"
    },
    "license" : {
      "name" : "Apache 2.0",
      "url" : "http://www.apache.org/licenses/LICENSE-2.0.html"
    },
    "version" : "1.0.0"
  },
  "servers" : [ {
    "url" : "https://petstore.swagger.io/v2"
  }, {
    "url" : "http://petstore.swagger.io/v2"
  } ],
  "tags" : [ {
    "name" : "pet",
    "description" : "Everything about your Pets",
    "externalDocs" : {
      "description" : "Find out more",
      "url" : "http://swagger.io"
    }
  }, {
    "name" : "store",
    "description" : "Access to Petstore orders"
  }, {
    "name" : "user",
    "description" : "Operations about user",
    "externalDocs" : {
      "description" : "Find out more about our store",
      "url" : "http://swagger.io"
    }
  } ],
  "paths" : {
    "/pet/findByStatus" : {
      "get" : {
        "tags" : [ "pet" ],
        "summary" : "Finds Pets by status",
        "description" : "Multiple status values can be provided with comma separated strings",
        "operationId" : "findPetsByStatus",
        "parameters" : [ {
          "name" : "status",
          "in" : "query",
          "description" : "Status values that need to be considered for filter",
          "required" : true,
          "style" : "FORM",
          "explode" : true,
          "schema" : {
            "type" : "array",
            "items" : {
              "type" : "string",
              "default" : "available",
              "enum" : [ "available", "pending", "sold" ]
            }
          }
        } ],
        "responses" : {
          "200" : {
            "description" : "successful operation",
            "content" : {
              "application/xml" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/Pet"
                  }
                }
              },
              "application/json" : {
                "schema" : {
                  "type" : "array",
                  "items" : {
                    "$ref" : "#/components/schemas/Pet"
                  }
                }
              }
            }
          },
          "400" : {
            "description" : "Invalid status value"
          }
        }
      }
    },
    "/pet/{petId}" : {
      "get" : {
        "tags" : [ "pet" ],
        "summary" : "Find pet by ID",
        "description" : "Returns a single pet",
        "operationId" : "getPetById",
        "parameters" : [ {
          "name" : "petId",
          "in" : "path",
          "description" : "ID of pet to return",
          "required" : true,
          "style" : "SIMPLE",
          "explode" : false,
          "schema" : {
            "type" : "integer",
            "format" : "int64"
          }
        } ],
        "responses" : {
          "200" : {
            "description" : "successful operation",
            "content" : {
              "application/xml" : {
                "schema" : {
                  "$ref" : "#/components/schemas/Pet"
                }
              },
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/Pet"
                }
              }
            }
          },
          "400" : {
            "description" : "Invalid ID supplied"
          },
          "404" : {
            "description" : "Pet not found"
          }
        }
      }
    }
  },
  "components" : {
    "schemas" : {
      "Category" : {
        "type" : "object",
        "properties" : {
          "id" : {
            "type" : "integer",
            "format" : "int64"
          },
          "name" : {
            "type" : "string"
          }
        },
        "xml" : {
          "name" : "Category"
        }
      },
      "Tag" : {
        "type" : "object",
        "properties" : {
          "id" : {
            "type" : "integer",
            "format" : "int64"
          },
          "name" : {
            "type" : "string"
          }
        },
        "xml" : {
          "name" : "Tag"
        }
      },
      "Pet" : {
        "required" : [ "name", "photoUrls" ],
        "type" : "object",
        "properties" : {
          "id" : {
            "type" : "integer",
            "format" : "int64"
          },
          "category" : {
            "$ref" : "#/components/schemas/Category"
          },
          "name" : {
            "type" : "string",
            "example" : "doggie"
          },
          "photoUrls" : {
            "type" : "array",
            "xml" : {
              "name" : "photoUrl",
              "wrapped" : true
            },
            "items" : {
              "type" : "string"
            }
          },
          "tags" : {
            "type" : "array",
            "xml" : {
              "name" : "tag",
              "wrapped" : true
            },
            "items" : {
              "$ref" : "#/components/schemas/Tag"
            }
          },
          "status" : {
            "type" : "string",
            "description" : "pet status in the store",
            "enum" : [ "available", "pending", "sold" ]
          }
        },
        "xml" : {
          "name" : "Pet"
        }
      }
    },
    "requestBodies" : {
      "Pet" : {
        "description" : "Pet object that needs to be added to the store",
        "content" : {
          "application/json" : {
            "schema" : {
              "$ref" : "#/components/schemas/Pet"
            }
          },
          "application/xml" : {
            "schema" : {
              "$ref" : "#/components/schemas/Pet"
            }
          }
        },
        "required" : true
      }
    },
    "extensions" : { }
  },
  "extensions" : {
    "x-wso2-basePath" : "/petstore/v1",
    "x-wso2-production-endpoints" : {
      "urls" : [ "http://www.mocky.io/v2/5d28af622c000066003edbcb" ]
    }
  }
}  };
}