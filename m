Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82C4C6FD18
	for <ath11k@archiver.kernel.org>; Wed, 19 Apr 2023 14:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIWw2w9R0DBgTNXCeje7c/DHEyo8Dbpo5KqVuJZ9bM8=; b=Rb6CNssVmwyX4L
	M1oJoZz3TypX861+hwZdW9Rgan5Zf5NrjAm+54BWwUWBz+aC5O7Nc8Phu3MDthoZ9T0ArBOGTZ1q/
	plCBDZjb78lHmQF+cdEYSupnbHPG5dCxNPO7p1x5/Kp30/6xdimeZKSOPV/5O45ST5bXKr5PVfnpV
	hz1MGj6JmQ3lZIlZb2LQNToq+0D+nu8jFzGhCehplVZbEyStL3/lAs2IslRZE8C1xTKIU+GNvCDYv
	6ULJbiLsgFMJzB1U7DDDd+7MWI7Ki5vNiF/0denoTLDMvOSSTJs1DqZtQg4u+uwU9x0hds23w67Ny
	CIU4bCYDPn4plkBvYGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8ih-005eSU-1L;
	Wed, 19 Apr 2023 14:23:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8ie-005eR1-1c
	for ath11k@lists.infradead.org;
	Wed, 19 Apr 2023 14:23:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 930F063FCB;
	Wed, 19 Apr 2023 14:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16924C433D2;
	Wed, 19 Apr 2023 14:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914215;
	bh=1nPx7fxMdalYxaScwWE123owRTOo0GOSqgX38SXhNnE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ALTnYTaNMagQ4CQe5AwWCjPzWyipmyR73zIwQ25NhzjIpgPTbIcCMceg99ts6TryX
	 u/ScZjw94jyjoK0HeR2TPAGw+p63JT2A/oftZcBUjdePgFDl098PUUxS136TaxdMQd
	 uVIhJXNYzlSNQg7K9pIxiRS/r7UP2FXyk4+2gpks7V7wv8f6780CBlpFtt9Fe8veNZ
	 qMK787giuUBddut2CekNnAgWtOfpWOva7ND1A0ZVptSmxOGXmTTSa/qZTNbj00+7DU
	 WLLALggSswVxC5ARiCTJEv3jkWf2BUnokB3I5BFFRm2oqnieK99fwyBIpIfDVas/qU
	 S+zNJGq/sbbxw==
MIME-Version: 1.0
Subject: Re: [PATCH V3 1/2] wifi: ath11k: fix tx status reporting in encap
 offload
 mode
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230403195738.25367-2-quic_pradeepc@quicinc.com>
References: <20230403195738.25367-2-quic_pradeepc@quicinc.com>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168191421217.18451.4017404228995663386.kvalo@kernel.org>
Date: Wed, 19 Apr 2023 14:23:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_072336_574028_CEFF1FF8 
X-CRM114-Status: UNSURE (   7.63  )
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

Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com> wrote:

> ieee80211_tx_status() treats packets in 802.11 frame format and
> tries to extract sta address from packet header. When tx encap
> offload is enabled, this becomes invalid operation. Hence, switch
> to using ieee80211_tx_status_ext() after filling in station
> address for handling both 802.11 and 802.3 frames.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

6257c702264c wifi: ath11k: fix tx status reporting in encap offload mode
2f0c9ac8362d wifi: ath11k: Fix incorrect update of radiotap fields

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230403195738.25367-2-quic_pradeepc@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
