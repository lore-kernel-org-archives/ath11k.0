Return-Path: <SRS0=4fK3=PO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050AFC433EF
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 03:20:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C407A6103B
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 03:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C407A6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JJyg5MdvMNVO7cc5kmgGDRQSMwMLClyU9c6rrUOq+vA=; b=a/XdSgYJ5Dbc0+
	Api+E+tYbOAboQl74tE72Xl+F33iNg749bOEo+zVgFrWgnQtwfShZ2WBluarkEHd9rFjooRX5ctXZ
	Gl0tOirFvr7XhYNSpmvBoUaFntk06hMNOY4C14f9sOqpDaeZu2fl/nOZPxroN2DO4qEp1JcAUF+tB
	2B95PZK+1377mMkbOoLbioIsTY6YM8xouTW/5TQXILAsmiFdI9k/PtxZzLjRDIMlivR8eIO+zsED0
	gfJEFTIrE1/ENNspN71Or0gAxrrhLA48PkPhpqTTLHBRDM5vlwD/eNl6t93WilyQPwI4yUr9Y+c0b
	QPpXui2oIHfyfA5OS4HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfD0r-000X1b-Fi; Tue, 26 Oct 2021 03:20:33 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfD0o-000X1G-TD
 for ath11k@lists.infradead.org; Tue, 26 Oct 2021 03:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635218431; x=1666754431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cDBNzU4TDcXDmNYWMXU0YO9Z5zhiULQ9Lwb2BsKHu4M=;
 b=OD3JDezjM42d1kRSp/5qRPUUlA+kuA/wT9XHRYA5un3H7zbmU8vZrQvu
 kEG/GRSc0+f7HeyBHvuUq6rZXUuEhaOAY5Ou6ssQwyhMZOYzAz/GGgFnZ
 1Lo4HJX3UZFtGBvRpsZrotf0Mn37GXXCiiq1JqjEx2/f1IR6pvZAVOSJ2 M=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 20:20:31 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 20:20:30 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 25 Oct 2021 20:20:29 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: fix the value of msecs_to_jiffies in
 ath11k_debugfs_fw_stats_request
Date: Mon, 25 Oct 2021 23:20:14 -0400
Message-ID: <20211026032014.27010-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_202031_002113_1FB7F019 
X-CRM114-Status: UNSURE (   9.97  )
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

parameter of msecs_to_jiffies should be (3 * 1000) instead of (3 * HZ)

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index b022365464c2..07409eb44f0f 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -200,7 +200,7 @@ static int ath11k_debugfs_fw_stats_request(struct ath11k *ar,
 	 * received 'update stats' event, we keep a 3 seconds timeout in case,
 	 * fw_stats_done is not marked yet
 	 */
-	timeout = jiffies + msecs_to_jiffies(3 * HZ);
+	timeout = jiffies + msecs_to_jiffies(3 * 1000);
 
 	ath11k_debugfs_fw_stats_reset(ar);
 
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
