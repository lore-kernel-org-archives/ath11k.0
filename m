Return-Path: <SRS0=wUnC=LJ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959A0C48BDF
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 22:44:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6122E61246
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 22:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6122E61246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mvZyhVou2iXxgDxxxrucP7uonq5wM3/KveKqWnVS2gI=; b=Ovd/OQbN9WKMm0
	aBfagfakszoU8KWKo+lRO12eUOLrrfANZEEC5CdT/hW1ZD5aXky6NnmAS+/p1YzIRGrDP276uYUnn
	JaMPuoijfcWkvdgwCv2BEONUB/McgeD8DjjcD9TeG+l/gW56oZM2vM9ba5TgVmakhNSMcE7zoMbXe
	i8W1xhIZsvgE9Q3ZfHHnlc34GCRC5aporsktkl6DkDixeXde61I8htJDsPWPcRGqzx5We1G/sQFoR
	3TNCok8KmLNe+SR8tgy1jATu4z80uB2+BCsXgZV9IcU5gVD35HUU0fzLDNZPKoGIVbWonC8xqnN35
	VyoLcGwO8gnLyix6xWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltHnV-003fEr-MP; Tue, 15 Jun 2021 22:44:41 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltGO8-0033qk-Qs
 for ath11k@lists.infradead.org; Tue, 15 Jun 2021 21:14:29 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623791664; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=2rvjQ6rET3dEL+36xoKue3CZ7wmAWfyY88c4OdpniRY=;
 b=d4xtOgB08R3oMiQUj4tWTtryOFZ6wbGMjn+2amspqjLJ81M8COc707d3S0MO8kfJX73hLrNb
 K/7Ji/HkE9tVAw8zSRRW31a3IppNtDAQeiw2maIepXbkbZ14vLuw8tHqapSJ51fMZIMUKAe/
 ysJ/zL+Kjc4+Eqp7u3ROp9uTjrc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60c9182fe27c0cc77fe0ca69 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 21:14:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5CF54C4323A; Tue, 15 Jun 2021 21:14:22 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-78-13-nat.elisa-mobile.fi
 [85.76.78.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C2176C433F1;
 Tue, 15 Jun 2021 21:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C2176C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 00/12] ath11k: optimizations in data path
Date: Wed, 16 Jun 2021 00:13:55 +0300
Message-Id: <20210615211407.92233-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_141424_982416_5CD9C324 
X-CRM114-Status: UNSURE (   8.94  )
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

This patchset covers optimizations in rx (first 7 patches)
and tx (remaining 5 patches) data path.

Running UDP DL/UL traffic on IPQ8074 5G radio showed an average 5-10%
improvement on a 4 core platform.

P Praneesh (12):
  ath11k: disable unused CE8 interrupts for ipq8074
  ath11k: allocate dst ring descriptors from cacheable memory
  ath11k: modify dp_rx desc access wrapper calls inline
  ath11k: avoid additional access to ath11k_hal_srng_dst_num_free
  ath11k: avoid active pdev check for each msdu
  ath11k: remove usage quota while processing rx packets
  ath11k: add branch predictors in process_rx
  ath11k: allocate HAL_WBM2SW_RELEASE ring from cacheable memory
  ath11k: remove mod operator in dst ring processing
  ath11k: avoid while loop in ring selection of tx completion interrupt
  ath11k: add branch predictors in dp_tx path
  ath11k: avoid unnecessary lock contention in tx_completion path

 drivers/net/wireless/ath/ath11k/ce.c    |   2 +-
 drivers/net/wireless/ath/ath11k/dp.c    |  45 +++++--
 drivers/net/wireless/ath/ath11k/dp.h    |   1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 205 ++++++++++++++++----------------
 drivers/net/wireless/ath/ath11k/dp_tx.c |  63 +++++-----
 drivers/net/wireless/ath/ath11k/hal.c   |  32 ++++-
 drivers/net/wireless/ath/ath11k/hal.h   |   1 +
 drivers/net/wireless/ath/ath11k/mac.c   |   2 +-
 8 files changed, 202 insertions(+), 149 deletions(-)

-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
