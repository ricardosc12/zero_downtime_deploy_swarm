use axum::{http::StatusCode, response::IntoResponse, routing::get, Router};

async fn teste() -> impl IntoResponse {
    (StatusCode::OK, "works!").into_response()
}

#[tokio::main]
async fn main() {
    let app = Router::new().route("/teste", get(teste));

    let listener = tokio::net::TcpListener::bind("0.0.0.0:5000").await.unwrap();

    println!("listening on {}", listener.local_addr().unwrap());

    axum::serve(listener, app).await.unwrap();
}
