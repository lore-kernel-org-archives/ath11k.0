Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79737C47422
	for <ath11k@archiver.kernel.org>; Fri, 26 Jan 2024 06:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x40ZDo5tZUCf8h+fkQ83ptCeoCgOEQRuWMLcbB8r5RA=; b=vY4qIjazjHwCgNGcncQ5JdavxA
	LP/9OaXcInPfzqmz2+rEwjz+Q7Izw5Jn/xLAekgWA60Ie6S17XPRYPqHL+CxdX66hy6knmPOsmjxI
	Rc2Eoa4boWC3xPgRYerGcau3r1nv2E5boj65hhv0ySvNs8wF7tFD1XMWqB4FHcVXONwlNN5rCanSx
	ojgUYwkr0PkyKJ6g3nToyRx5seP39x2P4mPS+vYeQwx1G5yQ7X5pr7wujsW21bxGueweBywfOEcmY
	wubtgHETxXfaamuN5HND+YmdjJIFRBQK2a15nkGwFq64JsZ4oEryiru77P4ArDJa119wGKGMvB8kc
	tq4hUuhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTFMq-00000003Cc4-3Hcb;
	Fri, 26 Jan 2024 06:07:08 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTFMo-00000003Cb1-3kzp
	for ath11k@lists.infradead.org;
	Fri, 26 Jan 2024 06:07:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7B667CE353C;
	Fri, 26 Jan 2024 06:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A746C433C7;
	Fri, 26 Jan 2024 06:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706249222;
	bh=Rwtxc+Dc2BLkxO+V8Dz2wt33cbpIubHKLZXOqbvU/G4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=FwdAebmFCuoCOLvnN7eL2WlUDnG2IU6NfUz7aMmzc+VL344iBSdgO9OgeTsY/ah8g
	 JKWGAhbT68sEAvyl+0h6gTDsi7w4JElnP1xsiWgbMSG2paHLLl4WqOZW56bWFFwFtI
	 z1656XLAhkje7rzyktPoIPbyvuwA4rOEQVDjjniOjcLMJwsZtt7FGxzbYCxOSfN9zP
	 dI4vwU7hkW5BT43UR9a3WTp3v2ZNj0BvtqnfAq9hzj4SWsfq3HtHWtvPH3cH+FTg41
	 8kchidonLm/1bsP/aCpiaVlZaqar3MNIIGSQpasLUuOPJK9ykQX8w1+lnAVU5g7JOr
	 iO9Y8EPH3ZBEg==
From: Kalle Valo <kvalo@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,  Greg KH
 <gregkh@linuxfoundation.org>,  Sasha Levin <sashal@kernel.org>,  Linux
 kernel regressions list <regressions@lists.linux.dev>,  LKML
 <linux-kernel@vger.kernel.org>,  netdev <netdev@vger.kernel.org>,
  Benjamin Berg <benjamin.berg@intel.com>,
    linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: Consider picking up "tpm: Enable hwrng only for Pluton on AMD
 CPUs" rather sooner than later
References: <3bfb5c07-664e-49cd-a470-635a36bcf806@leemhuis.info>
Date: Fri, 26 Jan 2024 08:06:58 +0200
In-Reply-To: <3bfb5c07-664e-49cd-a470-635a36bcf806@leemhuis.info> (Thorsten
	Leemhuis's message of "Fri, 26 Jan 2024 07:02:43 +0100")
Message-ID: <87mssszkzh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_220707_135500_B82B86A1 
X-CRM114-Status: UNSURE (   7.87  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

+ linux-wireless, ath11k

Thorsten Leemhuis <regressions@leemhuis.info> writes:

> Hi stable team, JFYI, yesterdays mainline commit 556857aa1d0855 ("wifi:
> ath11k: rely on mac80211 debugfs handling for vif") from Benjamin
> contains no stable tag, but a Fixes: tag for a 6.7 commit. So it guess
> you will pick it up anyway. Might be worth picking up rather sooner than
> later, as it fixes a regression that according to Kalle causes ath11k to
> crash during suspend:
> https://lore.kernel.org/all/874jfjiolh.fsf@kernel.org/
> https://bugzilla.kernel.org/show_bug.cgi?id=218364

Thanks. The subject doesn't match the body but I guess that's just a
copypaste error :)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

