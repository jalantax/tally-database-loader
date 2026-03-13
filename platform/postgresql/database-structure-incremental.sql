create table _diff
(
 guid varchar(64) not null,
 alterid int
);

create table _delete
(
 guid varchar(64) not null
);

create table _vchnumber
(
 guid varchar(64) not null,
 voucher_number varchar(256)
);

create table config
(
 name varchar(64) not null primary key,
 value varchar(1024)
);

create table mst_group
(
 guid varchar(64) not null primary key,
 alterid int,
 name varchar(1024),
 parent varchar(1024),
 _parent varchar(64),
 primary_group varchar(1024),
 is_revenue smallint,
 is_deemedpositive smallint,
 is_reserved smallint,
 affects_gross_profit smallint,
 sort_position int
);

create table mst_ledger
(
 guid varchar(64) not null primary key,
 alterid int,
 name varchar(1024),
 parent varchar(1024),
 _parent varchar(64),
 alias varchar(256),
 description text,
 notes text,
 is_revenue smallint,
 is_deemedpositive smallint,
 opening_balance decimal(17,2),
 closing_balance decimal(17,2),
 mailing_name varchar(256),
 mailing_address text,
 mailing_state varchar(256),
 mailing_country varchar(256),
 mailing_pincode varchar(64),
 email varchar(256),
 mobile varchar(64),
 it_pan varchar(64),
 gstn varchar(64),
 gst_registration_type varchar(64),
 gst_supply_type varchar(64),
 gst_duty_head varchar(16),
 tax_rate decimal(9,4),
 bank_account_holder varchar(256),
 bank_account_number varchar(64),
 bank_ifsc varchar(64),
 bank_swift varchar(64),
 bank_name varchar(256),
 bank_branch varchar(256),
 bill_credit_period int,
 gstapplicable text,
 appropriate_for varchar(64),
 gst_appropriate_to varchar(100),
 excise_alloc_type varchar(64)
);

create table mst_vouchertype
(
 guid varchar(64) not null primary key,
 alterid int,
 name varchar(1024),
 parent varchar(1024),
 _parent varchar(64),
 numbering_method varchar(64),
 is_deemedpositive smallint,
 affects_stock smallint
);

create table mst_uom
(
 guid varchar(64) not null primary key,
 alterid int,
 name varchar(1024),
 formalname varchar(256),
 is_simple_unit smallint,
 base_units varchar(1024),
 additional_units varchar(1024),
 conversion decimal(15,4)
);

create table mst_godown
(
 guid varchar(64) not null primary key,
 alterid int,
 name varchar(1024),
 parent varchar(1024),
 _parent varchar(64),
 address varchar(1024)
);

create table mst_stock_category
(
 guid varchar(64) not null primary key,
 alterid int,
 name varchar(1024),
 parent varchar(1024),
 _parent varchar(64)
);

create table mst_stock_group
(
 guid varchar(64) not null primary key,
 alterid int,
 name varchar(1024),
 parent varchar(1024),
 _parent varchar(64)
);

create table mst_stock_item
(
 guid varchar(64) not null primary key,
 alterid int,
 name varchar(1024),
 parent varchar(1024),
 _parent varchar(64),
 category varchar(1024),
 _category varchar(64),
 alias varchar(256),
 description text,
 notes text,
 part_number varchar(256),
 uom varchar(32),
 _uom varchar(64),
 alternate_uom varchar(32),
 _alternate_uom varchar(64),
 conversion decimal(15,4),
 opening_balance decimal(15,4),
 opening_rate decimal(15,4),
 opening_value decimal(17,2),
 closing_balance decimal(15,4),
 closing_rate decimal(15,4),
 closing_value decimal(17,2),
 costing_method varchar(32),
 gst_type_of_supply varchar(32),
 gst_hsn_code varchar(64),
 gst_hsn_description varchar(256),
 gst_rate decimal(9,4),
 gst_taxability varchar(32)
);

create table mst_cost_category
(
 guid varchar(64) not null primary key,
 alterid int,
 name varchar(1024),
 allocate_revenue smallint,
 allocate_non_revenue smallint
);

create table mst_cost_centre
(
 guid varchar(64) not null primary key,
 alterid int,
 name varchar(1024),
 parent varchar(1024),
 _parent varchar(64),
 category varchar(1024)
);

