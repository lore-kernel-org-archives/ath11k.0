Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B00ECA553C
	for <ath11k@archiver.kernel.org>; Thu, 14 Sep 2023 13:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uso/jgHy8RhhmB/uesCIU0wfLutvWjdHTE2rqhO/tqk=; b=kSgq1kGJHoeMrZ
	bc6d+05xbtpauttcRZy3Zy3Uk09L0jNTmt92V9+xqFzdEosl/WYvwkacnQKJmxgK0hhFNu3dkqY7e
	iKY3x0Zk3Atn4wZUADz8sp2pxlaev3HBS4CkZTN5vgiPAnoDqCNlrDcYECrJ8HsUheJYObrpgIj/5
	l4QS36sID3rTu9309ZsHns9ALpOdj22pTVPdobhZGxYD6ccx3g71rI0rC2nuD1rJRHWD7LgyjBMmj
	TrIPAeDJbNQ879baYze5qgQCeslE8MiYdkDEbXj2+QNVda1q12LrCKJ5gksfL9svkUvQOmdrxeTgZ
	u5kHy+cQ21KuVRvNe3dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmEZ-008Qve-3B;
	Thu, 14 Sep 2023 13:18:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmEX-008Qur-0X
	for ath11k@lists.infradead.org;
	Thu, 14 Sep 2023 13:18:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7EC8DCE2693;
	Thu, 14 Sep 2023 13:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7DDC433C7;
	Thu, 14 Sep 2023 13:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694697489;
	bh=oRdTkO1Bg/J6QPqLOcvJSa1zSAhMOHyLWami5YtJwr4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=hh7lNoQ07hRSM49MuXmbmXOOkReaKt+F8pAZS6gPziDZMMC+NQUDMMkW6oxj6lW6v
	 KJUf45C5/2pIot22CPhpTzY8UnITh14sfz5rPk0MphnqP8H9gv30oumhk1BoF/SFvy
	 QGCikFHJHQnLL8q5gdHCXmhcGCx3fBeKnEVOsP4rMUqblCdJyaQqOLSiMzYhojicQM
	 gpL1lMealSNvB8XKFUCe+HkA1Werz3zbpU1OvIpC4mKW1nwltLPUz/BTOxTAvIDbhP
	 d5F014rkjOzPICJ6llg0T5eMCRKD8d+4GmmQIIlUGnN1KqdT1RYGJwVyv+C2gvY1FI
	 6cqA1Yw+a31mw==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <johannes@sipsolutions.net>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v6] wifi: cfg80211: save power spectral density(psd) of
 regulatory rule
References: <20230914082026.3709-1-quic_wgong@quicinc.com>
Date: Thu, 14 Sep 2023 16:18:06 +0300
In-Reply-To: <20230914082026.3709-1-quic_wgong@quicinc.com> (Wen Gong's
	message of "Thu, 14 Sep 2023 04:20:26 -0400")
Message-ID: <87bke4dhbl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_061813_400735_95D5090A 
X-CRM114-Status: GOOD (  10.52  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> 6 GHz regulatory domains introduces Power Spectral Density (PSD).
> The PSD value of the regulatory rule should be taken into effect
> for the ieee80211_channels falling into that particular regulatory
> rule. Save the values in the channel which has PSD value and add
> nl80211 attributes accordingly to handle it.
>
> Co-developed-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
> V6: change per johannes.
>    1. rebased to ath-202308030925
>    2. remove change in parse_reg_rule() which is for CRDA

It's a bit risky to use my ath.git master branch as the baseline for
cfg80211 and mac80211 patches, for example it doesn't have the latest
locking rework yet.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
