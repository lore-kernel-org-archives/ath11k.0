Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46076C4332F
	for <ath11k@archiver.kernel.org>; Mon, 13 Nov 2023 15:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rKjAIz49Yew35svscRBRpXkVL9KDRUr8H/tc6hwNew=; b=RtPzU9jwRIDIcd
	nnBCdj9od5etd7J5y+BuBRAXY7UBA3BGYg2hZ1FySibEQjDdjwfl4FHzmjLAVR/7cJaENYMSQx688
	FVkEG42VHKjmbQteS0QRA47q+iqEeOlqu0Ys7aRHqjvWQJOKc7KctdCUzklc14+TKZKRyBjt9Ac/s
	TY+q8wvodBTHT+o24le0/erQ6FsSRBD0YXhHip4RTThRjlzE5YN+GoZnwRyxSAAABDWTENOJ4Ik+P
	zlCYwMyW4EYl8qg4hnGDBG2xqsRitFc03xZjjqz599PkWi6Jp/oomcPzFDRiL4ctFg5R/skL9moGQ
	3HlbAJdyNwMVfX/WsVpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Z0o-00EFdp-0G;
	Mon, 13 Nov 2023 15:38:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Z0l-00EFcl-0O
	for ath11k@lists.infradead.org;
	Mon, 13 Nov 2023 15:38:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7BD75CE16E9;
	Mon, 13 Nov 2023 15:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E4CC433C7;
	Mon, 13 Nov 2023 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699889880;
	bh=nodC5p6ug9A05wH2ElfMtDXiy9l8bsxSv4FLIQhdg+8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OVppq6+u/PyTFjBKZoEW1bZQdrZdfALGvpZuIevND49++UtW0H1PQBT8OCcDyj7bq
	 6T5Y+bxzkoh05KHmQJ9K+YPcnS5HwNo/MkXw/19RPzalc1SsXBa55IFnnS6utSwk4T
	 LWx1zxUxsF0cBMcy4y6XyFZhbTV54zaEZ0rHdSR3wwzcGF0qkYK7PLJVjRIQc58rGc
	 HBmGLRVyXR6LL7h0P4WKnCtSOsuf3xfPbR4Gyn34y4olTQX1rEXeDO4qpMxSHYJIJQ
	 4HbEF/CEXFjktmfTAOwNIada18f7cLpOQFSxkOuHmFoo6AMffAEDGJ3e2l51Ne9K7k
	 /GwrwlYSkmdLA==
From: Kalle Valo <kvalo@kernel.org>
To: "Luca Weiss" <luca.weiss@fairphone.com>
Cc: "Jeff Johnson" <quic_jjohnson@quicinc.com>,
  <~postmarketos/upstreaming@lists.sr.ht>,  <phone-devel@vger.kernel.org>,
  <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: Defer on rproc_get failure
References: <20231027-ath11k-rproc-defer-v1-1-f6b6a812cd18@fairphone.com>
	<87lebowjyf.fsf@kernel.org> <CWJ4ZLEZCKQC.2STOBNUU06B2P@fairphone.com>
Date: Mon, 13 Nov 2023 17:37:57 +0200
In-Reply-To: <CWJ4ZLEZCKQC.2STOBNUU06B2P@fairphone.com> (Luca Weiss's message
	of "Fri, 27 Oct 2023 12:07:09 +0200")
Message-ID: <87a5rhu0iy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_073803_503879_ABAE6030 
X-CRM114-Status: GOOD (  25.74  )
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

"Luca Weiss" <luca.weiss@fairphone.com> writes:

> On Fri Oct 27, 2023 at 10:25 AM CEST, Kalle Valo wrote:
>
>> Luca Weiss <luca.weiss@fairphone.com> writes:
>>
>> > If we already have gotten the rproc_handle (meaning the "qcom,rproc"
>> > property is defined in the devicetree), it's a valid state that the
>> > remoteproc module hasn't probed yet so we should defer probing instead
>> > of just failing to probe.
>> >
>> > This resolves a race condition when the ath11k driver probes and fails
>> > before the wpss remoteproc driver has probed, like the following:
>> >
>> >   [    6.232360] ath11k 17a10040.wifi: failed to get rproc
>> >   [    6.232366] ath11k 17a10040.wifi: failed to get rproc: -22
>> >   [    6.232478] ath11k: probe of 17a10040.wifi failed with error -22
>> >        ...
>> >   [    6.252415] remoteproc remoteproc2: 8a00000.remoteproc is available
>> >   [    6.252776] remoteproc remoteproc2: powering up 8a00000.remoteproc
>> >   [    6.252781] remoteproc remoteproc2: Booting fw image qcom/qcm6490/fairphone5/wpss.mdt, size 7188
>> >
>> > So, defer the probe if we hit that so we can retry later once the wpss
>> > remoteproc is available.
>> >
>> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>
>> Did you test this on a real device? If yes, what ath11k hardware and firmware
>> did you use? We use Tested-on tag to document that:
>>
>> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatches#tested-on_tag
>
> Hi,
>
> Yes I tested this on qcm6490-fairphone-fp5 including some extra patches
> for wpss-pas remoteproc support (nothing special, just adding it to the
> existing PAS driver) and wifi enablement in dts.

Nice, do you have a link to the patches or a git tree which has
everything? And how difficult would it be for me to run vanilla
kernel.org kernel (no vendor kernels or anything like that) on Fairphone
5? Any documentation available for that?

I'm asking because I don't have a test setup for WCN6750 right now. It
would be awesome if I could use Fairphone for testing :)

> I built this line from info from the dmesg, hope it's okay:
>
> Tested-on: wcn6750 hw1.0 AHB WLAN.MSL.1.0.1-01264-QCAMSLSWPLZ-1.37886.3

Thanks, I added that to the commit message.

> And thinking about it, a Fixes tag would also be appropriate for this
> patch. The code was moved to a different file in commit ba929d6fe31a
> ("ath11k: Remove rproc references from common core layer") but I think
> this tag should be correct.
>
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")

Ok, I added that as well.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
