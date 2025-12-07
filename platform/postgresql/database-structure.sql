-- Master Tables-JTC edited
CREATE TABLE mst_group (
    guid VARCHAR(64) PRIMARY KEY,
    name VARCHAR(1024) NOT NULL DEFAULT '',
    parent VARCHAR(1024) NOT NULL DEFAULT '',
    primary_group VARCHAR(1024) NOT NULL DEFAULT 	'',
    is_revenue SMALLINT,
    is_deemedpositive SMALLINT,
    is_reserved SMALLINT,
    affects_gross_profit SMALLINT,
    sort_position INTEGER
);

CREATE TABLE mst_ledger (
    guid VARCHAR(64) PRIMARY KEY,
    name VARCHAR(1024) NOT NULL DEFAULT '',
    parent VARCHAR(1024) NOT NULL DEFAULT '',
    alias VARCHAR(256) NOT NULL DEFAULT '',
    description TEXT,
    notes TEXT,
    is_revenue SMALLINT,
    is_deemedpositive SMALLINT,
    opening_balance DECIMAL(17,2) DEFAULT 0,
    closing_balance DECIMAL(17,2) DEFAULT 0,
    mailing_name VARCHAR(256) NOT NULL DEFAULT '',
    mailing_address TEXT,
    mailing_state VARCHAR(256) NOT NULL DEFAULT '',
    mailing_country VARCHAR(256) NOT NULL DEFAULT '',
    mailing_pincode VARCHAR(64) NOT NULL DEFAULT '',
    email VARCHAR(256) NOT NULL DEFAULT '',
    it_pan VARCHAR(64) NOT NULL DEFAULT '',
    gstn VARCHAR(64) NOT NULL DEFAULT '',
    gst_registration_type VARCHAR(64) NOT NULL DEFAULT '',
    gst_supply_type VARCHAR(64) NOT NULL DEFAULT '',
    gst_duty_head VARCHAR(16) NOT NULL DEFAULT '',
    tax_rate NUMERIC(9,4) DEFAULT 0,
    bank_account_holder VARCHAR(256) NOT NULL DEFAULT '',
    bank_account_number VARCHAR(64) NOT NULL DEFAULT '',
    bank_ifsc VARCHAR(64) NOT NULL DEFAULT '',
    bank_swift VARCHAR(64) NOT NULL DEFAULT '',
    bank_name VARCHAR(64) NOT NULL DEFAULT '',
    bank_branch VARCHAR(64) NOT NULL DEFAULT '',
    bill_credit_period INTEGER DEFAULT 0,
    gstapplicable TEXT,
    appropriate_for VARCHAR(64) DEFAULT '',
    gst_appropriate_to VARCHAR(100) DEFAULT '',
    excise_alloc_type VARCHAR(64) DEFAULT ''
);

