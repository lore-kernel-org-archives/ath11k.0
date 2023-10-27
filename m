Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A848EC25B47
	for <ath11k@archiver.kernel.org>; Fri, 27 Oct 2023 08:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UKXiRuDa4hOv/YUzkWMpd5/F9n8vlubBM15yJ2sF64=; b=ApW1EXaAx9kVY9
	x6SPn7LO09BWgK7jYHzfaSMQpJDRq7zrPQUD4DnOrvvp4MEW52geFmz9xBWZZAyCvNm+mePjQ5yVe
	HGLY+uDwt43HwRKpY8alLyu++56tF4lT+YhZ7mdtlB2EtyERihiho3X66AYX8RSee/fEmzoa6wgye
	U5jDoyW5E2OWI4DBqyi0PWy6hVsU+cv2T9GeXcQCHdwS/3s5P5QdAee+QBnu+gNYWfNoJB9GqedND
	8fu4wbTspKmXqBk33IDwfClEL7hJVKa4CxcKc8XdCdSe2elzaPL+QHPJFcQh3/55cAyOVwuJFx9zS
	9NpaHvHgKbyrLheh1+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwI9x-00FvmU-0v;
	Fri, 27 Oct 2023 08:25:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwI9u-00Fvll-1b
	for ath11k@lists.infradead.org;
	Fri, 27 Oct 2023 08:25:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD0696348A;
	Fri, 27 Oct 2023 08:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3D5C433C7;
	Fri, 27 Oct 2023 08:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698395132;
	bh=QfeOWdwE/IqoYB+mqr3chG0yS+T71+Nm/ssIY25qlkk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=iHzGHUBYp8J5jK0eJJXhQwe2tROaFdXhyaE9WXpL2QJaeNYhqGWrVX/Wuov+RF7Yz
	 jtasbTiM94yhN0ZwLm9vSB0XMYB01AiFWbi77ecTU98zIsIPsH3tuw1XQCczwHec74
	 VLg8Hq/oow8+z7plFR88BHej0Btb9VGwUaS4FxaVzKvSkWtluXiAql/7sjQzlzLhTD
	 EkMgPWxkjqPLWlipA+KLtEUxV/m2D+NlZ0bBCOvLG14G0z0tCxkbFKFxMNLRuHIndZ
	 30tlzT8KETaxluOYytLD0Xe9gn0y/7f/cmyOumwVOLNX4UDKJgp+jPZYiH/7EK42Ec
	 E/ovnyIHnxUdw==
From: Kalle Valo <kvalo@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
  ~postmarketos/upstreaming@lists.sr.ht,  phone-devel@vger.kernel.org,
  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: Defer on rproc_get failure
References: <20231027-ath11k-rproc-defer-v1-1-f6b6a812cd18@fairphone.com>
Date: Fri, 27 Oct 2023 11:25:28 +0300
In-Reply-To: <20231027-ath11k-rproc-defer-v1-1-f6b6a812cd18@fairphone.com>
	(Luca Weiss's message of "Fri, 27 Oct 2023 08:57:18 +0200")
Message-ID: <87lebowjyf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_012534_586235_4B158E30 
X-CRM114-Status: GOOD (  13.41  )
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

Luca Weiss <luca.weiss@fairphone.com> writes:

> If we already have gotten the rproc_handle (meaning the "qcom,rproc"
> property is defined in the devicetree), it's a valid state that the
> remoteproc module hasn't probed yet so we should defer probing instead
> of just failing to probe.
>
> This resolves a race condition when the ath11k driver probes and fails
> before the wpss remoteproc driver has probed, like the following:
>
>   [    6.232360] ath11k 17a10040.wifi: failed to get rproc
>   [    6.232366] ath11k 17a10040.wifi: failed to get rproc: -22
>   [    6.232478] ath11k: probe of 17a10040.wifi failed with error -22
>        ...
>   [    6.252415] remoteproc remoteproc2: 8a00000.remoteproc is available
>   [    6.252776] remoteproc remoteproc2: powering up 8a00000.remoteproc
>   [    6.252781] remoteproc remoteproc2: Booting fw image qcom/qcm6490/fairphone5/wpss.mdt, size 7188
>
> So, defer the probe if we hit that so we can retry later once the wpss
> remoteproc is available.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Did you test this on a real device? If yes, what ath11k hardware and firmware
did you use? We use Tested-on tag to document that:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatches#tested-on_tag

I can add that in the pending branch if you provide the info.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
