Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0EFC761A6
	for <ath11k@archiver.kernel.org>; Mon,  3 Apr 2023 13:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61s0eogu51vEiJrQuMyM9/qcv9xU7cEY4rcGLrmyZ9Q=; b=S7quib1BsZxodA
	IEuK8v6BioaR08BOeuJTFQA1G+l5uX4UVnT+zYcpGflmIe/UviI5bFBCP4FKhv35T8+Kb9kD8Iv9M
	3iz45XiV5xurt68RR5vNL0QRvz+veyOihN0hEWepBDG1O9aZWYXSTE8/nsCZZ22RrPKzBCh80oKNL
	3vqhCnRs4YVkjF4SEfyRMw+SCavwlYkv0biqwTZL2KBk/7Nk+yuprz/F8pTImVDjcTrDKo9cy87Je
	W9P5CyaIn57xjYqAC4yGS2U5rZn3rh72hFVKFe7gMg8CQO/eCKJRHNo+9TPywRLb7yAj+WDqv5BM2
	2UfQNY8WiXIo0aKA8YCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjKZE-00FWCJ-0n;
	Mon, 03 Apr 2023 13:49:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjKZC-00FWBV-02
	for ath11k@lists.infradead.org;
	Mon, 03 Apr 2023 13:49:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9BB2C61B54
	for <ath11k@lists.infradead.org>; Mon,  3 Apr 2023 13:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51193C433D2;
	Mon,  3 Apr 2023 13:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680529789;
	bh=fT4/bhIvqUua9+hZVKY5XgpED0gkhvKtDxlKaYq7nYo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=NGt4ybHCzQHrjK1wT97EwT6LmTUmMpQXeasrII3G3kzNSyhNIWGa4LdJ7KXUQKZp+
	 dgsC5rFS1mNkCW0N7QdkSVM0EuqgPP+imOcvU3c0GLg+JlVFgm+w7+LtU1x0E9aRxA
	 YAib8+2V6rIKhMbi1lnF7EPWm5DuzOiqTJaSGUqj/+aaqNRLPxsIL98Kghbs5GBFPh
	 qfVL+g3l8iQ4cPpUHdKm3OULuSfFzPhTYX5H2kyh77gLWQ41sh5U/Ob2Os5hFyZgRR
	 5ZwkTYf76WTNa0WE8LfJpc/3FV5073kmhVRIZZh+uIvFi1Lluf+mkvzSdhhK7DDzsE
	 3bcFkBRLeld6A==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: reduce the MHI timeout to 20s
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230329162038.8637-1-kvalo@kernel.org>
References: <20230329162038.8637-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168052978643.12755.3479029977193961957.kvalo@kernel.org>
Date: Mon,  3 Apr 2023 13:49:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_064950_088267_7D43A5D6 
X-CRM114-Status: GOOD (  13.06  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Currently ath11k breaks after hibernation, the reason being that ath11k expects
> that the wireless device will have power during suspend and the firmware will
> continue running. But of course during hibernation the power from the device is
> cut off and firmware is not running when resuming, so ath11k will fail.
> 
> (The reason why ath11k needs the firmware running is the interaction between
> mac80211 and MHI stack, it's a long story and more info in the bugzilla report.)
> 
> In SUSE kernels the watchdog timeout is reduced from the default 120 to 60 seconds:
> 
> CONFIG_DPM_WATCHDOG_TIMEOUT=60
> 
> But as the ath11k MHI timeout is 90 seconds the kernel will crash before will
> ath11k will recover in resume callback. To avoid the crash reduce the MHI
> timeout to just 20 seconds.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=214649
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to wireless.git, thanks.

cf5fa3ca0552 wifi: ath11k: reduce the MHI timeout to 20s

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230329162038.8637-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
