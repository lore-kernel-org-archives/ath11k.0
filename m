Return-Path: <SRS0=YaQx=JN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513AAC43461
	for <ath11k@archiver.kernel.org>; Fri, 16 Apr 2021 18:47:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA16A6137D
	for <ath11k@archiver.kernel.org>; Fri, 16 Apr 2021 18:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA16A6137D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXpq5WLjYmxJYFKatRa8QbpjFX/DdjzYxkZ8vgQUqfA=; b=i02+mB8y/NvD7APLhWlfT7sAsF
	v8zk4rLgRDDFcTeh6InoXUJ5Lfd8ufM4fM15/+u3Z6XqpSwa0Sy/IgkGp/RI/J0Bvev+rpRmjaxP9
	ULRlPQS7eGp3KBVA0+dUpBt/vgbWQUhEDnRMgoI3Dd3pBFLSn7kRRuhqbh1PvkdDyT/zEX+vhU+DH
	PLKwOnTdwiKEGLtfgEh+Go8Ug+hBq0ASi1RDTVljQA00iZVTaTiPoKefg16OuAGkpGilftv7BvSry
	f7Z4u+ffpFHlyWcMSmdv2/JoN+oQkeodpif6jRbheul7MLtOfLOQcmdszIjDmsGqHnNjhXhaCWRae
	vr5Zg7Ug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXTV6-0037zw-0A; Fri, 16 Apr 2021 18:47:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTV2-0037yt-Td
 for ath11k@desiato.infradead.org; Fri, 16 Apr 2021 18:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=nXza0ed97DWeQ6ht3ECM6daF5ZkiN7IpuREWksjCdW0=; b=b7PWVuzL1jEmCroCxBrmaUwWk1
 Qin6kIHh+BBZEIUUFqMhEGlOc0H1gkCIHebtnDeUBm0k3MNOqa4h9admYWMJsHNT4GIGx14PmR77v
 /klhgkmaTtu3Q+cfw5lQlf1An7+Cl+PZ4YBvOeYYCIv88Zu3lJ90nUnfdDfjLwXvgLi8ik8xZ8qu9
 t5x/UTTrJZIWo4UhFQtPFnJ7z9T3weTJeq4MmZ8ZyNMyS3kVpnbe6ZmToUu88fW+8kHNWsFGJdrIJ
 kdivZ49NraFqnOizqDe6sgJXMxt06Vv8NrMjRuTnYPmYImhavONLWLUwQn6mkiJ96JP02QNNeZCb2
 7BFheK1w==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTUx-009dTF-Bm
 for ath11k@lists.infradead.org; Fri, 16 Apr 2021 18:47:27 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618598843; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=nXza0ed97DWeQ6ht3ECM6daF5ZkiN7IpuREWksjCdW0=;
 b=kPu5peQetqmSvD93TyEjqGsEOMQI0A2f97J4K541FUcjbc6Zm6IjJCnzx/G4nmWiPY4Er4/L
 eFH08zDkNuMbeWAYi/CKv9g7P85KOZlXl+bNwaFVrYc1rztWd6/W5r3dN22o1B1t46jFebfu
 MK6tDEOTc6v2p/pgj/VqzDXYffU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6079dbb82cc44d3aeaf2c514 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 18:47:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 11353C43461; Fri, 16 Apr 2021 18:47:19 +0000 (UTC)
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C40EEC43466;
 Fri, 16 Apr 2021 18:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C40EEC43466
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From: Bhaumik Bhatt <bbhatt@codeaurora.org>
To: manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
 jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
 loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org,
 Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 3/6] bus: mhi: Add MMIO region length to controller
 structure
Date: Fri, 16 Apr 2021 11:47:02 -0700
Message-Id: <1618598825-18629-4-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618598825-18629-1-git-send-email-bbhatt@codeaurora.org>
References: <1618598825-18629-1-git-send-email-bbhatt@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_114724_013510_0E31E870 
X-CRM114-Status: GOOD (  12.63  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Make controller driver specify the MMIO register region length
for range checking of BHI or BHIe space. This can help validate
that offsets are in acceptable memory region or not and avoid any
boot-up issues due to BHI or BHIe memory accesses.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 include/linux/mhi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 944aa3a..ad53b24 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -293,6 +293,7 @@ struct mhi_controller_config {
  * @mhi_dev: MHI device instance for the controller
  * @debugfs_dentry: MHI controller debugfs directory
  * @regs: Base address of MHI MMIO register space (required)
+ * @reg_len: Length of the MHI MMIO region (required)
  * @bhi: Points to base of MHI BHI register space
  * @bhie: Points to base of MHI BHIe register space
  * @wake_db: MHI WAKE doorbell register address
@@ -375,6 +376,7 @@ struct mhi_controller {
 	struct mhi_device *mhi_dev;
 	struct dentry *debugfs_dentry;
 	void __iomem *regs;
+	size_t reg_len;
 	void __iomem *bhi;
 	void __iomem *bhie;
 	void __iomem *wake_db;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
