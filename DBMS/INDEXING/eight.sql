SET SERVEROUTPUT ON;
set verify off;


CREATE TABLE Products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    stock_quantity NUMBER
);


INSERT INTO Products VALUES (1, 'Laptop', 50);
INSERT INTO Products VALUES (2, 'Mouse', 100);
INSERT INTO Products VALUES (3, 'Keyboard', 75);
COMMIT;


CREATE TABLE Orders (
    order_id NUMBER PRIMARY KEY,
    product_id NUMBER,
    order_quantity NUMBER,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


CREATE OR REPLACE TRIGGER Validate_Order_Availability
BEFORE INSERT ON Orders
FOR EACH ROW
DECLARE
    v_current_stock NUMBER;
    v_pending_orders NUMBER;
    v_available_quantity NUMBER;
BEGIN
    
    SELECT stock_quantity INTO v_current_stock
    FROM Products
    WHERE product_id = :NEW.product_id;
    
 
    SELECT NVL(SUM(order_quantity), 0) INTO v_pending_orders
    FROM Orders
    WHERE product_id = :NEW.product_id;
    
 
    v_available_quantity := v_current_stock - v_pending_orders;
    
 
    IF v_available_quantity < :NEW.order_quantity THEN
        RAISE_APPLICATION_ERROR(-20001, 
            'Insufficient stock for the order. Available: ' || v_available_quantity || 
            ', Requested: ' || :NEW.order_quantity);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Order validated successfully. Sufficient stock available.');
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Product not found in inventory');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Error validating order: ' || SQLERRM);
END;
/


INSERT INTO Orders VALUES (1, 1, 10);  
INSERT INTO Orders VALUES (2, 1, 35);  
INSERT INTO Orders VALUES (3, 1, 10);  
INSERT INTO Orders VALUES (4, 2, 50);  


SELECT * FROM Products;
SELECT * FROM Orders;