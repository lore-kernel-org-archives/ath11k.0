Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZHLc-0006pL-4f
 for ath11k@lists.infradead.org; Mon, 25 Nov 2019 16:36:25 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 2/8] ath11k: ignore event 0x6017
Date: Mon, 25 Nov 2019 16:36:19 +0000
Message-ID: <0101016ea36bc69b-c32c733c-c065-431e-822f-9cac79cd49fb-000000@us-west-2.amazonses.com>
In-Reply-To: <1574699772-17938-1-git-send-email-kvalo@codeaurora.org>
References: <1574699772-17938-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: John Crispin <john@phrozen.org>

Everytime a new peer gets associated, we see the following message in the log
- ath11k c000000.wifi1: Unknown eventid: 0x6017
Ignore this event for now. We probably need to handle the event properly when
we add OMI support.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c |  1 +
 drivers/net/wireless/ath/ath11k/wmi.h | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 3d1d4d3c3f20..3ec5dd47cdc8 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5416,6 +5416,7 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	/* add Unsupported events here */
 	case WMI_TBTTOFFSET_EXT_UPDATE_EVENTID:
 	case WMI_VDEV_DELETE_RESP_EVENTID:
+	case WMI_PEER_OPER_MODE_CHANGE_EVENTID:
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "ignoring unsupported event 0x%x\n", id);
 		break;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 00c51cc83d47..1110da29cfcd 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -288,7 +288,6 @@ enum wmi_tlv_cmd_id {
 	WMI_PEER_REORDER_QUEUE_REMOVE_CMDID,
 	WMI_PEER_SET_RX_BLOCKSIZE_CMDID,
 	WMI_PEER_ANTDIV_INFO_REQ_CMDID,
-	WMI_PEER_OPER_MODE_CHANGE_EVENTID,
 	WMI_BCN_TX_CMDID = WMI_TLV_CMD(WMI_GRP_MGMT),
 	WMI_PDEV_SEND_BCN_CMDID,
 	WMI_BCN_TMPL_CMDID,
@@ -586,6 +585,18 @@ enum wmi_tlv_event_id {
 	WMI_WDS_PEER_EVENTID,
 	WMI_PEER_STA_PS_STATECHG_EVENTID,
 	WMI_PEER_ANTDIV_INFO_EVENTID,
+	WMI_PEER_RESERVED0_EVENTID,
+	WMI_PEER_RESERVED1_EVENTID,
+	WMI_PEER_RESERVED2_EVENTID,
+	WMI_PEER_RESERVED3_EVENTID,
+	WMI_PEER_RESERVED4_EVENTID,
+	WMI_PEER_RESERVED5_EVENTID,
+	WMI_PEER_RESERVED6_EVENTID,
+	WMI_PEER_RESERVED7_EVENTID,
+	WMI_PEER_RESERVED8_EVENTID,
+	WMI_PEER_RESERVED9_EVENTID,
+	WMI_PEER_RESERVED10_EVENTID,
+	WMI_PEER_OPER_MODE_CHANGE_EVENTID,
 	WMI_MGMT_RX_EVENTID = WMI_TLV_CMD(WMI_GRP_MGMT),
 	WMI_HOST_SWBA_EVENTID,
 	WMI_TBTTOFFSET_UPDATE_EVENTID,
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
