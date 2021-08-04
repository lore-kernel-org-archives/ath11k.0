Return-Path: <SRS0=Cifq=M3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CE1C4320A
	for <ath11k@archiver.kernel.org>; Wed,  4 Aug 2021 18:12:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA51760F35
	for <ath11k@archiver.kernel.org>; Wed,  4 Aug 2021 18:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA51760F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HzY3B8BIet6mlA6gfecNou3Xszt4txBjH791ghQ+6UE=; b=nTdRykslPFoPrX
	meUiUEvldirRiL1+f47wW4++uMrlEJxV0Zs/vPfRW5dftefLLJiVjSDR7k1arSynYFbS1+RgCFJ9D
	u33tLvIr9P+LFJ3aEwCaLUTC8030vDIqaIFAXQhRmOt+lTA+XGMjkkfOURXJzZeQkOrf/62CR6dEZ
	ccno10JoGhxvqVzrW/bWaGiOa3yOM4kL3BPidTXJG7dTLEFJuDTP4sMm3Eq2hxO62lpilZFS3ZfYh
	BOzn7EsZlKCt+uoKi6cCTnmsUXMHMZeIiDNjdvOkRdJDl5MtONAzTM1i/sfLCm+/PW/ll4dN970cX
	pSd3w5qrDHFi9idMUCSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBLNb-0078eH-WB; Wed, 04 Aug 2021 18:12:36 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBLNZ-0078dq-Tj
 for ath11k@lists.infradead.org; Wed, 04 Aug 2021 18:12:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628100753; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=BWdiYkAiGSM6BDwi0I+lmrjBqe8ZGMPFNU7wGl8me9A=;
 b=Bmr6yR3CjkHbjsQ9O1T258uqE+Ie8kqp78DiWsFPaSYKCoeKoIinCNv+xqUh/eBr4XvR3e3p
 JbmpWa+Lhrafc7fjJSfNXRBCDFAu29/SwR8wUPFcKJ+3BMCx6FyN0dAc5s+O+0eRNZQ5/naY
 H4en5YDmZZl7HS8xbpxt1O3lv08=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 610ad88b8caa8fb7f5906697 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 04 Aug 2021 18:12:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EAADEC43460; Wed,  4 Aug 2021 18:12:26 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-77-199-nat.elisa-mobile.fi
 [85.76.77.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B954C433D3;
 Wed,  4 Aug 2021 18:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B954C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Wen Gong <wgong@codeaurora.org>
Subject: [PATCH 0/3] ath11k: enable support of 6G band for WCN6855
Date: Wed,  4 Aug 2021 21:12:14 +0300
Message-Id: <20210804181217.88751-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_111234_147638_39BEA10C 
X-CRM114-Status: UNSURE (   8.48  )
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

From: Wen Gong <wgong@codeaurora.org>

This depends on the following patches:

Pradeep Kumar Chitrapu:
ath11k: add channel 2 into 6 GHz channel list
ath11k: fix packet drops due to incorrect 6 GHz freq value in rx status

Wen Gong (3):
  ath11k: re-enable ht_cap/vht_cap for 5G band for WCN6855
  ath11k: enable 6G channels for WCN6855
  ath11k: copy cap info of 6G band under WMI_HOST_WLAN_5G_CAP for WCN6855

 drivers/net/wireless/ath/ath11k/mac.c |   29 +++++++++++++++++++----------
 drivers/net/wireless/ath/ath11k/wmi.c |   22 +++++++++++-----------
 2 files changed, 30 insertions(+), 21 deletions(-)

-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
