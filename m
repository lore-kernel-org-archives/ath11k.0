Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he2P3-00073o-BX
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 19:07:22 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: fix SPDX comment style warnings
Date: Fri, 21 Jun 2019 00:37:01 +0530
Message-Id: <1561057621-669-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

drivers/net/wireless/ath/ath11k/testmode.h:1: Improper SPDX comment style for 'drivers/net/wireless/ath/ath11k/testmode.h', please use '/*' instead
drivers/net/wireless/ath/ath11k/testmode.h:1: Missing or malformed SPDX-License-Identifier tag in line 1
drivers/net/wireless/ath/ath11k/testmode_i.h:1: Improper SPDX comment style for 'drivers/net/wireless/ath/ath11k/testmode_i.h', please use '/*' instead
drivers/net/wireless/ath/ath11k/testmode_i.h:1: Missing or malformed SPDX-License-Identifier tag in line 1
drivers/net/wireless/ath/ath11k/trace.h:1: Improper SPDX comment style for 'drivers/net/wireless/ath/ath11k/trace.h', please use '/*' instead
drivers/net/wireless/ath/ath11k/trace.h:1: Missing or malformed SPDX-License-Identifier tag in line 1

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/testmode.h   | 2 +-
 drivers/net/wireless/ath/ath11k/testmode_i.h | 2 +-
 drivers/net/wireless/ath/ath11k/trace.h      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/testmode.h b/drivers/net/wireless/ath/ath11k/testmode.h
index 090b4a2..303091b 100644
--- a/drivers/net/wireless/ath/ath11k/testmode.h
+++ b/drivers/net/wireless/ath/ath11k/testmode.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: ISC
+/* SPDX-License-Identifier: ISC */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  */
diff --git a/drivers/net/wireless/ath/ath11k/testmode_i.h b/drivers/net/wireless/ath/ath11k/testmode_i.h
index 33b784f..96ae22b 100644
--- a/drivers/net/wireless/ath/ath11k/testmode_i.h
+++ b/drivers/net/wireless/ath/ath11k/testmode_i.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: ISC
+/* SPDX-License-Identifier: ISC */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  */
diff --git a/drivers/net/wireless/ath/ath11k/trace.h b/drivers/net/wireless/ath/ath11k/trace.h
index f369db1..aa96c4e 100644
--- a/drivers/net/wireless/ath/ath11k/trace.h
+++ b/drivers/net/wireless/ath/ath11k/trace.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: ISC
+/* SPDX-License-Identifier: ISC */
 /*
  * Copyright (c) 2019 The Linux Foundation. All rights reserved.
  */
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
