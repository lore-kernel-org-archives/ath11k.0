Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFD4C433EF
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 08:46:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2FB560F35
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 08:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2FB560F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SkgaQHwdj6wu87NRWYwzMV/2ngtMIc0GLmmatQ0c8iM=; b=wnp2ejendlLy53
	12yDNXpn0cS3xeab8Yx56GQKl4wvcdo3jPHWq+3PLapDTuXalg5eT/+rM8g8/O0DpLFmFrd8wEcdk
	LudWlX002rKLGri+eFsqpazl45fVsoL8T56j8X9CdD5P054Wlj9I8X6sKnWV2oyzNaSCq+J5nBfz0
	IBhcL7OfzhL/Ef5UzvPsTJg1I5KGWsHthGusbgKMd9cSQETHSx6OdgmcPQ3VxWcknoq7lZHSutpSj
	IAOdeVXXu5XBVMVwayQv3+cmpplEi1o7q39+C7HfhYkLVR2I6ljl9C7HJkIFLLnSRxgmK35U5QcsO
	xf47t2mBVztaYjtKax0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZqwj-008OtC-S5; Mon, 11 Oct 2021 08:46:09 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZqwg-008OsY-PR
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 08:46:08 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633941967; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=xXp3i4v4/0wcSp9ku35sbISTjz7kXw9ox96r2zhWiXA=;
 b=BhrkwpT+sKKUvawX5fTbooF4jjV4pB8DfpjuBkOCttwtgWTwQ19lNRACMk8G71/Nznw+I0gK
 +RUiJzbzJn4s0WeArq/Vtp6pJD04LSJ1Jppug/0vu0//+hDLD0vkBMiqKTvvWf1eyERK5x+T
 NgjfcGFpnppnc7BsxrSG3uUSV+8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6163f9cd03355859c88bd74d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 08:46:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 261D4C4360D; Mon, 11 Oct 2021 08:46:05 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CB129C4338F;
 Mon, 11 Oct 2021 08:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CB129C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH] ath11k: change to treat alpha code na as world wide regdomain
Date: Mon, 11 Oct 2021 04:45:53 -0400
Message-Id: <20211011084553.30943-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_014607_562806_1CBDF0EE 
X-CRM114-Status: GOOD (  10.73  )
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

Some firmware versions for WCN6855 report the default regdomain with
alpha code "na" by default when load as a world wide regdomain, ath11k
should treat it as a world wide alpha code.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index a72c5695e0b1..4935cb7f1f49 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -6540,7 +6540,13 @@ static void ath11k_wmi_htc_tx_complete(struct ath11k_base *ab,
 
 static bool ath11k_reg_is_world_alpha(char *alpha)
 {
-	return alpha[0] == '0' && alpha[1] == '0';
+	if (alpha[0] == '0' && alpha[1] == '0')
+		return true;
+
+	if (alpha[0] == 'n' && alpha[1] == 'a')
+		return true;
+
+	return false;
 }
 
 static int ath11k_reg_11d_new_cc_event(struct ath11k_base *ab, struct sk_buff *skb)
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
