Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgH67-00020y-1d
 for ath11k@lists.infradead.org; Wed, 03 Jun 2020 00:17:36 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH v5 7/8] ath11k: Send multiple scan_chan_list messages if
 required
Date: Tue,  2 Jun 2020 17:17:23 -0700
Message-Id: <20200603001724.12161-8-pradeepc@codeaurora.org>
In-Reply-To: <20200603001724.12161-1-pradeepc@codeaurora.org>
References: <20200603001724.12161-1-pradeepc@codeaurora.org>
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

With addition of 6Ghz channels, it is possible that wmi buffer size can
exceed the maximum wmi buffer size. So iterate over the channel list,
and send multiple messages till channel list is empty.
Also mark PSC channel flag for 6GHz channels accordingly.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 170 ++++++++++++++------------
 drivers/net/wireless/ath/ath11k/wmi.h |   3 +
 2 files changed, 98 insertions(+), 75 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 239a336f55f4..ad3a7b68d308 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2194,91 +2194,111 @@ int ath11k_wmi_send_scan_chan_list_cmd(struct ath11k *ar,
 	struct channel_param *tchan_info;
 	struct wmi_tlv *tlv;
 	void *ptr;
-	int i, ret, len;
+	int i, ret = 0, len;
+	u16 num_send_chans, num_sends = 0, max_chan_limit = 0;
 	u32 *reg1, *reg2;
 
-	len = sizeof(*cmd) + TLV_HDR_SIZE +
-		 sizeof(*chan_info) * chan_list->nallchans;
-
-	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
-	if (!skb)
-		return -ENOMEM;
-
-	cmd = (struct wmi_scan_chan_list_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_SCAN_CHAN_LIST_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-
-	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
-		   "WMI no.of chan = %d len = %d\n", chan_list->nallchans, len);
-	cmd->pdev_id = chan_list->pdev_id;
-	cmd->num_scan_chans = chan_list->nallchans;
-
-	ptr = skb->data + sizeof(*cmd);
-
-	len = sizeof(*chan_info) * chan_list->nallchans;
-	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	ptr += TLV_HDR_SIZE;
-
 	tchan_info = &chan_list->ch_param[0];
+	while (chan_list->nallchans) {
+		len = sizeof(*cmd) + TLV_HDR_SIZE;
+		max_chan_limit =
+			(wmi->wmi_ab->max_msg_len[ar->pdev_idx] - len) /
+			sizeof(*chan_info);
+
+		if (chan_list->nallchans > max_chan_limit)
+			num_send_chans = max_chan_limit;
+		else
+			num_send_chans = chan_list->nallchans;
+
+		chan_list->nallchans -= num_send_chans;
+		len += sizeof(*chan_info) * num_send_chans;
+
+		skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+		if (!skb)
+			return -ENOMEM;
 
-	for (i = 0; i < chan_list->nallchans; ++i) {
-		chan_info = ptr;
-		memset(chan_info, 0, sizeof(*chan_info));
-		len = sizeof(*chan_info);
-		chan_info->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-						   WMI_TAG_CHANNEL) |
-					FIELD_PREP(WMI_TLV_LEN,
-						   len - TLV_HDR_SIZE);
-
-		reg1 = &chan_info->reg_info_1;
-		reg2 = &chan_info->reg_info_2;
-		chan_info->mhz = tchan_info->mhz;
-		chan_info->band_center_freq1 = tchan_info->cfreq1;
-		chan_info->band_center_freq2 = tchan_info->cfreq2;
-
-		if (tchan_info->is_chan_passive)
-			chan_info->info |= WMI_CHAN_INFO_PASSIVE;
-		if (tchan_info->allow_he)
-			chan_info->info |= WMI_CHAN_INFO_ALLOW_HE;
-		else if (tchan_info->allow_vht)
-			chan_info->info |= WMI_CHAN_INFO_ALLOW_VHT;
-		else if (tchan_info->allow_ht)
-			chan_info->info |= WMI_CHAN_INFO_ALLOW_HT;
-		if (tchan_info->half_rate)
-			chan_info->info |= WMI_CHAN_INFO_HALF_RATE;
-		if (tchan_info->quarter_rate)
-			chan_info->info |= WMI_CHAN_INFO_QUARTER_RATE;
-
-		chan_info->info |= FIELD_PREP(WMI_CHAN_INFO_MODE,
-					      tchan_info->phy_mode);
-		*reg1 |= FIELD_PREP(WMI_CHAN_REG_INFO1_MIN_PWR,
-				    tchan_info->minpower);
-		*reg1 |= FIELD_PREP(WMI_CHAN_REG_INFO1_MAX_PWR,
-				    tchan_info->maxpower);
-		*reg1 |= FIELD_PREP(WMI_CHAN_REG_INFO1_MAX_REG_PWR,
-				    tchan_info->maxregpower);
-		*reg1 |= FIELD_PREP(WMI_CHAN_REG_INFO1_REG_CLS,
-				    tchan_info->reg_class_id);
-		*reg2 |= FIELD_PREP(WMI_CHAN_REG_INFO2_ANT_MAX,
-				    tchan_info->antennamax);
+		cmd = (struct wmi_scan_chan_list_cmd *)skb->data;
+		cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_SCAN_CHAN_LIST_CMD) |
+			FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+		cmd->pdev_id = chan_list->pdev_id;
+		cmd->num_scan_chans = num_send_chans;
+		if (num_sends)
+			cmd->flags |= WMI_APPEND_TO_EXISTING_CHAN_LIST_FLAG;
 
 		ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
-			   "WMI chan scan list chan[%d] = %u\n",
-			   i, chan_info->mhz);
+			   "WMI no.of chan = %d len = %d pdev_id = %d num_sends = %d\n",
+			   num_send_chans, len, cmd->pdev_id, num_sends);
 
