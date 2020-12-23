Return-Path: <SRS0=zJ/X=F3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EBDC433E0
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 03:03:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0809920705
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 03:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0809920705
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUds3TPk39ddPXttCvIaKqDqSipSPEY+qdOXL+RnyCA=; b=fd5I4jk0cPyoXTxBvygB39KZnd
	YgM0Qr6B2kKnJi1YFZpgGSlnqzHAKcps8BGNFw8VO9PI3OrmqiWUrweBJzqzcQ2e04Cx6ytePOh69
	gHDtybfdQD433K4/1EzvUINt3g+z1yJZrquxMvkF0A7tPP0viLwt+xSAfYzE7T8OxLz6d1KP1L3A/
	oso+wq8OOb984CULgu0Ie2nAqPWMSg6bPEvtmQOWhx5RXoy0ywYwI6OGJgcWOpckWLoowyBk/rt6A
	sRtGJMc2kt8CrvK0J/qm4L8xBh9Hb97fQ1FJ8B4hh/DUOV3nhGiwg3J49mSJEiIk9KDOmplataMEk
	XzEyRFYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kruQq-0007Va-6F; Wed, 23 Dec 2020 03:03:20 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kruQm-0007SK-MZ
 for ath11k@lists.infradead.org; Wed, 23 Dec 2020 03:03:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608692596; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=COpPCI35yZLocAaYqn3iaC0V3RPVM6uVwo+YuNePICU=;
 b=sjNcE5jWZ0hEDDqACyI31VqnEekcM/LIsK8ChMethP9bpspV6iJzIHcEqrC9jNjO/VhZ/dZA
 yby5P80g6zsz0BF3Y5lyA5n4MqPNlb4h7hOPlz0deax1Pa4vhVS9llNvaw7itVD1ygfXJlZR
 v7aI5/TXjbewFmDdGZE/pFJscfI=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fe2b34bda471981880371c3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Dec 2020 03:02:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 01A2CC433ED; Wed, 23 Dec 2020 03:02:35 +0000 (UTC)
Received: from cjhuang-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BF241C433CA;
 Wed, 23 Dec 2020 03:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BF241C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=cjhuang@codeaurora.org
From: Carl Huang <cjhuang@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 1/6] ath11k: get msi_data again after request_irq is called
Date: Tue, 22 Dec 2020 22:02:20 -0500
Message-Id: <20201223030225.2345-2-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201223030225.2345-1-cjhuang@codeaurora.org>
References: <20201223030225.2345-1-cjhuang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_220317_606021_3E9B2B9E 
X-CRM114-Status: GOOD (  19.37  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The reservation mode of interrupts is kernel assigns a dummy vector
when the interrupt is allocated and assigns a real vector when the
request_irq is called. The reservation mode helps to ease vector
pressure when devices with a large amount of queues/interrupts
are initialized, but only a minimal subset of those queues/interrupts
is actually used.

So on reservation mode, the msi_data may change after request_irq
is called, so ath11k reads msi_data again after request_irq is called,
and then the correct msi_data is programmed into QCA6390 hardware
components. Without this change, spurious interrupt occurs in case of
one MSI vector. When VT-D in BIOS is enabled and ath11k can get 32 MSI
vectors, ath11k always get the same msi_data before and after request_irq,
that's why this change is only required when one MSI vector is to be
supported.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 78478b2..c1ae1df 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -804,6 +804,32 @@ static void ath11k_pci_disable_msi(struct ath11k_pci *ab_pci)
 	pci_free_irq_vectors(ab_pci->pdev);
 }
 
+static int ath11k_pci_config_msi_data(struct ath11k_pci *ab_pci)
+{
+	struct msi_desc *msi_desc;
+	int ret;
+
+	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
+	if (!msi_desc) {
+		ath11k_err(ab_pci->ab, "%s msi_desc is NULL!\n", __func__);
+		ret = -EINVAL;
+		goto free_msi_vector;
+	}
+
+	ab_pci->msi_ep_base_data = msi_desc->msg.data;
+
+	ath11k_dbg(ab_pci->ab, ATH11K_DBG_PCI,
+		   "msi base data after request_irq is %d\n",
+		   ab_pci->msi_ep_base_data);
+
+	return 0;
+
+free_msi_vector:
+	pci_free_irq_vectors(ab_pci->pdev);
+
+	return ret;
+}
+
 static int ath11k_pci_claim(struct ath11k_pci *ab_pci, struct pci_dev *pdev)
 {
 	struct ath11k_base *ab = ab_pci->ab;
@@ -1174,6 +1200,17 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		goto err_ce_free;
 	}
 
+	/* kernel may allocate a dummy vector before request_irq and
+	 * then allocate a real vector when request_irq is called.
+	 * So get msi_data here again to avoid spurious interrupt
+	 * as msi_data will configured to srngs.
+	 */
+	ret = ath11k_pci_config_msi_data(ab_pci);
+	if (ret) {
+		ath11k_err(ab, "failed to config msi_data: %d\n", ret);
+		goto err_ce_free;
+	}
+
 	ret = ath11k_core_init(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to init core: %d\n", ret);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
