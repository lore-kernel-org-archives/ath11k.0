Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E78FC433F5
	for <ath11k@archiver.kernel.org>; Tue, 21 Dec 2021 19:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SilKhynsTCF3fu9xxElAac85Ruh1kuMRX+N02p5McKw=; b=mGL+z4VF7WK1t/
	AmaZbAHZtmGUZOH+Y5RkI4aQIQ3l4idHp7DqYAKmHREyF4XlywHFYh/DIzF/YO3Cfh5rnSRmY6cAC
	hrLsK/UgENTFUTo5adXccFoYXNdO4XAFgwTfnIy0tHOm6Gcx7Htje3u3FrdG/nwWpxdubuEfj/e1t
	GvC1ntEFKh8vLtKf6qz3L0Y2EwS3g0b4ZqnXTFQ50wOZYogPK3skCOg/98OXg8uM43XyQnKVHGUwG
	O9MMr25YoATO5cGjOTj3aVXieK+C6OI6OdHYzVpS0zPGTgVVYyvVZ4cq/dCusBvobod/pDe599wSD
	y/1NHnO/XbpTAGdNb8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzkzJ-008HOC-N1; Tue, 21 Dec 2021 19:39:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzkzG-008HMk-OS
 for ath11k@lists.infradead.org; Tue, 21 Dec 2021 19:39:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 796F3B81736;
 Tue, 21 Dec 2021 19:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D628C36AE8;
 Tue, 21 Dec 2021 19:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640115588;
 bh=bNfUoZedx6yXkJHuvzaeMl8iyE0ktEf9fQ6+7LtJZWY=;
 h=From:To:Cc:Subject:Date:From;
 b=Spc7MnxE9o+x2TwYu/sgN3HGbzPb2DbsH5IuMZ1mG/w/Rc0CgIoCSbjnojjU/DCOz
 e629SJi+PZ0hkbd6SBkv6L2qxDBTlCDYYNuJ9qgITj4w0EJe5oxqDy1tqBefpfAJ9h
 mqejR2NhJCQdhnu3LRPqw68lN1IC2ABUViqkkDq+FExPz6BNTyEhS/74anffxCB5Cp
 XuXfXQk3QB6Nxu7xNKq0VLpkQkfWAZRL0XfJZpFdol4lLFlZf6wcperMVrWDSRAVFh
 vryUXC9MaoAtAwBXW2raStQbRrC5AuqTceH7D2y0mN5UqV4cLGxrlWZldyY1I8P4R8
 /Ne1WXyWW9YkA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, kvalo@kernel.org,
 pkshih@realtek.com, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: [PATCH net-next 1/2] codel: remove unnecessary sock.h include
Date: Tue, 21 Dec 2021 11:39:40 -0800
Message-Id: <20211221193941.3805147-1-kuba@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_113951_091144_D321CB14 
X-CRM114-Status: GOOD (  12.78  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Since sock.h is modified relatively often (60 times in the last
12 months) it seems worthwhile to decrease the incremental build
work.

CoDel's header includes net/inet_ecn.h which in turn includes net/sock.h.
codel.h is itself included by mac80211 which is included by much of
the WiFi stack and drivers. Removing the net/inet_ecn.h include from
CoDel breaks the dependecy between WiFi and sock.h.

Commit d068ca2ae2e6 ("codel: split into multiple files") moved all
the code which actually needs ECN helpers out to net/codel_impl.h,
the include can be moved there as well.

This decreases the incremental build size after touching sock.h
from 4999 objects to 4051 objects.

Fix unmasked missing includes in WiFi drivers.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: kvalo@kernel.org
CC: pkshih@realtek.com
CC: ath11k@lists.infradead.org
CC: linux-wireless@vger.kernel.org
---
 drivers/net/wireless/ath/ath11k/debugfs.c  | 2 ++
 drivers/net/wireless/realtek/rtw89/core.c  | 2 ++
 drivers/net/wireless/realtek/rtw89/debug.c | 2 ++
 include/net/codel.h                        | 1 -
 include/net/codel_impl.h                   | 2 ++
 5 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index dba055d085be..eb8b4f20c95e 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2018-2020 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/vmalloc.h>
+
 #include "debugfs.h"
 
 #include "core.h"
diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index cf05baf88640..a0737eea9f81 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
 /* Copyright(c) 2019-2020  Realtek Corporation
  */
+#include <linux/ip.h>
+#include <linux/udp.h>
 
 #include "coex.h"
 #include "core.h"
diff --git a/drivers/net/wireless/realtek/rtw89/debug.c b/drivers/net/wireless/realtek/rtw89/debug.c
index 9756d75ef24e..22bd1d03e722 100644
--- a/drivers/net/wireless/realtek/rtw89/debug.c
+++ b/drivers/net/wireless/realtek/rtw89/debug.c
@@ -2,6 +2,8 @@
 /* Copyright(c) 2019-2020  Realtek Corporation
  */
 
+#include <linux/vmalloc.h>
+
 #include "coex.h"
 #include "debug.h"
 #include "fw.h"
diff --git a/include/net/codel.h b/include/net/codel.h
index a6c9e34e62b8..d74dd8fda54e 100644
--- a/include/net/codel.h
+++ b/include/net/codel.h
@@ -45,7 +45,6 @@
 #include <linux/ktime.h>
 #include <linux/skbuff.h>
 #include <net/pkt_sched.h>
-#include <net/inet_ecn.h>
 
 /* Controlling Queue Delay (CoDel) algorithm
  * =========================================
diff --git a/include/net/codel_impl.h b/include/net/codel_impl.h
index 137d40d8cbeb..78a27ac73070 100644
--- a/include/net/codel_impl.h
+++ b/include/net/codel_impl.h
@@ -49,6 +49,8 @@
  * Implemented on linux by Dave Taht and Eric Dumazet
  */
 
+#include <net/inet_ecn.h>
+
 static void codel_params_init(struct codel_params *params)
 {
 	params->interval = MS2TIME(100);
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