create table mst_attendance_type
(
 guid varchar(64) not null primary key,
 alterid int,
 name varchar(1024),
 parent varchar(1024),
 _parent varchar(64),
 uom varchar(32),
 _uom varchar(64),
 attendance_type varchar(64),
 attendance_period varchar(64)
);

create table mst_employee
(
 guid varchar(64) not null primary key,
 alterid int,
 name varchar(1024),
 parent varchar(1024),
 _parent varchar(64),
 id_number varchar(256),
 date_of_joining date,
 date_of_release date,
 designation varchar(64),
 function_role varchar(64),
 location varchar(256),
 gender varchar(32),
 date_of_birth date,
 blood_group varchar(32),
 father_mother_name varchar(256),
 spouse_name varchar(256),
 address text,
 mobile varchar(64),
 email varchar(64),
 pan varchar(32),
 aadhar varchar(32),
 uan varchar(32),
 pf_number varchar(32),
 pf_joining_date date,
 pf_relieving_date date,
 pr_account_number varchar(32)
);

create table mst_payhead
(
 guid varchar(64) not null primary key,
 alterid int,
 name varchar(1024),
 parent varchar(1024),
 _parent varchar(64),
 payslip_name varchar(1024),
 pay_type varchar(64),
 income_type varchar(64),
 calculation_type varchar(32),
 leave_type varchar(64),
 calculation_period varchar(32)
);

create table mst_gst_effective_rate
(
 item varchar(1024),
 _item varchar(64),
 applicable_from date,
 hsn_description varchar(256),
 hsn_code varchar(64),
 duty_head varchar(64),
 rate decimal(9,4),
 rate_per_unit decimal(9,4),
 valuation_type varchar(64),
 is_rcm_applicable smallint,
 nature_of_transaction varchar(64),
 nature_of_goods varchar(64),
 supply_type varchar(64),
 taxability varchar(64)
);

create table mst_ledger_gst_reg_history
(
 ledger_name varchar(1024) not null,
 applicable_from date not null,
 gst_registration_type varchar(64),
 gstin varchar(64),
 state varchar(256),
 place_of_supply varchar(256)
);

create table mst_opening_batch_allocation
(
 name varchar(1024),
 item varchar(1024),
 _item varchar(64),
 opening_balance decimal(15,4),
 opening_rate decimal(15,4),
 opening_value decimal(17,2),
 godown varchar(1024),
 _godown varchar(64),
 manufactured_on date
);

create table mst_opening_bill_allocation
(
 ledger varchar(1024),
 _ledger varchar(64),
 opening_balance decimal(17,4),
 bill_date date,
 name varchar(1024),
 bill_credit_period int,
 is_advance smallint
);

create table trn_closingstock_ledger
(
 ledger varchar(1024),
 _ledger varchar(64),
 stock_date date,
 stock_value decimal(17,2)
);

create table mst_stockitem_standard_cost
(
 item varchar(1024),
 _item varchar(64),
 date date,
 rate decimal(15,4)
);

create table mst_stockitem_standard_price
(
 item varchar(1024),
 _item varchar(64),
 date date,
 rate decimal(15,4)
);

create table trn_voucher
(
 guid varchar(64) not null primary key,
 alterid int,
 date date,
 voucher_type varchar(1024),
 _voucher_type varchar(64),
 voucher_number varchar(64),
 reference_number text,
 reference_date date,
 narration text,
 party_name varchar(256),
 _party_name varchar(64),
 party_gstin varchar(50),
 place_of_supply varchar(256),
 is_invoice smallint,
 is_accounting_voucher smallint,
 is_inventory_voucher smallint,
 is_order_voucher smallint,
 is_cancelled_xml smallint,
 irn varchar(100),
 irn_ack_date date,
 cost_centre_name varchar(256),
 port_code varchar(64),
 shipping_bill_no varchar(64),
 shipping_bill_date date,
 vch_gst_applicable smallint,
 vch_gst_included smallint,
 vch_gst_excluded smallint,
 cmp_gst_state varchar(64),
 cmp_gstin varchar(20),
 stat_key varchar(256)
);

create table trn_accounting
(
 guid varchar(64),
 ledger varchar(1024),
 _ledger varchar(64),
 amount decimal(17,2),
 amount_forex decimal(17,2),
 currency varchar(16),
 is_reverse_charge_applicable_line varchar(30),
 gst_nature_of_supply_line varchar(100),
 txn_hsn_sac varchar(20),
 appropriate_for varchar(64),
 gst_appropriate_to varchar(100),
 excise_alloc_type varchar(64),
 gst_taxability_line varchar(30),
 is_party_ledger smallint,
 is_cost_centre smallint,
 is_eligible_for_itc smallint
);

