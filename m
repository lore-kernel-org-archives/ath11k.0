Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHTnu-0003Hv-S2
 for ath11k@lists.infradead.org; Thu, 26 Mar 2020 14:48:22 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH] ath11k: add pktlog checksum in trace events to support pktlog
Date: Thu, 26 Mar 2020 20:19:15 +0530
Message-Id: <1585234155-30574-1-git-send-email-mkenna@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, linux-wireless@vger.kernel.org

Pktlog data are different among the chipset & chipset versions.
As part of enhancing the user space script to decode the pktlog
trace events generated, it is desirable to know which chipset or
which chipset version has provided the events and thereby decode
the pktlogs appropriately.

Pktlog checksum helps to determine the chipset variant which is
given by the firmware in the struct wmi_ready_event.

Pktlog checksums are computed during the firmware build.
So, adding that pktlog checksum in the pklog trace events.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h  |  1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c |  3 ++-
 drivers/net/wireless/ath/ath11k/trace.h | 12 ++++++++----
 drivers/net/wireless/ath/ath11k/wmi.c   | 21 +++++++++++++--------
 drivers/net/wireless/ath/ath11k/wmi.h   |  8 +++++++-
 5 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 6e7b8ec..a1e29f3 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -650,6 +650,7 @@ struct ath11k_base {
 		/* protected by data_lock */
 		u32 fw_crash_counter;
 	} stats;
+	u32 pktlog_defs_checksum;
 };
 
 struct ath11k_fw_stats_pdev {
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index f74a0e7..a3f2c76 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1491,7 +1491,8 @@ static void ath11k_htt_pktlog(struct ath11k_base *ab, struct sk_buff *skb)
 		return;
 	}
 
-	trace_ath11k_htt_pktlog(ar, data->payload, hdr->size);
+	trace_ath11k_htt_pktlog(ar, data->payload, hdr->size,
+				ar->ab->pktlog_defs_checksum);
 }
 
 static void ath11k_htt_backpressure_event_handler(struct ath11k_base *ab,
diff --git a/drivers/net/wireless/ath/ath11k/trace.h b/drivers/net/wireless/ath/ath11k/trace.h
index 8700a62..66d0aae 100644
--- a/drivers/net/wireless/ath/ath11k/trace.h
+++ b/drivers/net/wireless/ath/ath11k/trace.h
@@ -21,14 +21,16 @@
 #define TRACE_SYSTEM ath11k
 
 TRACE_EVENT(ath11k_htt_pktlog,
-	    TP_PROTO(struct ath11k *ar, const void *buf, u16 buf_len),
+	    TP_PROTO(struct ath11k *ar, const void *buf, u16 buf_len,
+		     u32 pktlog_checksum),
 
-	TP_ARGS(ar, buf, buf_len),
+	TP_ARGS(ar, buf, buf_len, pktlog_checksum),
 
 	TP_STRUCT__entry(
 		__string(device, dev_name(ar->ab->dev))
 		__string(driver, dev_driver_string(ar->ab->dev))
 		__field(u16, buf_len)
+		__field(u32, pktlog_checksum)
 		__dynamic_array(u8, pktlog, buf_len)
 	),
 
@@ -36,14 +38,16 @@
 		__assign_str(device, dev_name(ar->ab->dev));
 		__assign_str(driver, dev_driver_string(ar->ab->dev));
 		__entry->buf_len = buf_len;
+		__entry->pktlog_checksum = pktlog_checksum;
 		memcpy(__get_dynamic_array(pktlog), buf, buf_len);
 	),
 
 	TP_printk(
-		"%s %s size %hu",
+		"%s %s size %hu pktlog_checksum %d",
 		__get_str(driver),
 		__get_str(device),
-		__entry->buf_len
+		__entry->buf_len,
+		__entry->pktlog_checksum
 	 )
 );
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index e7ce369..ad88efe 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -87,8 +87,8 @@ struct wmi_tlv_rdy_parse {
 		= { .min_len = sizeof(struct wmi_pdev_bss_chan_info_event) },
 	[WMI_TAG_VDEV_INSTALL_KEY_COMPLETE_EVENT]
 		= { .min_len = sizeof(struct wmi_vdev_install_key_compl_event) },
-	[WMI_TAG_READY_EVENT]
-		= {.min_len = sizeof(struct wmi_ready_event) },
+	[WMI_TAG_READY_EVENT] = {
+		.min_len = sizeof(struct wmi_ready_event_min) },
 	[WMI_TAG_SERVICE_AVAILABLE_EVENT]
 		= {.min_len = sizeof(struct wmi_service_available_event) },
 	[WMI_TAG_PEER_ASSOC_CONF_EVENT]
@@ -4851,7 +4851,7 @@ static int ath11k_wmi_tlv_rdy_parse(struct ath11k_base *ab, u16 tag, u16 len,
 				    const void *ptr, void *data)
 {
 	struct wmi_tlv_rdy_parse *rdy_parse = data;
-	struct wmi_ready_event *fixed_param;
+	struct wmi_ready_event fixed_param;
 	struct wmi_mac_addr *addr_list;
 	struct ath11k_pdev *pdev;
 	u32 num_mac_addr;
@@ -4859,11 +4859,16 @@ static int ath11k_wmi_tlv_rdy_parse(struct ath11k_base *ab, u16 tag, u16 len,
 
 	switch (tag) {
 	case WMI_TAG_READY_EVENT:
-		fixed_param = (struct wmi_ready_event *)ptr;
-		ab->wlan_init_status = fixed_param->status;
-		rdy_parse->num_extra_mac_addr = fixed_param->num_extra_mac_addr;
-
-		ether_addr_copy(ab->mac_addr, fixed_param->mac_addr.addr);
+		memset(&fixed_param, 0, sizeof(fixed_param));
+		memcpy(&fixed_param, (struct wmi_ready_event *)ptr,
+		       min_t(u16, sizeof(fixed_param), len));
+		ab->wlan_init_status = fixed_param.ready_event_min.status;
+		rdy_parse->num_extra_mac_addr =
+			fixed_param.ready_event_min.num_extra_mac_addr;
+
+		ether_addr_copy(ab->mac_addr,
+				fixed_param.ready_event_min.mac_addr.addr);
+		ab->pktlog_defs_checksum = fixed_param.pktlog_defs_checksum;
 		ab->wmi_ready = true;
 		break;
 	case WMI_TAG_ARRAY_FIXED_STRUCT:
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 510f9c6..58f9098 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2345,7 +2345,7 @@ struct wmi_mac_addr {
 	} __packed;
 } __packed;
 
-struct wmi_ready_event {
+struct wmi_ready_event_min {
 	struct wmi_abi_version fw_abi_vers;
 	struct wmi_mac_addr mac_addr;
 	u32 status;
@@ -2355,6 +2355,12 @@ struct wmi_ready_event {
 	u32 num_extra_peers;
 } __packed;
 
+struct wmi_ready_event {
+	struct wmi_ready_event_min ready_event_min;
+	u32 max_ast_index;
+	u32 pktlog_defs_checksum;
+} __packed;
+
 struct wmi_service_available_event {
 	u32 wmi_service_segment_offset;
 	u32 wmi_service_segment_bitmap[WMI_SERVICE_SEGMENT_BM_SIZE32];
-- 
1.9.1

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
