Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdCpv-0000z1-6U
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 12:03:40 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 81B5B608BA
 for <ath11k@lists.infradead.org>; Tue, 18 Jun 2019 12:03:37 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/2] ath11k: fix typo with swap16() and swap32()
Date: Tue, 18 Jun 2019 15:03:32 +0300
Message-Id: <1560859413-8788-1-git-send-email-kvalo@codeaurora.org>
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

Fix GCC errors on sparc64:

drivers/net/wireless/ath/ath11k/dp.h:1490:13: error: implicit declaration of function 'swap32' [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/ath11k/dp.h:1491:13: error: implicit declaration of function 'swap16' [-Werror=implicit-function-declaration]

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 037fcbd7604d..6eeeff99dbd8 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1487,8 +1487,8 @@ static inline void dp_peer_map_get_mac_addr(u32 addr_l32, u16 addr_h16,
 					    u8 *addr)
 {
 #ifdef __BIG_ENDIAN
-	addr_l32 = swap32(addr_l32);
-	addr_h16 = swap16(addr_h16);
+	addr_l32 = swab32(addr_l32);
+	addr_h16 = swab16(addr_h16);
 #endif
 	memcpy(addr, &addr_l32, 4);
 	memcpy(addr + 4, &addr_h16, ETH_ALEN - 4);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
