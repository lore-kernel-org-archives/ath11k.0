Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AE3C433EF
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 09:49:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81C0D61ACE
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 09:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81C0D61ACE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aYEqUzcQkdUj2oA1JeKWgplU3e2pEM0qrvWIQxcjqKY=; b=2xc7MLvwb5weT7
	TtgGMvrGXIxOAYYgGQldjmPzVp2+E0cb8gmdNs6mcrByU1HrYb+AIyhDd68SlYA/ezQR9Swwa/MoE
	tHVN5npqimjKi2chpUU+p5o9MheHHuPGWZuJfax+Ivapr9Xmn2/DSGGMElcPV/ldciQbUZQmvH2mM
	BYizKq9rRWkwz1uohAg1npEgWb8wPt23XgD2j9ho9TDUaXZ4PZrybJ8T18U1n5iCGJVBk3jGhFedL
	qnymuXzxpbzZMsZnJcBn3pE/9rcBjMN8UI8s2Ia6euF3uQUohtquSMU+zuEZ1f64IlwPWQaGGiAvw
	aW2YFHUSVhqk0odMmykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mne39-007NBo-Dj; Thu, 18 Nov 2021 09:49:47 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mne36-007NBB-GU
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 09:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637228984; x=1668764984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wbjRCIJQaE3Scf4DiqQrfYifLF31muA6vchgbkQrHaw=;
 b=hHrByaCDtMyDXV6RDlKZt06Jw+ok6rrLTn5RGQjq7JLxQZ4RBJOvRDQV
 L8ZHJ1JOicr4qpus0iyifgvPabgQqeso3Rxd6TEJficTa1KIm3x7q6ibU
 1eJGcxdOG51O1J9tj+Ro93ohTDMGOTGHMaBY6KaoCZ0OFZuSKJoFULZFS U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Nov 2021 01:49:35 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 01:49:35 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 01:49:34 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 01:49:33 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2] ath11k: change to treat alpha code na as world wide
 regdomain
Date: Thu, 18 Nov 2021 04:48:48 -0500
Message-ID: <20211118094848.7776-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_014944_619147_F36DF54B 
X-CRM114-Status: UNSURE (   9.75  )
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

Some firmware versions for WCN6855 report the default regdomain with
alpha code "na" by default when load as a world wide regdomain, ath11k
should treat it as a world wide alpha code.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
v2: rebased to latest ath.git master ath-202111170737

 drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 614b2f6bcc8e..2e9fb87d8bf6 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5927,7 +5927,13 @@ static void ath11k_wmi_htc_tx_complete(struct ath11k_base *ab,
 
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
 
 static int ath11k_reg_chan_list_event(struct ath11k_base *ab, struct sk_buff *skb)

base-commit: 63ec871bc50a306aac550e2d85f697ca2d5f5deb
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