create table trn_inventory
(
 guid varchar(64),
 item varchar(1024),
 _item varchar(64),
 quantity decimal(15,4),
 billed_qty decimal(15,4),
 rate decimal(15,4),
 amount decimal(17,2),
 additional_amount decimal(17,2),
 discount_amount decimal(17,2),
 godown varchar(1024),
 _godown varchar(64),
 tracking_number varchar(256),
 order_number varchar(256),
 order_duedate date,
 is_reverse_charge_applicable_line varchar(30),
 gst_nature_of_supply_line varchar(100),
 txn_hsn_sac varchar(20)
);

create table trn_cost_centre
(
 guid varchar(64),
 ledger varchar(1024),
 _ledger varchar(64),
 costcentre varchar(1024),
 _costcentre varchar(64),
 amount decimal(17,2)
);

create table trn_cost_category_centre
(
 guid varchar(64),
 ledger varchar(1024),
 _ledger varchar(64),
 costcategory varchar(1024),
 _costcategory varchar(64),
 costcentre varchar(1024),
 _costcentre varchar(64),
 amount decimal(17,2)
);

create table trn_cost_inventory_category_centre
(
 guid varchar(64),
 ledger varchar(1024),
 _ledger varchar(64),
 item varchar(1024),
 _item varchar(64),
 costcategory varchar(1024),
 _costcategory varchar(64),
 costcentre varchar(1024),
 _costcentre varchar(64),
 amount decimal(17,2)
);

create table trn_bill
(
 guid varchar(64),
 ledger varchar(1024),
 _ledger varchar(64),
 name text,
 amount decimal(17,2),
 billtype varchar(256),
 bill_credit_period int
);

create table trn_bank
(
 guid varchar(64),
 ledger varchar(1024),
 _ledger varchar(64),
 transaction_type varchar(32),
 instrument_date date,
 instrument_number varchar(1024),
 bank_name varchar(512),
 amount decimal(17,2),
 bankers_date date
);

create table trn_batch
(
 guid varchar(64),
 item varchar(1024),
 _item varchar(64),
 name varchar(1024),
 quantity decimal(15,4),
 amount decimal(17,2),
 godown varchar(1024),
 _godown varchar(64),
 destination_godown varchar(1024),
 _destination_godown varchar(64),
 tracking_number varchar(1024)
);

create table trn_inventory_additional_cost
(
 guid varchar(64),
 ledger varchar(1024),
 _ledger varchar(64),
 amount decimal(17,2),
 additional_allocation_type varchar(32),
 rate_of_invoice_tax decimal(9,4)
);

create table trn_employee
(
 guid varchar(64),
 category varchar(1024),
 _category varchar(64),
 employee_name varchar(1024),
 _employee_name varchar(64),
 amount decimal(17,2),
 employee_sort_order int
);

create table trn_payhead
(
 guid varchar(64),
 category varchar(1024),
 _category varchar(64),
 employee_name varchar(1024),
 _employee_name varchar(64),
 employee_sort_order int,
 payhead_name varchar(1024),
 _payhead_name varchar(64),
 payhead_sort_order int,
 amount decimal(17,2)
);

create table trn_attendance
(
 guid varchar(64),
 employee_name varchar(1024),
 _employee_name varchar(64),
 attendancetype_name varchar(1024),
 _attendancetype_name varchar(64),
 time_value decimal(17,2),
 type_value numeric(17,4)
);

create table trn_voucher_ewaybill
(
 guid varchar(64) not null,
 eway_bill_no text,
 eway_bill_date date
);

create table trn_inventory_taxdetails
(
 voucher_guid varchar(64) not null,
 stock_item_name varchar(1024),
 gst_duty_head text,
 gst_rate text
);

create table trn_accounting_taxdetails
(
 voucher_guid varchar(64) not null,
 ledger_name varchar(1024),
 gst_duty_head text,
 gst_rate text
);

-- ============================================================================
-- PERFORMANCE INDEXES
-- ============================================================================

-- trn_voucher indexes
create index idx_trn_voucher_date_invoice on trn_voucher(date, is_invoice)
    where is_invoice = 1;
