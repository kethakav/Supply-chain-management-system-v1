CREATE INDEX idx_store_id ON orders(nearest_store_id);

CREATE INDEX idx_route_id ON orders(route_id);

CREATE INDEX idx_store_id_truck ON truck_delivery(store_id);

CREATE INDEX idx_route_id_truck ON truck_delivery(route_id);
