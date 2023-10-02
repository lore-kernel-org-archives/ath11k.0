Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9216AE743C3
	for <ath11k@archiver.kernel.org>; Mon,  2 Oct 2023 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erlJ7C0Dl1yw3pvhsnutO1hW6rCTNduIFBEGSZqHXQw=; b=jzNK7zzAJJnwPZ
	jnOBSR33msZuLCEMlYq3vvpmP8G50bwOmzfwgAF+dAaVzsIBomHMHWbM2VAQyFv1eNDkqT5Ho+79H
	rF1dGKcOkASCLUcyiRjSURb96mUAoswbdg9R9MT32TDE7GKoV0QDgSbppEPH2hypzk7k8gjAdK+Mu
	ov014QgmXwmc2OTdIygsUgMwyAj89xiGwT/87ahWG3Ry5tUY3jFsIT2Cp6ab66aIw4LqI/eSdPdJF
	E3vFOJB8K5u/JDoDpaZFe1yVAkhkWj3Ceo/nF+IHdqjciAd0n/K7OZg0Nq8r1U4YJC82Aw/S9sfxb
	oWrlWid9/ArxSY2t8J0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLX6-00D37a-1D;
	Mon, 02 Oct 2023 16:12:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLX3-00D378-2P
	for ath11k@lists.infradead.org;
	Mon, 02 Oct 2023 16:12:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5FC99B810D5;
	Mon,  2 Oct 2023 16:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949E4C433C7;
	Mon,  2 Oct 2023 16:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696263147;
	bh=hCn2OqcTzFqtqEAqQGkyNCHh5hZQMbM6wx1pLBkbcNA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=B/DJbAtO0VNuzlSnWjrblLfUVn6gZ2yvqAk2XsH+Qfn0YI5xvxT3UioDne8Pn7yc4
	 8bTtwQnWWcKFj/hD5FEni41XhlTh9j/KpNA7z6DHoEm/uLjb3TDexulo70UeHQbFma
	 AcPMQ5YLAWtKEcjL0ZQBk7k563Nyc3T9iC6CXnFr7HTdsbZ2sM08k2aMXSQyI2G/4K
	 dorsYkzDJNXtdsvLt610EPoXcY3fzsq5TypDwf9vvep88r1/KOK7NFxMBwDPdNm2ct
	 AvvpcPNPCjEeXj3UgpJv7D+ZN2pXLyRu1IGe5gRZCKPopzd5bZBbFkYyatkKt4D1Nx
	 R7jERPeZKSAnQ==
MIME-Version: 1.0
Subject: Re: wifi: ath12k: do not drop data frames from unassociated stations
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1689749074-14676-1-git-send-email-quic_haric@quicinc.com>
References: <1689749074-14676-1-git-send-email-quic_haric@quicinc.com>
To: Hari Chandrakanthan <quic_haric@quicinc.com>
Cc: <quic_kvalo@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>,
 Hari Chandrakanthan <quic_haric@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169626314465.3936351.82532246234260943.kvalo@kernel.org>
Date: Mon,  2 Oct 2023 16:12:26 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_091229_925609_46922A43 
X-CRM114-Status: GOOD (  12.51  )
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

Hari Chandrakanthan <quic_haric@quicinc.com> wrote:

> >From 'IEEE Std 802.11-2020 section 11.3.4.1':
> If STA A in an infrastructure BSS receives a Class 2 or Class 3 frame
> from STA B that is not authenticated with STA A
> (i.e., the state for STA B is State 1), STA A shall discard the frame.
> If the frame has an individual address in the Address 1 field,
> the MLME of STA A shall send a Deauthentication frame to STA B.
> 
> When data frames from unassociated stations are received by an AP,
> the AP is supposed to send a deauthentication/disassociation frame with
> reason code "Class 2 frame received from nonauthenticated STA" or
> "Class 3 frame received from nonassociated STA".
> 
> But ath12k AP doesn't send deauthentication/disassociation frames,
> when it receives data frames from unassociated stations.
> 
> The ath12k driver drops the data frames from unassociated
> station and the upper layer(mac80211/hostapd) is not aware of such event.
> Hence deauthentication/disassociation frame is not sent to that
> particular station by the AP.
> 
> To address this issue, allow the data frames from the
> unassociated stations to reach mac80211 so that mac80211 can send
> NL80211_CMD_UNEXPECTED_FRAME event to userspace(hostapd) and hostapd
> upon receiving the event will send the deauthentication/disassociation
> frame with proper reason code.
> 
> The data frame from unassociated stations gets dropped in mac80211.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1e55298a6394 wifi: ath12k: do not drop data frames from unassociated stations

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1689749074-14676-1-git-send-email-quic_haric@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
