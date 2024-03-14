Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CF4C54E67
	for <ath11k@archiver.kernel.org>; Thu, 14 Mar 2024 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iTtLbHsIOnRZr1h22E53rw8mzeKiaDfgErrScdq9sRA=; b=Pr797WXJ2vWvj04rjhKA1Sfif2
	LZ3TgHK+4YDV789LN2SLR1M5fGFGkDVMV8eaUieqhZSGIIaFYJqVxj7Vf9lvNn5Wc84Gs678jeZqe
	vIJ/r8cGLNVMjOPUh/uKtVzlgt6ZruxBe+PuIPrAsNiJiGJwEzHoCGbj+WmqG9JMDohYYxsGt5kt9
	WgP5j7gp4F8VM1ugwZOTo9EFR4dl/S7so5vIasNWbpjLpVS0IYX6Ex6i/iMQKpMBiHq2nuZsmjX2O
	JWH0KN/cQdwGiK3mlUQPPtgzV7HWswAKIruzdnGpU+N9cBKizFoAvlbr6fvJej1LLuxVLi8Jf8ucO
	H3w5hCQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhhf-0000000DmhI-3uLX;
	Thu, 14 Mar 2024 09:48:47 +0000
Received: from esa3.hc1455-7.c3s2.iphmx.com ([207.54.90.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhha-0000000DmdG-0sIy;
	Thu, 14 Mar 2024 09:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710409722; x=1741945722;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tXWoDv0MCVcjPegxH+LsuRrAuyb6Of1Y0FhIRJQ/Wsw=;
  b=s7xwtt5+KHfsYZ8VROOSWymgJ7l1zSLWO5Ge179mrpCe5ZeoFHn7Uynm
   6HfhZ/aU6nyo9GJwi3Zd1mVxAIYuWuuacHM121A6ww0EF1mIm3wlZ+a+0
   L9jph+LtWqfbUGUq8J0ADWJvyedIX2A141+QA5uAQ3vQtVbaB6suDgLSY
   JZOFeCMhSGRW4Czfmo2S4J5nMrNZJFipuau5WoZHCHAufzhAkKsGqsLqq
   CeyK3a9LbChcd+msRbjTYa6wwquHpYEULjKCaTFNql0tkY+kHLXTQRis5
   oOiWNDLNcSLvbvwdo7auyiszVyDQ1N1+hPwCK0gijbamgDxp/61lFSh1F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="152240894"
X-IronPort-AV: E=Sophos;i="6.07,125,1708354800"; 
   d="scan'208";a="152240894"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 18:48:36 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 159E1275F6;
	Thu, 14 Mar 2024 18:48:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 37F9C4262F;
	Thu, 14 Mar 2024 18:48:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BF5E620098E23;
	Thu, 14 Mar 2024 18:48:32 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.226.45])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1D2AE1A006B;
	Thu, 14 Mar 2024 17:48:32 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: linux-kernel@vger.kernel.org
Cc: Li Zhijian <lizhijian@fujitsu.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath10k@lists.infradead.org
Subject: [PATCH 1/3] net: ath: Convert sprintf/snprintf to sysfs_emit
Date: Thu, 14 Mar 2024 17:48:21 +0800
Message-Id: <20240314094823.1324898-1-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28250.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28250.006
X-TMASE-Result: 10--3.130400-10.000000
X-TMASE-MatchedRID: ebEStOsB1eE4ibokZ3+Q0CoiRKlBVkYIBXngI6jFvpfDqO6/8R69QE8U
	roFNOGp7a6aAZTOwtJmRloiW1Kgftd2ZdKe8BPbSrMZ+BqQt2Nps/NNpVQ666iXOD7ucKRbIQiM
	ingSlKoKMx5HzfQifbPE41045MrHXFDCN/1eC4ASdVNZaI2n6/wmWvXEqQTm5wLkNMQzGl5B+Kr
	WCPbERPznpYPqS6jzxEi2pD9yuITrh15/JKUJo/p4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMO3LlEZYYZnW9rIyN56uP6NRM6ylMvEXGk1oRQBQClV4HA/0Gjnf5bBp2jOiFp3dpx6YyQ
	KoFjU2kssxlojaTXaZ9+GrWpP0BdW4wbpXTb5DJKKve1kh3RY37qSWrndbmQn0bOriG5BVc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_024842_623460_9A0B82F4 
X-CRM114-Status: GOOD (  10.65  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Per filesystems/sysfs.rst, show() should only use sysfs_emit()
or sysfs_emit_at() when formatting the value to be returned to user space.

coccinelle complains that there are still a couple of functions that use
snprintf(). Convert them to sysfs_emit().

sprintf() will be converted as weel if they have.

Generally, this patch is generated by
make coccicheck M=<path/to/file> MODE=patch \
COCCI=scripts/coccinelle/api/device_attr_show.cocci

No functional change intended

CC: Kalle Valo <kvalo@kernel.org>
CC: Jeff Johnson <jjohnson@kernel.org>
CC: linux-wireless@vger.kernel.org
CC: ath11k@lists.infradead.org
CC: ath10k@lists.infradead.org
Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---
This is a part of the work "Fix coccicheck device_attr_show warnings"[1]
Split them per subsystem so that the maintainer can review it easily
[1] https://lore.kernel.org/lkml/20240116041129.3937800-1-lizhijian@fujitsu.com/
---
 drivers/net/wireless/ath/ath10k/thermal.c | 2 +-
 drivers/net/wireless/ath/ath11k/thermal.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 31c8d7fbb095..8b15ec07b107 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -100,7 +100,7 @@ static ssize_t ath10k_thermal_show_temp(struct device *dev,
 	spin_unlock_bh(&ar->data_lock);
 
 	/* display in millidegree celsius */
-	ret = snprintf(buf, PAGE_SIZE, "%d\n", temperature * 1000);
+	ret = sysfs_emit(buf, "%d\n", temperature * 1000);
 out:
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
diff --git a/drivers/net/wireless/ath/ath11k/thermal.c b/drivers/net/wireless/ath/ath11k/thermal.c
index 41e7499f075f..18d6eab5cce3 100644
--- a/drivers/net/wireless/ath/ath11k/thermal.c
+++ b/drivers/net/wireless/ath/ath11k/thermal.c
@@ -101,7 +101,7 @@ static ssize_t ath11k_thermal_show_temp(struct device *dev,
 	spin_unlock_bh(&ar->data_lock);
 
 	/* display in millidegree Celsius */
-	ret = snprintf(buf, PAGE_SIZE, "%d\n", temperature * 1000);
+	ret = sysfs_emit(buf, "%d\n", temperature * 1000);
 out:
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
-- 
2.29.2


