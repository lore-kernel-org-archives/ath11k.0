Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3053C433EF
	for <ath11k@archiver.kernel.org>; Fri, 24 Dec 2021 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cMj55nI1XRHlhKRjTVteezOu9oABWudNf0xsBPrKeAo=; b=a+3fXZHwubm6cw
	J0s5JOdr8Bm4xNtTvQs0rhsG1EyAAeRRZYir1k3SOSv8Pn5Bsbzy3tEDOYDnX7UvaZgLCzNXPfNyt
	hhA9T+UotkTPpPIBMtfYVxWWvsoGQr8r2HsJ2xBldmGnlrlOA+PdhAxXeWmPUdqlteAfaD3xPHbXo
	+uFefAhaZHpmVlRKmi4F9btNRReNPLZf9g+vkxxKSPCFl+/egNcObY1zdNysrEa8e8FPBcKzodjLW
	SvAukNaFV49hd43qERHZXWOVH7LD8bmTIuL76UChdtuBXCmgXp1XG3B0jMaaViCyTz0Ac2uUwohd5
	Q44gXBEw1Zyh60SXA0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0gJv-00Dxkv-3g; Fri, 24 Dec 2021 08:52:59 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0gJs-00Dxju-DX
 for ath11k@lists.infradead.org; Fri, 24 Dec 2021 08:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640335976; x=1671871976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T6yczIZsdajMiqnGS9NhC5afIZkzDMJoJouZGNwCQuI=;
 b=KobWYiXg+io3EjFH/wveQdFTiTBw8QkqG/EVSVnPI+Iej1LIEod9L/DJ
 hxXdcBgl9rxgjyLW5HLwRItudB8nHQOX+COTWqXJUQAx9PuAiatw5yrXd
 2AFJ9Yv49GeI5YzbWEC5vDPyswGSFRDukNW1O9YtUXUjiePUqj0nIMt3B 8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Dec 2021 00:52:54 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2021 00:52:54 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 24 Dec 2021 00:52:54 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 24 Dec 2021 00:52:52 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2 00/15] ath11k: add support for 6 GHz station for various
 modes : LPI, SP and VLP
Date: Fri, 24 Dec 2021 03:52:21 -0500
Message-ID: <20211224085236.9064-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_005256_529124_DAC4C4E0 
X-CRM114-Status: UNSURE (   6.03  )
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

v2: 
   1. change some minor comments by Kalle.
   2. rebased to ath.git ath-202112220603

Depends on one patch:
[v5] cfg80211: save power spectral density(psd) of regulatory rule
https://patchwork.kernel.org/project/linux-wireless/patch/20210928085211.26186-1-wgong@codeaurora.org/

It introduced some new concept:
power type of AP(STANDARD_POWER_AP, INDOOR_AP, VERY_LOW_POWER_AP)
power type of STATION(DEFAULT_CLIENT, SUBORDINATE_CLIENT)
power spectral density(psd)

This patchset is to implement the new rules for 6 GHz band in
ath11k.

ath11k parsed the reg rules from new wmi event
WMI_REG_CHAN_LIST_CC_EXT_EVENTID and parse the
transmit power envelope element in beacon of AP
and then set new wmi cmd WMI_VDEV_SET_TPC_POWER_CMDID
to firmware when connect to 6G AP, also support backward
compatibility with firmware which not support new wmi
cmd WMI_VDEV_SET_TPC_POWER_CMDID.

Wen Gong (15):
  ath11k: add support for extended wmi service bit
  ath11k: Add support to parse new wmi event for 6 GHz regulatory
  ath11k: add support to select 6 GHz Regulatory type
  ath11k: allow only one interface up simultaneously for WCN6855
  ath11k: store cur_regulatory_info for each radio
  ath11k: update regulatory rules when interface added
  ath11k: update regulatory rules when connect to AP on 6 GHz band for
    station
  ath11k: save power spectral density(psd) of regulatory rule
  ath11k: add parse of transmit power envelope element
  ath11k: save max tx power in vdev start response event from firmware
  ath11k: fill parameters for vdev_set_tpc_power wmi command
  ath11k: add WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT service bit
  ath11k: discard BSS_CHANGED_TXPOWER when EXT_TPC_REG_SUPPORT for 6 GHz
  ath11k: add handler for WMI_VDEV_SET_TPC_POWER_CMDID
  ath11k: send TPC power to firmware for 6 GHz station

 drivers/net/wireless/ath/ath11k/core.c |   6 +
 drivers/net/wireless/ath/ath11k/core.h |  40 ++
 drivers/net/wireless/ath/ath11k/hw.c   |  17 +
 drivers/net/wireless/ath/ath11k/hw.h   |   5 +
 drivers/net/wireless/ath/ath11k/mac.c  | 539 ++++++++++++++++-
 drivers/net/wireless/ath/ath11k/mac.h  |   5 +-
 drivers/net/wireless/ath/ath11k/reg.c  | 105 +++-
 drivers/net/wireless/ath/ath11k/reg.h  |   6 +-
 drivers/net/wireless/ath/ath11k/wmi.c  | 799 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/wmi.h  | 219 ++++++-
 10 files changed, 1659 insertions(+), 82 deletions(-)


base-commit: e5da5e8c54e27d8fa86765cd733c1a05aee53ae9
prerequisite-patch-id: d0941cb1e08f82e9bd5feaf01b160807b4b0faa9
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
