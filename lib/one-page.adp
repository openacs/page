<master>
<property name="title">@title@</property>

<if @control_html@ not nil>
<div style="float: right;">@control_html;noquote@</div>
</if>
@content;noquote@
