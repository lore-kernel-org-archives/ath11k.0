Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30E3C433EF
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:01:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7B3A60E9B
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7B3A60E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zgxCd4ckXGAGY6sxEpxdWNlnnPW6+1vLoSE0tPQCYgk=; b=O1wxYNZhKjG/vG
	mzgcSgfzLHPJaVqr63fnujG+TtKiTs7kRX8II39pJZSLHobnUOkfnmrqkj96vNIMloecI4h7hT9vq
	WevNnjyBORdGvLMBPscZX3qOPwvOBVDoqK/lk7Znlqk0pClmTlRx9Me6Dtf66g96rEDU1f6TDrbjU
	GvY/VyTpMT6GeDvESL7mhGtdt33cdi19TTn68vdp721Q8pbH2abHQyc0VtqGNMGSYUBk84N7hr7Qz
	hU0PXvZ8HuZZ9j5ZIfX/vhHxIzzI18s0JeBkFmHwcF9NFpQpLstivV1N1CKU6FrtgSz3SNEv1Vqop
	w/TK4qxq+wrealmNp7Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTi1S-00E1gs-UP; Fri, 24 Sep 2021 10:01:38 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTi1O-00E1fj-UX
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 10:01:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632477696; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=Jtm1YlKHDvpeMf3rbeFkR5QNvHJkqFfAZqi3HuZVxnY=;
 b=swvT0W1u4OQqlWulc0QpnFkdxkcLEJg1AJoOZwTwPFr52UTUYMVtUeh2fSxpv+yDbALPWdX6
 WDqE7PwPHB1uVD5TnBuBe5XdAXFqviK0zJpzs0cBUJ3eDXYjkehcFHcYyhxyyyAuhYhxQqNm
 rrqX8kyT9oY2vNMYF/Se7YOtgwU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 614da1ebc0393e3e1919d180 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 10:01:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5F95BC4360D; Fri, 24 Sep 2021 10:01:15 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A6317C4338F;
 Fri, 24 Sep 2021 10:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A6317C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v4 0/6] cfg80211/mac80211: Add support for 6GHZ STA for
 various modes : LPI, SP and VLP
Date: Fri, 24 Sep 2021 06:00:46 -0400
Message-Id: <20210924100052.32029-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_030136_791358_4FB84E4A 
X-CRM114-Status: GOOD (  10.66  )
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

v4:
    1. rebased to top commit id 9e263e193af7 kernel/git/jberg/mac80211-next.git
    2. add NULL check for "mac80211: use ieee802_11_parse_elems() to find ies instead of ieee80211_bss_get_ie()"
    3. remove the 3 patches which already upstream:
       "mac80211: parse transmit power envelope element"
       "ieee80211: add definition for transmit power envelope element"
       "ieee80211: add definition of regulatory info in 6 GHz operation information"

v3: change per comments of Johannes.
    1. add patch "mac80211: use ieee802_11_parse_elems() to find ies instead of ieee80211_bss_get_ie()"
    2. move nl80211_ap_reg_power to ieee80211
    3. change some comments, length check, stack big size variable...

v2: change per comments of johannes.
    including code style, code logic, patch merge, commit log...

It introduced some new concept:
power type of AP(STANDARD_POWER_AP, INDOOR_AP, VERY_LOW_POWER_AP)
power type of STATION(DEFAULT_CLIENT, SUBORDINATE_CLIENT)
power spectral density(psd)

This patchset for cfg80211/mac80211 is to add the definition of new
concept of 6G and add basic parse of IE(transmit power envelope
element) in beacon and save power spectral density(psd) reported
by lower-driver for 6G channel, the info will be passed to lower
driver when connecting to 6G AP.

Wen Gong (6):
  mac80211: add power type definition for 6 GHz
  mac80211: add parse regulatory info in 6 GHz operation information
  cfg80211: add definition for 6 GHz power spectral density(psd)
  cfg80211: save power spectral density(psd) of regulatory rule
  mac80211: use ieee802_11_parse_elems() to find ies instead of
    ieee80211_bss_get_ie()
  mac80211: save transmit power envelope element and power constraint

 include/linux/ieee80211.h    | 34 +++++++++++++++
 include/net/cfg80211.h       |  5 +++
 include/net/mac80211.h       |  8 ++++
 include/net/regulatory.h     |  1 +
 include/uapi/linux/nl80211.h |  2 +
 net/mac80211/mlme.c          | 82 +++++++++++++++++++++++++++++-------
 net/mac80211/util.c          | 13 ++++++
 net/wireless/reg.c           | 17 ++++++++
 8 files changed, 146 insertions(+), 16 deletions(-)


base-commit: 9e263e193af73d2509dc3102a680a11130f44e20
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
