-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `cart`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'P',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(5) UNSIGNED NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `price`, `description`, `status`, `created_at`, `updated_at`) VALUES(1, 'P0001', 'Product 1', 100, 'Description, lorem ipsum dolor sit amet, consectetuer adipiscing elit, aenean commodo ligula eget product', 'A', '2020-07-07 14:28:49', NULL);
INSERT INTO `products` (`id`, `sku`, `name`, `price`, `description`, `status`, `created_at`, `updated_at`) VALUES(2, 'P0002', 'Product 2', 200, 'Description, lorem ipsum dolor sit amet, consectetuer adipiscing elit, aenean commodo ligula eget product', 'A', '2020-07-07 14:31:13', NULL);
INSERT INTO `products` (`id`, `sku`, `name`, `price`, `description`, `status`, `created_at`, `updated_at`) VALUES(3, 'P0003', 'Product 3', 300, 'Description, lorem ipsum dolor sit amet, consectetuer adipiscing elit, aenean commodo ligula eget product', 'A', '2020-07-07 14:31:14', NULL);
INSERT INTO `products` (`id`, `sku`, `name`, `price`, `description`, `status`, `created_at`, `updated_at`) VALUES(4, 'P0004', 'Product 4', 400, 'Description, lorem ipsum dolor sit amet, consectetuer adipiscing elit, aenean commodo ligula eget product', 'A', '2020-07-07 14:31:14', NULL);
INSERT INTO `products` (`id`, `sku`, `name`, `price`, `description`, `status`, `created_at`, `updated_at`) VALUES(5, 'P0005', 'Product 5', 500, 'Description, lorem ipsum dolor sit amet, consectetuer adipiscing elit, aenean commodo ligula eget product', 'A', '2020-07-07 14:31:14', NULL);
INSERT INTO `products` (`id`, `sku`, `name`, `price`, `description`, `status`, `created_at`, `updated_at`) VALUES(6, 'P0006', 'Product 6', 600, 'Description, lorem ipsum dolor sit amet, consectetuer adipiscing elit, aenean commodo ligula eget product', 'A', '2020-07-07 14:31:14', NULL);
INSERT INTO `products` (`id`, `sku`, `name`, `price`, `description`, `status`, `created_at`, `updated_at`) VALUES(7, 'P0007', 'Product 7', 100, 'Description, lorem ipsum dolor sit amet, consectetuer adipiscing elit, aenean commodo ligula eget product', 'I', '2020-07-07 14:31:14', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_carts`
--

CREATE TABLE `product_carts` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(5) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_Unq1` (`sku`);

--
-- Indices de la tabla `product_carts`
--
ALTER TABLE `product_carts`
  ADD PRIMARY KEY (`product_id`,`cart_id`),
  ADD KEY `product_carts_Fk1` (`product_id`),
  ADD KEY `product_carts_Fk2` (`cart_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `product_carts`
--
ALTER TABLE `product_carts`
  ADD CONSTRAINT `fk_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;