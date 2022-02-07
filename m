Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D30C433F5
	for <ath11k@archiver.kernel.org>; Mon,  7 Feb 2022 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvXmqborqi3w8p7QorJ2iKcMNIytPOl9x4RXjBVEZ/k=; b=OS80QydQhdOATk
	qdelv8i1LjY9OqohZX2XgSchmfPZ1R407wwdrTbbYBlXT11PW1/5JXRl2FWMpnjwY1tq1McV7UWZ6
	mMhXW2Lp3EkkvAKstdMLmvGRVUJiku7DhlfqHty/sKCdGf9H5ci+WB4sgv7RymF7uNPyDy2KSrOD8
	0Kfv3dF7ZC8ThiU4eeNO/QeEWi7h4jFK3Xa608jn1tDo3qtyzB9d4JzFIJuEq8B9kCvlJj8PiamLb
	ohR70PyO07t3sa6UH/qOFYqMEgwpWwr7rCIWwnDEtjkc9Hk5mTeGILsRABhKIWQUDUQcmBtmnf7ec
	4ld4K1OlhvptObrWH5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH4fu-00AQ9T-0i; Mon, 07 Feb 2022 14:07:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH4fr-00AQ8k-Ep
 for ath11k@lists.infradead.org; Mon, 07 Feb 2022 14:07:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CE92CB8123D;
 Mon,  7 Feb 2022 14:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1AEC004E1;
 Mon,  7 Feb 2022 14:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644242840;
 bh=YIj8F7vEHjnUcDOoMnZx1TDJTkrwr4oLKo9lNOY3XmI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=NTpVrk3XHr40fqLepnZxlYg/3m1RIx9Mx1h1hJlOYDBqAaJbEqG8oM085F2iCMh1G
 efqOZbVXNBeA9sFfm0zo/j2cT4NnNLJmUTVk0UH74DrQeBz9XEtQrzM6uUxGUVO45Z
 9sSqcsJkuiWK6V36OjiIihkb3VPk9Te6DNxKNzXNbzzZK+gclbRodAD+W30c+RNBKw
 lN71uTE4CUwKGCVVqRfPYtiA6bHH2M1+cSb3nmx55yM+hvhCAWZNRkPsNKL+8V7tkI
 kFDuOGyxyw8yGos7WqM5/4kgL8l4LLHzaIo8aJC/ak/30nF9PHZlIfqMu2fSFLhhBm
 uB/Uyhl+Kebkw==
From: Kalle Valo <kvalo@kernel.org>
To: Alex David <flu0r1ne@flu0r1ne.net>
Cc: ath11k@lists.infradead.org
Subject: Re: [PATCH] Change the max number of active probe SSIDs to match
 registration
References: <YcRtS0oQyDNjCTQS@peregrine>
Date: Mon, 07 Feb 2022 16:07:17 +0200
In-Reply-To: <YcRtS0oQyDNjCTQS@peregrine> (Alex David's message of "Thu, 23
 Dec 2021 12:36:29 +0000")
Message-ID: <87o83ibwiy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_060723_660870_15407F08 
X-CRM114-Status: GOOD (  11.60  )
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

Alex David <flu0r1ne@flu0r1ne.net> writes:

> The maximum number of SSIDs in a for active probe requests is currently
> reported as 16 (WLAN_SCAN_PARAMS_MAX_SSID) when registering the driver.
> The scan_req_params structure only has the capacity to hold 10 SSIDs.
> This leads to a buffer overflow which can be triggered from wpa_supplicant
> in userspace. When copying the SSIDs into the scan_req_params structure in
> the ath11k_mac_op_hw_scan route, it can overwrite the extraie pointer.
>
> Signed-off-by: Alex David <flu0r1ne@flu0r1ne.net>

I missed this as this wasn't in patchwork. This is because you didn't CC
linux-wireless. Please see instructions here how to submit ath11k
patches:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatches

Please also add "ath11k:" prefix to the subject and a Tested-on tag.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
