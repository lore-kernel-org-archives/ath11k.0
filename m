Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdCpw-0000zV-8q
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 12:03:41 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 93CAC608BA
 for <ath11k@lists.infradead.org>; Tue, 18 Jun 2019 12:03:38 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 2/2] ath11k: include vmalloc.h to fix a compilation error on
 sparc64
Date: Tue, 18 Jun 2019 15:03:33 +0300
Message-Id: <1560859413-8788-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1560859413-8788-1-git-send-email-kvalo@codeaurora.org>
References: <1560859413-8788-1-git-send-email-kvalo@codeaurora.org>
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

drivers/net/wireless/ath/ath11k/debugfs_sta.c:414:14: error: implicit declaration of function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/ath11k/debugfs_sta.c:427:2: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index cff6a3f048ea..470cb97a160b 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/vmalloc.h>
+
 #include "core.h"
 #include "debug.h"
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
