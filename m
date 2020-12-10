Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMZi-0001SE-4h
 for ath11k@lists.infradead.org; Thu, 10 Dec 2020 14:05:45 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 6/6] ath11k: Fix incorrect tlvs in scan start command
Date: Thu, 10 Dec 2020 16:05:24 +0200
Message-Id: <1607609124-17250-7-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1607609124-17250-1-git-send-email-kvalo@codeaurora.org>
References: <1607609124-17250-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

Currently 6G specific tlvs have duplicate entries which is causing
scan failures. Fix this by removing the duplicate entries of the same
tlv. This also fixes out-of-bound memory writes caused due to
adding tlvs when num_hint_bssid and num_hint_s_ssid are ZEROs.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01386-QCAHKSWPL_SILICONZ-1

Fixes: 74601ecfef6e ("ath11k: Add support for 6g scan hint")
Reported-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 79b7f991c612..95ebb105dfd7 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2213,37 +2213,6 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 		}
 	}
 
-	len = params->num_hint_s_ssid * sizeof(struct hint_short_ssid);
-	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_FIXED_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, len);
-	ptr += TLV_HDR_SIZE;
-	if (params->num_hint_s_ssid) {
-		s_ssid = ptr;
-		for (i = 0; i < params->num_hint_s_ssid; ++i) {
-			s_ssid->freq_flags = params->hint_s_ssid[i].freq_flags;
-			s_ssid->short_ssid = params->hint_s_ssid[i].short_ssid;
-			s_ssid++;
-		}
-	}
-	ptr += len;
-
-	len = params->num_hint_bssid * sizeof(struct hint_bssid);
-	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_FIXED_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, len);
-	ptr += TLV_HDR_SIZE;
-	if (params->num_hint_bssid) {
-		hint_bssid = ptr;
-		for (i = 0; i < params->num_hint_bssid; ++i) {
-			hint_bssid->freq_flags =
-				params->hint_bssid[i].freq_flags;
-			ether_addr_copy(&params->hint_bssid[i].bssid.addr[0],
-					&hint_bssid->bssid.addr[0]);
-			hint_bssid++;
-		}
-	}
-
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_START_SCAN_CMDID);
 	if (ret) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
