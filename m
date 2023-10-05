Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B83FE7B61F
	for <ath11k@archiver.kernel.org>; Thu,  5 Oct 2023 06:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTanAN1EVbgZJmR7OgQpvSTLAhBJASwUz3g6Fb4YPII=; b=hBl94XP7aPytm3
	Hr1Gn/8TdS7PSG+ehIH4IjUzpkYlsh6aenexKmaRANTA1cqz0/uqHtGtHoDv+VBdfQXClTzAxfXBu
	LATyK1g1zsR9NfgqP7367v9UP6uoiok5/wdFn5i4iLssGBGAmkt7Syi1SHdW9il9iiIHBvQHkFITO
	BP1KKXOqOzMaobxv2sbhG/hTmC0NbmZvICrKYtPmMZkj0nYM0efTn7KqBv+i82qoPHCXGOaCNxtLo
	lCrdFGBfXSAEz23gQOvWsyRVYTty5q+lQAVonVdOpL6IOlYerZyEAytVJHVMAm9wgWTm44r41bu2P
	7kIjsggy2shjVBkiu0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoHlu-001Vz0-1X;
	Thu, 05 Oct 2023 06:23:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoHlp-001Vxo-1J
	for ath11k@lists.infradead.org;
	Thu, 05 Oct 2023 06:23:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 09573CE1DE2;
	Thu,  5 Oct 2023 06:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA05C433A9;
	Thu,  5 Oct 2023 06:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696487012;
	bh=PW+4BzLpDF9zHyyfbmwr68+cskAVvPDqhBGD3+u9VWc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=YgH19h+i+TwaxJadJfRPK+U1pi0dgxhqdfDnV6X0LSAmdVLPYfd7vyN45KnFyStEP
	 lF8ld8rKP4MqKVu/k7HCv9xxg2HCfm8I6RwEG+FY1oB+tXvTqJ0Wvczu2EBzRIHNyH
	 gTm6zJsAkteUh+Glqfd9XPAO66Q+4TAfJ7IRigFRzvc+xStQ21cmFrzsFBIFWFlmsb
	 LCmyF8xWM+/PB2Qb+Inn6cthUS7H+mQOn2Ays833m6/WdASae/9u8NlM8CoNLzBLGT
	 yJquf39KbPf3vNxp9VVJm7r9l4dVPhcim/iMy8LzrBkr3gj2Bp15ZQgIe350pCFzaT
	 7JvMC9EwZlYJg==
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] wifi: ath11k: fix CAC running state during virtual
 interface start
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230912051857.2284-3-quic_adisi@quicinc.com>
References: <20230912051857.2284-3-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <johannes@sipsolutions.net>, "Aditya Kumar Singh" <quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169648700901.444191.6213111122304356892.kvalo@kernel.org>
Date: Thu,  5 Oct 2023 06:23:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_232337_626796_CD624C88 
X-CRM114-Status: GOOD (  10.73  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:

> Currently channel definition's primary channel's DFS CAC time
> as well as primary channel's state i.e usable are used to set
> the CAC_RUNNING flag for the ath11k radio structure. However,
> this is wrong since certain channel definition are possbile
> where primary channel may not be a DFS channel but, secondary
> channel is a DFS channel. For example - channel 36 with 160 MHz
> bandwidth.
> In such cases, the flag will not be set which is wrong.
> 
> Fix this issue by using cfg80211_chandef_dfs_usable() function
> from cfg80211 which return trues if at least one channel is in
> usable state.
> 
> While at it, modify the CAC running debug log message to print
> the CAC time as well in milli-seconds.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

69fcb5259056 wifi: ath11k: fix CAC running state during virtual interface start
77f1ee6fd8b6 wifi: ath11k: fix Tx power value during active CAC

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230912051857.2284-3-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
