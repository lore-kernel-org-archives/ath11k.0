Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74ECC7EE43
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 14:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0vPd8YfCUheS4fApOPC7MjSdeXXlvhvoiVqXZHXmTYE=; b=vDmwh7cme6D5TM
	0mjX22z3MPZACCZ8ipu3utLG9MFhVp7w6sbras07Z5/y4dDBWWPRk9jvxk1svTvA/g8g40ebnJuDj
	dTOnAR+Z7FEcqx2uHWppLMvlmi7NdKtBI94R2erbjwf4NNoXeINHOYv9eztXYOZta0N0ou0BCs5cj
	lMpjcTPWIpAqw6X9eYWHFrnU5OFRFvdAa7TXtCv+W01sdRbJgUtKaZRZ5Uihs7jwgHmuT9TAnuHkC
	x3I4y8p2WWQOvYFGVodi6nI5Cw1Qg+x6uUT1GXc5TU0TlLd7u0p9C3SaNlFNT8TOQ4RGJHoxkiKBG
	sgERn3iTWuP+jUAyPGZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2l-00DFVf-1T;
	Fri, 09 Jun 2023 14:24:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2i-00DFUU-2b
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 14:24:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C65F612E3
	for <ath11k@lists.infradead.org>; Fri,  9 Jun 2023 14:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A02C433EF;
	Fri,  9 Jun 2023 14:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686320683;
	bh=GNcaM5RE6Sq/mNvgioG2yaYjxqAFOAEAMgRlZ6mH+B4=;
	h=From:To:Cc:Subject:Date:From;
	b=nSbMatYc+NKak8m3BJ4LvkSNWqUhCq2j+WuzWAMMLRaAyWliP/d3WZrQk+kU3cT+k
	 GNIfR3kPcDM815gBXWHl7uPbbSwnBcXuRtO+atSoPrbwpbKh48OCUkcGXilcfGSU2l
	 ha3kVv2uXv5tqkVJX+e9i1sEPri5YaWQTVYWvzRCyIDlU15oL2uhyETTmflPtyy/bM
	 yU+XRq64W83q0baR5SBTBxpx7iRaLj5Yhe0TpY8bnhsWthyUq3B/6TOZY0jtfAfvpF
	 qJauQogVPb0/RRypGFVskihfWXiZkuzYzHXpslXeI4o+NrjfpWLbel9vqxGG7AeiWy
	 MNxXGaznzxykg==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 00/15] wifi: ath11k: debug message improvements
Date: Fri,  9 Jun 2023 17:24:25 +0300
Message-Id: <20230609142440.24643-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_072444_881497_E2CC8A30 
X-CRM114-Status: UNSURE (   7.50  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Some improvements and cleanup to ath11k debug messages. Print debug
level automatically in kernel log messages.

Kalle Valo (15):
  wifi: ath11k: debug: remove unused ATH11K_DBG_ANY
  wifi: ath11k: print debug level in debug messages
  wifi: ath11k: remove manual mask names from debug messages
  wifi: ath11k: add WMI event debug messages
  wifi: ath11k: remove unsupported event handlers
  wifi: ath11k: wmi: cleanup error handling in
    ath11k_wmi_send_init_country_cmd()
  wifi: ath11k: wmi: use common error handling style
  wifi: ath11k: wmi: add unified command debug messages
  wifi: ath11k: pci: cleanup debug logging
  wifi: ath11k: dp: cleanup debug message
  wifi: ath11k: debug: use all upper case in ATH11k_DBG_HAL
  wifi: ath11k: hal: cleanup debug message
  wifi: ath11k: don't use %pK
  wifi: ath11k: htc: cleanup debug messages
  wifi: ath11k: debug: add ATH11K_DBG_CE

 drivers/net/wireless/ath/ath11k/ahb.c    |   4 +-
 drivers/net/wireless/ath/ath11k/ce.c     |   4 +-
 drivers/net/wireless/ath/ath11k/core.c   |  14 +-
 drivers/net/wireless/ath/ath11k/debug.c  |   2 +-
 drivers/net/wireless/ath/ath11k/debug.h  |  48 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c  |   8 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c  |  12 +-
 drivers/net/wireless/ath/ath11k/hal.c    |  10 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c |  24 +-
 drivers/net/wireless/ath/ath11k/htc.c    |  42 +-
 drivers/net/wireless/ath/ath11k/mac.c    | 110 ++---
 drivers/net/wireless/ath/ath11k/mhi.c    |   6 +-
 drivers/net/wireless/ath/ath11k/pci.c    |  22 +-
 drivers/net/wireless/ath/ath11k/pcic.c   |   6 +-
 drivers/net/wireless/ath/ath11k/peer.c   |   4 +-
 drivers/net/wireless/ath/ath11k/qmi.c    |  58 +--
 drivers/net/wireless/ath/ath11k/reg.c    |   4 +-
 drivers/net/wireless/ath/ath11k/wmi.c    | 562 +++++++++++++----------
 18 files changed, 544 insertions(+), 396 deletions(-)


base-commit: 3b3d60fff1f7ecd2966a2f4f9b20a80630b93682
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
