Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16043C43334
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 05:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XcfqNHJ87BJVax75hAqdG+KT64m4iRIq4Q77wekvaDg=; b=Qz3oQSZxXyzF0/
	HaYvSprGVfFjixEoEwHux/rxrY94+ClESLI/Hoq+FAqj09l8uqA9RdGtYJ5RvLEDLQf0BtCEx1TQX
	nkEnUKtzJNDmrnUTfaiEgjSZ6TZktrzcEMThNYYuNN9hhuFdlPBv8J3PSoBBDP4FjCN3xf5Bi5zSe
	eYcKk8Llhx+VUFTuAB4bTKChKcoSNLmJJiOofMDd30ZACcyCi861MtnPVN/efcbuvhMB5UYliIxfZ
	p1j1Cp5TCuvNzVpT5rbZZKL5T6Ue6umWzFloB/w5SKhgvV3T0FnKirptfNmZt3+6GKvc8kq7Eql47
	R92/KLvJ6HTWfCUCP8sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwzpq-005u4w-RP; Fri, 03 Jun 2022 05:26:58 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwzpn-005u48-Bl
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 05:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654234015; x=1685770015;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=zdDYBhK+04G5Dd6DBtMQpBl6Gq+biOkesGZwnFYBR5I=;
  b=OSygwMKhIYHvrlJfP8hnp1GQOQvnjAC6d2W9KtygDOdi87HRJw925Tdl
   p7z2K/zZWHpkrjeH8oTSCXmt2Rxk8kdcKsul4o3MUqu6WReYQD/VZoR5l
   ytxK/Cf/NYtTLYMhqtWUdS69V7O5QDv6WOJCLCl9HgpLMh+yZNdhPfzIl
   s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 02 Jun 2022 22:26:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 22:26:52 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 22:26:52 -0700
Received: from adisi-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 22:26:50 -0700
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Aditya Kumar Singh
	<quic_adisi@quicinc.com>
Subject: [PATCH v2 0/2] ath11k: add support for get_txpower mac ops
Date: Fri, 3 Jun 2022 10:56:34 +0530
Message-ID: <20220603052636.22854-1-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_222655_470490_68251D6C 
X-CRM114-Status: UNSURE (   9.42  )
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

Currently, driver does not support get_txpower mac ops because of which
cfg80211 returns vif->bss_conf.txpower to user space. bss_conf.txpower
gets its value from ieee80211_channel->max_reg_power. However, the final
txpower is dependent on few other parameters apart from max regulatory
supported power. It is the firmware which knows about all these parameters
and considers the minimum for each packet transmission.

Firmware reports the final tx power in firmware pdev stats which falls
under fw_stats. But currently, fw_stats is under debugfs.

Add support for get_txpower mac ops to get the tx power from firmware
leveraging fw_stats and return it accordingly.

Also, move fw_stats out of debugfs so that get_txpower mac ops can
function properly even when debugfs is disabled.

Aditya Kumar Singh (2):
  ath11k: move firmware stats out of debugfs
  ath11k: add get_txpower mac ops

---
v2: removed unnecessary line breaks and made debug logs more clear

---

 drivers/net/wireless/ath/ath11k/core.c    |  46 ++++++++
 drivers/net/wireless/ath/ath11k/core.h    |  12 +-
 drivers/net/wireless/ath/ath11k/debugfs.c | 137 +++++-----------------
 drivers/net/wireless/ath/ath11k/debugfs.h |   6 +-
 drivers/net/wireless/ath/ath11k/mac.c     |  92 +++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.c     |  48 +++++++-
 6 files changed, 229 insertions(+), 112 deletions(-)

-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
