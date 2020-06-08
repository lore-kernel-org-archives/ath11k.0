Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQsC-00081L-Ag
 for ath11k@lists.infradead.org; Mon, 08 Jun 2020 23:08:10 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.7 089/274] ath11k: fix error message to correctly
 report the command that failed
Date: Mon,  8 Jun 2020 19:03:02 -0400
Message-Id: <20200608230607.3361041-89-sashal@kernel.org>
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
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
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit 9a8074e3bcd7956ec6b4f7c26360af1b0b0abe38 ]

Currently the error message refers to the command WMI_TWT_DIeABLE_CMDID
which looks like a cut-n-paste mangled typo. Fix the message to match
the command WMI_BSS_COLOR_CHANGE_ENABLE_CMDID that failed.

Fixes: 5a032c8d1953 ("ath11k: add WMI calls required for handling BSS color")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/20200327192639.363354-1-colin.king@canonical.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index e7ce36966d6a..6fec62846279 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2779,7 +2779,7 @@ int ath11k_wmi_send_bss_color_change_enable_cmd(struct ath11k *ar, u32 vdev_id,
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_BSS_COLOR_CHANGE_ENABLE_CMDID);
 	if (ret) {
-		ath11k_warn(ab, "Failed to send WMI_TWT_DIeABLE_CMDID");
+		ath11k_warn(ab, "Failed to send WMI_BSS_COLOR_CHANGE_ENABLE_CMDID");
 		dev_kfree_skb(skb);
 	}
 	return ret;
-- 
2.25.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
