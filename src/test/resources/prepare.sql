BEGIN;
DROP SCHEMA IF EXISTS hibershop CASCADE;
CREATE SCHEMA hibershop;
DROP TABLE IF EXISTS hibershop.items CASCADE;
CREATE TABLE hibershop.items(id bigserial PRIMARY KEY, title VARCHAR(255) NOT NULL, price DECIMAL);
INSERT INTO hibershop.items (title, price) VALUES
('Product-1', 110.25),
('Product-2', 400),
('Product-3', 250);
DROP TABLE IF EXISTS hibershop.buyers CASCADE;
CREATE TABLE hibershop.buyers(id bigserial PRIMARY KEY, name VARCHAR(255) NOT NULL);
INSERT INTO hibershop.buyers (name) VALUES
('Buyer-1'),
('Buyer-2'),
('Buyer-3');
DROP TABLE IF EXISTS hibershop.orders CASCADE;
CREATE TABLE hibershop.orders(id bigserial PRIMARY KEY, item_id BIGINT, buyer_id BIGINT, price DECIMAL, FOREIGN KEY (item_id) REFERENCES hibershop.items(id), FOREIGN KEY (buyer_id) REFERENCES hibershop.buyers(id));
INSERT INTO hibershop.orders (item_id, buyer_id, price) VALUES
(1, 3, 200),
(2, 1, 80),
(3, 2, 130);
COMMIT;