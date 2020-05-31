Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfT89-0003cY-CH
 for ath11k@lists.infradead.org; Sun, 31 May 2020 18:56:24 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH v4 8/8] ath11k: Add support for 6g scan hint
Date: Sun, 31 May 2020 11:56:00 -0700
Message-Id: <20200531185600.20789-9-pradeepc@codeaurora.org>
In-Reply-To: <20200531185600.20789-1-pradeepc@codeaurora.org>
References: <20200531185600.20789-1-pradeepc@codeaurora.org>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

Add support for 6Ghz short ssid and bssid hint mechanism
as part of scan command.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 72 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 22 ++++++++
 2 files changed, 94 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index ad3a7b68d308..317376a4eb6e 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2005,6 +2005,8 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 	int i, ret, len;
 	u32 *tmp_ptr;
 	u8 extraie_len_with_pad = 0;
+	struct hint_short_ssid *s_ssid = NULL;
+	struct hint_bssid *hint_bssid = NULL;
 
 	len = sizeof(*cmd);
 
@@ -2026,6 +2028,14 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 			roundup(params->extraie.len, sizeof(u32));
 	len += extraie_len_with_pad;
 
+	if (params->num_hint_bssid)
+		len += TLV_HDR_SIZE +
+		       params->num_hint_bssid * sizeof(struct hint_bssid);
+
+	if (params->num_hint_s_ssid)
+		len += TLV_HDR_SIZE +
+		       params->num_hint_s_ssid * sizeof(struct hint_short_ssid);
+
 	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
 	if (!skb)
 		return -ENOMEM;
@@ -2126,6 +2136,68 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 
 	ptr += extraie_len_with_pad;
 
+	if (params->num_hint_s_ssid) {
+		len = params->num_hint_s_ssid * sizeof(struct hint_short_ssid);
+		tlv = ptr;
+		tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_FIXED_STRUCT) |
+			      FIELD_PREP(WMI_TLV_LEN, len);
+		ptr += TLV_HDR_SIZE;
+		s_ssid = ptr;
+		for (i = 0; i < params->num_hint_s_ssid; ++i) {
+			s_ssid->freq_flags = params->hint_s_ssid[i].freq_flags;
+			s_ssid->short_ssid = params->hint_s_ssid[i].short_ssid;
+			s_ssid++;
+		}
+		ptr += len;
+	}
+
+	if (params->num_hint_bssid) {
+		len = params->num_hint_bssid * sizeof(struct hint_bssid);
+		tlv = ptr;
+		tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_FIXED_STRUCT) |
+			      FIELD_PREP(WMI_TLV_LEN, len);
+		ptr += TLV_HDR_SIZE;
+		hint_bssid = ptr;
+		for (i = 0; i < params->num_hint_bssid; ++i) {
+			hint_bssid->freq_flags =
+				params->hint_bssid[i].freq_flags;
+			ether_addr_copy(&params->hint_bssid[i].bssid.addr[0],
+					&hint_bssid->bssid.addr[0]);
+			hint_bssid++;
+		}
+	}
+
+	len = params->num_hint_s_ssid * sizeof(struct hint_short_ssid);
+	tlv = ptr;
+	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_FIXED_STRUCT) |
+		      FIELD_PREP(WMI_TLV_LEN, len);
+	ptr += TLV_HDR_SIZE;
+	if (params->num_hint_s_ssid) {
+		s_ssid = ptr;
+		for (i = 0; i < params->num_hint_s_ssid; ++i) {
+			s_ssid->freq_flags = params->hint_s_ssid[i].freq_flags;
+			s_ssid->short_ssid = params->hint_s_ssid[i].short_ssid;
+			s_ssid++;
+		}
+	}
+	ptr += len;
+
+	len = params->num_hint_bssid * sizeof(struct hint_bssid);
+	tlv = ptr;
+	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_FIXED_STRUCT) |
+		      FIELD_PREP(WMI_TLV_LEN, len);
+	ptr += TLV_HDR_SIZE;
+	if (params->num_hint_bssid) {
+		hint_bssid = ptr;
+		for (i = 0; i < params->num_hint_bssid; ++i) {
+			hint_bssid->freq_flags =
+				params->hint_bssid[i].freq_flags;
+			ether_addr_copy(&params->hint_bssid[i].bssid.addr[0],
+					&hint_bssid->bssid.addr[0]);
+			hint_bssid++;
+		}
+	}
+
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_START_SCAN_CMDID);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 319ad7241e01..1162bd7a5f87 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -50,6 +50,14 @@ struct wmi_tlv {
 #define WMI_MAX_MEM_REQS        32
 #define ATH11K_MAX_HW_LISTEN_INTERVAL 5
 
+#define WLAN_SCAN_MAX_HINT_S_SSID        10
+#define WLAN_SCAN_MAX_HINT_BSSID         10
+#define MAX_RNR_BSS                    5
+
+#define WLAN_SCAN_MAX_HINT_S_SSID        10
+#define WLAN_SCAN_MAX_HINT_BSSID         10
+#define MAX_RNR_BSS                    5
+
 #define WLAN_SCAN_PARAMS_MAX_SSID    16
 #define WLAN_SCAN_PARAMS_MAX_BSSID   4
 #define WLAN_SCAN_PARAMS_MAX_IE_LEN  256
@@ -3105,6 +3113,16 @@ enum {
 	((flag) |= (((mode) << WMI_SCAN_DWELL_MODE_SHIFT) & \
 		    WMI_SCAN_DWELL_MODE_MASK))
 
+struct hint_short_ssid {
+	u32 freq_flags;
+	u32 short_ssid;
+};
+
+struct hint_bssid {
+	u32 freq_flags;
+	struct wmi_mac_addr bssid;
+};
+
 struct scan_req_params {
 	u32 scan_id;
 	u32 scan_req_id;
@@ -3184,6 +3202,10 @@ struct scan_req_params {
 	struct element_info extraie;
 	struct element_info htcap;
 	struct element_info vhtcap;
+	u32 num_hint_s_ssid;
+	u32 num_hint_bssid;
+	struct hint_short_ssid hint_s_ssid[WLAN_SCAN_MAX_HINT_S_SSID];
+	struct hint_bssid hint_bssid[WLAN_SCAN_MAX_HINT_BSSID];
 };
 
 struct wmi_ssid_arg {
-- 
2.17.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
