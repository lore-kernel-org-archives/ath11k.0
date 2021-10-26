Return-Path: <SRS0=4fK3=PO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351B3C4332F
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 11:19:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F38FC60232
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 11:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F38FC60232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EKsbaXu+DzwlCshVfDbWsH9DL5ZHQxECQvnuwZ3WctM=; b=x3KjtTGdbfm7gU
	vwDzONdE1jBO6Q7LpASQnp1oln0ovo53rWeCHZr7QP0Y8+vM5ptkW420hrYAW9jwFK9DGMtq3W/UC
	iWLiNixTseM91IqM01tovwzUiUVBBtL4Iqf+DCgkcFNyqXYym81zH8i2CuVBJ3tuwkhs9QGGXjWTX
	MMnkuB27ONA2Oqht1vqCjYs7cL9ehuUq9jj1Owdk8fObay4UX86EHe6eD9tLhHkwyBRGf9XiK/ydR
	uBT/5XulpxnLa1vV810izPE1r5hJ7iPmY/MPsoGtwEq4CgyqLc9ekpm9H6y4LdvCl+MIleXuvxsS0
	gFWmExvBqry+wNdkdk7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfKUj-001cGo-Mi; Tue, 26 Oct 2021 11:19:53 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfKUg-001cEh-1G
 for ath11k@lists.infradead.org; Tue, 26 Oct 2021 11:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635247190; x=1666783190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IDJx14GduesSW3sMZhDa1eGb0NCSZpY2io/2eR8Eot4=;
 b=R1n0LZxZeFYdHHYEhO7F2p0MPGonh452HTYkW3nd3orBy4IP711gN5mJ
 wyvKx/u2R6ixLaBC70QZ5sN8M9QIvdtxDHty8juKGvKzTRzeeh4ADUT/c
 PSqvq15Af6ZqQlpNFoeFTwQKy6LXOl4AtM+DIvpF8SpdSXLbTdGexgJCv c=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 26 Oct 2021 04:19:48 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 04:19:48 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Tue, 26 Oct 2021 04:19:46 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 00/15] ath11k: add support for 6 GHz station for various modes
 : LPI, SP and VLP
Date: Tue, 26 Oct 2021 07:18:58 -0400
Message-ID: <20211026111913.7346-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_041950_140919_07A2B42C 
X-CRM114-Status: UNSURE (   8.47  )
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

It depends on the patches of mac80211/ieee80211/cfg80211
ad below links:

ieee80211: add definition of regulatory info in 6 GHz operation information
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a1ef61825469b874920f4afb889e1a92353680ff

ieee80211: add definition for transmit power envelope element
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ad31393b98e4addbc5f1ccc484bfbb8d07c92056

mac80211: parse transmit power envelope element
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b0345850ad770c5164bf6d4a0aa0c40ef2419cb0

mac80211: use ieee802_11_parse_elems() in ieee80211_prep_channel()
https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git/commit/?id=37123c3baaee4d6a189ad4abad804770d4a607e8

ieee80211: add power type definition for 6 GHz
https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git/commit/?id=405fca8a946168e71c04b82cc80727c3ea686e08

mac80211: add parse regulatory info in 6 GHz operation information
https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git/commit/?id=cb751b7a57e50d356ec8fc7712c245a05515e787

mac80211: save transmit power envelope element and power constraint
https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git/commit/?id=63214f02cff9ebd57be00e143de12107c66f5394

[v5] cfg80211: save power spectral density(psd) of regulatory rule
https://patchwork.kernel.org/project/linux-wireless/patch/20210928085211.26186-1-wgong@codeaurora.org/

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

 drivers/net/wireless/ath/ath11k/core.c |  10 +
 drivers/net/wireless/ath/ath11k/core.h |  57 ++
 drivers/net/wireless/ath/ath11k/hw.h   |   1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 551 ++++++++++++++++-
 drivers/net/wireless/ath/ath11k/mac.h  |   5 +-
 drivers/net/wireless/ath/ath11k/reg.c  |  99 ++-
 drivers/net/wireless/ath/ath11k/reg.h  |   6 +-
 drivers/net/wireless/ath/ath11k/wmi.c  | 796 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/wmi.h  | 217 ++++++-
 9 files changed, 1660 insertions(+), 82 deletions(-)

-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
