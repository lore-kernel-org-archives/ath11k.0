Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9ACC4332F
	for <ath11k@archiver.kernel.org>; Mon, 21 Nov 2022 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n6GhyZ+sxpje/0uFe1oPmhTeXS4CNLTfZ/3Je7d7gjE=; b=p/wvAGx0bjBcCa
	vRgtN9/xDHeLVvTbL+skF2ORnGneJpmZ/iLTI+Urdf8hTD5agMVaPUiDFFWZTyxR0N+G/Z5fI78S6
	wRc8vZjiSs73sgaP6XYg2kS2C7uqrLzJoPYB3Gv9pF29KgUp7UhZer90A3qkDo+/tV4tf0vGn0fZl
	jGijRe2OqSC6xDOwU1tTaoMFLeQiFYTy+S50vxfEJ8JsiRpuZd1RU4lSEXisyQeIEje7KNoxCOsjR
	mJLoPLFGTucoXmFNYbV0+Z4x21ElrLnfXf6kt2dmxBMeFkgId5Gg622p5aXAkHtOexjkjUnY9lSEo
	Joxpun4YytJ8VGUTa1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox9UM-00Ffq7-O0; Mon, 21 Nov 2022 16:17:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox9UK-00FfiU-AI
	for ath11k@lists.infradead.org; Mon, 21 Nov 2022 16:17:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 2ECE6CE1399;
	Mon, 21 Nov 2022 16:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A526EC433C1;
	Mon, 21 Nov 2022 16:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669047453;
	bh=yQGbbm63/8Za4tULD4tZDuctTenWp7KiB2LGcuQYF2c=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=b9JhLlNvcmpedn/Yyqyj/qQF+NVjOrVwJv7OIUtZNDli+ucNsoZ3TnPpIRlQCu1v6
	 ek7IlFTCSLmMdQSRrDRGLfoTBlu/jh/HRZ9+8F0XyIlbQCCjrnozS3Ogm+F+mlzhLw
	 hJnjWS/uPoEwZD6CtJrtaDqYl/CpKbyS+rxUo4aJ+PlWYbmAJXJPn+7Fp1WhTWf5pP
	 9pwhJbGEWP75wp1f29A08cwoTqNiX13IfVhNVO9ltwqC35ngY3MlWo2IGvsoF+aVOP
	 X/Ci4i+M34X1hHhju2hbqZCRn8gvy86paoaF5Si3xU1cpEVEE+0znqP37BepPGeipm
	 rVDEhmLFFryCw==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] Enable low power mode when WLAN is not active
References: <20221121110359.4652-1-quic_mpubbise@quicinc.com>
Date: Mon, 21 Nov 2022 18:17:30 +0200
In-Reply-To: <20221121110359.4652-1-quic_mpubbise@quicinc.com> (Manikanta
	Pubbisetty's message of "Mon, 21 Nov 2022 16:33:56 +0530")
Message-ID: <87h6ys8ep1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_081740_566342_99266CE8 
X-CRM114-Status: GOOD (  12.57  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> Currently, WLAN chip is powered once during driver probe and is kept
> ON (powered) always even when WLAN is not active; keeping the chip
> powered ON all the time will consume extra power which is not
> desirable for battery operated devices. Same is the case with non-WoW
> suspend, chip will not be put into low power mode when the system is
> suspended resulting in higher battery drain.
>
> Send QMI MODE OFF command to firmware during WiFi OFF to put device
> into low power mode.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
>
> Manikanta Pubbisetty (3):
>   ath11k: Fix double free issue during SRNG deinit
>   ath11k: Move hardware initialization logic to start()
>   ath11k: Enable low power mode when WLAN is not active

Nowadays we use "wifi:" prefix, but I can add it.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
