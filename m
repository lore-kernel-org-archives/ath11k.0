Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB73C433FE
	for <ath11k@archiver.kernel.org>; Thu, 17 Feb 2022 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hIQ/OBtCtieFtzYoyOtx54FtbX5BzuTeQWwBAQSAxCk=; b=c/+FT+D+zyHCTg
	ljf59sAHm0Do/FFdtWcCCYBEYwDmA+lyzeYlO1AjQLL+QndRXwEEUFC7Qld6i7SUPFA7VNKQ1PLZ6
	t9enza+iSH2za8QW2RxalCJGDPfAYlY2dmrJ4XdvNL1tHIP69Ltae+jYarxVPH9j5d+iwSPVEr/8u
	lIiWMggeRgdqpNdzD7xpviP8ttW16ArHrmzkWiatT+nF7wpSFpBEwB8c9UITXMPxfzYMd4n+TM/j/
	Pl28aM0j15eEegUVYl9vFekMwZy7IsoIObpTD4xLq8I5/V/6xeWl3gNgbbtjrAbIBaQ2YDTwtYUeC
	E9RNDR1CgF7IzARy80ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKVU6-008elX-68; Thu, 17 Feb 2022 01:21:26 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKVU3-008ejg-59
 for ath11k@lists.infradead.org; Thu, 17 Feb 2022 01:21:24 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1645060881; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jmad550xJb8rdWeuXWI0Vd6FHhnAbQy2dhhVnu50hH0=;
 b=m/VEBIkbm+C0MXBxnY1XeFZhTuczcCmPfawKM6Xb7mHytW9inY0uUpM0foibyv3rt5Nm2Aj/
 +uLtXoFINPsrXgYQUpaiH9nKAZIkgtN/XI0DL66IUTqYNi6F9nsRJhaMSRe0uHJ5aOP7jgqV
 eKWb8dUAvHLBpoNFT6hR+PY1OCY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 620da31054b2901ff1ff34db (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Feb 2022 01:21:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6C6C7C4360D; Thu, 17 Feb 2022 01:21:20 +0000 (UTC)
Received: from pradeepc2-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pradeepc)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A316DC4338F;
 Thu, 17 Feb 2022 01:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A316DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH v10 0/3] ath11k: add HE radiotap header support
Date: Wed, 16 Feb 2022 17:21:09 -0800
Message-Id: <20220217012112.31211-1-pradeepc@codeaurora.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_172123_305094_793D0C10 
X-CRM114-Status: UNSURE (   7.51  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This series address review comments from previous revision:
https://patchwork.kernel.org/project/linux-wireless/list/?series=328291&state=%2A&archive=both

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01725-QCAHKSWPL_SILICONZ-1

changes in v10:
 - rebase

changes in v9:
 - maintain rate_info in local

changes in v8:
 - move ieee80211_tx_status_ext out of spin lock

changes in v7:
 - use generic radiotap HE fields from
	include/net/ieee80211_radiotap.h
 - fix converting gi and ltf enums to match nl80211 enums when
	updating radiotap headers.
 - fix sparse warnings

Pradeep Kumar Chitrapu (3):
  ath11k: switch to using ieee80211_tx_status_ext()
  ath11k: decode HE status tlv
  ath11k: translate HE status to radiotap format

 drivers/net/wireless/ath/ath11k/dp_rx.c    | 111 ++++-
 drivers/net/wireless/ath/ath11k/dp_tx.c    |  32 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h |   1 +
 drivers/net/wireless/ath/ath11k/hal_rx.c   | 471 ++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/hal_rx.h   | 135 +++++-
 5 files changed, 670 insertions(+), 80 deletions(-)

-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
