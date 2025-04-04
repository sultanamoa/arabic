<? --[[
*  Pi-hole: A black hole for Internet advertisements
*  (c) 2017 Pi-hole, LLC (https://pi-hole.net)
*  Network-wide ad blocking via your own hardware.
*
*  This file is copyright under the latest version of the EUPL.
*  Please see LICENSE file for your rights under this license.
--]]

indexpage = true
mg.include('scripts/lua/header_authenticated.lp','r')
?>
<!-- Small boxes (Stat box) -->
<div class="row">
    <div class="col-lg-3 col-sm-6">
        <!-- small box -->
        <div class="small-box bg-aqua no-user-select" id="total_queries" title="Total number of queries">
            <div class="inner">
                <p>إجمالي الاستعلامات</p>
                <h3 class="statistic"><span id="dns_queries">---</span></h3>
            </div>
            <div class="icon">
                <i class="fas fa-globe-americas"></i>
            </div>
            <a href="network" class="small-box-footer" id="total_clients">
                <span id="active_clients">-</span> الاجهزة النشطة <i class="fa fa-arrow-circle-right"></i>
            </a>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-sm-6">
        <!-- small box -->
        <div class="small-box bg-red no-user-select">
            <div class="inner">
                <p>الاستعلامات المحجوبة</p>
                <h3 class="statistic"><span id="blocked_queries">---</span></h3>
            </div>
            <div class="icon">
                <i class="fas fa-hand-paper"></i>
            </div>
            <a href="queries?upstream=blocklist" class="small-box-footer">
                قائمة الاستعلامات المحجوبة <i class="fa fa-arrow-circle-right"></i>
            </a>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-sm-6">
        <!-- small box -->
        <div class="small-box bg-yellow no-user-select">
            <div class="inner">
                <p>نسبة الحجب</p>
                <h3 class="statistic"><span id="percent_blocked">---</span></h3>
            </div>
            <div class="icon">
                <i class="fas fa-chart-pie"></i>
            </div>
            <a href="queries" class="small-box-footer">
                قائمة جميع الاستعلامات <i class="fa fa-arrow-circle-right"></i>
            </a>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-sm-6">
        <!-- small box -->
        <div class="small-box bg-green no-user-select">
            <div class="inner">
                <p>النطاقات التي في القائمة</p>
                <h3 class="statistic"><span id="gravity_size">---</span></h3>
            </div>
            <div class="icon">
                <i class="fas fa-list-alt"></i>
            </div>
            <a href="groups-lists" class="small-box-footer">
                ادارة القائمة <i class="fa fa-arrow-circle-right"></i>
            </a>
        </div>
    </div>
    <!-- ./col -->
</div>

<div class="row">
    <div class="col-md-12">
        <div class="box" id="queries-over-time">
            <div class="box-header with-border">
                <h3 class="box-title">مجموع الاستعلامات</h3>
                <button class="btn btn-xs btn-default pull-right zoom-reset" data-sel="reset-history"><i class="fas fa-undo"></i>&nbsp;Reset zoom</button>
                <span class="pull-right zoom-info" data-toggle="tooltip" title="You can zoom this graph by either holding down the [Ctrl] key and using your mouse wheel or by using the &quot;pinch&quot; multi-touch gesture. You can furthermore click and drag to pan the graph."><i class="fa fa-info-circle"></i></span>
            </div>
            <div class="box-body">
                <div class="chart" style="width: 100%; height: 180px">
                    <canvas id="queryOverTimeChart"></canvas>
                </div>
            </div>
            <div class="overlay">
                <i class="fa fa-sync fa-spin"></i>
            </div>
            <!-- /.box-body -->
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="box" id="clients">
            <div class="box-header with-border">
                <h3 class="box-title">نشاط الأجهزة</h3>
                <button class="btn btn-xs btn-default pull-right zoom-reset" data-sel="reset-clients"><i class="fas fa-undo"></i>&nbsp;Reset zoom</button>
                <span class="pull-right zoom-info" data-toggle="tooltip" title="You can zoom this graph by either holding down the [Ctrl] key and using your mouse wheel or by using the &quot;pinch&quot; multi-touch gesture. You can furthermore click and drag to pan the graph."><i class="fa fa-info-circle"></i></span>
            </div>
            <div class="box-body">
                <div class="chart" style="width: 100%; height: 180px">
                    <canvas id="clientsChart" class="extratooltipcanvas no-user-select"></canvas>
                </div>
            </div>
            <div class="overlay">
                <i class="fa fa-sync fa-spin"></i>
            </div>
            <!-- /.box-body -->
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        <div class="box" id="query-types-pie">
            <div class="box-header with-border">
                <h3 class="box-title">انواع الاستعلامات</h3>
            </div>
            <div class="box-body">
                <div style="width:50%">
                    <canvas id="queryTypePieChart" width="280" height="280"></canvas>
                </div>
                <div class="chart-legend" style="width:50%" id="query-types-legend" ></div>
            </div>
            <div class="overlay">
                <i class="fa fa-sync fa-spin"></i>
            </div>
            <!-- /.box-body -->
        </div>
    </div>
    <div class="col-md-6">
        <div class="box" id="forward-destinations-pie">
            <div class="box-header with-border">
                <h3 class="box-title">خوادم خارجية</h3>
            </div>
            <div class="box-body">
                <div style="width:50%">
                    <canvas id="forwardDestinationPieChart" width="280" height="280" class="extratooltipcanvas no-user-select"></canvas>
                </div>
                <div class="chart-legend" style="width:50%" id="forward-destinations-legend"></div>
            </div>
            <div class="overlay">
                <i class="fa fa-sync fa-spin"></i>
            </div>
            <!-- /.box-body -->
        </div>
    </div>
</div>

<? if pihole.boxedlayout() then tablelayout = 'col-md-6' else  tablelayout = 'col-md-6 col-lg-6' end ?>
<div class="row">
    <div class="<?=tablelayout?>">
        <div class="box" id="domain-frequency">
            <div class="box-header with-border">
                <h3 class="box-title">اعلى النطاقات استعلام</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            <th>اسم النطاق</th>
                            <th>عدد المرات</th>
                            <th> نسبة الاستعلام</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="overlay">
                <i class="fa fa-sync fa-spin"></i>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>
    <!-- /.col -->
    <div class="<?=tablelayout?>">
        <div class="box" id="ad-frequency">
            <div class="box-header with-border">
                <h3 class="box-title">اعلى نطاقات محجوبة</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            <th>اسم النطاق</th>
                            <th>عدد المرات</th>
                            <th>نسبة الاستعلام</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="overlay">
                <i class="fa fa-sync fa-spin"></i>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>
</div>
<div class="row">
    <!-- /.col -->
    <div class="<?=tablelayout?>">
        <div class="box" id="client-frequency">
            <div class="box-header with-border">
                <h3 class="box-title">اعلى المستخدمين (مجموع)</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            <th>المستخدم</th>
                            <th>عدد الطلبات</th>
                            <th>نسبة الطلبات</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="overlay">
                <i class="fa fa-sync fa-spin"></i>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>
    <!-- /.col -->
    <div class="<?=tablelayout?>">
        <div class="box" id="client-frequency-blocked">
            <div class="box-header with-border">
                <h3 class="box-title">اعلى المستخدمين (المحجوبة فقط)</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            <th>المستخدم</th>
                            <th>عدد الحجب</th>
                            <th>نسبة الحجب</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="overlay">
                <i class="fa fa-sync fa-spin"></i>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>
    <!-- /.col -->
</div>
<!-- /.row -->

<script defer src="<?=pihole.fileversion('scripts/js/charts.js')?>"></script>
<script defer src="<?=pihole.fileversion('scripts/js/index.js')?>"></script>

<? mg.include('scripts/lua/footer.lp','r')?>
