CREATE DATABASE cabeleleila;

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(64) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL
);

CREATE TABLE service (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    duration INT NOT NULL
);

CREATE TABLE appointment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    services VARCHAR(255) NOT NULL,
    status ENUM('aguardando', 'confirmado', 'cancelado', 'finalizado') NOT NULL DEFAULT 'aguardando',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);

INSERT INTO service (name, duration) VALUES
('Corte de Cabelo', 60),
('Progressiva', 120),
('Manicure', 30),
('Pedicure', 45),
('Coloração', 90),
('Hidratação', 60),
('Selagem', 90),
('Escova', 60);