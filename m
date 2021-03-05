Return-Path: <SRS0=UBD8=ID=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C4DC433DB
	for <ath11k@archiver.kernel.org>; Fri,  5 Mar 2021 23:04:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E342B65056
	for <ath11k@archiver.kernel.org>; Fri,  5 Mar 2021 23:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E342B65056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ag3ODpNII8kr54EUoU6WFc1GuNv09ZD1f4YONa/lbhU=; b=Ul8ZquFzj2l5ohb+VkVKCujEQy
	7hu1EnJGtrFF7xEY2C64Q2b+YVhTZDQOv0uzBaesp7VwMRqRnblhTOt4ohaMeXPrtHTNhPH62fClS
	xlnatTtGqD9lnQxtdHm+QqM1lXnxi8PY4yXjrNg+Dgvy0DMLsACk8lBZJqwp9GNYbfnPWnAfgmDeF
	agHnXUw+I460q1z6INe4Gfpwt8R62MUKpe4k8yaopzJ6toml/lTfVLStTnr5jXFewsqJibJIMb38J
	N0+8cM0rj6Fm9nDwj3VAC7kvtFb6vij02pgHXJCrj+nlTu5W35apjW6RW7Qg5G4jfXxy+DCKJqGKC
	pXbZUByw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIJUK-00H0Eg-ES; Fri, 05 Mar 2021 23:04:04 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIJU8-00H0CZ-7u
 for ath11k@lists.infradead.org; Fri, 05 Mar 2021 23:04:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614985427; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=BSalNBIRHjU0vmonfDMN/+cONgPuMS/tjoio871XFik=;
 b=pXKDwKUmcPWzSNyFrcil7QcyzNQ/Q1lFFI+oLby/M7+8rQDBifs6/BTGDY4BN5Rv0WdnKH3b
 zXj70+hY5PjnO4Ov/q4HaxiSnvlEackQfJ1fF3aAVhBvkUxntghuF9zUipLCddSmBTswAFU5
 zvTyQyd3/J8+Cudl0NtCti2M570=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6042b8d160050cf4d0727d4e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 23:03:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 76C65C43462; Fri,  5 Mar 2021 23:03:45 +0000 (UTC)
Received: from pradeepc2-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pradeepc)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CA139C433CA;
 Fri,  5 Mar 2021 23:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CA139C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=pradeepc@codeaurora.org
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH v7 0/3] ath11k: add HE radiotap header support
Date: Fri,  5 Mar 2021 15:03:34 -0800
Message-Id: <20210305230337.23047-1-pradeepc@codeaurora.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_230357_714893_0623741F 
X-CRM114-Status: UNSURE (   8.32  )
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

 drivers/net/wireless/ath/ath11k/dp_rx.c    | 114 ++++-
 drivers/net/wireless/ath/ath11k/dp_tx.c    |  26 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h |   1 +
 drivers/net/wireless/ath/ath11k/hal_rx.c   | 470 ++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/hal_rx.h   | 135 +++++-
 5 files changed, 663 insertions(+), 83 deletions(-)

-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
