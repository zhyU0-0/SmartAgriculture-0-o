create table device
(
    id          bigint auto_increment comment '主键ID'
        primary key,
    sn          varchar(255)  null comment 'sn',
    type        int default 0 null comment '消息类型(默认0)',
    status      int default 0 null comment '设备状态',
    create_time datetime      null comment '创建时间',
    update_time datetime      null comment '更新时间',
    field_id    bigint        null comment '地块ID',
    gateway_id  bigint        null comment '网关ID',
    user_id     bigint        null comment '用户ID',
    name        varchar(255)  null
)
    comment '设备表';

create table device_field
(
    id        bigint auto_increment comment '用户主键ID'
        primary key,
    field_id  varchar(255) null comment '地块ID',
    device_id varchar(255) null comment '设备ID'
)
    comment '地块-设备';

create table exception_info
(
    id               bigint auto_increment comment '主键ID'
        primary key,
    content          varchar(255) null comment '消息内容',
    status           varchar(255) null comment '信息状态',
    type             int          null comment '异常类型',
    create_time      datetime     null comment '创建时间',
    update_time      datetime     null comment '更新时间',
    gateway_id       bigint       null comment '网关ID',
    field_id         bigint       null comment '地块ID',
    process_function varchar(255) null
)
    comment '异常信息表';

create table field
(
    id                bigint auto_increment comment '主键ID'
        primary key,
    type              int default 0  null comment '消息类型(默认0)',
    status            int default 0  null comment '地块状态',
    create_time       datetime       null comment '创建时间',
    update_time       datetime       null comment '更新时间',
    user_id           bigint         null comment '用户ID',
    name              varchar(255)   null comment '地块名称',
    area              decimal(10, 2) null comment '地块面积',
    content           varchar(255)   null comment '地块描述',
    address           varchar(255)   null comment '位置',
    temp              decimal(10, 2) null,
    humidity          decimal(10, 2) null,
    image             varchar(200)   null,
    irrigation_volume decimal(10, 3) null,
    crop_type         varchar(100)   null,
    land_humidity     decimal(10, 2) null,
    land_temp         decimal(10, 2) null,
    concentration_co2 decimal(10, 2) null,
    light_intensity   decimal(10, 2) null,
    density           decimal(10, 2) null
)
    comment '设备表';

create table gateway
(
    id          bigint auto_increment comment '主键ID'
        primary key,
    type        int default 0 null comment '消息类型(默认0)',
    status      int default 0 null comment '网关状态',
    create_time datetime      null comment '创建时间',
    update_time datetime      null comment '更新时间',
    user_id     bigint        null comment '用户ID',
    name        varchar(255)  null comment '网关名称',
    content     varchar(255)  null comment '网关描述',
    sn          varchar(200)  null,
    address     varchar(255)  null
)
    comment '网关表';

create table location_table
(
    id        bigint auto_increment
        primary key,
    max_x     varchar(255) null,
    max_y     varchar(255) null,
    point_x   varchar(255) null,
    point_y   varchar(255) null,
    picture   text         null,
    device_sn varchar(255) null,
    data      text         null
)
    comment '坐标表';

create table node
(
    id          bigint auto_increment comment '主键id'
        primary key,
    user_id     bigint   null comment '用户id',
    create_time datetime null comment '创建时间',
    update_time datetime null,
    content     text     null comment '内容'
);

create table session
(
    id          bigint auto_increment comment '主键ID'
        primary key,
    content     text         null,
    image_url   varchar(255) null comment '图片路径',
    type        int          null comment '消息类型(imageChat/chat)',
    role        int          null comment '角色',
    create_time datetime     null comment '创建时间',
    user_id     bigint       null comment '用户ID'
)
    comment '消息表';

create table skills_tools
(
    id        bigint auto_increment comment '技能主键ID'
        primary key,
    skills_id bigint       null,
    tools     varchar(225) null
);

create table threshold
(
    id                    bigint auto_increment comment '阈值主键ID'
        primary key,
    max_temp              decimal(5, 2)  null comment '最高温度(℃)',
    min_temp              decimal(5, 2)  null comment '最低温度(℃)',
    max_humidity          decimal(5, 2)  null comment '最高湿度(%)',
    min_humidity          decimal(5, 2)  null comment '最低湿度(%)',
    max_concentration_co2 decimal(10, 2) null comment '最高浓度(mg/L)',
    min_concentration_co2 decimal(10, 2) null comment '最低浓度(mg/L)',
    create_time           datetime       null comment '创建时间',
    update_time           datetime       null comment '更新时间',
    remark                varchar(500)   null comment '备注信息',
    field_id              bigint         null comment '地块id',
    land_max_temp         decimal(10, 2) null,
    land_min_temp         int            null,
    land_max_humidity     decimal(10, 2) null,
    land_min_humidity     decimal(10, 2) null,
    max_light_intensity   decimal(5, 2)  null,
    min_light_intensity   decimal(5, 2)  null
)
    comment '阈值配置表';

create index idx_create_time
    on threshold (create_time);

create table user
(
    id          bigint auto_increment comment '用户主键ID'
        primary key,
    openid      varchar(45)    null comment '第三方标识(如微信openid)',
    name        varchar(255)   null comment '用户姓名',
    password    varchar(255)   null comment '用户密码（建议存储加密后的密文）',
    image       varchar(500)   null comment '用户头像路径',
    create_time datetime       null comment '创建时间',
    money       decimal(10, 3) null comment '账号资金',
    phone       varchar(20)    null comment '手机号',
    skills_id   bigint         null comment '用户选择的技能'
)
    comment '用户信息表';

create table user_skill
(
    id          bigint auto_increment comment '技能主键ID'
        primary key,
    name        varchar(225) null,
    description text         null,
    instruction text         null,
    user_id     bigint       null,
    create_time datetime     null,
    update_time datetime     null
);

create table value_table
(
    id          bigint auto_increment comment '用户主键ID'
        primary key,
    value       decimal(10, 2) null comment '数值',
    create_time datetime       null comment '创建时间',
    device_id   bigint         null comment '设备id',
    type        int            null comment '类型'
)
    comment '数值表';

create table weather_data
(
    id              bigint auto_increment comment '主键ID'
        primary key,
    date            date        not null comment '日期，如：2026-03-17',
    week            varchar(10) null comment '星期几，如：2 (代表星期二)',
    dayweather      varchar(50) null comment '白天天气状况，如：阴',
    nightweather    varchar(50) null comment '夜间天气状况，如：小雨',
    daytemp         varchar(10) null comment '白天温度（摄氏度）',
    nighttemp       varchar(10) null comment '夜间温度（摄氏度）',
    daywind         varchar(20) null comment '白天风向，如：南',
    nightwind       varchar(20) null comment '夜间风向，如：南',
    daypower        varchar(20) null comment '白天风力等级，如：1-3',
    nightpower      varchar(20) null comment '夜间风力等级，如：1-3',
    daytemp_float   varchar(10) null comment '白天温度（浮点数格式）',
    nighttemp_float varchar(10) null comment '夜间温度（浮点数格式）',
    advice          text        null comment '生活建议',
    created_time    datetime    null comment '创建时间',
    updated_time    datetime    null comment '更新时间',
    gateway_id      bigint      null comment '网关id',
    date_num        int         null comment '日期编号(1-4)'
)
    comment '天气数据表';

