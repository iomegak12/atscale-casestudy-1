CREATE FUNCTION IF NOT EXISTS ramkumar_training_dataset.calculateOrderAmount(units INTEGER, unitPrice INTEGER, itemDiscount INTEGER)
RETURNS INTEGER
AS
(
  (
    SELECT (units*unitPrice) - CAST(((units * unitPrice) * itemDiscount * 0.01) AS INTEGER)
  )
);

SELECT ramkumar_training_dataset.calculateOrderAmount(100, 10, 10);
