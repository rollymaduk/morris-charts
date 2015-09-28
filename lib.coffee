Rp_mchart={
  ###private properties###
  _instances:{}

  ###private methods###
  _getInstance:(name)->
      unless @_instances[name]
        @_instances[name]={data:new ReactiveVar(),options:new ReactiveVar(),type:new ReactiveVar()}
      @_instances[name]

  ###public methods###
  setData:(name,data)->
    @_getInstance(name).data.set(data)

  setOptions:(name,options)->
    @_getInstance(name).options.set(options)

  setType:(name,type)->
    @_getInstance(name).type.set(type)

  buildChart:(element)=>
    $("##{element}").empty()
    item=Rp_mchart._getInstance(element)
    options=item.options.get() or {}
    settings=_.extend(options,{element:element,data:item.data.get()})
    switch item.type.get()
      when 'pie'
        new Morris.Donut(settings)
      when 'area'
        new Morris.Area(settings)
      when 'bar'
        new Morris.Bar(settings)
      else
        new Morris.Line(settings)

}

Meteor.startup ->
  Template.rp_morris_chart.rendered=->
    @autorun(()=>_.delay(Rp_mchart.buildChart,Template.rp_morris_chart.getData().delay,@_id))

  Template.rp_morris_chart.helpers
    id:->Template.instance()._id
    chartClass:->Template.instance()._chartClasses

  Template.rp_morris_chart.destroyed=->
    console.log @
    $("##{@_id}").empty()
    Rp_mchart._instances={}
    Blaze.remove(@view)

  Template.rp_morris_chart.created=->
    Template.rp_morris_chart.initialize(@)

  Template.rp_morris_chart.initialize=(temp)->
    @prepareDatasource()
    @prepareOptions(!_.isEqual(@getData().type,'pie'))
    @prepareDelay()
    temp._id=@getData().id or _.uniqueId('rp_mChart_')
    Rp_mchart.setData(temp._id,@getDatasource())
    Rp_mchart.setOptions(temp._id,@getOptions())
    Rp_mchart.setType(temp._id,@getData().type or 'line')
    temp._chartClasses= @getData().chartClasses or ""

  Template.rp_morris_chart.prepareOptions=(predicate)->
    opts=if predicate then {hideHover:'auto',ymin:'auto',ymax:'auto'} else {}
    @setOptions(_.extend(resize:true,opts))

  Template.rp_morris_chart.getOptions=->
    @getData().options or {}

  Template.rp_morris_chart.setOptions=(options)->
    options=_.extend(@getOptions(),options)
    @setData('options',options)

  Template.rp_morris_chart.prepareDatasource=->
    source= @getDatasource()
    unless source
      @setDatasource([])
  Template.rp_morris_chart.prepareDelay=->
    delay=@getData().delay
    unless delay
      @setData('delay',0)

  Template.rp_morris_chart.setDatasource=(data)->
    @setData('datasource',data)

  Template.rp_morris_chart.getDatasource=()->
    @getData().datasource

  Template.rp_morris_chart.getData=->
    Template.currentData() or false

  Template.rp_morris_chart.setData=(key,data)->
    Template.currentData()[key]=data

