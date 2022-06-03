Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D27DC433EF
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KRCw1XrikwZFYY/WCvXCW75VPBKUPlc5xr08HphDytM=; b=KGgHKTPDFo4LpQ
	R89UiuJ44nJW9s/xSZuiIs9/nBsrA6XVeneQ+1iFBlXW9k6T0O4f8YRsfXrUGhK1uxIclGYojdvjQ
	3kO4z15uXy08nAydfv7T6Q2/NgKYIgADa6+v3kuHsOjzH2vvH9hbyE9IukQkSH/HSSHfH0doMFTvJ
	Td7sfvq8iKJSx3G5xnpbgjyvmHoI9PyDjH3r/r7D0jBxPJ98e++7hk+sMqqjLUjAhlVUMSnTbnJbg
	DWh9tmaeJc6XRtZ6/0vQTH0A1KCmm+L6lJ2zM7c+d24x9DQ7ZHs2IGbeuPfsuUziN8vmhaf3jJbil
	0HPSs6SXHJsZsasz86fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2fn-006eoB-OF; Fri, 03 Jun 2022 08:28:47 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2fk-006em2-Pp
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 08:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654244924; x=1685780924;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=avJpal9naLF92RUkm26se4++uNEjib8i82kLVB/GrqI=;
  b=XNxwTp1WDMWfpguwYoqh0T4I7ZKSjgXC52cboEYkUOI9qtgmjODzYHNc
   y3ElLblhIs+q3vadSZnKI1MK551VAkem2YpU1iPO8jiRIGb95R6D/BTki
   88adBrTkJlJ7UzEYqSSiUFuSfwOWLUQMhDWgJs9r6JGMzmOUTUILjJgVE
   Q=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Jun 2022 01:28:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 01:28:39 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 3 Jun 2022 01:28:38 -0700
Received: from adisi-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 3 Jun 2022 01:28:36 -0700
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Aditya Kumar Singh
	<quic_adisi@quicinc.com>
Subject: [PATCH v3 0/2] ath11k: add support for get_txpower mac ops
Date: Fri, 3 Jun 2022 13:58:12 +0530
Message-ID: <20220603082814.31466-1-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_012844_964853_A6DE79D8 
X-CRM114-Status: UNSURE (   9.33  )
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
v3: fixed warnings related to blank lines

v2: removed unnecessary line breaks and made debug logs more clear

---
 drivers/net/wireless/ath/ath11k/core.c    |  46 +++++++
 drivers/net/wireless/ath/ath11k/core.h    |  12 +-
 drivers/net/wireless/ath/ath11k/debugfs.c | 139 +++++-----------------
 drivers/net/wireless/ath/ath11k/debugfs.h |   6 +-
 drivers/net/wireless/ath/ath11k/mac.c     |  92 ++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.c     |  48 +++++++-
 6 files changed, 229 insertions(+), 114 deletions(-)

-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
