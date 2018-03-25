package com.crud.bean;

import java.util.ArrayList;
import java.util.List;

public class RoomExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public RoomExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("Id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("Id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("Id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("Id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("Id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("Id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("Id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("Id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("Id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("Id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("Id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("Id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andRoomnumberIsNull() {
            addCriterion("roomnumber is null");
            return (Criteria) this;
        }

        public Criteria andRoomnumberIsNotNull() {
            addCriterion("roomnumber is not null");
            return (Criteria) this;
        }

        public Criteria andRoomnumberEqualTo(String value) {
            addCriterion("roomnumber =", value, "roomnumber");
            return (Criteria) this;
        }

        public Criteria andRoomnumberNotEqualTo(String value) {
            addCriterion("roomnumber <>", value, "roomnumber");
            return (Criteria) this;
        }

        public Criteria andRoomnumberGreaterThan(String value) {
            addCriterion("roomnumber >", value, "roomnumber");
            return (Criteria) this;
        }

        public Criteria andRoomnumberGreaterThanOrEqualTo(String value) {
            addCriterion("roomnumber >=", value, "roomnumber");
            return (Criteria) this;
        }

        public Criteria andRoomnumberLessThan(String value) {
            addCriterion("roomnumber <", value, "roomnumber");
            return (Criteria) this;
        }

        public Criteria andRoomnumberLessThanOrEqualTo(String value) {
            addCriterion("roomnumber <=", value, "roomnumber");
            return (Criteria) this;
        }

        public Criteria andRoomnumberLike(String value) {
            addCriterion("roomnumber like", value, "roomnumber");
            return (Criteria) this;
        }

        public Criteria andRoomnumberNotLike(String value) {
            addCriterion("roomnumber not like", value, "roomnumber");
            return (Criteria) this;
        }

        public Criteria andRoomnumberIn(List<String> values) {
            addCriterion("roomnumber in", values, "roomnumber");
            return (Criteria) this;
        }

        public Criteria andRoomnumberNotIn(List<String> values) {
            addCriterion("roomnumber not in", values, "roomnumber");
            return (Criteria) this;
        }

        public Criteria andRoomnumberBetween(String value1, String value2) {
            addCriterion("roomnumber between", value1, value2, "roomnumber");
            return (Criteria) this;
        }

        public Criteria andRoomnumberNotBetween(String value1, String value2) {
            addCriterion("roomnumber not between", value1, value2, "roomnumber");
            return (Criteria) this;
        }

        public Criteria andSizeIsNull() {
            addCriterion("size is null");
            return (Criteria) this;
        }

        public Criteria andSizeIsNotNull() {
            addCriterion("size is not null");
            return (Criteria) this;
        }

        public Criteria andSizeEqualTo(Integer value) {
            addCriterion("size =", value, "size");
            return (Criteria) this;
        }

        public Criteria andSizeNotEqualTo(Integer value) {
            addCriterion("size <>", value, "size");
            return (Criteria) this;
        }

        public Criteria andSizeGreaterThan(Integer value) {
            addCriterion("size >", value, "size");
            return (Criteria) this;
        }

        public Criteria andSizeGreaterThanOrEqualTo(Integer value) {
            addCriterion("size >=", value, "size");
            return (Criteria) this;
        }

        public Criteria andSizeLessThan(Integer value) {
            addCriterion("size <", value, "size");
            return (Criteria) this;
        }

        public Criteria andSizeLessThanOrEqualTo(Integer value) {
            addCriterion("size <=", value, "size");
            return (Criteria) this;
        }

        public Criteria andSizeIn(List<Integer> values) {
            addCriterion("size in", values, "size");
            return (Criteria) this;
        }

        public Criteria andSizeNotIn(List<Integer> values) {
            addCriterion("size not in", values, "size");
            return (Criteria) this;
        }

        public Criteria andSizeBetween(Integer value1, Integer value2) {
            addCriterion("size between", value1, value2, "size");
            return (Criteria) this;
        }

        public Criteria andSizeNotBetween(Integer value1, Integer value2) {
            addCriterion("size not between", value1, value2, "size");
            return (Criteria) this;
        }

        public Criteria andPriceIsNull() {
            addCriterion("price is null");
            return (Criteria) this;
        }

        public Criteria andPriceIsNotNull() {
            addCriterion("price is not null");
            return (Criteria) this;
        }

        public Criteria andPriceEqualTo(Double value) {
            addCriterion("price =", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotEqualTo(Double value) {
            addCriterion("price <>", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThan(Double value) {
            addCriterion("price >", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThanOrEqualTo(Double value) {
            addCriterion("price >=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThan(Double value) {
            addCriterion("price <", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThanOrEqualTo(Double value) {
            addCriterion("price <=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceIn(List<Double> values) {
            addCriterion("price in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotIn(List<Double> values) {
            addCriterion("price not in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceBetween(Double value1, Double value2) {
            addCriterion("price between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotBetween(Double value1, Double value2) {
            addCriterion("price not between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andBookIsNull() {
            addCriterion("book is null");
            return (Criteria) this;
        }

        public Criteria andBookIsNotNull() {
            addCriterion("book is not null");
            return (Criteria) this;
        }

        public Criteria andBookEqualTo(Integer value) {
            addCriterion("book =", value, "book");
            return (Criteria) this;
        }

        public Criteria andBookNotEqualTo(Integer value) {
            addCriterion("book <>", value, "book");
            return (Criteria) this;
        }

        public Criteria andBookGreaterThan(Integer value) {
            addCriterion("book >", value, "book");
            return (Criteria) this;
        }

        public Criteria andBookGreaterThanOrEqualTo(Integer value) {
            addCriterion("book >=", value, "book");
            return (Criteria) this;
        }

        public Criteria andBookLessThan(Integer value) {
            addCriterion("book <", value, "book");
            return (Criteria) this;
        }

        public Criteria andBookLessThanOrEqualTo(Integer value) {
            addCriterion("book <=", value, "book");
            return (Criteria) this;
        }

        public Criteria andBookIn(List<Integer> values) {
            addCriterion("book in", values, "book");
            return (Criteria) this;
        }

        public Criteria andBookNotIn(List<Integer> values) {
            addCriterion("book not in", values, "book");
            return (Criteria) this;
        }

        public Criteria andBookBetween(Integer value1, Integer value2) {
            addCriterion("book between", value1, value2, "book");
            return (Criteria) this;
        }

        public Criteria andBookNotBetween(Integer value1, Integer value2) {
            addCriterion("book not between", value1, value2, "book");
            return (Criteria) this;
        }

        public Criteria andComputerIsNull() {
            addCriterion("computer is null");
            return (Criteria) this;
        }

        public Criteria andComputerIsNotNull() {
            addCriterion("computer is not null");
            return (Criteria) this;
        }

        public Criteria andComputerEqualTo(Integer value) {
            addCriterion("computer =", value, "computer");
            return (Criteria) this;
        }

        public Criteria andComputerNotEqualTo(Integer value) {
            addCriterion("computer <>", value, "computer");
            return (Criteria) this;
        }

        public Criteria andComputerGreaterThan(Integer value) {
            addCriterion("computer >", value, "computer");
            return (Criteria) this;
        }

        public Criteria andComputerGreaterThanOrEqualTo(Integer value) {
            addCriterion("computer >=", value, "computer");
            return (Criteria) this;
        }

        public Criteria andComputerLessThan(Integer value) {
            addCriterion("computer <", value, "computer");
            return (Criteria) this;
        }

        public Criteria andComputerLessThanOrEqualTo(Integer value) {
            addCriterion("computer <=", value, "computer");
            return (Criteria) this;
        }

        public Criteria andComputerIn(List<Integer> values) {
            addCriterion("computer in", values, "computer");
            return (Criteria) this;
        }

        public Criteria andComputerNotIn(List<Integer> values) {
            addCriterion("computer not in", values, "computer");
            return (Criteria) this;
        }

        public Criteria andComputerBetween(Integer value1, Integer value2) {
            addCriterion("computer between", value1, value2, "computer");
            return (Criteria) this;
        }

        public Criteria andComputerNotBetween(Integer value1, Integer value2) {
            addCriterion("computer not between", value1, value2, "computer");
            return (Criteria) this;
        }

        public Criteria andGardenIsNull() {
            addCriterion("garden is null");
            return (Criteria) this;
        }

        public Criteria andGardenIsNotNull() {
            addCriterion("garden is not null");
            return (Criteria) this;
        }

        public Criteria andGardenEqualTo(Integer value) {
            addCriterion("garden =", value, "garden");
            return (Criteria) this;
        }

        public Criteria andGardenNotEqualTo(Integer value) {
            addCriterion("garden <>", value, "garden");
            return (Criteria) this;
        }

        public Criteria andGardenGreaterThan(Integer value) {
            addCriterion("garden >", value, "garden");
            return (Criteria) this;
        }

        public Criteria andGardenGreaterThanOrEqualTo(Integer value) {
            addCriterion("garden >=", value, "garden");
            return (Criteria) this;
        }

        public Criteria andGardenLessThan(Integer value) {
            addCriterion("garden <", value, "garden");
            return (Criteria) this;
        }

        public Criteria andGardenLessThanOrEqualTo(Integer value) {
            addCriterion("garden <=", value, "garden");
            return (Criteria) this;
        }

        public Criteria andGardenIn(List<Integer> values) {
            addCriterion("garden in", values, "garden");
            return (Criteria) this;
        }

        public Criteria andGardenNotIn(List<Integer> values) {
            addCriterion("garden not in", values, "garden");
            return (Criteria) this;
        }

        public Criteria andGardenBetween(Integer value1, Integer value2) {
            addCriterion("garden between", value1, value2, "garden");
            return (Criteria) this;
        }

        public Criteria andGardenNotBetween(Integer value1, Integer value2) {
            addCriterion("garden not between", value1, value2, "garden");
            return (Criteria) this;
        }

        public Criteria andFreebreakfastIsNull() {
            addCriterion("freebreakfast is null");
            return (Criteria) this;
        }

        public Criteria andFreebreakfastIsNotNull() {
            addCriterion("freebreakfast is not null");
            return (Criteria) this;
        }

        public Criteria andFreebreakfastEqualTo(Integer value) {
            addCriterion("freebreakfast =", value, "freebreakfast");
            return (Criteria) this;
        }

        public Criteria andFreebreakfastNotEqualTo(Integer value) {
            addCriterion("freebreakfast <>", value, "freebreakfast");
            return (Criteria) this;
        }

        public Criteria andFreebreakfastGreaterThan(Integer value) {
            addCriterion("freebreakfast >", value, "freebreakfast");
            return (Criteria) this;
        }

        public Criteria andFreebreakfastGreaterThanOrEqualTo(Integer value) {
            addCriterion("freebreakfast >=", value, "freebreakfast");
            return (Criteria) this;
        }

        public Criteria andFreebreakfastLessThan(Integer value) {
            addCriterion("freebreakfast <", value, "freebreakfast");
            return (Criteria) this;
        }

        public Criteria andFreebreakfastLessThanOrEqualTo(Integer value) {
            addCriterion("freebreakfast <=", value, "freebreakfast");
            return (Criteria) this;
        }

        public Criteria andFreebreakfastIn(List<Integer> values) {
            addCriterion("freebreakfast in", values, "freebreakfast");
            return (Criteria) this;
        }

        public Criteria andFreebreakfastNotIn(List<Integer> values) {
            addCriterion("freebreakfast not in", values, "freebreakfast");
            return (Criteria) this;
        }

        public Criteria andFreebreakfastBetween(Integer value1, Integer value2) {
            addCriterion("freebreakfast between", value1, value2, "freebreakfast");
            return (Criteria) this;
        }

        public Criteria andFreebreakfastNotBetween(Integer value1, Integer value2) {
            addCriterion("freebreakfast not between", value1, value2, "freebreakfast");
            return (Criteria) this;
        }

        public Criteria andDailycleanIsNull() {
            addCriterion("dailyclean is null");
            return (Criteria) this;
        }

        public Criteria andDailycleanIsNotNull() {
            addCriterion("dailyclean is not null");
            return (Criteria) this;
        }

        public Criteria andDailycleanEqualTo(Integer value) {
            addCriterion("dailyclean =", value, "dailyclean");
            return (Criteria) this;
        }

        public Criteria andDailycleanNotEqualTo(Integer value) {
            addCriterion("dailyclean <>", value, "dailyclean");
            return (Criteria) this;
        }

        public Criteria andDailycleanGreaterThan(Integer value) {
            addCriterion("dailyclean >", value, "dailyclean");
            return (Criteria) this;
        }

        public Criteria andDailycleanGreaterThanOrEqualTo(Integer value) {
            addCriterion("dailyclean >=", value, "dailyclean");
            return (Criteria) this;
        }

        public Criteria andDailycleanLessThan(Integer value) {
            addCriterion("dailyclean <", value, "dailyclean");
            return (Criteria) this;
        }

        public Criteria andDailycleanLessThanOrEqualTo(Integer value) {
            addCriterion("dailyclean <=", value, "dailyclean");
            return (Criteria) this;
        }

        public Criteria andDailycleanIn(List<Integer> values) {
            addCriterion("dailyclean in", values, "dailyclean");
            return (Criteria) this;
        }

        public Criteria andDailycleanNotIn(List<Integer> values) {
            addCriterion("dailyclean not in", values, "dailyclean");
            return (Criteria) this;
        }

        public Criteria andDailycleanBetween(Integer value1, Integer value2) {
            addCriterion("dailyclean between", value1, value2, "dailyclean");
            return (Criteria) this;
        }

        public Criteria andDailycleanNotBetween(Integer value1, Integer value2) {
            addCriterion("dailyclean not between", value1, value2, "dailyclean");
            return (Criteria) this;
        }

        public Criteria andPicIsNull() {
            addCriterion("pic is null");
            return (Criteria) this;
        }

        public Criteria andPicIsNotNull() {
            addCriterion("pic is not null");
            return (Criteria) this;
        }

        public Criteria andPicEqualTo(String value) {
            addCriterion("pic =", value, "pic");
            return (Criteria) this;
        }

        public Criteria andPicNotEqualTo(String value) {
            addCriterion("pic <>", value, "pic");
            return (Criteria) this;
        }

        public Criteria andPicGreaterThan(String value) {
            addCriterion("pic >", value, "pic");
            return (Criteria) this;
        }

        public Criteria andPicGreaterThanOrEqualTo(String value) {
            addCriterion("pic >=", value, "pic");
            return (Criteria) this;
        }

        public Criteria andPicLessThan(String value) {
            addCriterion("pic <", value, "pic");
            return (Criteria) this;
        }

        public Criteria andPicLessThanOrEqualTo(String value) {
            addCriterion("pic <=", value, "pic");
            return (Criteria) this;
        }

        public Criteria andPicLike(String value) {
            addCriterion("pic like", value, "pic");
            return (Criteria) this;
        }

        public Criteria andPicNotLike(String value) {
            addCriterion("pic not like", value, "pic");
            return (Criteria) this;
        }

        public Criteria andPicIn(List<String> values) {
            addCriterion("pic in", values, "pic");
            return (Criteria) this;
        }

        public Criteria andPicNotIn(List<String> values) {
            addCriterion("pic not in", values, "pic");
            return (Criteria) this;
        }

        public Criteria andPicBetween(String value1, String value2) {
            addCriterion("pic between", value1, value2, "pic");
            return (Criteria) this;
        }

        public Criteria andPicNotBetween(String value1, String value2) {
            addCriterion("pic not between", value1, value2, "pic");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}