create index idx_trn_voucher_type on trn_voucher using btree (upper(trim(voucher_type)));
create index idx_trn_voucher_guid on trn_voucher(guid);
create index idx_trn_voucher_party_name on trn_voucher using btree (trim(party_name));
create index idx_trn_voucher_cancelled on trn_voucher(is_cancelled_xml)
    where is_cancelled_xml is not null;
create index idx_trn_voucher_date_type_composite
    on trn_voucher(date, is_invoice, upper(trim(voucher_type)));

-- mst_ledger indexes
create index idx_mst_ledger_name_trim on mst_ledger using btree (trim(name));
create index idx_mst_ledger_guid on mst_ledger(guid);
create index idx_mst_ledger_gstn on mst_ledger(gstn) where gstn != '';
create index idx_mst_ledger_gst_duty_head on mst_ledger(gst_duty_head)
    where gst_duty_head != '';
create index idx_mst_ledger_parent_trim on mst_ledger using btree (trim(parent));
create index idx_mst_ledger_gstapplicable on mst_ledger using btree (upper(trim(gstapplicable)));
create index idx_mst_ledger_appropriate_for on mst_ledger(appropriate_for)
    where appropriate_for != '';
create index idx_mst_ledger_name_exact on mst_ledger(name);

-- mst_group indexes
create index idx_mst_group_name_trim on mst_group using btree (trim(name));
create index idx_mst_group_revenue_flags on mst_group(is_revenue, is_deemedpositive);
create index idx_mst_group_guid on mst_group(guid);

-- trn_inventory indexes
create index idx_trn_inventory_guid on trn_inventory(guid);
create index idx_trn_inventory_item_trim on trn_inventory using btree (trim(item));
create index idx_trn_inventory_amount on trn_inventory(guid, amount)
    where abs(amount) > 0.005;
create index idx_trn_inventory_hsn_sac on trn_inventory(txn_hsn_sac)
    where txn_hsn_sac is not null;
create index idx_trn_inventory_item_exact on trn_inventory(item);
create index idx_trn_inventory_guid_amount_covering
    on trn_inventory(guid, amount, item, txn_hsn_sac)
    where abs(amount) > 0.005;

-- mst_stock_item indexes
create index idx_mst_stock_item_name_trim on mst_stock_item using btree (trim(name));
create index idx_mst_stock_item_guid on mst_stock_item(guid);
create index idx_mst_stock_item_gst_type on mst_stock_item(gst_type_of_supply)
    where gst_type_of_supply != '';
create index idx_mst_stock_item_taxability on mst_stock_item(gst_taxability)
    where gst_taxability != '';

-- trn_accounting indexes
create index idx_trn_accounting_guid_ledger on trn_accounting(guid, ledger);
create index idx_trn_accounting_ledger_trim on trn_accounting using btree (trim(ledger));
create index idx_trn_accounting_amount on trn_accounting(guid, amount)
    where abs(amount) > 0.005;
create index idx_trn_accounting_appropriate_for on trn_accounting(guid, appropriate_for)
    where appropriate_for != '';
create index idx_trn_accounting_hsn_sac on trn_accounting(txn_hsn_sac)
    where txn_hsn_sac is not null;
create index idx_trn_accounting_gst_taxability on trn_accounting(guid, gst_taxability_line)
    where gst_taxability_line is not null;
create index idx_trn_accounting_ledger_exact on trn_accounting(ledger);
create index idx_trn_accounting_guid_amount_covering
    on trn_accounting(guid, amount, ledger, appropriate_for)
    where abs(amount) > 0.005;

-- trn_inventory_taxdetails indexes
create index idx_trn_inventory_taxdetails_voucher_item
    on trn_inventory_taxdetails(voucher_guid, trim(stock_item_name), gst_duty_head);
create index idx_trn_inventory_taxdetails_duty_head
    on trn_inventory_taxdetails(gst_duty_head)
    where gst_duty_head is not null;

-- trn_accounting_taxdetails indexes
create index idx_trn_accounting_taxdetails_voucher_ledger
    on trn_accounting_taxdetails(voucher_guid, trim(ledger_name), gst_duty_head);
create index idx_trn_accounting_taxdetails_duty_head
    on trn_accounting_taxdetails(gst_duty_head)
    where gst_duty_head is not null;

-- mst_ledger_gst_reg_history indexes
create index idx_ledger_gst_history_lookup
    on mst_ledger_gst_reg_history(trim(ledger_name), applicable_from desc);
create index idx_ledger_gst_history_full
    on mst_ledger_gst_reg_history(ledger_name, applicable_from, gst_registration_type, gstin);