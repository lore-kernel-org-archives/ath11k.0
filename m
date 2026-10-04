Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0F8CA5FE6
	for <ath11k@archiver.kernel.org>; Sun,  4 Oct 2026 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iBoFGPkE06vjMhxF2D/+ekmdU8OvBVPkR8cZBYUeB4=; b=gRMkEeDr+Pb1zPBRc7UUbZQMaH
	37WavHiz0zAHMNd+Svz33Sw2LETwDRFBUMks6HKZtDr8RPMMVpnVAP0vuuUKbiruQqKkwVS5cA9fk
	RwUB6suv4VGKiBYGk6Bdw8Kq9JCiriw8t1bSS1yw/SozGR/KbfLri+hT5lkcLbhguaKw/7p6sHtP/
	QB6DAvxnj8YcCXqrxh0d2o4tQ/cHVUgda0fj8KXUFd6VH9LY8Iz0eUbk5xUtpe6WRTPQ+aGFcxwK8
	pSQikZ757xVaxiAScwEQUfNU08zZUFWjOBGpY5B6G7AWAuuxo5dI5NNb9diyDM1lUys4FOA4+t0KT
	62NuU88Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKFW-0000000Eiun-2RDB;
	Sun, 04 Oct 2026 11:19:22 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKFU-0000000EiuT-2Hsx
	for ath11k@lists.infradead.org;
	Sun, 04 Oct 2026 11:19:21 +0000
Received: from MAILGW-BIG.big.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id A80C4103C0;
	Sun, 04 Oct 2026 14:19:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=5iBoFGPkE06vjMhxF2D/
	+ekmdU8OvBVPkR8cZBYUeB4=; b=DbtOzk0MbjS0mOTH0gNUZtipf7LzVR6pmbJ3
	R/aMjNb1dQoymlVLelFWgEtAIknJj9SdOMuj39W9gOHa2Ksro5oypZ86KtiM3BaU
	1KWMD3fNDBmnfqeg+tiIPGqgqT0R0W4YttfmbFykcpZNASi30YhdStAnvSz4T37Y
	DhiBWgdkufnsM9XuuLTuZu9LxAbAIBOJXQ4FMA78P09mq+wDeBrO/2mdEJP/GrQt
	xfIkpVaFSwPq2WnqlwchMciMXFCoKj0K+8r8qNigexn5YZzYqgkhYTxDf44Jj/BU
	Hh6w5glmHNWjm4Pw0Qp+PZTjc2s8XE5i5kvCMpRI/utKTB+mBw==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 376BD102F9;
	Sun, 04 Oct 2026 14:19:18 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 14:19:17 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Jeff Johnson <jjohnson@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH ath-next 1/5] wifi: ath11k: add a debugfs file listing the firmware WMI services
Date: Sun, 4 Oct 2026 14:18:03 +0300
Message-ID: <2b36fb4e11a9d8bfbd5011074bc954278cf81447.1791111135.git.me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791111135.2.git.me@andrei-z.com>
References: <cover.1791111135.2.git.me@andrei-z.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_041920_764313_E40CB7ED 
X-CRM114-Status: GOOD (  10.55  )
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

Whether a feature is available often comes down to a WMI service bit
the firmware reports at boot, and ath11k only logs the ext services,
at debug level. List the number of every set bit of the service map in
<soc>/wmi_services, so that the capabilities of a given firmware build
can be read directly.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 70922612d3..75d2e81c77 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -851,6 +851,18 @@ static const struct file_operations fops_sram_dump = {
 	.llseek = default_llseek,
 };
 
+static int ath11k_wmi_services_show(struct seq_file *m, void *v)
+{
+	struct ath11k_base *ab = m->private;
+	unsigned int i;
+
+	for_each_set_bit(i, ab->wmi_ab.svc_map, WMI_MAX_EXT2_SERVICE)
+		seq_printf(m, "%u\n", i);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(ath11k_wmi_services);
+
 int ath11k_debugfs_pdev_create(struct ath11k_base *ab)
 {
 	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
@@ -862,6 +874,9 @@ int ath11k_debugfs_pdev_create(struct ath11k_base *ab)
 	debugfs_create_file("soc_dp_stats", 0400, ab->debugfs_soc, ab,
 			    &fops_soc_dp_stats);
 
+	debugfs_create_file("wmi_services", 0400, ab->debugfs_soc, ab,
+			    &ath11k_wmi_services_fops);
+
 	if (ab->hw_params.sram_dump.start != 0)
 		debugfs_create_file("sram", 0400, ab->debugfs_soc, ab,
 				    &fops_sram_dump);
-- 
2.47.3



