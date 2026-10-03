Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA7BCA5FEF
	for <ath11k@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4ZWY2lYUWLTnEVfGSFVYa6IQCkfgmn3BeS8my0FevU=; b=O0HG+BBI1G1teu/F8h5hvdWymM
	lhpe1HESLQJ3SAK+OptlBetXI5lnzazs0hqem4HjiYLDE6+z0jHpMy/LLpFyv3/F1WNfcvFuwF8Iq
	icoXffyaF92CoW0pgWS2vAPQksBozMrG7f8PoaN2OcD/IPOGXN9Z6jMlkMszxOLnpsbGTrWsjjwTP
	NuM+P6IdDfY2tfoSQy4V1Kggk9Q4RvQtef53UfaazC5Bo7bnL1w8l9Fon7Ft5dKrp04vhjckJqwmX
	MZtbMrzOd7uuyxToicCriUD1zdrOacvzbqcxyyv6vg9N5p7TthVE/zPfffzcIRIwLDjHgHsvi0T0P
	aNUn0MhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD25j-0000000DiqX-1Ohr;
	Sat, 03 Oct 2026 15:56:03 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD25g-0000000Dioh-2WFv
	for ath11k@lists.infradead.org;
	Sat, 03 Oct 2026 15:56:01 +0000
Received: from MAILGW-HP.hp.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id BF8961603B;
	Sat, 03 Oct 2026 18:55:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=z4ZWY2lYUWLTnEVfGSFV
	Ya6IQCkfgmn3BeS8my0FevU=; b=a5UhJq/rblD21Q5QmLvrHHrLbOqnV0YaKYbe
	fq3sTcNIwUQypAzVVytVL8Y+JYwFQR/nxF//EhJA0q/sUoCwGpJuAghiOejlxK9x
	jZllmtJ1Tb+hxmX+0KE/GjcofLP5n+4uaOVL9jxSCCkaJN0c8IJ0yKI0BD64o+sW
	vOMn+w6DRAPKEpftIvEHHotMhWE7X4hD1qj64aJ97kCpgwchVmXTjeIbZAOV4ble
	dSz5oi6rTgP6naChDci8gjGxN/4OGN6IM6efgkID0pwA1qY5wOt3MCa8eCzqxfE1
	X2IOXV+5rzeQuSQhF0j+L03vuL+Di+PzE2/qZQnE5JLLj2RVxw==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 0201B15CF5;
	Sat, 03 Oct 2026 18:55:48 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 18:55:47 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johannes Berg
	<johannes@sipsolutions.net>
CC: <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 1/4] wifi: ath11k: add a debugfs file listing the firmware WMI services
Date: Sat, 3 Oct 2026 18:55:39 +0300
Message-ID: <20261003155542.96363-2-me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003155542.96363-1-me@andrei-z.com>
References: <20261003155542.96363-1-me@andrei-z.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_085600_831803_31B85AB6 
X-CRM114-Status: GOOD (  10.88  )
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
at debug level. List every set bit of the service map in
<soc>/wmi_services, as ath10k's file of the same name does, so the
capabilities of a given firmware build can be read directly.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 70922612d..75d2e81c7 100644
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