-		ptr += sizeof(*chan_info);
+		ptr = skb->data + sizeof(*cmd);
 
-		tchan_info++;
-	}
+		len = sizeof(*chan_info) * num_send_chans;
+		tlv = ptr;
+		tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
+			      FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+		ptr += TLV_HDR_SIZE;
 
-	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_SCAN_CHAN_LIST_CMDID);
-	if (ret) {
-		ath11k_warn(ar->ab, "failed to send WMI_SCAN_CHAN_LIST cmd\n");
-		dev_kfree_skb(skb);
-	}
+		for (i = 0; i < num_send_chans; ++i) {
+			chan_info = ptr;
+			memset(chan_info, 0, sizeof(*chan_info));
+			len = sizeof(*chan_info);
+			chan_info->tlv_header = FIELD_PREP(WMI_TLV_TAG,
+							   WMI_TAG_CHANNEL) |
+						FIELD_PREP(WMI_TLV_LEN,
+							   len - TLV_HDR_SIZE);
+
+			reg1 = &chan_info->reg_info_1;
+			reg2 = &chan_info->reg_info_2;
+			chan_info->mhz = tchan_info->mhz;
+			chan_info->band_center_freq1 = tchan_info->cfreq1;
+			chan_info->band_center_freq2 = tchan_info->cfreq2;
+
+			if (tchan_info->is_chan_passive)
+				chan_info->info |= WMI_CHAN_INFO_PASSIVE;
+			if (tchan_info->allow_he)
+				chan_info->info |= WMI_CHAN_INFO_ALLOW_HE;
+			else if (tchan_info->allow_vht)
+				chan_info->info |= WMI_CHAN_INFO_ALLOW_VHT;
+			else if (tchan_info->allow_ht)
+				chan_info->info |= WMI_CHAN_INFO_ALLOW_HT;
+			if (tchan_info->half_rate)
+				chan_info->info |= WMI_CHAN_INFO_HALF_RATE;
+			if (tchan_info->quarter_rate)
+				chan_info->info |= WMI_CHAN_INFO_QUARTER_RATE;
+			if (tchan_info->psc_channel)
+				chan_info->info |= WMI_CHAN_INFO_PSC;
+
+			chan_info->info |= FIELD_PREP(WMI_CHAN_INFO_MODE,
+						      tchan_info->phy_mode);
+			*reg1 |= FIELD_PREP(WMI_CHAN_REG_INFO1_MIN_PWR,
+					    tchan_info->minpower);
+			*reg1 |= FIELD_PREP(WMI_CHAN_REG_INFO1_MAX_PWR,
+					    tchan_info->maxpower);
+			*reg1 |= FIELD_PREP(WMI_CHAN_REG_INFO1_MAX_REG_PWR,
+					    tchan_info->maxregpower);
+			*reg1 |= FIELD_PREP(WMI_CHAN_REG_INFO1_REG_CLS,
+					    tchan_info->reg_class_id);
+			*reg2 |= FIELD_PREP(WMI_CHAN_REG_INFO2_ANT_MAX,
+					    tchan_info->antennamax);
+
+			ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+				   "WMI chan scan list chan[%d] = %u, chan_info->info %8x\n",
+				   i, chan_info->mhz, chan_info->info);
+
+			ptr += sizeof(*chan_info);
+
+			tchan_info++;
+		}
 
+		ret = ath11k_wmi_cmd_send(wmi, skb, WMI_SCAN_CHAN_LIST_CMDID);
+		if (ret) {
+			ath11k_warn(ar->ab, "failed to send WMI_SCAN_CHAN_LIST cmd\n");
+			dev_kfree_skb(skb);
+			goto end;
+		}
+
+		num_sends++;
+	}
+end:
 	return ret;
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 4937d02839fc..319ad7241e01 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -54,6 +54,8 @@ struct wmi_tlv {
 #define WLAN_SCAN_PARAMS_MAX_BSSID   4
 #define WLAN_SCAN_PARAMS_MAX_IE_LEN  256
 
+#define WMI_APPEND_TO_EXISTING_CHAN_LIST_FLAG 1
+
 #define WMI_BA_MODE_BUFFER_SIZE_256  3
 /*
  * HW mode config type replicated from FW header
@@ -3271,6 +3273,7 @@ struct  wmi_bcn_send_from_host_cmd {
 #define WMI_CHAN_INFO_QUARTER_RATE	BIT(15)
 #define WMI_CHAN_INFO_DFS_FREQ2		BIT(16)
 #define WMI_CHAN_INFO_ALLOW_HE		BIT(17)
+#define WMI_CHAN_INFO_PSC		BIT(18)
 
 #define WMI_CHAN_REG_INFO1_MIN_PWR	GENMASK(7, 0)
 #define WMI_CHAN_REG_INFO1_MAX_PWR	GENMASK(15, 8)
-- 
2.17.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
