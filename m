Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgkH5-0003xa-EC
 for ath11k@lists.infradead.org; Thu, 04 Jun 2020 07:26:52 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 10/12] ath11k: add the multiple bssid IE offset to the beacon
 template
Date: Thu,  4 Jun 2020 09:09:50 +0200
Message-Id: <20200604070952.15481-11-john@phrozen.org>
In-Reply-To: <20200604070952.15481-1-john@phrozen.org>
References: <20200604070952.15481-1-john@phrozen.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

The FW needs to know the offset of the multi bssid IE. Add this value to
the WMI TLV.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 3fca51c3f943..2fe4b65850ef 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1567,6 +1567,7 @@ int ath11k_wmi_bcn_tmpl(struct ath11k *ar, u32 vdev_id,
 	cmd->csa_switch_count_offset = offs->csa_counter_offs[0];
 	cmd->ext_csa_switch_count_offset = offs->csa_counter_offs[1];
 	cmd->buf_len = bcn->len;
+	cmd->mbssid_ie_offset = offs->multiple_bssid_offset;
 
 	ptr = skb->data + sizeof(*cmd);
 
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
