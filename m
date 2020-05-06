Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWGbN-0006Pn-NB
 for ath11k@lists.infradead.org; Wed, 06 May 2020 09:44:33 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 3/3] ath11k: Remove bus layer includes from upper layer
Date: Wed,  6 May 2020 15:14:00 +0530
Message-Id: <20200506094400.4740-4-govinds@codeaurora.org>
In-Reply-To: <20200506094400.4740-1-govinds@codeaurora.org>
References: <20200506094400.4740-1-govinds@codeaurora.org>
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
To: ath11k@lists.infradead.org
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

Bus level header files needs to be abstracted by upper
layer. Remove bus layer includes by adding appropriate header
files.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c     | 1 -
 drivers/net/wireless/ath/ath11k/hal.c      | 1 -
 drivers/net/wireless/ath/ath11k/hal_desc.h | 2 ++
 drivers/net/wireless/ath/ath11k/hal_rx.c   | 1 -
 drivers/net/wireless/ath/ath11k/hal_tx.c   | 2 +-
 drivers/net/wireless/ath/ath11k/hal_tx.h   | 1 +
 drivers/net/wireless/ath/ath11k/htc.c      | 1 -
 7 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index a91eae6a4e57..02501cc154fe 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -7,7 +7,6 @@
 #include <linux/slab.h>
 #include <linux/remoteproc.h>
 #include <linux/firmware.h>
-#include "ahb.h"
 #include "core.h"
 #include "dp_tx.h"
 #include "dp_rx.h"
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 6d937674215e..d63785178afa 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  */
 #include <linux/dma-mapping.h>
-#include "ahb.h"
 #include "hal_tx.h"
 #include "debug.h"
 #include "hal_desc.h"
diff --git a/drivers/net/wireless/ath/ath11k/hal_desc.h b/drivers/net/wireless/ath/ath11k/hal_desc.h
index 5e200380cca4..ab73c813fb45 100644
--- a/drivers/net/wireless/ath/ath11k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath11k/hal_desc.h
@@ -2,6 +2,8 @@
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  */
+#include "core.h"
+
 #ifndef ATH11K_HAL_DESC_H
 #define ATH11K_HAL_DESC_H
 
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 69b0248a7baf..129c9e1efeb9 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  */
 
-#include "ahb.h"
 #include "debug.h"
 #include "hal.h"
 #include "hal_tx.h"
diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.c b/drivers/net/wireless/ath/ath11k/hal_tx.c
index b364c077c1f7..81937c29ffca 100644
--- a/drivers/net/wireless/ath/ath11k/hal_tx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_tx.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  */
 
-#include "ahb.h"
+#include "hal_desc.h"
 #include "hal.h"
 #include "hal_tx.h"
 #include "hif.h"
diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.h b/drivers/net/wireless/ath/ath11k/hal_tx.h
index ce48a61bfb66..d4760a20fdac 100644
--- a/drivers/net/wireless/ath/ath11k/hal_tx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_tx.h
@@ -7,6 +7,7 @@
 #define ATH11K_HAL_TX_H
 
 #include "hal_desc.h"
+#include "core.h"
 
 #define HAL_TX_ADDRX_EN			1
 #define HAL_TX_ADDRY_EN			2
diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index 1909fc3287ba..ad13c648b679 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -5,7 +5,6 @@
 #include <linux/skbuff.h>
 #include <linux/ctype.h>
 
-#include "ahb.h"
 #include "debug.h"
 #include "hif.h"
 
-- 
2.22.0

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
