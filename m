Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271C5C433EF
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 10:56:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE54A60FF2
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 10:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE54A60FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4twfd+cJfNawSkn24sNVkXc47N20ws2w/u/pR683Mew=; b=knNxP8bi8D3QXO
	0Ruxnus7QwupttBcCuakNx2JufAntKfv5jcmHQp5MdzjWkgc1kLKbuMKkWIAx2zuIUNFVCn+xkcnl
	/dm36WstOTBIrs3WNQyTl1oTMZc8Isz3fuNjgT1Lj9CbjySOF+i7qT3LREviChPWZjR23VjBT9oJw
	WlpWbqJqLa1v9B4mYqdkneke8DaHX0JbeXdnsWSWWB3v8qlD+UxIr3AyP5Z97IWI7dKTb0ZRpFoLN
	SCD/mrHl3UqdjMeCQW4vtXyL3Ony5PpnYmFB2GP84/lCPUjRZ9W37yj0tAPwg/6oaP072IEEGWNWN
	C4dknWMxXQz32hpRtiEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVAn1-006t1c-TT; Tue, 28 Sep 2021 10:56:47 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVAmy-006sp9-Bj
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 10:56:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632826605; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=kgc6bVZtUMzywqUnKIJwEJJLvR6lppnN1wOHpjT4trU=;
 b=nBZ9hnOArBzOvayCrYlizqpaQsJFaX5hdHC3v5oELfsdLFK51n0thzW5tl57z4QpT5YbDkvH
 NdiaugBKpgOpDrx8UsRB3GWn4WIF7A/K/eB6cJp19+omm8WjP7AyxI8u/ifoXYC3UUalegPy
 7IKNk5CXk1/w2fqFju4iqnwLfHo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6152f4ea3cc3a01f262d8f96 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 10:56:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5A616C4360C; Tue, 28 Sep 2021 10:56:42 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7B19DC4338F;
 Tue, 28 Sep 2021 10:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7B19DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add support for RX decapsulation offload
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210721204217.120572-1-jouni@codeaurora.org>
References: <20210721204217.120572-1-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Sriram R <srirrama@codeaurora.org>,
 Manikanta Pubbisetty <mpubbise@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928105642.5A616C4360C@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 10:56:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_035645_620076_8EA429C2 
X-CRM114-Status: GOOD (  13.37  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> Add support for rx decapsulation offload by advertising
> the support to mac80211 during registration. Also ensure
> the frames have the RX_FLAG_8023 flag set in decap offload
> frames before passing to mac80211.
> 
> Since the packets delivered to the driver are in 802.3 format, these
> can be sent to the network core with minimal processing in mac80211.
> This helps in releasing some CPU cycles in the host processor and
> thereby improving the performance.
> 
> Two exceptions are made before passing decap frames, one is
> for EAPOL packets since mac80211 8023 fast rx for the sta
> is set only after authorization, other case is for multicast
> packets to validate PN in mac80211. In both the cases the
> decap frames are converted to 80211 frame and sent to mac80211.
> 
> Ethernet decap can be enabled by using frame_mode modparam:
> 
> insmod ath11k frame_mode=2
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00844-QCAHKSWPL_SILICONZ-1 v2
> 
> Co-developed-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

2167fa606c0f ath11k: Add support for RX decapsulation offload

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210721204217.120572-1-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
