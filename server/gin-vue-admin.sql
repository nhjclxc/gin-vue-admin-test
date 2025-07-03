# gin-vue-admin项目表结构，按照字母顺序排序

# example  ===>>> exa
# system  ===>>> sys
# Go Vue Admin  ===>>> gva

create table exa_attachment_category
(
    id         bigint unsigned auto_increment
        primary key,
    created_at datetime(3)      null,
    updated_at datetime(3)      null,
    deleted_at datetime(3)      null,
    name       varchar(255)     null comment '分类名称',
    pid        bigint default 0 null comment '父节点ID'
) engine = innodb
  auto_increment = 1 comment = '扩展-附件分类表';

create index idx_exa_attachment_category_deleted_at on exa_attachment_category (deleted_at);

create table exa_customers
(
    id                    bigint unsigned auto_increment
        primary key,
    created_at            datetime(3)     null,
    updated_at            datetime(3)     null,
    deleted_at            datetime(3)     null,
    customer_name         varchar(191)    null comment '客户名',
    customer_phone_data   varchar(191)    null comment '客户手机号',
    sys_user_id           bigint unsigned null comment '管理ID',
    sys_user_authority_id bigint unsigned null comment '管理角色ID'
) engine = innodb
  auto_increment = 1 comment = '扩展-客户表';

create index idx_exa_customers_deleted_at on exa_customers (deleted_at);


create table exa_file_chunks
(
    id                bigint unsigned auto_increment
        primary key,
    created_at        datetime(3)     null,
    updated_at        datetime(3)     null,
    deleted_at        datetime(3)     null,
    exa_file_id       bigint unsigned null,
    file_chunk_number bigint          null,
    file_chunk_path   varchar(191)    null
) engine = innodb
  auto_increment = 1 comment = '扩展-文件分片表';

create index idx_exa_file_chunks_deleted_at on exa_file_chunks (deleted_at);


create table exa_file_upload_and_downloads
(
    id         bigint unsigned auto_increment
        primary key,
    created_at datetime(3)      null,
    updated_at datetime(3)      null,
    deleted_at datetime(3)      null,
    name       varchar(191)     null comment '文件名',
    class_id   bigint default 0 null comment '分类id',
    url        varchar(191)     null comment '文件地址',
    tag        varchar(191)     null comment '文件标签',
    `key`      varchar(191)     null comment '编号'
) engine = innodb
  auto_increment = 1 comment = '扩展-文件表（断点续传）';

create index idx_exa_file_upload_and_downloads_deleted_at on exa_file_upload_and_downloads (deleted_at);

INSERT INTO `gin-vue-admin-test2`.exa_file_upload_and_downloads (id, created_at, updated_at, deleted_at, name, class_id, url, tag, `key`) VALUES (1, '2025-07-01 17:23:05.468', '2025-07-01 17:23:05.468', null, '10.png', 0, 'https://qmplusimg.henrongyi.top/gvalogo.png', 'png', '158787308910.png');
INSERT INTO `gin-vue-admin-test2`.exa_file_upload_and_downloads (id, created_at, updated_at, deleted_at, name, class_id, url, tag, `key`) VALUES (2, '2025-07-01 17:23:05.468', '2025-07-01 17:23:05.468', null, 'logo.png', 0, 'https://qmplusimg.henrongyi.top/1576554439myAvatar.png', 'png', '1587973709logo.png');



create table exa_files
(
    id          bigint unsigned auto_increment
        primary key,
    created_at  datetime(3)  null,
    updated_at  datetime(3)  null,
    deleted_at  datetime(3)  null,
    file_name   varchar(191) null,
    file_md5    varchar(191) null,
    file_path   varchar(191) null,
    chunk_total bigint       null,
    is_finish   tinyint(1)   null
) engine = innodb
  auto_increment = 1 comment = '扩展-文件表';

create index idx_exa_files_deleted_at on exa_files (deleted_at);


create table gva_announcements_info
(
    id          bigint unsigned auto_increment
        primary key,
    created_at  datetime(3)  null,
    updated_at  datetime(3)  null,
    deleted_at  datetime(3)  null,
    title       varchar(191) null comment '公告标题',
    content     text         null comment '公告内容',
    user_id     bigint       null comment '发布者',
    attachments json         null comment '相关附件'
) engine = innodb
  auto_increment = 1 comment = '全局-文件表';

create index idx_gva_announcements_info_deleted_at on gva_announcements_info (deleted_at);


create table jwt_blacklists
(
    id         bigint unsigned auto_increment
        primary key,
    created_at datetime(3) null,
    updated_at datetime(3) null,
    deleted_at datetime(3) null,
    jwt        text        null comment 'jwt'
) engine = innodb
  auto_increment = 1 comment = '鉴权-黑名单表';


create index idx_jwt_blacklists_deleted_at on jwt_blacklists (deleted_at);

