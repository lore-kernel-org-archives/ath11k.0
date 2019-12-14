Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ig4SM-0007fv-Sm
 for ath11k@lists.infradead.org; Sat, 14 Dec 2019 10:15:28 +0000
From: zhengbin <zhengbin13@huawei.com>
Subject: [PATCH -next] ath11k: Remove unneeded semicolon
Date: Sat, 14 Dec 2019 18:22:34 +0800
Message-ID: <1576318954-40658-1-git-send-email-zhengbin13@huawei.com>
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
To: kvalo@codeaurora.org, davem@davemloft.net, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: zhengbin13@huawei.com

Fixes coccicheck warning:

drivers/net/wireless/ath/ath11k/wmi.h:2570:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 4a518d4..22c887a 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2567,7 +2567,7 @@ static inline const char *ath11k_wmi_phymode_str(enum wmi_phy_mode mode)
 		/* no default handler to allow compiler to check that the
 		 * enum is fully handled
 		 */
-	};
+	}

 	return "<unknown>";
 }
--
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
