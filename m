Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koxCa-0004je-Sr
 for ath11k@lists.infradead.org; Mon, 14 Dec 2020 23:24:25 +0000
From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] ath11k: add missing null check on allocated skb
Date: Mon, 14 Dec 2020 23:24:17 +0000
Message-Id: <20201214232417.84556-1-colin.king@canonical.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the null check on a newly allocated skb is missing and
this can lead to a null pointer dereference is the allocation fails.
Fix this by adding a null check and returning -ENOMEM.

Addresses-Coverity: ("Dereference null return")
Fixes: 43ed15e1ee01 ("ath11k: put hw to DBS using WMI_PDEV_SET_HW_MODE_CMDID")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index da4b546b62cb..c869ff479212 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3460,6 +3460,8 @@ int ath11k_wmi_set_hw_mode(struct ath11k_base *ab,
 	len = sizeof(*cmd);
 
 	skb = ath11k_wmi_alloc_skb(wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
 	cmd = (struct wmi_pdev_set_hw_mode_cmd_param *)skb->data;
 
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_SET_HW_MODE_CMD) |
-- 
2.29.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