INSERT INTO `gin-vue-admin-test2`.jwt_blacklists (id, created_at, updated_at, deleted_at, jwt) VALUES (1, '2025-07-02 08:23:06.272', '2025-07-02 08:23:06.272', null, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiOGIzYzZiMDMtYmU3OS00MDM1LTlmYzctNzZiYTBiOWRiMDc4IiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Ik1yLuWlh-a3vCIsIkF1dGhvcml0eUlkIjo4ODgsIkJ1ZmZlclRpbWUiOjg2NDAwLCJpc3MiOiJxbVBsdXMiLCJhdWQiOlsiR1ZBIl0sImV4cCI6MTc1MjAyMDU0MSwibmJmIjoxNzUxNDE1NzQxfQ.uTt0yPdK2Dq2kZCRtmMtXAige8GdOYY8F1K8i0tXmCQ');
INSERT INTO `gin-vue-admin-test2`.jwt_blacklists (id, created_at, updated_at, deleted_at, jwt) VALUES (2, '2025-07-02 08:24:15.488', '2025-07-02 08:24:15.488', null, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiOGIzYzZiMDMtYmU3OS00MDM1LTlmYzctNzZiYTBiOWRiMDc4IiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Ik1yLuWlh-a3vCIsIkF1dGhvcml0eUlkIjo4ODgsIkJ1ZmZlclRpbWUiOjg2NDAwLCJpc3MiOiJxbVBsdXMiLCJhdWQiOlsiR1ZBIl0sImV4cCI6MTc1MjAyMDYwMSwibmJmIjoxNzUxNDE1ODAxfQ.XJ1hL0pO-86ianwPB-pbrKyZFOSvZmj8i8cmd3NVVoI');



create table sys_apis
(
    id          bigint unsigned auto_increment
        primary key,
    created_at  datetime(3)                 null,
    updated_at  datetime(3)                 null,
    deleted_at  datetime(3)                 null,
    path        varchar(191)                null comment 'api路径',
    description varchar(191)                null comment 'api中文描述',
    api_group   varchar(191)                null comment 'api组',
    method      varchar(191) default 'POST' null comment '方法'
) engine = innodb
  auto_increment = 1 comment = '系统-api接口路径表';

create index idx_sys_apis_deleted_at on sys_apis (deleted_at);

INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (1, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/jwt/jsonInBlacklist', 'jwt加入黑名单(退出，必选)', 'jwt', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (2, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/user/deleteUser', '删除用户', '系统用户', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (3, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/user/admin_register', '用户注册', '系统用户', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (4, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/user/getUserList', '获取用户列表', '系统用户', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (5, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/user/setUserInfo', '设置用户信息', '系统用户', 'PUT');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (6, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/user/setSelfInfo', '设置自身信息(必选)', '系统用户', 'PUT');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (7, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/user/getUserInfo', '获取自身信息(必选)', '系统用户', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (8, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/user/setUserAuthorities', '设置权限组', '系统用户', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (9, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/user/changePassword', '修改密码（建议选择)', '系统用户', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (10, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/user/setUserAuthority', '修改用户角色(必选)', '系统用户', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (11, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/user/resetPassword', '重置用户密码', '系统用户', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (12, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/user/setSelfSetting', '用户界面配置', '系统用户', 'PUT');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (13, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/api/createApi', '创建api', 'api', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (14, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/api/deleteApi', '删除Api', 'api', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (15, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/api/updateApi', '更新Api', 'api', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (16, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/api/getApiList', '获取api列表', 'api', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (17, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/api/getAllApis', '获取所有api', 'api', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (18, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/api/getApiById', '获取api详细信息', 'api', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (19, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/api/deleteApisByIds', '批量删除api', 'api', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (20, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/api/syncApi', '获取待同步API', 'api', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (21, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/api/getApiGroups', '获取路由组', 'api', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (22, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/api/enterSyncApi', '确认同步API', 'api', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (23, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/api/ignoreApi', '忽略API', 'api', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (24, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/authority/copyAuthority', '拷贝角色', '角色', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (25, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/authority/createAuthority', '创建角色', '角色', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (26, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/authority/deleteAuthority', '删除角色', '角色', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (27, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/authority/updateAuthority', '更新角色信息', '角色', 'PUT');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (28, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/authority/getAuthorityList', '获取角色列表', '角色', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (29, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/authority/setDataAuthority', '设置角色资源权限', '角色', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (30, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/casbin/updateCasbin', '更改角色api权限', 'casbin', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (31, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/casbin/getPolicyPathByAuthorityId', '获取权限列表', 'casbin', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (32, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/menu/addBaseMenu', '新增菜单', '菜单', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (33, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/menu/getMenu', '获取菜单树(必选)', '菜单', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (34, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/menu/deleteBaseMenu', '删除菜单', '菜单', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (35, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/menu/updateBaseMenu', '更新菜单', '菜单', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (36, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/menu/getBaseMenuById', '根据id获取菜单', '菜单', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (37, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/menu/getMenuList', '分页获取基础menu列表', '菜单', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (38, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/menu/getBaseMenuTree', '获取用户动态路由', '菜单', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (39, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/menu/getMenuAuthority', '获取指定角色menu', '菜单', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (40, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/menu/addMenuAuthority', '增加menu和角色关联关系', '菜单', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (41, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/fileUploadAndDownload/findFile', '寻找目标文件（秒传）', '分片上传', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (42, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/fileUploadAndDownload/breakpointContinue', '断点续传', '分片上传', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (43, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/fileUploadAndDownload/breakpointContinueFinish', '断点续传完成', '分片上传', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (44, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/fileUploadAndDownload/removeChunk', '上传完成移除文件', '分片上传', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (45, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/fileUploadAndDownload/upload', '文件上传（建议选择）', '文件上传与下载', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (46, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/fileUploadAndDownload/deleteFile', '删除文件', '文件上传与下载', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (47, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/fileUploadAndDownload/editFileName', '文件名或者备注编辑', '文件上传与下载', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (48, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/fileUploadAndDownload/getFileList', '获取上传文件列表', '文件上传与下载', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (49, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/fileUploadAndDownload/importURL', '导入URL', '文件上传与下载', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (50, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/system/getServerInfo', '获取服务器信息', '系统服务', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (51, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/system/getSystemConfig', '获取配置文件内容', '系统服务', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (52, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/system/setSystemConfig', '设置配置文件内容', '系统服务', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (53, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/customer/customer', '更新客户', '客户', 'PUT');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (54, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/customer/customer', '创建客户', '客户', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (55, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/customer/customer', '删除客户', '客户', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (56, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/customer/customer', '获取单一客户', '客户', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (57, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/customer/customerList', '获取客户列表', '客户', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (58, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/getDB', '获取所有数据库', '代码生成器', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (59, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/getTables', '获取数据库表', '代码生成器', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (60, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/createTemp', '自动化代码', '代码生成器', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (61, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/preview', '预览自动化代码', '代码生成器', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (62, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/getColumn', '获取所选table的所有字段', '代码生成器', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (63, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/installPlugin', '安装插件', '代码生成器', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (64, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/pubPlug', '打包插件', '代码生成器', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (65, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/mcp', '自动生成 MCP Tool 模板', '代码生成器', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (66, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/createPackage', '配置模板', '模板配置', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (67, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/getTemplates', '获取模板文件', '模板配置', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (68, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/getPackage', '获取所有模板', '模板配置', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (69, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/delPackage', '删除模板', '模板配置', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (70, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/getMeta', '获取meta信息', '代码生成器历史', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (71, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/rollback', '回滚自动生成代码', '代码生成器历史', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (72, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/getSysHistory', '查询回滚记录', '代码生成器历史', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (73, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/delSysHistory', '删除回滚记录', '代码生成器历史', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (74, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/autoCode/addFunc', '增加模板方法', '代码生成器历史', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (75, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysDictionaryDetail/updateSysDictionaryDetail', '更新字典内容', '系统字典详情', 'PUT');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (76, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysDictionaryDetail/createSysDictionaryDetail', '新增字典内容', '系统字典详情', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (77, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysDictionaryDetail/deleteSysDictionaryDetail', '删除字典内容', '系统字典详情', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (78, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysDictionaryDetail/findSysDictionaryDetail', '根据ID获取字典内容', '系统字典详情', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (79, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysDictionaryDetail/getSysDictionaryDetailList', '获取字典内容列表', '系统字典详情', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (80, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysDictionary/createSysDictionary', '新增字典', '系统字典', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (81, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysDictionary/deleteSysDictionary', '删除字典', '系统字典', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (82, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysDictionary/updateSysDictionary', '更新字典', '系统字典', 'PUT');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (83, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysDictionary/findSysDictionary', '根据ID获取字典（建议选择）', '系统字典', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (84, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysDictionary/getSysDictionaryList', '获取字典列表', '系统字典', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (85, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysOperationRecord/createSysOperationRecord', '新增操作记录', '操作记录', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (86, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysOperationRecord/findSysOperationRecord', '根据ID获取操作记录', '操作记录', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (87, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysOperationRecord/getSysOperationRecordList', '获取操作记录列表', '操作记录', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (88, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysOperationRecord/deleteSysOperationRecord', '删除操作记录', '操作记录', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (89, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysOperationRecord/deleteSysOperationRecordByIds', '批量删除操作历史', '操作记录', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (90, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/simpleUploader/upload', '插件版分片上传', '断点续传(插件版)', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (91, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/simpleUploader/checkFileMd5', '文件完整度验证', '断点续传(插件版)', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (92, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/simpleUploader/mergeFileMd5', '上传完成合并文件', '断点续传(插件版)', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (93, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/email/emailTest', '发送测试邮件', 'email', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (94, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/email/sendEmail', '发送邮件', 'email', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (95, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/authorityBtn/setAuthorityBtn', '设置按钮权限', '按钮权限', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (96, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/authorityBtn/getAuthorityBtn', '获取已有按钮权限', '按钮权限', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (97, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/authorityBtn/canRemoveAuthorityBtn', '删除按钮', '按钮权限', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (98, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysExportTemplate/createSysExportTemplate', '新增导出模板', '导出模板', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (99, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysExportTemplate/deleteSysExportTemplate', '删除导出模板', '导出模板', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (100, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysExportTemplate/deleteSysExportTemplateByIds', '批量删除导出模板', '导出模板', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (101, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysExportTemplate/updateSysExportTemplate', '更新导出模板', '导出模板', 'PUT');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (102, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysExportTemplate/findSysExportTemplate', '根据ID获取导出模板', '导出模板', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (103, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysExportTemplate/getSysExportTemplateList', '获取导出模板列表', '导出模板', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (104, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysExportTemplate/exportExcel', '导出Excel', '导出模板', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (105, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysExportTemplate/exportTemplate', '下载模板', '导出模板', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (106, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysExportTemplate/importExcel', '导入Excel', '导出模板', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (107, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/info/createInfo', '新建公告', '公告', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (108, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/info/deleteInfo', '删除公告', '公告', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (109, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/info/deleteInfoByIds', '批量删除公告', '公告', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (110, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/info/updateInfo', '更新公告', '公告', 'PUT');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (111, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/info/findInfo', '根据ID获取公告', '公告', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (112, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/info/getInfoList', '获取公告列表', '公告', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (113, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysParams/createSysParams', '新建参数', '参数管理', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (114, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysParams/deleteSysParams', '删除参数', '参数管理', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (115, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysParams/deleteSysParamsByIds', '批量删除参数', '参数管理', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (116, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysParams/updateSysParams', '更新参数', '参数管理', 'PUT');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (117, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysParams/findSysParams', '根据ID获取参数', '参数管理', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (118, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysParams/getSysParamsList', '获取参数列表', '参数管理', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (119, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/sysParams/getSysParam', '获取参数列表', '参数管理', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (120, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/attachmentCategory/getCategoryList', '分类列表', '媒体库分类', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (121, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/attachmentCategory/addCategory', '添加/编辑分类', '媒体库分类', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (122, '2025-07-01 17:23:05.188', '2025-07-01 17:23:05.188', null, '/attachmentCategory/deleteCategory', '删除分类', '媒体库分类', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (123, '2025-07-01 22:20:05.234', '2025-07-01 22:20:05.234', null, '/tabUser/createTabUser', '新增tabUser表', 'tabUser表', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (124, '2025-07-01 22:20:05.238', '2025-07-01 22:20:05.238', null, '/tabUser/deleteTabUser', '删除tabUser表', 'tabUser表', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (125, '2025-07-01 22:20:05.242', '2025-07-01 22:20:05.242', null, '/tabUser/deleteTabUserByIds', '批量删除tabUser表', 'tabUser表', 'DELETE');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (126, '2025-07-01 22:20:05.244', '2025-07-01 22:20:05.244', null, '/tabUser/updateTabUser', '更新tabUser表', 'tabUser表', 'PUT');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (127, '2025-07-01 22:20:05.246', '2025-07-01 22:20:05.246', null, '/tabUser/findTabUser', '根据ID获取tabUser表', 'tabUser表', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_apis (id, created_at, updated_at, deleted_at, path, description, api_group, method) VALUES (128, '2025-07-01 22:20:05.248', '2025-07-01 22:20:05.248', null, '/tabUser/getTabUserList', '获取tabUser表列表', 'tabUser表', 'GET');


create table sys_authorities
(
    created_at     datetime(3)                      null,
    updated_at     datetime(3)                      null,
    deleted_at     datetime(3)                      null,
    authority_id   bigint unsigned auto_increment comment '角色ID'
        primary key,
    authority_name varchar(191)                     null comment '角色名',
    parent_id      bigint unsigned                  null comment '父角色ID',
    default_router varchar(191) default 'dashboard' null comment '默认菜单',
    constraint uni_sys_authorities_authority_id unique (authority_id)
) engine = innodb
  auto_increment = 1 comment = '系统-角色表';

INSERT INTO `gin-vue-admin-test2`.sys_authorities (created_at, updated_at, deleted_at, authority_id, authority_name, parent_id, default_router) VALUES ('2025-07-01 17:23:05.213', '2025-07-01 17:23:05.449', null, 888, '普通用户', 0, 'dashboard');
INSERT INTO `gin-vue-admin-test2`.sys_authorities (created_at, updated_at, deleted_at, authority_id, authority_name, parent_id, default_router) VALUES ('2025-07-01 17:23:05.213', '2025-07-01 17:23:05.460', null, 8881, '普通用户子角色', 888, 'dashboard');
INSERT INTO `gin-vue-admin-test2`.sys_authorities (created_at, updated_at, deleted_at, authority_id, authority_name, parent_id, default_router) VALUES ('2025-07-01 17:23:05.213', '2025-07-01 17:23:05.456', null, 9528, '测试角色', 0, 'dashboard');


create table sys_authority_btns
(
    authority_id         bigint unsigned null comment '角色ID',
    sys_menu_id          bigint unsigned null comment '菜单ID',
    sys_base_menu_btn_id bigint unsigned null comment '菜单按钮ID'
) engine = innodb
  auto_increment = 1 comment = '系统-角色-按钮授权表';


create table sys_authority_menus
(
    sys_base_menu_id           bigint unsigned not null,
    sys_authority_authority_id bigint unsigned not null comment '角色ID',
    primary key (sys_base_menu_id, sys_authority_authority_id)
) engine = innodb
  auto_increment = 1 comment = '系统-角色-按钮授权表';

INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (1, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (1, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (1, 9528);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (2, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (2, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (2, 9528);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (3, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (3, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (4, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (4, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (4, 9528);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (5, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (5, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (6, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (6, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (7, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (7, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (8, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (8, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (8, 9528);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (9, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (9, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (10, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (11, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (12, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (13, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (14, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (15, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (16, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (17, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (17, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (18, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (18, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (19, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (19, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (20, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (20, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (21, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (21, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (22, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (22, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (23, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (23, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (24, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (24, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (25, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (25, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (26, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (26, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (27, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (27, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (28, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (28, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (29, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (30, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (31, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (32, 888);
INSERT INTO `gin-vue-admin-test2`.sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (33, 888);



create table sys_auto_code_histories
(
    id                 bigint unsigned auto_increment
        primary key,
    created_at         datetime(3)     null,
    updated_at         datetime(3)     null,
    deleted_at         datetime(3)     null,
    table_name         varchar(191)    null comment '表名',
    package            varchar(191)    null comment '模块名/插件名',
    request            text            null comment '前端传入的结构化信息',
    struct_name        varchar(191)    null comment '结构体名称',
    abbreviation       varchar(191)    null comment '结构体名称缩写',
    business_db        varchar(191)    null comment '业务库',
    description        varchar(191)    null comment 'Struct中文名称',
    templates          text            null comment '模板信息',
    Injections         text            null comment '注入路径',
    flag               bigint          null comment '[0:创建,1:回滚]',
    api_ids            varchar(191)    null comment 'api表注册内容',
    menu_id            bigint unsigned null comment '菜单ID',
    export_template_id bigint unsigned null comment '导出模板ID',
    package_id         bigint unsigned null comment '包ID'
) engine = innodb
  auto_increment = 1 comment = '系统-代码生成历史记录表';

create index idx_sys_auto_code_histories_deleted_at on sys_auto_code_histories (deleted_at);



create table sys_auto_code_packages
(
    id           bigint unsigned auto_increment
        primary key,
    created_at   datetime(3)  null,
    updated_at   datetime(3)  null,
    deleted_at   datetime(3)  null,
    `desc`       varchar(191) null comment '描述',
    label        varchar(191) null comment '展示名',
    template     varchar(191) null comment '模版',
    package_name varchar(191) null comment '包名',
    module       varchar(191) null
) engine = innodb
  auto_increment = 1 comment = '系统-代码生成包模板表';

create index idx_sys_auto_code_packages_deleted_at
    on sys_auto_code_packages (deleted_at);

INSERT INTO `gin-vue-admin-test2`.sys_auto_code_packages (id, created_at, updated_at, deleted_at, `desc`, label, template, package_name, module) VALUES (3, '2025-07-01 21:57:58.592', '2025-07-01 21:57:58.592', null, '系统自动读取example包', 'example包', 'package', 'example', 'server');
INSERT INTO `gin-vue-admin-test2`.sys_auto_code_packages (id, created_at, updated_at, deleted_at, `desc`, label, template, package_name, module) VALUES (4, '2025-07-01 21:57:58.592', '2025-07-01 21:57:58.592', null, '系统自动读取system包', 'system包', 'package', 'system', 'server');
INSERT INTO `gin-vue-admin-test2`.sys_auto_code_packages (id, created_at, updated_at, deleted_at, `desc`, label, template, package_name, module) VALUES (5, '2025-07-01 21:57:58.592', '2025-07-01 21:57:58.592', null, '系统自动读取announcement插件，使用前请确认是否为v2版本插件', 'announcement插件', 'plugin', 'announcement', 'server');



create table sys_base_menu_btns
(
    id               bigint unsigned auto_increment
        primary key,
    created_at       datetime(3)     null,
    updated_at       datetime(3)     null,
    deleted_at       datetime(3)     null,
    name             varchar(191)    null comment '按钮关键key',
    `desc`           varchar(191)    null comment '包描述',
    sys_base_menu_id bigint unsigned null comment '菜单ID'
) engine = innodb
  auto_increment = 1 comment = '系统-基础-菜单按钮表';

create index idx_sys_base_menu_btns_deleted_at on sys_base_menu_btns (deleted_at);


create table sys_base_menu_parameters
(
    id               bigint unsigned auto_increment
        primary key,
    created_at       datetime(3)     null,
    updated_at       datetime(3)     null,
    deleted_at       datetime(3)     null,
    sys_base_menu_id bigint unsigned null,
    type             varchar(191)    null comment '地址栏携带参数为params还是query',
    `key`            varchar(191)    null comment '地址栏携带参数的key',
    value            varchar(191)    null comment '地址栏携带参数的值'
) engine = innodb
  auto_increment = 1 comment = '系统-基础-菜单参数表';

create index idx_sys_base_menu_parameters_deleted_at on sys_base_menu_parameters (deleted_at);


create table sys_base_menus
(
    id              bigint unsigned auto_increment
        primary key,
    created_at      datetime(3)     null,
    updated_at      datetime(3)     null,
    deleted_at      datetime(3)     null,
    menu_level      bigint unsigned null,
    parent_id       bigint unsigned null comment '父菜单ID',
    path            varchar(191)    null comment '路由path',
    name            varchar(191)    null comment '路由name',
    hidden          tinyint(1)      null comment '是否在列表隐藏',
    component       varchar(191)    null comment '对应前端文件路径',
    sort            bigint          null comment '排序标记',
    active_name     varchar(191)    null comment '附加属性',
    keep_alive      tinyint(1)      null comment '附加属性',
    default_menu    tinyint(1)      null comment '附加属性',
    title           varchar(191)    null comment '附加属性',
    icon            varchar(191)    null comment '附加属性',
    close_tab       tinyint(1)      null comment '附加属性',
    transition_type varchar(191)    null comment '附加属性'
) engine = innodb
  auto_increment = 1 comment = '系统-基础-菜单表';

create index idx_sys_base_menus_deleted_at on sys_base_menus (deleted_at);

INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (1, '2025-07-01 17:23:05.256', '2025-07-01 17:23:05.256', null, 0, 0, 'dashboard', 'dashboard', 0, 'view/dashboard/index.vue', 1, '', 0, 0, '仪表盘', 'odometer', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (2, '2025-07-01 17:23:05.256', '2025-07-01 17:23:05.256', null, 0, 0, 'about', 'about', 0, 'view/about/index.vue', 9, '', 0, 0, '关于我们', 'info-filled', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (3, '2025-07-01 17:23:05.256', '2025-07-01 17:23:05.256', null, 0, 0, 'admin', 'superAdmin', 0, 'view/superAdmin/index.vue', 3, '', 0, 0, '超级管理员', 'user', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (4, '2025-07-01 17:23:05.256', '2025-07-01 17:23:05.256', null, 0, 0, 'person', 'person', 1, 'view/person/person.vue', 4, '', 0, 0, '个人信息', 'message', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (5, '2025-07-01 17:23:05.256', '2025-07-01 17:23:05.256', null, 0, 0, 'example', 'example', 0, 'view/example/index.vue', 7, '', 0, 0, '示例文件', 'management', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (6, '2025-07-01 17:23:05.256', '2025-07-01 17:23:05.256', null, 0, 0, 'systemTools', 'systemTools', 0, 'view/systemTools/index.vue', 5, '', 0, 0, '系统工具', 'tools', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (7, '2025-07-01 17:23:05.256', '2025-07-01 17:23:05.256', null, 0, 0, 'https://www.gin-vue-admin.com', 'https://www.gin-vue-admin.com', 0, '/', 0, '', 0, 0, '官方网站', 'customer-gva', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (8, '2025-07-01 17:23:05.256', '2025-07-01 17:23:05.256', null, 0, 0, 'state', 'state', 0, 'view/system/state.vue', 8, '', 0, 0, '服务器状态', 'cloudy', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (9, '2025-07-01 17:23:05.256', '2025-07-01 17:23:05.256', null, 0, 0, 'plugin', 'plugin', 0, 'view/routerHolder.vue', 6, '', 0, 0, '插件系统', 'cherry', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (10, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 3, 'authority', 'authority', 0, 'view/superAdmin/authority/authority.vue', 1, '', 0, 0, '角色管理', 'avatar', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (11, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 3, 'menu', 'menu', 0, 'view/superAdmin/menu/menu.vue', 2, '', 1, 0, '菜单管理', 'tickets', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (12, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 3, 'api', 'api', 0, 'view/superAdmin/api/api.vue', 3, '', 1, 0, 'api管理', 'platform', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (13, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 3, 'user', 'user', 0, 'view/superAdmin/user/user.vue', 4, '', 0, 0, '用户管理', 'coordinate', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (14, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 3, 'dictionary', 'dictionary', 0, 'view/superAdmin/dictionary/sysDictionary.vue', 5, '', 0, 0, '字典管理', 'notebook', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (15, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 3, 'operation', 'operation', 0, 'view/superAdmin/operation/sysOperationRecord.vue', 6, '', 0, 0, '操作历史', 'pie-chart', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (16, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 3, 'sysParams', 'sysParams', 0, 'view/superAdmin/params/sysParams.vue', 7, '', 0, 0, '参数管理', 'compass', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (17, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 5, 'upload', 'upload', 0, 'view/example/upload/upload.vue', 5, '', 0, 0, '媒体库（上传下载）', 'upload', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (18, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 5, 'breakpoint', 'breakpoint', 0, 'view/example/breakpoint/breakpoint.vue', 6, '', 0, 0, '断点续传', 'upload-filled', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (19, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 5, 'customer', 'customer', 0, 'view/example/customer/customer.vue', 7, '', 0, 0, '客户列表（资源示例）', 'avatar', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (20, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 6, 'autoCode', 'autoCode', 0, 'view/systemTools/autoCode/index.vue', 1, '', 1, 0, '代码生成器', 'cpu', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (21, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 6, 'formCreate', 'formCreate', 0, 'view/systemTools/formCreate/index.vue', 3, '', 1, 0, '表单生成器', 'magic-stick', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (22, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 6, 'system', 'system', 0, 'view/systemTools/system/system.vue', 4, '', 0, 0, '系统配置', 'operation', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (23, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 6, 'autoCodeAdmin', 'autoCodeAdmin', 0, 'view/systemTools/autoCodeAdmin/index.vue', 2, '', 0, 0, '自动化代码管理', 'magic-stick', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (24, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 6, 'autoCodeEdit/:id', 'autoCodeEdit', 1, 'view/systemTools/autoCode/index.vue', 0, '', 0, 0, '自动化代码-${id}', 'magic-stick', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (25, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 6, 'autoPkg', 'autoPkg', 0, 'view/systemTools/autoPkg/autoPkg.vue', 0, '', 0, 0, '模板配置', 'folder', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (26, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 6, 'exportTemplate', 'exportTemplate', 0, 'view/systemTools/exportTemplate/exportTemplate.vue', 5, '', 0, 0, '导出模板', 'reading', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (27, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 6, 'picture', 'picture', 0, 'view/systemTools/autoCode/picture.vue', 6, '', 0, 0, 'AI页面绘制', 'picture-filled', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (28, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 6, 'mcpTool', 'mcpTool', 0, 'view/systemTools/autoCode/mcp.vue', 7, '', 0, 0, 'Mcp Tools模板', 'magnet', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (29, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 9, 'https://plugin.gin-vue-admin.com/', 'https://plugin.gin-vue-admin.com/', 0, 'https://plugin.gin-vue-admin.com/', 0, '', 0, 0, '插件市场', 'shop', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (30, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 9, 'installPlugin', 'installPlugin', 0, 'view/systemTools/installPlugin/index.vue', 1, '', 0, 0, '插件安装', 'box', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (31, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 9, 'pubPlug', 'pubPlug', 0, 'view/systemTools/pubPlug/pubPlug.vue', 3, '', 0, 0, '打包插件', 'files', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (32, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 9, 'plugin-email', 'plugin-email', 0, 'plugin/email/view/index.vue', 4, '', 0, 0, '邮件插件', 'message', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (33, '2025-07-01 17:23:05.260', '2025-07-01 17:23:05.260', null, 1, 9, 'anInfo', 'anInfo', 0, 'plugin/announcement/view/info.vue', 5, '', 0, 0, '公告管理[示例]', 'scaleToOriginal', 0, '');
INSERT INTO `gin-vue-admin-test2`.sys_base_menus (id, created_at, updated_at, deleted_at, menu_level, parent_id, path, name, hidden, component, sort, active_name, keep_alive, default_menu, title, icon, close_tab, transition_type) VALUES (34, '2025-07-01 22:20:05.260', '2025-07-01 22:20:05.260', null, 0, 0, 'tabUser', 'tabUser', 0, 'view/system/tabUser/tabUser.vue', 0, '', 0, 0, 'tabUser表', '', 0, '');



create table sys_data_authority_id
(
    sys_authority_authority_id     bigint unsigned not null comment '角色ID',
    data_authority_id_authority_id bigint unsigned not null comment '角色ID',
    primary key (sys_authority_authority_id, data_authority_id_authority_id)
) engine = innodb
  auto_increment = 1 comment = '系统-角色-授权数据表';

INSERT INTO `gin-vue-admin-test2`.sys_data_authority_id (sys_authority_authority_id, data_authority_id_authority_id) VALUES (888, 888);
INSERT INTO `gin-vue-admin-test2`.sys_data_authority_id (sys_authority_authority_id, data_authority_id_authority_id) VALUES (888, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_data_authority_id (sys_authority_authority_id, data_authority_id_authority_id) VALUES (888, 9528);
INSERT INTO `gin-vue-admin-test2`.sys_data_authority_id (sys_authority_authority_id, data_authority_id_authority_id) VALUES (9528, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_data_authority_id (sys_authority_authority_id, data_authority_id_authority_id) VALUES (9528, 9528);


create table sys_dictionaries
(
    id         bigint unsigned auto_increment
        primary key,
    created_at datetime(3)  null,
    updated_at datetime(3)  null,
    deleted_at datetime(3)  null,
    name       varchar(191) null comment '字典名（中）',
    type       varchar(191) null comment '字典名（英）',
    status     tinyint(1)   null comment '状态',
    `desc`     varchar(191) null comment '描述'
) engine = innodb
  auto_increment = 1 comment = '系统-字典表（一级）';

create index idx_sys_dictionaries_deleted_at on sys_dictionaries (deleted_at);

INSERT INTO `gin-vue-admin-test2`.sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (1, '2025-07-01 17:23:05.227', '2025-07-01 17:23:05.232', null, '性别', 'gender', 1, '性别字典');
INSERT INTO `gin-vue-admin-test2`.sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (2, '2025-07-01 17:23:05.227', '2025-07-01 17:23:05.235', null, '数据库int类型', 'int', 1, 'int类型对应的数据库类型');
INSERT INTO `gin-vue-admin-test2`.sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (3, '2025-07-01 17:23:05.227', '2025-07-01 17:23:05.239', null, '数据库时间日期类型', 'time.Time', 1, '数据库时间日期类型');
INSERT INTO `gin-vue-admin-test2`.sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (4, '2025-07-01 17:23:05.227', '2025-07-01 17:23:05.243', null, '数据库浮点型', 'float64', 1, '数据库浮点型');
INSERT INTO `gin-vue-admin-test2`.sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (5, '2025-07-01 17:23:05.227', '2025-07-01 17:23:05.247', null, '数据库字符串', 'string', 1, '数据库字符串');
INSERT INTO `gin-vue-admin-test2`.sys_dictionaries (id, created_at, updated_at, deleted_at, name, type, status, `desc`) VALUES (6, '2025-07-01 17:23:05.227', '2025-07-01 17:23:05.251', null, '数据库bool类型', 'bool', 1, '数据库bool类型');


create table sys_dictionary_details
(
    id                bigint unsigned auto_increment
        primary key,
    created_at        datetime(3)     null,
    updated_at        datetime(3)     null,
    deleted_at        datetime(3)     null,
    label             varchar(191)    null comment '展示值',
    value             varchar(191)    null comment '字典值',
    extend            varchar(191)    null comment '扩展值',
    status            tinyint(1)      null comment '启用状态',
    sort              bigint          null comment '排序标记',
    sys_dictionary_id bigint unsigned null comment '关联标记'
) engine = innodb
  auto_increment = 1 comment = '系统-字典-详细表（二级）';

create index idx_sys_dictionary_details_deleted_at on sys_dictionary_details (deleted_at);

INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (1, '2025-07-01 17:23:05.232', '2025-07-01 17:23:05.232', null, '男', '1', '', 1, 1, 1);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (2, '2025-07-01 17:23:05.232', '2025-07-01 17:23:05.232', null, '女', '2', '', 1, 2, 1);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (3, '2025-07-01 17:23:05.236', '2025-07-01 17:23:05.236', null, 'smallint', '1', 'mysql', 1, 1, 2);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (4, '2025-07-01 17:23:05.236', '2025-07-01 17:23:05.236', null, 'mediumint', '2', 'mysql', 1, 2, 2);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (5, '2025-07-01 17:23:05.236', '2025-07-01 17:23:05.236', null, 'int', '3', 'mysql', 1, 3, 2);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (6, '2025-07-01 17:23:05.236', '2025-07-01 17:23:05.236', null, 'bigint', '4', 'mysql', 1, 4, 2);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (7, '2025-07-01 17:23:05.236', '2025-07-01 17:23:05.236', null, 'int2', '5', 'pgsql', 1, 5, 2);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (8, '2025-07-01 17:23:05.236', '2025-07-01 17:23:05.236', null, 'int4', '6', 'pgsql', 1, 6, 2);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (9, '2025-07-01 17:23:05.236', '2025-07-01 17:23:05.236', null, 'int6', '7', 'pgsql', 1, 7, 2);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (10, '2025-07-01 17:23:05.236', '2025-07-01 17:23:05.236', null, 'int8', '8', 'pgsql', 1, 8, 2);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (11, '2025-07-01 17:23:05.240', '2025-07-01 17:23:05.240', null, 'date', '', '', 1, 0, 3);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (12, '2025-07-01 17:23:05.240', '2025-07-01 17:23:05.240', null, 'time', '1', 'mysql', 1, 1, 3);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (13, '2025-07-01 17:23:05.240', '2025-07-01 17:23:05.240', null, 'year', '2', 'mysql', 1, 2, 3);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (14, '2025-07-01 17:23:05.240', '2025-07-01 17:23:05.240', null, 'datetime', '3', 'mysql', 1, 3, 3);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (15, '2025-07-01 17:23:05.240', '2025-07-01 17:23:05.240', null, 'timestamp', '5', 'mysql', 1, 5, 3);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (16, '2025-07-01 17:23:05.240', '2025-07-01 17:23:05.240', null, 'timestamptz', '6', 'pgsql', 1, 5, 3);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (17, '2025-07-01 17:23:05.244', '2025-07-01 17:23:05.244', null, 'float', '', '', 1, 0, 4);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (18, '2025-07-01 17:23:05.244', '2025-07-01 17:23:05.244', null, 'double', '1', 'mysql', 1, 1, 4);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (19, '2025-07-01 17:23:05.244', '2025-07-01 17:23:05.244', null, 'decimal', '2', 'mysql', 1, 2, 4);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (20, '2025-07-01 17:23:05.244', '2025-07-01 17:23:05.244', null, 'numeric', '3', 'pgsql', 1, 3, 4);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (21, '2025-07-01 17:23:05.244', '2025-07-01 17:23:05.244', null, 'smallserial', '4', 'pgsql', 1, 4, 4);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (22, '2025-07-01 17:23:05.247', '2025-07-01 17:23:05.247', null, 'char', '', '', 1, 0, 5);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (23, '2025-07-01 17:23:05.247', '2025-07-01 17:23:05.247', null, 'varchar', '1', 'mysql', 1, 1, 5);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (24, '2025-07-01 17:23:05.247', '2025-07-01 17:23:05.247', null, 'tinyblob', '2', 'mysql', 1, 2, 5);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (25, '2025-07-01 17:23:05.247', '2025-07-01 17:23:05.247', null, 'tinytext', '3', 'mysql', 1, 3, 5);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (26, '2025-07-01 17:23:05.247', '2025-07-01 17:23:05.247', null, 'text', '4', 'mysql', 1, 4, 5);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (27, '2025-07-01 17:23:05.247', '2025-07-01 17:23:05.247', null, 'blob', '5', 'mysql', 1, 5, 5);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (28, '2025-07-01 17:23:05.247', '2025-07-01 17:23:05.247', null, 'mediumblob', '6', 'mysql', 1, 6, 5);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (29, '2025-07-01 17:23:05.247', '2025-07-01 17:23:05.247', null, 'mediumtext', '7', 'mysql', 1, 7, 5);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (30, '2025-07-01 17:23:05.247', '2025-07-01 17:23:05.247', null, 'longblob', '8', 'mysql', 1, 8, 5);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (31, '2025-07-01 17:23:05.247', '2025-07-01 17:23:05.247', null, 'longtext', '9', 'mysql', 1, 9, 5);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (32, '2025-07-01 17:23:05.252', '2025-07-01 17:23:05.252', null, 'tinyint', '1', 'mysql', 1, 0, 6);
INSERT INTO `gin-vue-admin-test2`.sys_dictionary_details (id, created_at, updated_at, deleted_at, label, value, extend, status, sort, sys_dictionary_id) VALUES (33, '2025-07-01 17:23:05.252', '2025-07-01 17:23:05.252', null, 'bool', '2', 'pgsql', 1, 0, 6);



create table sys_export_template_condition
(
    id          bigint unsigned auto_increment
        primary key,
    created_at  datetime(3)  null,
    updated_at  datetime(3)  null,
    deleted_at  datetime(3)  null,
    template_id varchar(191) null comment '模板标识',
    `from`      varchar(191) null comment '条件取的key',
    `column`    varchar(191) null comment '作为查询条件的字段',
    operator    varchar(191) null comment '操作符'
) engine = innodb
  auto_increment = 1 comment = '系统-导出模板条件表';

create index idx_sys_export_template_condition_deleted_at on sys_export_template_condition (deleted_at);


create table sys_export_template_join
(
    id          bigint unsigned auto_increment
        primary key,
    created_at  datetime(3)  null,
    updated_at  datetime(3)  null,
    deleted_at  datetime(3)  null,
    template_id varchar(191) null comment '模板标识',
    joins       varchar(191) null comment '关联',
    `table`     varchar(191) null comment '关联表',
    `on`        varchar(191) null comment '关联条件'
) engine = innodb
  auto_increment = 1 comment = '系统-导出模板关联表';

create index idx_sys_export_template_join_deleted_at
    on sys_export_template_join (deleted_at);



create table sys_export_templates
(
    id            bigint unsigned auto_increment
        primary key,
    created_at    datetime(3)  null,
    updated_at    datetime(3)  null,
    deleted_at    datetime(3)  null,
    db_name       varchar(191) null comment '数据库名称',
    name          varchar(191) null comment '模板名称',
    table_name    varchar(191) null comment '表名称',
    template_id   varchar(191) null comment '模板标识',
    template_info text         null,
    `limit`       bigint       null comment '导出限制',
    `order`       varchar(191) null comment '排序'
) engine = innodb
  auto_increment = 1 comment = '系统-导出模板表';

create index idx_sys_export_templates_deleted_at on sys_export_templates (deleted_at);

INSERT INTO `gin-vue-admin-test2`.sys_export_templates (id, created_at, updated_at, deleted_at, db_name, name, table_name, template_id, template_info, `limit`, `order`) VALUES (1, '2025-07-01 17:23:05.444', '2025-07-01 17:23:05.444', null, '', 'api', 'sys_apis', 'api', '{"path":"路径","method":"方法（大写）","description":"方法介绍","api_group":"方法分组"}', null, '');


create table sys_ignore_apis
(
    id         bigint unsigned auto_increment
        primary key,
    created_at datetime(3)                 null,
    updated_at datetime(3)                 null,
    deleted_at datetime(3)                 null,
    path       varchar(191)                null comment 'api路径',
    method     varchar(191) default 'POST' null comment '方法'
) engine = innodb
  auto_increment = 1 comment = '系统-忽略接口鉴权api表';

create index idx_sys_ignore_apis_deleted_at on sys_ignore_apis (deleted_at);

INSERT INTO `gin-vue-admin-test2`.sys_ignore_apis (id, created_at, updated_at, deleted_at, path, method) VALUES (1, '2025-07-01 17:23:05.200', '2025-07-01 17:23:05.200', null, '/swagger/*any', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_ignore_apis (id, created_at, updated_at, deleted_at, path, method) VALUES (2, '2025-07-01 17:23:05.200', '2025-07-01 17:23:05.200', null, '/api/freshCasbin', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_ignore_apis (id, created_at, updated_at, deleted_at, path, method) VALUES (3, '2025-07-01 17:23:05.200', '2025-07-01 17:23:05.200', null, '/uploads/file/*filepath', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_ignore_apis (id, created_at, updated_at, deleted_at, path, method) VALUES (4, '2025-07-01 17:23:05.200', '2025-07-01 17:23:05.200', null, '/health', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_ignore_apis (id, created_at, updated_at, deleted_at, path, method) VALUES (5, '2025-07-01 17:23:05.200', '2025-07-01 17:23:05.200', null, '/uploads/file/*filepath', 'HEAD');
INSERT INTO `gin-vue-admin-test2`.sys_ignore_apis (id, created_at, updated_at, deleted_at, path, method) VALUES (6, '2025-07-01 17:23:05.200', '2025-07-01 17:23:05.200', null, '/autoCode/llmAuto', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_ignore_apis (id, created_at, updated_at, deleted_at, path, method) VALUES (7, '2025-07-01 17:23:05.200', '2025-07-01 17:23:05.200', null, '/system/reloadSystem', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_ignore_apis (id, created_at, updated_at, deleted_at, path, method) VALUES (8, '2025-07-01 17:23:05.200', '2025-07-01 17:23:05.200', null, '/base/login', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_ignore_apis (id, created_at, updated_at, deleted_at, path, method) VALUES (9, '2025-07-01 17:23:05.200', '2025-07-01 17:23:05.200', null, '/base/captcha', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_ignore_apis (id, created_at, updated_at, deleted_at, path, method) VALUES (10, '2025-07-01 17:23:05.200', '2025-07-01 17:23:05.200', null, '/init/initdb', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_ignore_apis (id, created_at, updated_at, deleted_at, path, method) VALUES (11, '2025-07-01 17:23:05.200', '2025-07-01 17:23:05.200', null, '/init/checkdb', 'POST');
INSERT INTO `gin-vue-admin-test2`.sys_ignore_apis (id, created_at, updated_at, deleted_at, path, method) VALUES (12, '2025-07-01 17:23:05.200', '2025-07-01 17:23:05.200', null, '/info/getInfoDataSource', 'GET');
INSERT INTO `gin-vue-admin-test2`.sys_ignore_apis (id, created_at, updated_at, deleted_at, path, method) VALUES (13, '2025-07-01 17:23:05.200', '2025-07-01 17:23:05.200', null, '/info/getInfoPublic', 'GET');



create table sys_operation_records
(
    id            bigint unsigned auto_increment
        primary key,
    created_at    datetime(3)     null,
    updated_at    datetime(3)     null,
    deleted_at    datetime(3)     null,
    ip            varchar(191)    null comment '请求ip',
    method        varchar(191)    null comment '请求方法',
    path          varchar(191)    null comment '请求路径',
    status        bigint          null comment '请求状态',
    latency       bigint          null comment '延迟',
    agent         text            null comment '代理',
    error_message varchar(191)    null comment '错误信息',
    body          text            null comment '请求Body',
    resp          text            null comment '响应Body',
    user_id       bigint unsigned null comment '用户id'
) engine = innodb
  auto_increment = 1 comment = '系统-接口日志表';

create index idx_sys_operation_records_deleted_at on sys_operation_records (deleted_at);


create table sys_params
(
    id         bigint unsigned auto_increment
        primary key,
    created_at datetime(3)  null,
    updated_at datetime(3)  null,
    deleted_at datetime(3)  null,
    name       varchar(191) null comment '参数名称',
    `key`      varchar(191) null comment '参数键',
    value      varchar(191) null comment '参数值',
    `desc`     varchar(191) null comment '参数说明'
) engine = innodb
  auto_increment = 1 comment = '系统-参数表';

create index idx_sys_params_deleted_at on sys_params (deleted_at);



create table sys_user_authority
(
    sys_user_id                bigint unsigned not null,
    sys_authority_authority_id bigint unsigned not null comment '角色ID',
    primary key (sys_user_id, sys_authority_authority_id)
) engine = innodb
  auto_increment = 1 comment = '系统-用户-角色授权表';

INSERT INTO `gin-vue-admin-test2`.sys_user_authority (sys_user_id, sys_authority_authority_id) VALUES (1, 888);
INSERT INTO `gin-vue-admin-test2`.sys_user_authority (sys_user_id, sys_authority_authority_id) VALUES (1, 8881);
INSERT INTO `gin-vue-admin-test2`.sys_user_authority (sys_user_id, sys_authority_authority_id) VALUES (1, 9528);
INSERT INTO `gin-vue-admin-test2`.sys_user_authority (sys_user_id, sys_authority_authority_id) VALUES (2, 888);



create table sys_users
(
    id             bigint unsigned auto_increment
        primary key,
    created_at     datetime(3)                                                              null,
    updated_at     datetime(3)                                                              null,
    deleted_at     datetime(3)                                                              null,
    uuid           varchar(191)                                                             null comment '用户UUID',
    username       varchar(191)                                                             null comment '用户登录名',
    password       varchar(191)                                                             null comment '用户登录密码',
    nick_name      varchar(191)    default '系统用户'                                       null comment '用户昵称',
    header_img     varchar(191)    default 'https://qmplusimg.henrongyi.top/gva_header.jpg' null comment '用户头像',
    authority_id   bigint unsigned default '888'                                            null comment '用户角色ID',
    phone          varchar(191)                                                             null comment '用户手机号',
    email          varchar(191)                                                             null comment '用户邮箱',
    enable         bigint          default 1                                                null comment '用户是否被冻结 1正常 2冻结',
    origin_setting text                                                                     null comment '配置'
) engine = innodb
  auto_increment = 1 comment = '系统-用户表';

create index idx_sys_users_deleted_at on sys_users (deleted_at);

create index idx_sys_users_username on sys_users (username);

create index idx_sys_users_uuid on sys_users (uuid);

INSERT INTO `gin-vue-admin-test2`.sys_users (id, created_at, updated_at, deleted_at, uuid, username, password, nick_name, header_img, authority_id, phone, email, enable, origin_setting) VALUES (1, '2025-07-01 17:23:05.429', '2025-07-01 21:48:25.221', null, '8b3c6b03-be79-4035-9fc7-76ba0b9db078', 'admin', '$2a$10$SgIxL.H.ZSjnKqIHQ3NyqOdjSQbid.YQmXMjkGaQjWLP6kPgYaAUe', 'Mr.奇淼', 'https://qmplusimg.henrongyi.top/gva_header.jpg', 888, '17611111111', '333333333@qq.com', 1, null);
INSERT INTO `gin-vue-admin-test2`.sys_users (id, created_at, updated_at, deleted_at, uuid, username, password, nick_name, header_img, authority_id, phone, email, enable, origin_setting) VALUES (2, '2025-07-01 17:23:05.429', '2025-07-01 17:23:05.438', null, 'eb56c3fe-61a3-4cf0-89d7-2989bdaea5ab', 'a303176530', '$2a$10$Q5W3RbWbCgOvasMxUErKtOgct84gY5JIOyKjnUW9ls7RJIrrjUo2q', '用户1', 'https:///qmplusimg.henrongyi.top/1572075907logo.png', 9528, '17611111111', '333333333@qq.com', 1, null);







create table casbin_rule
(
    id    bigint unsigned auto_increment
        primary key,
    ptype varchar(100) null,
    v0    varchar(100) null,
    v1    varchar(100) null,
    v2    varchar(100) null,
    v3    varchar(100) null,
    v4    varchar(100) null,
    v5    varchar(100) null,
    constraint idx_casbin_rule
        unique (ptype, v0, v1, v2, v3, v4, v5)
) engine = innodb
  auto_increment = 1 comment = '权限控制策略表';

INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (2, 'p', '888', '/api/createApi', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (5, 'p', '888', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (8, 'p', '888', '/api/deleteApisByIds', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (11, 'p', '888', '/api/enterSyncApi', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (7, 'p', '888', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (4, 'p', '888', '/api/getApiById', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (10, 'p', '888', '/api/getApiGroups', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (3, 'p', '888', '/api/getApiList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (12, 'p', '888', '/api/ignoreApi', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (9, 'p', '888', '/api/syncApi', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (6, 'p', '888', '/api/updateApi', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (123, 'p', '888', '/attachmentCategory/addCategory', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (124, 'p', '888', '/attachmentCategory/deleteCategory', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (122, 'p', '888', '/attachmentCategory/getCategoryList', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (13, 'p', '888', '/authority/copyAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (15, 'p', '888', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (16, 'p', '888', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (17, 'p', '888', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (18, 'p', '888', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (14, 'p', '888', '/authority/updateAuthority', 'PUT', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (99, 'p', '888', '/authorityBtn/canRemoveAuthorityBtn', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (98, 'p', '888', '/authorityBtn/getAuthorityBtn', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (97, 'p', '888', '/authorityBtn/setAuthorityBtn', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (74, 'p', '888', '/autoCode/addFunc', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (67, 'p', '888', '/autoCode/createPackage', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (71, 'p', '888', '/autoCode/createPlug', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (64, 'p', '888', '/autoCode/createTemp', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (70, 'p', '888', '/autoCode/delPackage', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (65, 'p', '888', '/autoCode/delSysHistory', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (62, 'p', '888', '/autoCode/getColumn', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (58, 'p', '888', '/autoCode/getDB', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (59, 'p', '888', '/autoCode/getMeta', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (69, 'p', '888', '/autoCode/getPackage', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (66, 'p', '888', '/autoCode/getSysHistory', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (61, 'p', '888', '/autoCode/getTables', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (68, 'p', '888', '/autoCode/getTemplates', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (72, 'p', '888', '/autoCode/installPlugin', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (75, 'p', '888', '/autoCode/mcp', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (60, 'p', '888', '/autoCode/preview', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (73, 'p', '888', '/autoCode/pubPlug', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (63, 'p', '888', '/autoCode/rollback', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (48, 'p', '888', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (47, 'p', '888', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (56, 'p', '888', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (53, 'p', '888', '/customer/customer', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (55, 'p', '888', '/customer/customer', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (54, 'p', '888', '/customer/customer', 'PUT', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (57, 'p', '888', '/customer/customerList', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (92, 'p', '888', '/email/emailTest', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (93, 'p', '888', '/email/sendEmail', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (40, 'p', '888', '/fileUploadAndDownload/breakpointContinue', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (39, 'p', '888', '/fileUploadAndDownload/breakpointContinueFinish', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (43, 'p', '888', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (44, 'p', '888', '/fileUploadAndDownload/editFileName', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (38, 'p', '888', '/fileUploadAndDownload/findFile', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (45, 'p', '888', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (46, 'p', '888', '/fileUploadAndDownload/importURL', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (41, 'p', '888', '/fileUploadAndDownload/removeChunk', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (42, 'p', '888', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (109, 'p', '888', '/info/createInfo', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (110, 'p', '888', '/info/deleteInfo', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (111, 'p', '888', '/info/deleteInfoByIds', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (113, 'p', '888', '/info/findInfo', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (114, 'p', '888', '/info/getInfoList', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (112, 'p', '888', '/info/updateInfo', 'PUT', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (49, 'p', '888', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (21, 'p', '888', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (23, 'p', '888', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (25, 'p', '888', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (27, 'p', '888', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (22, 'p', '888', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (19, 'p', '888', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (24, 'p', '888', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (20, 'p', '888', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (26, 'p', '888', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (95, 'p', '888', '/simpleUploader/checkFileMd5', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (96, 'p', '888', '/simpleUploader/mergeFileMd5', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (94, 'p', '888', '/simpleUploader/upload', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (84, 'p', '888', '/sysDictionary/createSysDictionary', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (85, 'p', '888', '/sysDictionary/deleteSysDictionary', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (81, 'p', '888', '/sysDictionary/findSysDictionary', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (83, 'p', '888', '/sysDictionary/getSysDictionaryList', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (82, 'p', '888', '/sysDictionary/updateSysDictionary', 'PUT', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (78, 'p', '888', '/sysDictionaryDetail/createSysDictionaryDetail', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (80, 'p', '888', '/sysDictionaryDetail/deleteSysDictionaryDetail', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (76, 'p', '888', '/sysDictionaryDetail/findSysDictionaryDetail', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (79, 'p', '888', '/sysDictionaryDetail/getSysDictionaryDetailList', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (77, 'p', '888', '/sysDictionaryDetail/updateSysDictionaryDetail', 'PUT', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (100, 'p', '888', '/sysExportTemplate/createSysExportTemplate', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (101, 'p', '888', '/sysExportTemplate/deleteSysExportTemplate', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (102, 'p', '888', '/sysExportTemplate/deleteSysExportTemplateByIds', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (106, 'p', '888', '/sysExportTemplate/exportExcel', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (107, 'p', '888', '/sysExportTemplate/exportTemplate', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (104, 'p', '888', '/sysExportTemplate/findSysExportTemplate', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (105, 'p', '888', '/sysExportTemplate/getSysExportTemplateList', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (108, 'p', '888', '/sysExportTemplate/importExcel', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (103, 'p', '888', '/sysExportTemplate/updateSysExportTemplate', 'PUT', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (88, 'p', '888', '/sysOperationRecord/createSysOperationRecord', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (90, 'p', '888', '/sysOperationRecord/deleteSysOperationRecord', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (91, 'p', '888', '/sysOperationRecord/deleteSysOperationRecordByIds', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (86, 'p', '888', '/sysOperationRecord/findSysOperationRecord', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (89, 'p', '888', '/sysOperationRecord/getSysOperationRecordList', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (87, 'p', '888', '/sysOperationRecord/updateSysOperationRecord', 'PUT', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (115, 'p', '888', '/sysParams/createSysParams', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (116, 'p', '888', '/sysParams/deleteSysParams', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (117, 'p', '888', '/sysParams/deleteSysParamsByIds', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (119, 'p', '888', '/sysParams/findSysParams', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (121, 'p', '888', '/sysParams/getSysParam', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (120, 'p', '888', '/sysParams/getSysParamsList', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (118, 'p', '888', '/sysParams/updateSysParams', 'PUT', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (52, 'p', '888', '/system/getServerInfo', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (50, 'p', '888', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (51, 'p', '888', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (1, 'p', '888', '/user/admin_register', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (33, 'p', '888', '/user/changePassword', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (32, 'p', '888', '/user/deleteUser', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (28, 'p', '888', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (31, 'p', '888', '/user/getUserList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (36, 'p', '888', '/user/resetPassword', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (30, 'p', '888', '/user/setSelfInfo', 'PUT', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (37, 'p', '888', '/user/setSelfSetting', 'PUT', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (35, 'p', '888', '/user/setUserAuthorities', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (34, 'p', '888', '/user/setUserAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (29, 'p', '888', '/user/setUserInfo', 'PUT', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (126, 'p', '8881', '/api/createApi', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (129, 'p', '8881', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (131, 'p', '8881', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (128, 'p', '8881', '/api/getApiById', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (127, 'p', '8881', '/api/getApiList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (130, 'p', '8881', '/api/updateApi', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (132, 'p', '8881', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (133, 'p', '8881', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (134, 'p', '8881', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (135, 'p', '8881', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (154, 'p', '8881', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (153, 'p', '8881', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (160, 'p', '8881', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (161, 'p', '8881', '/customer/customer', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (158, 'p', '8881', '/customer/customer', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (159, 'p', '8881', '/customer/customer', 'PUT', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (162, 'p', '8881', '/customer/customerList', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (150, 'p', '8881', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (151, 'p', '8881', '/fileUploadAndDownload/editFileName', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (149, 'p', '8881', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (152, 'p', '8881', '/fileUploadAndDownload/importURL', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (148, 'p', '8881', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (155, 'p', '8881', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (138, 'p', '8881', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (140, 'p', '8881', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (142, 'p', '8881', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (144, 'p', '8881', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (139, 'p', '8881', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (136, 'p', '8881', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (141, 'p', '8881', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (137, 'p', '8881', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (143, 'p', '8881', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (156, 'p', '8881', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (157, 'p', '8881', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (125, 'p', '8881', '/user/admin_register', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (145, 'p', '8881', '/user/changePassword', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (163, 'p', '8881', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (146, 'p', '8881', '/user/getUserList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (147, 'p', '8881', '/user/setUserAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (165, 'p', '9528', '/api/createApi', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (168, 'p', '9528', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (170, 'p', '9528', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (167, 'p', '9528', '/api/getApiById', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (166, 'p', '9528', '/api/getApiList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (169, 'p', '9528', '/api/updateApi', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (171, 'p', '9528', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (172, 'p', '9528', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (173, 'p', '9528', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (174, 'p', '9528', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (202, 'p', '9528', '/autoCode/createTemp', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (193, 'p', '9528', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (192, 'p', '9528', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (200, 'p', '9528', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (198, 'p', '9528', '/customer/customer', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (199, 'p', '9528', '/customer/customer', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (197, 'p', '9528', '/customer/customer', 'PUT', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (201, 'p', '9528', '/customer/customerList', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (189, 'p', '9528', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (190, 'p', '9528', '/fileUploadAndDownload/editFileName', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (188, 'p', '9528', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (191, 'p', '9528', '/fileUploadAndDownload/importURL', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (187, 'p', '9528', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (194, 'p', '9528', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (177, 'p', '9528', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (179, 'p', '9528', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (181, 'p', '9528', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (183, 'p', '9528', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (178, 'p', '9528', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (175, 'p', '9528', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (180, 'p', '9528', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (176, 'p', '9528', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (182, 'p', '9528', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (195, 'p', '9528', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (196, 'p', '9528', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (164, 'p', '9528', '/user/admin_register', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (184, 'p', '9528', '/user/changePassword', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (203, 'p', '9528', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (185, 'p', '9528', '/user/getUserList', 'POST', '', '', '');
INSERT INTO `gin-vue-admin-test2`.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) VALUES (186, 'p', '9528', '/user/setUserAuthority', 'POST', '', '', '');
