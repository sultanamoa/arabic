<? --[[
*    Pi-hole: A black hole for Internet advertisements
*    (c) 2017 Pi-hole, LLC (https://pi-hole.net)
*    Network-wide ad blocking via your own hardware.
*
*    This file is copyright under the latest version of the EUPL.
*    Please see LICENSE file for your rights under this license.
*/ ]]-- ?>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img class="logo-img" src="<?=webhome?>img/logo.svg" alt="Pi-hole logo" width="52" height="75">
                </div>
                <div class="pull-left info">
                    <p>حالة النظام</p>
                    <span id="status"></span><br>
                    <span id="query_frequency"></span><br>
                    <span id="cpu"></span><br>
                    <span id="memory"></span>
                </div>
            </div>
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header text-uppercase">الرئيسية</li>
                <!-- Home Page -->
                <li class="menu-main<? if scriptname == 'index' or scriptname == 'index.lp' then ?> active<? end ?>">
                    <a href="<?=webhome?>">
                        <i class="fa fa-fw menu-icon fa-home"></i> <span>واجهة المستخدم</span>
                    </a>
                </li>
                <!-- Query Log -->
                <li class="menu-analysis<? if scriptname == 'queries' then ?> active<? end ?>">
                    <a href="<?=webhome?>queries">
                        <i class="fa fa-fw menu-icon fa-file-alt"></i> <span>سجل الاستعلام</span>
                    </a>
                </li>

                <li class="header text-uppercase">اعداد المجموعات</li>
                <!-- Group Management -->
                <li class="menu-group<? if scriptname == 'groups' then ?> active<? end ?>">
                    <a href="<?=webhome?>groups">
                        <i class="fa fa-fw menu-icon fa-user-friends"></i>
                        <span>مجموعات
                            <span class="pull-right-container">
                                <span class="label label-primary pull-right" id="num_groups" title="Number of enabled groups"></span>
                            </span>
                        </span>
                    </a>
                </li>
                <li class="menu-group<? if scriptname == 'groups/clients' then ?> active<? end ?>">
                    <a href="<?=webhome?>groups/clients">
                        <i class="fa fa-fw menu-icon fa-laptop"></i>
                        <span>اجهزة
                            <span class="pull-right-container">
                                <span class="label label-primary pull-right" id="num_clients" title="Number of defined clients"></span>
                            </span>
                        </span>
                    </a>
                </li>
                <li class="menu-group<? if scriptname == 'groups/domains' then ?> active<? end ?>">
                    <a href="<?=webhome?>groups/domains">
                        <i class="fa fa-fw menu-icon fa-list"></i>
                        <span>نطاقات
                            <span class="pull-right-container">
                                <span class="label bg-red pull-right" id="num_denied" title="Number of enabled deny rules (domains and regex)"></span>
                                <span class="label bg-green pull-right" id="num_allowed" title="Number of enabled allow rules (domains and regex)"></span>
                            </span>
                        </span>
                    </a>
                </li>
                <li class="menu-group<? if scriptname == 'groups/lists' then ?> active<? end ?>">
                    <a href="<?=webhome?>groups/lists">
                        <i class="fa fa-fw menu-icon fa-shield-alt"></i>
                        <span>Lists
                            <span class="pull-right-container">
                                <span class="label bg-blue pull-right" id="num_lists" title="Number of subscribed and enabled lists"></span>
                                <span class="label bg-yellow pull-right" id="num_gravity" title="Total number of domains subscribed by your Pi-hole"></span>
                            </span>
                        </span>
                    </a>
                </li>

                <li class="header text-uppercase">DNS تحكم عناوين </li>
                <!-- Local DNS Records -->
                <!-- Enable/Disable Blocking -->
                <li id="pihole-disable" class="menu-dns treeview">
                    <a href="<?=webhome?>#">
                        <i class="fa fa-fw menu-icon fa-stop"></i> <span>Disable Blocking&nbsp;&nbsp;&nbsp;<span id="flip-status-disable"></span></span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li>
                            <a href="<?=webhome?>#" id="pihole-disable-indefinitely">
                                <i class="fa fa-fw menu-icon fa-infinity"></i> Indefinitely
                            </a>
                        </li>
                        <li>
                            <a href="<?=webhome?>#" id="pihole-disable-10s">
                                <i class="fa fa-fw menu-icon fa-clock"></i> لمدة 10 ثواني
                            </a>
                        </li>
                        <li>
                            <a href="<?=webhome?>#" id="pihole-disable-30s">
                                <i class="fa fa-fw menu-icon fa-clock"></i> لمدة 30 ثانية
                            </a>
                        </li>
                        <li>
                            <a href="<?=webhome?>#" id="pihole-disable-5m">
                                <i class="fa fa-fw menu-icon fas fa-clock"></i> لمدة 5 دقائق
                            </a>
                        </li>
                        <li>
                            <a href="<?=webhome?>#" id="pihole-disable-cst" data-toggle="modal" data-target="#customDisableModal">
                                <i class="fa fa-fw menu-icon fa-user-clock"></i> وقت محدد
                            </a>
                        </li>
                    </ul>
                    <!-- <a href="<?=webhome?>#" id="flip-status"><i class="fa fa-stop"></i> <span>Disable</span></a> -->
                </li>
                <li id="pihole-enable" class="menu-dns treeview" style="display: none;">
                    <a href="<?=webhome?>#">
                        <i class="fa fa-fw menu-icon fa-play"></i>
                        <span id="enableLabel">تفعيل الحجب&nbsp;&nbsp;&nbsp;
                            <span id="flip-status-enable"></span>
                        </span>
                    </a>
                </li>
                <li class="header text-uppercase">System</li>
                <!-- Settings -->
                <li class="menu-system treeview <? if startsWith(scriptname, 'settings/') then ?> active<? end ?>">
                    <a href="<?=webhome?>#">
                        <i class="fa fa-fw menu-icon fa-cogs"></i> <span>الاعدادات</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li class="<? if scriptname == 'settings/system' then ?> active<? end ?>">
                            <a href="<?=webhome?>settings/system">
                                <i class="fa-fw menu-icon fa-solid fa-circle-info"></i> <span>النظام</span>
                            </a>
                        </li>
                        <li class="<? if scriptname == 'settings/dns' then ?> active<? end ?>">
                            <a href="<?=webhome?>settings/dns">
                                <i class="fa-fw menu-icon fa-solid fa-book-atlas"></i> <span>DNS</span>
                            </a>
                        </li>
                        <li class="<? if scriptname == 'settings/dhcp' then ?> active<? end ?>">
                            <a href="<?=webhome?>settings/dhcp">
                                <i class="fa-fw menu-icon fa-solid fa-sitemap"></i> <span>DHCP</span>
                            </a>
                        </li>
                        <li class="<? if scriptname == 'settings/api' then ?> active<? end ?>">
                            <a href="<?=webhome?>settings/api">
                                <i class="fa-fw menu-icon fa-solid fa-window-restore"></i> <span>Web interface / API</span>
                            </a>
                        </li>
                        <li class="<? if scriptname == 'settings/privacy' then ?> active<? end ?>">
                            <a href="<?=webhome?>settings/privacy">
                                <i class="fa-fw menu-icon fa-solid fa-binoculars"></i> <span>الخصوصية</span>
                            </a>
                        </li>
                        <li class="<? if scriptname == 'settings/teleporter' then ?> active<? end ?>">
                            <a href="<?=webhome?>settings/teleporter">
                                <i class="fa-fw menu-icon fa-solid fa-file-export"></i> <span>Teleporter</span>
                            </a>
                        </li>
                        <li class="<? if scriptname == 'settings/dnsrecords' then ?> active<? end ?>">
                            <a href="<?=webhome?>settings/dnsrecords">
                                <i class="fa-fw menu-icon fa-solid fa-address-book"></i> <span>معرفات المواقع الداخلية</span>
                            </a>
                        </li>
                        <li class="<? if scriptname == 'settings/all' then ?> active<? end ?> settings-level-expert">
                            <a href="<?=webhome?>settings/all">
                                <i class="fa-fw menu-icon fa-solid fa-pen-to-square"></i> <span>جميع الاعدادات</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- Tools -->
                <li class="menu-system treeview<? if in_array(scriptname, {'messages', 'gravity', 'search', 'taillog', 'interfaces', 'network'}) then ?> active<? end ?>">
                    <a href="<?=webhome?>#">
                        <i class="fa fa-fw menu-icon fa-tools"></i> <span>الادوات</span>
                        <span class="warning-count hidden"></span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <!-- Pi-hole diagnosis -->
                        <li class="<? if scriptname == 'messages' then ?> active<? end ?>">
                            <a href="<?=webhome?>messages">
                                <i class="fa fa-fw menu-icon fa-file-medical-alt"></i> <span>فحص النظام والتحقق من الاخطاء</span>
                                <span class="pull-right-container warning-count hidden"></span>
                            </a>
                        </li>
                        <!-- Tail log files -->
                        <li class="treeview <? if scriptname == 'taillog' then ?> active<? end ?>">
                            <a href="<?=webhome?>#">
                                <i class="fa-fw menu-icon fa-solid fa-list-ul"></i> <span>تتبع سجلات الاحداث مباشرة</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <!-- Tail pihole.log -->
                                <li class="<? if scriptname == 'taillog' and GET("file") == "dnsmasq" then ?> active<? end ?>">
                                    <a href="<?=webhome?>taillog?file=dnsmasq">
                                        <i class="fa-fw menu-icon fa-solid fa-list-ul"></i> pihole.log
                                    </a>
                                </li>
                                <!-- Tail FTL.log -->
                                <li class="<? if scriptname == 'taillog' and GET("file") == "ftl" then ?> active<? end ?>">
                                    <a href="<?=webhome?>taillog?file=ftl">
                                        <i class="fa-fw menu-icon fa-solid fa-list-ul"></i> FTL.log
                                    </a>
                                </li>
                                <!-- Tail webserver.log -->
                                <li class="<? if scriptname == 'taillog' and GET("file") == "webserver" then ?> active<? end ?>">
                                    <a href="<?=webhome?>taillog?file=webserver">
                                        <i class="fa-fw menu-icon fa-solid fa-list-ul"></i> webserver.log
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- Run gravity.sh -->
                        <li class="<? if scriptname == 'gravity' then ?> active<? end ?>">
                            <a href="<?=webhome?>gravity">
                                <i class="fa fa-fw menu-icon fa-arrow-circle-down"></i> <span>لتحديث قوائم الحجب</span>
                            </a>
                        </li>
                        <!-- Query Lists -->
                        <li class="<? if scriptname == 'search' then ?> active<? end ?>">
                            <a href="<?=webhome?>search">
                                <i class="fa fa-fw menu-icon fa-search"></i> <span>قائمة البحث</span>
                            </a>
                        </li>
                        <!-- Interfaces -->
                        <li class="<? if scriptname == 'interfaces' then ?> active<? end ?>">
                            <a href="<?=webhome?>interfaces">
                                <i class="fa fa-fw menu-icon fa-wifi"></i> <span>Interfaces</span>
                            </a>
                        </li>
                        <!-- Network -->
                        <li class="<? if scriptname == 'network' then ?> active<? end ?>">
                            <a href="<?=webhome?>network">
                                <i class="fa fa-fw menu-icon fa-network-wired"></i> <span>الشبكة</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <!-- Donate button -->
                <li class="header text-uppercase">الامن السيبراني</li>
                <li class="menu-donate">
                    <a href="https://aicbox.com/" rel="noopener" target="_blank">
                        <i class="fas fa-fw menu-icon fa-donate"></i> <span>الأمن السيبراني</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
