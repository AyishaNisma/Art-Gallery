DROP DATABASE IF EXISTS artstore;
CREATE DATABASE artstore CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE artstore;

CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(120) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE admins (
  admin_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  name VARCHAR(100)
);

CREATE TABLE artists (
  artist_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  bio TEXT
);

CREATE TABLE artworks (
  artwork_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  image_filename VARCHAR(255),
  artist_id INT,
  available_qty INT DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id) ON DELETE SET NULL
);

CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  status VARCHAR(50) DEFAULT 'Pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE order_items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  artwork_id INT NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
  FOREIGN KEY (artwork_id) REFERENCES artworks(artwork_id) ON DELETE CASCADE
);

INSERT INTO admins (username, password, name) VALUES
('admin', 'scrypt:32768:8:1$YViLob8JvMeqQMoz$0959c5bf26b741be2e3d929f8aead903412c60dee5a91daeb5333c644c33575847d7263982eee5070eb8bf507d2d43f80091fde7193eeeda1c05485c38267bd1', 'Gallery Admin');

INSERT INTO artists (name, bio) VALUES
('Ravi Kumar', 'Contemporary painter from India.'),
('Ananya Roy', 'Digital artist focusing on surreal landscapes.');

INSERT INTO artworks (title, description, price, image_filename, artist_id, available_qty) VALUES
('Sunset over Ganges', 'Oil painting with vibrant hues', 12000.00, 'sunset.jpg', 1, 1),
('Dreamscape #1', 'Digital print, limited edition', 3500.00, 'dream1.jpg', 2, 5);

UPDATE admins
SET password = 'pbkdf2:sha256:600000$abc123$e1cb69f56cda4d32e0a9e1acbe469c3ec5b3fae8b4b1d7c5a3d13c76e3d7a893'
WHERE username = 'admin';
INSERT INTO artists (name, bio) VALUES
('Vincent van Gogh', 'A Dutch post-impressionist painter known for his bold colors and emotional honesty in works like Starry Night.'),
('Salvador Dalí', 'A Spanish surrealist famous for dreamlike, bizarre, and imaginative paintings such as The Persistence of Memory.'),
('Leonardo da Vinci', 'Italian Renaissance genius celebrated for masterpieces like Mona Lisa and his contributions to art, science, and anatomy.'),
('Edvard Munch', 'A Norwegian painter known for expressing deep psychological themes and anxiety, as in The Scream.'),
('Johannes Vermeer', 'Dutch Baroque painter renowned for his delicate use of light and intimate domestic scenes, like Girl with a Pearl Earring.'),
('Rembrandt', 'A Dutch master of the 17th century, celebrated for his dramatic lighting, realism, and self-portraits, exemplified in The Night Watch.'),
('Claude Monet', 'French Impressionist painter known for capturing light and natural landscapes, especially his Water Lilies series.'),
('Sandro Botticelli', 'Italian Renaissance painter famous for mythological works like The Birth of Venus with graceful figures and flowing lines.'),
('Grant Wood', 'An American painter best known for regionalist art depicting rural American life, including American Gothic.');

use artstore;
DESCRIBE artworks;
ALTER TABLE artworks
ADD COLUMN status VARCHAR(20) DEFAULT 'Available';
SELECT COUNT(*) FROM artworks;
SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'artstore'   -- your database name
  AND TABLE_NAME = 'users'       -- your table name
  AND COLUMN_NAME = 'address';
ALTER TABLE users
ADD COLUMN address VARCHAR(255) DEFAULT 'Not provided';

USE artstore;
ALTER TABLE users
ADD COLUMN address VARCHAR(255) DEFAULT 'Not provided';
USE artstore;
DESCRIBE users;
SHOW PROCESSLIST;
KILL 147;
KILL 151;
KILL 152;
KILL 153;
KILL 154;
KILL 155;
KILL 156;
KILL 160;
KILL 165;

SHOW PROCESSLIST;
USE artstore;
ALTER TABLE users
ADD COLUMN address VARCHAR(255) DEFAULT 'Not provided';

DESCRIBE users;
SELECT DATABASE();
SHOW TABLES;
DESCRIBE users;
DESCRIBE orders;
ALTER TABLE orders
ADD COLUMN address VARCHAR(255) DEFAULT 'Not provided';
SHOW PROCESSLIST;
KILL 167;
USE artstore;
ALTER TABLE orders
ADD COLUMN address VARCHAR(255) DEFAULT 'Not provided';
ALTER TABLE orders
ADD COLUMN address VARCHAR(255) DEFAULT 'Not provided';
SHOW PROCESSLIST;
KILL 175;
USE artstore;
ALTER TABLE orders
ADD COLUMN address VARCHAR(255) DEFAULT 'Not provided';
DESCRIBE orders;
ALTER TABLE orders
ADD COLUMN delivery_date DATE DEFAULT NULL;
SHOW PROCESSLIST;
KILL 179;
ALTER TABLE orders
ADD COLUMN delivery_date DATE DEFAULT NULL;
SHOW PROCESSLIST;
KILL 184;
use artstore;
ALTER TABLE orders
ADD COLUMN delivery_date DATE DEFAULT NULL;
use artstore;
ALTER TABLE orders
ADD COLUMN delivery_date DATE DEFAULT NULL;
DESCRIBE orders;
ALTER TABLE orders
ADD COLUMN payment_mode VARCHAR(50) DEFAULT 'Not specified';
KILL 194;
ALTER TABLE orders
ADD COLUMN payment_mode VARCHAR(50) DEFAULT 'Not specified';

SHOW PROCESSLIST;
KILL 199;
KILL 193;
KILL 197;


SHOW PROCESSLIST;
ALTER TABLE orders
ADD COLUMN payment_mode VARCHAR(50) DEFAULT 'Not specified';
describe orders;
use artstore;
describe artworks;