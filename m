Return-Path: <SRS0=WqG4=HM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AB4C433DB
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:42:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B846064E32
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B846064E32
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlzfSo5/puCHIbHQ8+sMzfMFDV08sxX0BP6QH6ZJUDI=; b=uigWtOqrwUM1LqqvQmTS6Dg+kI
	X+BxN5GFOKTS5rKwAqp0PVrjkzpPLfVyBVLuxMolKscsTkMSHCKeGuSWzJnEKmRKyLdufVZ2brbXv
	/e6udguHEQpfesScZhGbypgIgaIZWb1bE6FGZp82RDEwauHo/77tLVO+LBeAm/rFPGJPzjF/PDcYQ
	7UvhEiUO5N/EohwYedYcKRYrXMh7elN5o7m62DFlvl+G5EML9FgnpAPpRCF43tsFb2Ko4Hx6jbkw8
	bMZkq8OUz5dcRpGcvTvPDKaP+JIJHjDmTfzIt14bWpJWxlVVM4gV3H6cM1Rt3NQLTXrudw4jHSorN
	1+02u0Bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9l51-0006nC-Rx; Wed, 10 Feb 2021 08:42:35 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9l4y-0006k6-BJ
 for ath11k@lists.infradead.org; Wed, 10 Feb 2021 08:42:34 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612946553; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=/y1H7m8tiDjR3yJ22JTzktykL76/exVvECpFNFsT0PE=;
 b=JBk2QTRQ85dYFX4xs7UvI+xirNzozfCxv7lef8JfiOyTvcPvEGJCxaDWvDdhbh/5SyZBjitc
 5pfSWEWmqJJgJsaemkj66FzJsXB7OBUjicfc11A221y7+Jbl7MDHef8asRXjLUMpkMZJfYPY
 FPOmXHDMhM/IGk9u9gppRy/dZeg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60239c758e43a988b7d12080 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 08:42:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7FDE7C43461; Wed, 10 Feb 2021 08:42:29 +0000 (UTC)
Received: from vnaralas-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F3EFC433C6;
 Wed, 10 Feb 2021 08:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8F3EFC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akolli@codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 03/11] ath11k: qmi: increase the number of fw segments
Date: Wed, 10 Feb 2021 14:12:02 +0530
Message-Id: <1612946530-28504-4-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
References: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_034233_516772_C0554FF6 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

QCN9074 firmware uses 20MB of HOST DDR memory, fw requests
the memory in segmnets of size 1MB/512KB/256KB.
Increase the number of fw memory segments to 52.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 7bad374cc23a..1797c3b59f48 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -23,7 +23,7 @@
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ8074	0x02
 #define ATH11K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
 #define ATH11K_QMI_RESP_LEN_MAX			8192
-#define ATH11K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	32
+#define ATH11K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	52
 #define ATH11K_QMI_CALDB_SIZE			0x480000
 #define ATH11K_QMI_BDF_EXT_STR_LENGTH		0x20
 
@@ -216,8 +216,8 @@ struct qmi_wlanfw_ind_register_resp_msg_v01 {
 	u64 fw_status;
 };
 
-#define QMI_WLANFW_REQUEST_MEM_IND_MSG_V01_MAX_LEN	1124
-#define QMI_WLANFW_RESPOND_MEM_REQ_MSG_V01_MAX_LEN	548
+#define QMI_WLANFW_REQUEST_MEM_IND_MSG_V01_MAX_LEN	1824
+#define QMI_WLANFW_RESPOND_MEM_REQ_MSG_V01_MAX_LEN	888
 #define QMI_WLANFW_RESPOND_MEM_RESP_MSG_V01_MAX_LEN	7
 #define QMI_WLANFW_REQUEST_MEM_IND_V01			0x0035
 #define QMI_WLANFW_RESPOND_MEM_REQ_V01			0x0036
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
