Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFD6C433EF
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:27:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28CE061544
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28CE061544
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NqkYk6vEcOBgem+Zv3wsjUyWfNlvBSi24G2UC5UmFr0=; b=DvsHZ0w1WZP8fN
	ueA7LQzxh4hK0IwjGoZUMpk1Hknd4pM832Pl9uD5w3Y3snu1VqxpBc5Pl1W+Kl/2pm3V9BPDwG1py
	/j+PBSpRZBoEbWB0mn199rDs4XY1hN8vrH/AZgA2yvEXeiBwc1mrWglCv1dko9rRohBFPdWmpesl4
	pF4QDILbCzBeH0yxu33gdl5pcCPJ6g5naM16aris5n27dkwzs8+2xVTifqyms53MeFj/+H9XoX6VJ
	2nM/c9/0y7ZNsHdVZ81j1NFxhCwhwhhIkNq5Ob+/QhGTjGl0xGS0U404pnE2Df6KWOYjNTQzdMyCK
	Yv32BrPdaJSoeygOs6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFM7-003n5J-KL; Wed, 17 Nov 2021 07:27:43 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFM4-003n3X-0x
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 07:27:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637134059; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=hwDc6VXQecDCbbtqjpFiE+B2bvoB30ymVBFSC5L5fPk=;
 b=OrlOju+zjETRTsLLmXOsKUQvWABcHXJAYx0HkHCCOQyGpjsh58+uk/VMzAv5JDV8t74ewR4N
 CBBkjQYtahpPv2XXGjO6BX41nxBA7sPeHA6gC78GbQqsbwyseLh6osx3pGaJpd0dUW5Ca4E7
 i01VGwi/Bqdzf0dk5WhoJiE2dh4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6194aee9665450d43aecc1cb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 07:27:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 326B7C43617; Wed, 17 Nov 2021 07:27:37 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 95CB3C43460;
 Wed, 17 Nov 2021 07:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 95CB3C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix ETSI regd with weather radar overlap
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211112153116.1214421-1-sven@narfation.org>
References: <20211112153116.1214421-1-sven@narfation.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Sven Eckelmann <sven@narfation.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713405345.31320.10844437499755849817.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 07:27:37 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_232740_190315_DAAD9F01 
X-CRM114-Status: GOOD (  18.44  )
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

Sven Eckelmann <sven@narfation.org> wrote:

> Some ETSI countries have a small overlap in the wireless-regdb with an ETSI
> channel (5590-5650). A good example is Australia:
> 
>   country AU: DFS-ETSI
>         (2400 - 2483.5 @ 40), (36)
>         (5150 - 5250 @ 80), (23), NO-OUTDOOR, AUTO-BW
>         (5250 - 5350 @ 80), (20), NO-OUTDOOR, AUTO-BW, DFS
>         (5470 - 5600 @ 80), (27), DFS
>         (5650 - 5730 @ 80), (27), DFS
>         (5730 - 5850 @ 80), (36)
>         (57000 - 66000 @ 2160), (43), NO-OUTDOOR
> 
> If the firmware (or the BDF) is shipped with these rules then there is only
> a 10 MHz overlap with the weather radar:
> 
> * below: 5470 - 5590
> * weather radar: 5590 - 5600
> * above: (none for the rule "5470 - 5600 @ 80")
> 
> There are several wrong assumption in the ath11k code:
> 
> * there is always a valid range below the weather radar
>   (actually: there could be no range below the weather radar range OR range
>    could be smaller than 20 MHz)
> * intersected range in the weather radar range is valid
>   (actually: the range could be smaller than 20 MHz)
> * range above weather radar is either empty or valid
>   (actually: the range could be smaller than 20 MHz)
> 
> These wrong assumption will lead in this example to a rule
> 
>   (5590 - 5600 @ 20), (N/A, 27), (600000 ms), DFS, AUTO-BW
> 
> which is invalid according to is_valid_reg_rule() because the freq_diff is
> only 10 MHz but the max_bandwidth is set to 20 MHz. Which results in a
> rejection like:
> 
>   WARNING: at backports-20210222_001-4.4.60-b157d2276/net/wireless/reg.c:3984
>   [...]
>   Call trace:
>   [<ffffffbffc3d2e50>] reg_get_max_bandwidth+0x300/0x3a8 [cfg80211]
>   [<ffffffbffc3d3d0c>] regulatory_set_wiphy_regd_sync+0x3c/0x98 [cfg80211]
>   [<ffffffbffc651598>] ath11k_regd_update+0x1a8/0x210 [ath11k]
>   [<ffffffbffc652108>] ath11k_regd_update_work+0x18/0x20 [ath11k]
>   [<ffffffc0000a93e0>] process_one_work+0x1f8/0x340
>   [<ffffffc0000a9784>] worker_thread+0x25c/0x448
>   [<ffffffc0000aedc8>] kthread+0xd0/0xd8
>   [<ffffffc000085550>] ret_from_fork+0x10/0x40
>   ath11k c000000.wifi: failed to perform regd update : -22
>   Invalid regulatory domain detected
> 
> To avoid this, the algorithm has to be changed slightly. Instead of
> splitting a rule which overlaps with the weather radar range into 3 pieces
> and accepting the first two parts blindly, it must actually be checked for
> each piece whether it is a valid range. And only if it is valid, add it to
> the output array.
> 
> When these checks are in place, the processed rules for AU would end up as
> 
>   country AU: DFS-ETSI
>           (2400 - 2483 @ 40), (N/A, 36), (N/A)
>           (5150 - 5250 @ 80), (6, 23), (N/A), NO-OUTDOOR, AUTO-BW
>           (5250 - 5350 @ 80), (6, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
>           (5470 - 5590 @ 80), (6, 27), (0 ms), DFS, AUTO-BW
>           (5650 - 5730 @ 80), (6, 27), (0 ms), DFS, AUTO-BW
>           (5730 - 5850 @ 80), (6, 36), (N/A), AUTO-BW
> 
> and will be accepted by the wireless regulatory code.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

086c921a3540 ath11k: Fix ETSI regd with weather radar overlap

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211112153116.1214421-1-sven@narfation.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
