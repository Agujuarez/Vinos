use actix_web::{web, App, HttpServer, HttpResponse, Responder};
use serde::{Serialize, Deserialize};

#[derive(Serialize, Deserialize)]
struct Wine {
    id: u32,
    name: String,
}

async fn get_wines() -> impl Responder {
    let wines = vec![
        Wine { id: 1, name: "Malbec".to_string() },
        Wine { id: 2, name: "Cabernet".to_string() },
    ];

    HttpResponse::Ok().json(wines)
}

async fn create_wine(wine: web::Json<Wine>) -> impl Responder {
    HttpResponse::Ok().json(wine.into_inner())
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let server_address = "127.0.0.1:8080";

    println!("Server running at http://{}", server_address);

    HttpServer::new(|| {
        App::new()
            .route("/wines", web::get().to(get_wines))
            .route("/wines", web::post().to(create_wine))
    })
    .bind(server_address)?
    .run()
    .await
}