-- GST Registration History for Ledgers (tracks GSTIN changes over time)
-- Used by sales register query to get correct GSTIN at transaction date
CREATE TABLE mst_ledger_gst_reg_history (
    id SERIAL PRIMARY KEY,
    ledger_name VARCHAR(1024) NOT NULL DEFAULT '',
    gstin VARCHAR(64) NOT NULL DEFAULT '',
    gst_registration_type VARCHAR(64) NOT NULL DEFAULT '',
    applicable_from DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE mst_vouchertype (
    guid VARCHAR(64) PRIMARY KEY,
    name VARCHAR(1024) NOT NULL DEFAULT '',
    parent VARCHAR(1024) NOT NULL DEFAULT '',
    numbering_method VARCHAR(64) NOT NULL DEFAULT '',
    is_deemedpositive SMALLINT,
    affects_stock SMALLINT
);

CREATE TABLE mst_uom (
    guid VARCHAR(64) PRIMARY KEY,
    name VARCHAR(1024) NOT NULL DEFAULT '',
    formalname VARCHAR(256) NOT NULL DEFAULT '',
    is_simple_unit SMALLINT NOT NULL,
    base_units VARCHAR(1024) NOT NULL DEFAULT '',
    additional_units VARCHAR(1024) NOT NULL DEFAULT '',
    conversion INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE mst_godown (
    guid VARCHAR(64) PRIMARY KEY,
    name VARCHAR(1024) NOT NULL DEFAULT '',
    parent VARCHAR(1024) NOT NULL DEFAULT '',
    address TEXT
);

CREATE TABLE mst_stock_category (
    guid VARCHAR(64) PRIMARY KEY,
    name VARCHAR(1024) NOT NULL DEFAULT '',
    parent VARCHAR(1024) NOT NULL DEFAULT ''
);

CREATE TABLE mst_stock_group (
    guid VARCHAR(64) PRIMARY KEY,
    name VARCHAR(1024) NOT NULL DEFAULT '',
    parent VARCHAR(1024) NOT NULL DEFAULT ''
);

CREATE TABLE mst_stock_item (
    guid VARCHAR(64) PRIMARY KEY,
    name VARCHAR(1024) NOT NULL DEFAULT '',
    parent VARCHAR(1024) NOT NULL DEFAULT '',
    category VARCHAR(1024) NOT NULL DEFAULT '',
    alias VARCHAR(256) NOT NULL DEFAULT '',
    description TEXT,
    notes TEXT,
    part_number VARCHAR(256) NOT NULL DEFAULT '',
    uom VARCHAR(32) NOT NULL DEFAULT '',
    alternate_uom VARCHAR(32) NOT NULL DEFAULT '',
    conversion INTEGER NOT NULL DEFAULT 0,
    opening_balance NUMERIC(15,4) DEFAULT 0,
    opening_rate NUMERIC(15,4) DEFAULT 0,
    opening_value DECIMAL(17,2) DEFAULT 0,
    closing_balance NUMERIC(15,4) DEFAULT 0,
    closing_rate NUMERIC(15,4) DEFAULT 0,
    closing_value DECIMAL(17,2) DEFAULT 0,
    costing_method VARCHAR(32) NOT NULL DEFAULT '',
    gst_type_of_supply VARCHAR(32) DEFAULT '',
    gst_hsn_code VARCHAR(64) DEFAULT '',
    gst_hsn_description VARCHAR(256) DEFAULT '',
    gst_rate NUMERIC(9,4) DEFAULT 0,
    gst_taxability VARCHAR(32) DEFAULT ''
);

CREATE TABLE mst_cost_category (
    guid VARCHAR(64) PRIMARY KEY,
    name VARCHAR(1024) NOT NULL DEFAULT '',
    allocate_revenue SMALLINT,
    allocate_non_revenue SMALLINT
);

CREATE TABLE mst_cost_centre (
    guid VARCHAR(64) PRIMARY KEY,
    name VARCHAR(1024) NOT NULL DEFAULT '',
    parent VARCHAR(1024) NOT NULL DEFAULT '',
    category VARCHAR(1024) NOT NULL DEFAULT ''
);

CREATE TABLE mst_attendance_type (
    guid VARCHAR(64) PRIMARY KEY,
    name VARCHAR(1024) NOT NULL DEFAULT '',
    parent VARCHAR(1024) NOT NULL DEFAULT '',
    uom VARCHAR(32) NOT NULL DEFAULT '',
    attendance_type VARCHAR(64) NOT NULL DEFAULT '',
    attendance_period VARCHAR(64) NOT NULL DEFAULT ''
);

CREATE TABLE mst_employee (
    guid VARCHAR(64) PRIMARY KEY,
    name VARCHAR(1024) NOT NULL DEFAULT '',
    parent VARCHAR(1024) NOT NULL DEFAULT '',
    id_number VARCHAR(256) NOT NULL DEFAULT '',
    date_of_joining DATE,
    date_of_release DATE,
    designation VARCHAR(64) NOT NULL DEFAULT '',
    function_role VARCHAR(64) NOT NULL DEFAULT '',
    location VARCHAR(256) NOT NULL DEFAULT '',
    gender VARCHAR(32) NOT NULL DEFAULT '',
    date_of_birth DATE,
    blood_group VARCHAR(32) NOT NULL DEFAULT '',
    father_mother_name VARCHAR(256) NOT NULL DEFAULT '',
    spouse_name VARCHAR(256) NOT NULL DEFAULT '',
    address TEXT,
    mobile VARCHAR(32) NOT NULL DEFAULT '',
    email VARCHAR(64) NOT NULL DEFAULT '',
    pan VARCHAR(32) NOT NULL DEFAULT '',
    aadhar VARCHAR(32) NOT NULL DEFAULT '',
    uan VARCHAR(32) NOT NULL DEFAULT '',
    pf_number VARCHAR(32) NOT NULL DEFAULT '',
    pf_joining_date DATE,
    pf_relieving_date DATE,
    pr_account_number VARCHAR(32) NOT NULL DEFAULT ''
);

CREATE TABLE mst_payhead (
    guid VARCHAR(64) PRIMARY KEY,
    name VARCHAR(1024) NOT NULL DEFAULT '',
    parent VARCHAR(1024) NOT NULL DEFAULT '',
    payslip_name VARCHAR(1024) NOT NULL DEFAULT '',
    pay_type VARCHAR(64) NOT NULL DEFAULT '',
    income_type VARCHAR(64) NOT NULL DEFAULT '',
    calculation_type VARCHAR(32) NOT NULL DEFAULT '',
    leave_type VARCHAR(64) NOT NULL DEFAULT '',
    calculation_period VARCHAR(32) NOT NULL DEFAULT ''
);

CREATE TABLE mst_gst_effective_rate (
    item VARCHAR(1024) NOT NULL DEFAULT '',
    applicable_from DATE,
    hsn_description VARCHAR(256) NOT NULL DEFAULT '',
    hsn_code VARCHAR(64) NOT NULL DEFAULT '',
    rate NUMERIC(9,4) DEFAULT 0,
    is_rcm_applicable SMALLINT,
    nature_of_transaction VARCHAR(64) NOT NULL DEFAULT '',
    nature_of_goods VARCHAR(64) NOT NULL DEFAULT '',
    supply_type VARCHAR(64) NOT NULL DEFAULT '',
    taxability VARCHAR(64) NOT NULL DEFAULT ''
);

CREATE TABLE mst_opening_batch_allocation (
    name VARCHAR(1024) NOT NULL DEFAULT '',
    item VARCHAR(1024) NOT NULL DEFAULT '',
    opening_balance DECIMAL(17,2) DEFAULT 0,
    opening_rate NUMERIC(15,4) DEFAULT 0,
    opening_value DECIMAL(17,2) DEFAULT 0,
    godown VARCHAR(1024) NOT NULL DEFAULT '',
    manufactured_on DATE
);

CREATE TABLE mst_opening_bill_allocation (
    ledger VARCHAR(1024) NOT NULL DEFAULT '',
    opening_balance DECIMAL(17,2) DEFAULT 0,
    bill_date DATE,
    name VARCHAR(1024) NOT NULL DEFAULT '',
    bill_credit_period INTEGER DEFAULT 0,
    is_advance SMALLINT
);

CREATE TABLE trn_closingstock_ledger (
    ledger VARCHAR(1024) NOT NULL DEFAULT '',
    stock_date DATE,
    stock_value DECIMAL(17,2) NOT NULL DEFAULT 0
);

CREATE TABLE mst_stockitem_standard_cost (
    item VARCHAR(1024) NOT NULL DEFAULT '',
    date DATE,
    rate NUMERIC(15,4) DEFAULT 0
);

CREATE TABLE mst_stockitem_standard_price (
    item VARCHAR(1024) NOT NULL DEFAULT '',
    date DATE,
    rate NUMERIC(15,4) DEFAULT 0
);

-- Transaction Tables
CREATE TABLE trn_voucher (
    guid VARCHAR(64) PRIMARY KEY,
    date DATE NOT NULL,
    voucher_type VARCHAR(1024) NOT NULL,
    voucher_number VARCHAR(64) NOT NULL DEFAULT '',
    reference_number VARCHAR(64) NOT NULL DEFAULT '',
    reference_date DATE,
    narration TEXT,
    party_name VARCHAR(256) NOT NULL DEFAULT '',
    party_gstin VARCHAR(15) NOT NULL DEFAULT '',
    place_of_supply VARCHAR(256) NOT NULL DEFAULT '',
    is_invoice SMALLINT,
    is_accounting_voucher SMALLINT,
    is_inventory_voucher SMALLINT,
    is_order_voucher SMALLINT,
    is_cancelled_xml SMALLINT,
    irn VARCHAR(100),
    irn_ack_date DATE,
    cost_centre_name VARCHAR(256),
    port_code VARCHAR(64),
    shipping_bill_no VARCHAR(64),
    shipping_bill_date DATE
);

CREATE TABLE trn_accounting (
    guid VARCHAR(64) NOT NULL DEFAULT '',
    ledger VARCHAR(1024) NOT NULL DEFAULT '',
    amount DECIMAL(17,2) NOT NULL DEFAULT 0,
    amount_forex DECIMAL(17,2) NOT NULL DEFAULT 0,
    currency VARCHAR(16) NOT NULL DEFAULT '',
    is_reverse_charge_applicable_line VARCHAR(30),
    gst_nature_of_supply_line VARCHAR(100),
    txn_hsn_sac VARCHAR(20),
    appropriate_for VARCHAR(64) DEFAULT '',
    gst_appropriate_to VARCHAR(100) DEFAULT '',
    excise_alloc_type VARCHAR(64) DEFAULT '',
    gst_taxability_line VARCHAR(30)
);

CREATE TABLE trn_inventory (
    guid VARCHAR(64) NOT NULL DEFAULT '',
    item VARCHAR(1024) NOT NULL DEFAULT '',
    quantity NUMERIC(15,4) NOT NULL DEFAULT 0,
    rate NUMERIC(15,4) NOT NULL DEFAULT 0,
    amount DECIMAL(17,2) NOT NULL DEFAULT 0,
    additional_amount DECIMAL(17,2) NOT NULL DEFAULT 0,
    discount_amount NUMERIC(17,2) NOT NULL DEFAULT 0,
    godown VARCHAR(1024),
    tracking_number VARCHAR(256),
    order_number VARCHAR(256),
    order_duedate DATE,
    is_reverse_charge_applicable_line VARCHAR(30),
    gst_nature_of_supply_line VARCHAR(100),
    txn_hsn_sac VARCHAR(20)
);

CREATE TABLE trn_cost_centre (
    guid VARCHAR(64) NOT NULL DEFAULT '',
    ledger VARCHAR(1024) NOT NULL DEFAULT '',
    costcentre VARCHAR(1024) NOT NULL DEFAULT '',
    amount DECIMAL(17,2) NOT NULL DEFAULT 0
);

CREATE TABLE trn_cost_category_centre (
    guid VARCHAR(64) NOT NULL DEFAULT '',
    ledger VARCHAR(1024) NOT NULL DEFAULT '',
    costcategory VARCHAR(1024) NOT NULL DEFAULT '',
    costcentre VARCHAR(1024) NOT NULL DEFAULT '',
    amount DECIMAL(17,2) NOT NULL DEFAULT 0
);

CREATE TABLE trn_cost_inventory_category_centre (
    guid VARCHAR(64) NOT NULL DEFAULT '',
    ledger VARCHAR(1024) NOT NULL DEFAULT '',
    item VARCHAR(1024) NOT NULL DEFAULT '',
    costcategory VARCHAR(1024) NOT NULL DEFAULT '',
    costcentre VARCHAR(1024) NOT NULL DEFAULT '',
    amount DECIMAL(17,2) NOT NULL DEFAULT 0
);

CREATE TABLE trn_bill (
    guid VARCHAR(64) NOT NULL DEFAULT '',
    ledger VARCHAR(1024) NOT NULL DEFAULT '',
    name VARCHAR(1024) NOT NULL DEFAULT '',
    amount DECIMAL(17,2) NOT NULL DEFAULT 0,
    billtype VARCHAR(256) NOT NULL DEFAULT '',
    bill_credit_period INTEGER DEFAULT 0
);

CREATE TABLE trn_bank (
    guid VARCHAR(64) NOT NULL DEFAULT '',
    ledger VARCHAR(1024) NOT NULL DEFAULT '',
    transaction_type VARCHAR(32) NOT NULL DEFAULT '',
    instrument_date DATE,
    instrument_number VARCHAR(1024) NOT NULL DEFAULT '',
    bank_name VARCHAR(64) NOT NULL DEFAULT '',
    amount DECIMAL(17,2) NOT NULL DEFAULT 0,
    bankers_date DATE
);

CREATE TABLE trn_batch (
    guid VARCHAR(64) NOT NULL DEFAULT '',
    item VARCHAR(1024) NOT NULL DEFAULT '',
    name VARCHAR(1024) NOT NULL DEFAULT '',
    quantity NUMERIC(15,4) NOT NULL DEFAULT 0,
    amount DECIMAL(17,2) NOT NULL DEFAULT 0,
    godown VARCHAR(1024),
    destination_godown VARCHAR(1024),
    tracking_number VARCHAR(1024)
);

CREATE TABLE trn_inventory_accounting (
    guid VARCHAR(64) NOT NULL DEFAULT '',
    ledger VARCHAR(1024) NOT NULL DEFAULT '',
    amount DECIMAL(17,2) NOT NULL DEFAULT 0,
    additional_allocation_type VARCHAR(32) NOT NULL DEFAULT ''
);

CREATE TABLE trn_employee (
    guid VARCHAR(64) NOT NULL DEFAULT '',
    category VARCHAR(1024) NOT NULL DEFAULT '',
    employee_name VARCHAR(1024) NOT NULL DEFAULT '',
    amount DECIMAL(17,2) NOT NULL DEFAULT 0,
    employee_sort_order INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE trn_payhead (
    guid VARCHAR(64) NOT NULL DEFAULT '',
    category VARCHAR(1024) NOT NULL DEFAULT '',
    employee_name VARCHAR(1024) NOT NULL DEFAULT '',
    employee_sort_order INTEGER NOT NULL DEFAULT 0,
    payhead_name VARCHAR(1024) NOT NULL DEFAULT '',
    payhead_sort_order INTEGER NOT NULL DEFAULT 0,
    amount DECIMAL(17,2) NOT NULL DEFAULT 0
);

CREATE TABLE trn_attendance (
    guid VARCHAR(64) NOT NULL DEFAULT '',
    employee_name VARCHAR(1024) NOT NULL DEFAULT '',
    attendancetype_name VARCHAR(1024) NOT NULL DEFAULT '',
    time_value DECIMAL(17,2) NOT NULL DEFAULT 0,
    type_value NUMERIC(17,4) NOT NULL DEFAULT 0
);

CREATE TABLE trn_voucher_ewaybill (
    guid VARCHAR(64) NOT NULL,
    eway_bill_no TEXT,
    eway_bill_date DATE
);

CREATE TABLE trn_inventory_taxdetails (
    voucher_guid VARCHAR(64) NOT NULL,
    stock_item_name VARCHAR(1024),
    gst_duty_head TEXT,
    gst_rate TEXT
);

CREATE TABLE trn_accounting_taxdetails (
    voucher_guid VARCHAR(64) NOT NULL,
    ledger_name VARCHAR(1024),
    gst_duty_head TEXT,
    gst_rate TEXT
);

CREATE TABLE config (
    name VARCHAR(64) PRIMARY KEY,
    value VARCHAR(1024)
);

-- ============================================================================
-- PERFORMANCE INDEXES FOR SALES REGISTER QUERY OPTIMIZATION
-- ============================================================================
-- These indexes dramatically improve query performance for GST sales register
-- generation, especially when querying through Foreign Data Wrapper (FDW).
-- Expected improvement: 50-70% reduction in query execution time.
-- Trade-off: Slightly slower data import (15-25%) and additional storage (~20%)
-- ============================================================================

-- Critical indexes for trn_voucher (VoucherBasicInfo CTE)
-- Composite index for the main WHERE clause filter
CREATE INDEX idx_trn_voucher_date_invoice ON trn_voucher(date, is_invoice)
    WHERE is_invoice = 1;

-- Index for voucher type filtering (text search optimization)
CREATE INDEX idx_trn_voucher_type ON trn_voucher USING btree (UPPER(TRIM(voucher_type)));

-- GUID index for JOINs (though it's already a PRIMARY KEY, explicit for FDW)
CREATE INDEX idx_trn_voucher_guid ON trn_voucher(guid);

-- Functional index for party name (handles TRIM in JOIN conditions)
CREATE INDEX idx_trn_voucher_party_name ON trn_voucher USING btree (TRIM(party_name));

-- Index for cancelled vouchers check
CREATE INDEX idx_trn_voucher_cancelled ON trn_voucher(is_cancelled_xml)
    WHERE is_cancelled_xml IS NOT NULL;

-- Indexes for mst_ledger (heavily joined table)
-- Functional index for name (handles TRIM in JOIN conditions)
CREATE INDEX idx_mst_ledger_name_trim ON mst_ledger USING btree (TRIM(name));

-- GUID index (though PRIMARY KEY, explicit for FDW performance)
CREATE INDEX idx_mst_ledger_guid ON mst_ledger(guid);

-- Index for GSTN lookups
CREATE INDEX idx_mst_ledger_gstn ON mst_ledger(gstn) WHERE gstn != '';

-- Index for GST duty head filtering (tax ledgers)
CREATE INDEX idx_mst_ledger_gst_duty_head ON mst_ledger(gst_duty_head)
    WHERE gst_duty_head != '';

-- Index for parent group lookups
CREATE INDEX idx_mst_ledger_parent_trim ON mst_ledger USING btree (TRIM(parent));

-- Index for gstapplicable filtering
CREATE INDEX idx_mst_ledger_gstapplicable ON mst_ledger USING btree (UPPER(TRIM(gstapplicable)));

-- Index for appropriate_for field (used in ancillary charges)
CREATE INDEX idx_mst_ledger_appropriate_for ON mst_ledger(appropriate_for)
    WHERE appropriate_for != '';

-- Indexes for mst_group (revenue detection)
-- Functional index for name (handles TRIM in JOIN conditions)
CREATE INDEX idx_mst_group_name_trim ON mst_group USING btree (TRIM(name));

-- Composite index for revenue filtering (critical for EXISTS subquery)
CREATE INDEX idx_mst_group_revenue_flags ON mst_group(is_revenue, is_deemedpositive);

-- GUID index
CREATE INDEX idx_mst_group_guid ON mst_group(guid);

-- Indexes for trn_inventory (InventoryLines CTE)
-- Composite index for voucher GUID filtering
CREATE INDEX idx_trn_inventory_guid ON trn_inventory(guid);

-- Functional index for item name (handles TRIM in JOIN conditions)
CREATE INDEX idx_trn_inventory_item_trim ON trn_inventory USING btree (TRIM(item));

-- Index for amount filtering (excludes zero amounts)
CREATE INDEX idx_trn_inventory_amount ON trn_inventory(guid, amount)
    WHERE ABS(amount) > 0.005;

-- Index for HSN/SAC code
CREATE INDEX idx_trn_inventory_hsn_sac ON trn_inventory(txn_hsn_sac)
    WHERE txn_hsn_sac IS NOT NULL;

-- Indexes for mst_stock_item (inventory master)
-- Functional index for name (handles TRIM in JOIN conditions)
CREATE INDEX idx_mst_stock_item_name_trim ON mst_stock_item USING btree (TRIM(name));

-- GUID index
CREATE INDEX idx_mst_stock_item_guid ON mst_stock_item(guid);

-- Index for GST type of supply
CREATE INDEX idx_mst_stock_item_gst_type ON mst_stock_item(gst_type_of_supply)
    WHERE gst_type_of_supply != '';

-- Index for taxability
CREATE INDEX idx_mst_stock_item_taxability ON mst_stock_item(gst_taxability)
    WHERE gst_taxability != '';

-- Indexes for trn_accounting (SalesLines, AncillaryCharges CTEs)
-- Composite index for GUID and ledger (most common JOIN pattern)
CREATE INDEX idx_trn_accounting_guid_ledger ON trn_accounting(guid, ledger);

-- Functional index for ledger name (handles TRIM in JOIN conditions)
CREATE INDEX idx_trn_accounting_ledger_trim ON trn_accounting USING btree (TRIM(ledger));

-- Index for amount filtering (excludes zero amounts)
CREATE INDEX idx_trn_accounting_amount ON trn_accounting(guid, amount)
    WHERE ABS(amount) > 0.005;

-- Index for appropriate_for field (ancillary charges detection)
CREATE INDEX idx_trn_accounting_appropriate_for ON trn_accounting(guid, appropriate_for)
    WHERE appropriate_for != '';

-- Index for HSN/SAC code
CREATE INDEX idx_trn_accounting_hsn_sac ON trn_accounting(txn_hsn_sac)
    WHERE txn_hsn_sac IS NOT NULL;

-- Index for GST taxability (nil-rated/exempt detection)
CREATE INDEX idx_trn_accounting_gst_taxability ON trn_accounting(guid, gst_taxability_line)
    WHERE gst_taxability_line IS NOT NULL;

-- Indexes for trn_inventory_taxdetails (LineItemTaxRates CTE)
-- Composite index for voucher GUID and stock item grouping
CREATE INDEX idx_trn_inventory_taxdetails_voucher_item
    ON trn_inventory_taxdetails(voucher_guid, TRIM(stock_item_name), gst_duty_head);

-- Index for GST duty head filtering
CREATE INDEX idx_trn_inventory_taxdetails_duty_head
    ON trn_inventory_taxdetails(gst_duty_head)
    WHERE gst_duty_head IS NOT NULL;

-- Indexes for trn_accounting_taxdetails (LineItemTaxRates CTE)
-- Composite index for voucher GUID and ledger grouping
CREATE INDEX idx_trn_accounting_taxdetails_voucher_ledger
    ON trn_accounting_taxdetails(voucher_guid, TRIM(ledger_name), gst_duty_head);

-- Index for GST duty head filtering
CREATE INDEX idx_trn_accounting_taxdetails_duty_head
    ON trn_accounting_taxdetails(gst_duty_head)
    WHERE gst_duty_head IS NOT NULL;

-- ============================================================================
-- END OF PERFORMANCE INDEXES
-- ============================================================================