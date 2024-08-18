use actix_web::{web, App, HttpServer, HttpResponse, Responder};
use serde::{Serialize, Deserialize};

#[derive(Serialize, Deserialize)]
struct Item {
    id: u32,
    name: String,
}

async fn get_items() -> impl Responder {
    let items = vec![
        Item { id: 1, name: "Guitarra".to_string() },
        Item { id: 2, name: "Bajo".to_string() },
    ];

    HttpResponse::Ok().json(items)
}

async fn create_item(item: web::Json<Item>) -> impl Responder {
    HttpResponse::Ok().json(item.into_inner())
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let server_address = "127.0.0.1:8080";

    println!("Server running at http://{}", server_address);

    HttpServer::new(|| {
        App::new()
            .route("/items", web::get().to(get_items))
            .route("/items", web::post().to(create_item))
    })
    .bind(server_address)?
    .run()
    .await
}

