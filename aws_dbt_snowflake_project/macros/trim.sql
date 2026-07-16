{% macro trim(column_name, node) %}
    trim({{ column_name | trim | upper }})
{% endmacro %}