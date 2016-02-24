
union {
    struct {
	mavlink_message_t m;
	mavlink_status_t status;
    } mv;
    uavtalk_message_t u;
} msg;

