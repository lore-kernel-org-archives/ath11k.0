Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA79C433EF
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 08:27:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 361B4608FE
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 08:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 361B4608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPp3BXRNMv4XEXjBCXscCvvMQ244QoZUBCxujFcJyFI=; b=pNM67UE8mZ4kkm
	8igBuIYNIEZzYy0IQeRthnSNyJ3mNKvRwY1dQB+0c4SPlu/bGy1QM+kxotwmhWBI7+4mGSNa1hmT2
	wpvnwI7JqU5QI09K2Bhx4zh7OjlWg+omBxQqIkWsmCby2sxlh4m+2yaEFI1Gl3XNkPi+p3NxMxhE7
	5VgD+0fV7TDSR5tK9WrF9ct7t5tsq/wStEnHXzFpnwRmsAwwuntYuGff8uPOE2+2r9tfSX3GYkCCN
	vgS3HhDrlyYEl/EBgsKBcdJIV1dyS/5ZTMSbzCJjMy3DOh42DGCfUyO5TYFW6dbfZDwYJ+jOCQjjt
	aUMMWFjMUXdBHEU8vV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZqeQ-008JfS-Jp; Mon, 11 Oct 2021 08:27:14 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZqXv-008HDG-KF
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 08:20:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633940433; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=3HEjC3o5H197uchx0DHIbOwe/BfVPfIa34gkyxWFAOg=;
 b=O4CuhSTXTZRoBDSgG7JFwIyVSbCESsocd6+xN2QP1GFSyizMdBLuCggbz3TlHH1X2O9fJZPY
 LoiIwyRStTlBHUhkmZSJtV8rKW9gGyJus/Wjtp3yVjqj1+obsWhkaxNoNs5W3x64mWg2OztS
 NWYBW7oSMdpQotZ2TeWZ/1Ms+x8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6163f3c5ff0285fb0a842c60 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 08:20:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 41A22C43616; Mon, 11 Oct 2021 08:20:21 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C8461C4360C;
 Mon, 11 Oct 2021 08:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C8461C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH 1/3] ath11k: add ath11k_qmi_free_resource() for recovery
Date: Mon, 11 Oct 2021 04:19:36 -0400
Message-Id: <20211011081938.30327-2-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211011081938.30327-1-wgong@codeaurora.org>
References: <20211011081938.30327-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_012034_054193_FE210C86 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

ath11k_qmi_free_target_mem_chunk() and ath11k_qmi_m3_free() is static
in qmi.c, they are needed for recovery, export them in a new function.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 5 +++++
 drivers/net/wireless/ath/ath11k/qmi.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index b5e34d670715..1f474a10d1b0 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2811,3 +2811,8 @@ void ath11k_qmi_deinit_service(struct ath11k_base *ab)
 }
 EXPORT_SYMBOL(ath11k_qmi_deinit_service);
 
+void ath11k_qmi_free_resource(struct ath11k_base *ab)
+{
+	ath11k_qmi_free_target_mem_chunk(ab);
+	ath11k_qmi_m3_free(ab);
+}
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 3d5930330703..692e796ff839 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -471,5 +471,6 @@ void ath11k_qmi_event_work(struct work_struct *work);
 void ath11k_qmi_msg_recv_work(struct work_struct *work);
 void ath11k_qmi_deinit_service(struct ath11k_base *ab);
 int ath11k_qmi_init_service(struct ath11k_base *ab);
+void ath11k_qmi_free_resource(struct ath11k_base *ab);
 
 #endif
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
