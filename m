Return-Path: <SRS0=2hxC=FW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD606C4361B
	for <ath11k@archiver.kernel.org>; Fri, 18 Dec 2020 17:46:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 666A323B51
	for <ath11k@archiver.kernel.org>; Fri, 18 Dec 2020 17:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 666A323B51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yqLhWHRzwtXaJ4R+c/GREpv0uTvph1Wg62iN9ET3F+Q=; b=IG2Vn1Qb66oo/w57aV6S+aLZui
	JrYFxeHSNwYO1EFDnTfwsGQymGIf9NfEfGxPgf92yOk9YRBDGDk2KSY6aQm7jYM2GM+3StHaQQnuj
	gh/yK4w7M7EdH8ooBsoTYIQkJy5iqDp3QriFIyBMO8IJUZOauCytB9xJjWOLUTnMcX5I3wpZuWhV5
	qoYl8QKeKJp5zcHAu9KSMV4Bufp5c2VHy4C8vmqFzbzk3GbROYaUxAPAA1eOUgtAfMME3lgX7Qj4+
	MfUkmbGXRGiqftp8ze5GHxbxVz3hTE4hOY15Yew3u5JClBF1sOzPmR/GMXTSlnOpONi6FUl1PUU8D
	jucfRCAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqJpF-0007du-F5; Fri, 18 Dec 2020 17:46:04 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqJLr-0003Ti-LC
 for ath11k@lists.infradead.org; Fri, 18 Dec 2020 17:15:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608311735; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=BqqRqWkwBQWTikMicbd6dhjnfIoCnTE40C7xTLxBxkM=;
 b=m6559sVO85T7G/jfoSk8ApCOo12eO6wr/skBvb1Os6P9jkwfNgrVXXmyJpeZKKVU2+sA+7Ny
 eGQqFDgzDr9PjaHzLh05Da8/XNs5JIdEu4orsr5/NKP49SQItEj2gE0B0V/0HtM7lVPO9OTH
 VRCSSVNqWA6L8dbyOAJ2gxMTfig=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fdcc8a6f5e9af65f899ff24 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 15:20:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A7F0CC433CA; Fri, 18 Dec 2020 15:20:04 +0000 (UTC)
Received: from periyasa-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: periyasa)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E1F99C433C6;
 Fri, 18 Dec 2020 15:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E1F99C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=periyasa@codeaurora.org
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH] ath11k: remove duplicate function declaration
Date: Fri, 18 Dec 2020 20:49:53 +0530
Message-Id: <1608304793-20612-1-git-send-email-periyasa@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_121544_686251_130B122A 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Removed the duplicated peer related function declaration
from core.h since those functions are already declared in peer.h

Founded in code review.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 799bf3d..9db375b 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -875,14 +875,6 @@ extern const struct service_to_pipe ath11k_target_service_to_ce_map_wlan_ipq6018
 extern const struct ce_pipe_config ath11k_target_ce_config_wlan_qca6390[];
 extern const struct service_to_pipe ath11k_target_service_to_ce_map_wlan_qca6390[];
 
-void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id);
-void ath11k_peer_map_event(struct ath11k_base *ab, u8 vdev_id, u16 peer_id,
-			   u8 *mac_addr, u16 ast_hash);
-struct ath11k_peer *ath11k_peer_find(struct ath11k_base *ab, int vdev_id,
-				     const u8 *addr);
-struct ath11k_peer *ath11k_peer_find_by_addr(struct ath11k_base *ab,
-					     const u8 *addr);
-struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab, int peer_id);
 int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab);
 int ath11k_core_pre_init(struct ath11k_base *ab);
 int ath11k_core_init(struct ath11k_base *ath11k);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
