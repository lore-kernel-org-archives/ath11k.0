Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85581C25B79
	for <ath11k@archiver.kernel.org>; Mon, 20 May 2024 15:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUC3K0FopgN75/hKia48R2a+UbLSZcvDavuSlPC6Nzc=; b=ZOeWq+kHgopHn+gARaoyDyjwlD
	+aG1Y7O/Wk4tBYDb0S4Ocl2/Ya21GgA6B2EIhTnTWP80nBHxzicArpx3ACRMEL+563XWDoIARdQcn
	uryB3kAfMiUK+VQctmgJmD3nP8H7+BQggOgqUOfhghPt8gHIAxbKMgVAMHjsDU8KK2QCxGnWsdsck
	vHIoVmmC7ivllOnM0jzBX5I5q5OKE2IsUszAbAcuHhWNkJQ2WUPkHUKLH+tiHGodsdGjipwm1Lc7Z
	JjaZvE+hHRV2SfJtRU+MinVkFp9vAQpY/OrtWHOjUy2NCbkg/vauV7Gj1vITn61ZJtyheq1nEOKud
	oIfDu+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s952E-0000000ErM0-1gia;
	Mon, 20 May 2024 15:34:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s952B-0000000ErKK-0mK4
	for ath11k@lists.infradead.org;
	Mon, 20 May 2024 15:34:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6040D61A88;
	Mon, 20 May 2024 15:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164BAC32789;
	Mon, 20 May 2024 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716219282;
	bh=Iql17hNOkntU/TEX70CbOa8Oc4J0CcgtLaFX5lJfHiU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=XixFXTySIXU6MYB/gKzec07HMWEKKFYxZdSlTizu3cEEJboWHNEXIVMOH+N+I3nWd
	 EN8AWqbYFYeNOrOZzbWf3RRHO2414UsH+e5knfZgrGjcMuQP1fRXJyKs+CuB0DrbJr
	 6BnGqwdiFNFCIq54LQxiVXV7cIPAnhcGcwlFztw/9rdRrVkBr9F5yTM8dshmO/SsVe
	 PD8dZ/zeE5s36XgEsS0ZvS6l99vKpyXJW6+GBaeOdUSHfaUasUQltQMzJCYGaIRGKy
	 vq0rHaQq7vKo2XfDSnqPdQIWFkWOJQl9nl2WVal4dsjL5wtIbKU2ZCQ2HH/Ru3Zuc8
	 43VWsc7lRk0LQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  <regressions@lists.linux.dev>
Subject: Re: [PATCH v2] wifi: ath11k: move power type check to ASSOC stage
 when connecting to 6 GHz AP
References: <20240424064019.4847-1-quic_bqiang@quicinc.com>
	<87wmo0k71i.fsf@kernel.org>
	<3dc28f34-45cc-4e14-b9ea-1f7b78a6a591@quicinc.com>
Date: Mon, 20 May 2024 18:34:39 +0300
In-Reply-To: <3dc28f34-45cc-4e14-b9ea-1f7b78a6a591@quicinc.com> (Baochen
	Qiang's message of "Fri, 17 May 2024 10:14:08 +0800")
Message-ID: <87h6esebu8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_083443_357581_AD709BBE 
X-CRM114-Status: GOOD (  14.88  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 5/11/2024 5:54 PM, Kalle Valo wrote:
>> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>> 
>>> With commit bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
>>> ath11k fails to connect to 6 GHz AP.
>>>
>>> This is because currently ath11k checks AP's power type in
>>> ath11k_mac_op_assign_vif_chanctx() which would be called in AUTH stage.
>>> However with above commit power type is not available until ASSOC stage.
>>> As a result power type check fails and therefore connection fails.
>>>
>>> Fix this by moving power type check to ASSOC stage, also move regulatory
>>> rules update there because it depends on power type.
>>>
>>> Tested-on: WCN6855 hw2.0 PCI
>>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>>
>>> Fixes: bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
>>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> 
>> Oh, this fell through the cracks. Commit bc8a0fac8677 was introduced in
>> v6.9-rc1 so I should have sent this to v6.9 but it's too late now. I'll
>> need to queue this for v6.10 via wireless tree.
>> 
>> Adding the regression also to regzbot:
>> 
>> #regzbot introduced: bc8a0fac8677
>> #regzbot title: ath11k: connection to 6 GHz AP fails
>> 
> Hi Kalle, with an upcoming patch this regression is expected to be fixed:
>
> https://lore.kernel.org/all/20240506214536.310434f55f76.I6aca291ee06265e3f63e0f9024ba19a850b53a33@changeid/#t
>
> So here the ath11k fix would not be needed any more once above patch got merged.

What happens if we apply both patch 'wifi: ath11k: move power type check
to ASSOC stage when connecting to 6 GHz AP' and patchset 'wifi:
mac80211: build TPE handling'? In other words, do they conflict from
functionality point of view?

I ask because I suspect Johannes is planning to take patchset 'wifi:
mac80211: build TPE handling' to v6.11 but we should fix the ath11k bug
in v6.10.

> But I don't have time to test this, so suggest keeping it pending. We
> could drop it once above analysis got verified.

BTW for some this patch wasn't in the pending branch but it's there now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

