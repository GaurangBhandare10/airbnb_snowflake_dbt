{% macro tag(column_name) %}
case 
    when {{ column_name }} < 100 then 'budget'
    when {{ column_name }} >= 100 and {{ column_name }} < 200 then 'mid-range'
    when {{ column_name }} >= 200 then 'luxury'
end
{% endmacro %}