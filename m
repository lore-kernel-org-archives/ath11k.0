Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA7EC54E66
	for <ath11k@archiver.kernel.org>; Fri, 15 Mar 2024 05:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I3M2FQXA24ojL/+FyY3k102AJ+AonKYH0KtBD1aMntM=; b=XwVutz6BWRYneMiifLtjktGtkJ
	SWjHpOzrNaeEnNMMtQiAs8xTqIbtZypyiA3TNpXukL7LVAELP4QCI0duvQkYXuXVv+GRr97Wp3K0f
	j5uGArV48oYvRYbjlIqKQJeXWTpPwRm3f6ZfBI3VeIqSa50qq0hKEWlM9mcIEcYxPM45dUpwiK3+c
	j91aRjj2XNbBJXQe1LOmTMT9lvZq7AxahIW8ktkSW4fbkeRmd82v+5YF7l6hXueowQ1lyIlGWCcpe
	Ayr5cYgVYAuKUSYTW+C9JFYbsPy7953b14MLQQyRpj59qDrHqnFGxpeKexccc/t6DhXfpZpDMr/NS
	o/WGUDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl0Ug-0000000Glcr-2KOo;
	Fri, 15 Mar 2024 05:52:38 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl0Uc-0000000Glbb-0RBY;
	Fri, 15 Mar 2024 05:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710481954; x=1742017954;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qv6phc/4FuyjqrfYPdqCTnpCxBNfhp35atRySiUpzR8=;
  b=FLSW6a5bgYrfbozk/al6jEX8zXfmqCp/KXmwpSCZLLxE3y7kll0Qa15/
   nK1sSzrICbYdaQDyTNtp9W57tX7+TYrykXTi4VBnIK4vM1IVxu2HMmoqa
   ndy0UWQdGJp7njg/b2dELfVHmNSqKLIBqHH3coFgqUI/MVvkS8deib5nn
   eA58e8aLGtQWpnwKGOSR25yuo5nuQ1yk4Q9reqbp2fVR6wB+wdtF/b5YE
   2r+kZ6CH7pJRTM9MFH8x7kYswnTjgPRKIsVpd8+AjPSx3ibT6B+o4nJFA
   6C1rQ1TbNMS25VMuGkYCS93vBxnZuVd0hM6qGei0v7JEWIQPFXEZLG26q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="152383414"
X-IronPort-AV: E=Sophos;i="6.07,127,1708354800"; 
   d="scan'208";a="152383414"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 14:52:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E1A9141205;
	Fri, 15 Mar 2024 14:52:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 64DC214D22;
	Fri, 15 Mar 2024 14:52:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E1A0A200A7E3A;
	Fri, 15 Mar 2024 14:52:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.226.45])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1A9A31A006B;
	Fri, 15 Mar 2024 13:52:24 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: linux-kernel@vger.kernel.org
Cc: Li Zhijian <lizhijian@fujitsu.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath10k@lists.infradead.org
Subject: [PATCH v2 1/3] wifi: ath: Convert sprintf/snprintf to sysfs_emit
Date: Fri, 15 Mar 2024 13:52:09 +0800
Message-Id: <20240315055211.1347548-1-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28252.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28252.004
X-TMASE-Result: 10--3.370400-10.000000
X-TMASE-MatchedRID: /mcjwogdDrk4ibokZ3+Q0CoiRKlBVkYIBXngI6jFvpfDqO6/8R69QE8U
	roFNOGp7a6aAZTOwtJmRloiW1Kgftd2ZdKe8BPbSrMZ+BqQt2Nps/NNpVQ666hXsn8ikX6Gtzv0
	+UmYCZcMPNxz2EvpSIAhBeNJICtc+zK2lwdvrNt2qH6mIBejVf2ItZ2e1geixEd+K6O5Nt53oKE
	r2irJf5CL637QCIVpi8vc3EUpCmrV8M8QL/JCA9N9JA2lmQRNUrzl8sNiWClKbKItl61J/yZ+in
	TK0bC9eKrauXd3MZDXdPm6Zo4+L6rfjitlkYmpJaIu8tbWsF6z9+jPt2YyIEwSvEMdfhO/82WMg
	P9XH4iW61V4Xac0M7FrnjD0+bxg0N7Br+Gphn4yMa1PejsZJrBXFEH92Kf64nTtPxlIuIBW9Hzj
	86YHXBCnifx5AGfCL
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_225234_623422_2F9270A0 
X-CRM114-Status: GOOD (  10.74  )
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
V2: subject updated

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


