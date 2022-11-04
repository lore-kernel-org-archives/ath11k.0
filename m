Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32AEC4332F
	for <ath11k@archiver.kernel.org>; Fri,  4 Nov 2022 10:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqKfrL3IZhW6mQZh2LzETPF0czMPXsL8NutF7Vg/Xt4=; b=jMangqKl8LHZnx
	9DCyKV9wvEr2h8MVBKa0/uOarGdiuzcX43uegNOgHtLJVRySMDfpqUK1RWbYIdCmc6O2Ivz1yOOTD
	0pVrdafS4ao2FapeZIuvUrFfZIyEPR9VqirZCgsAxNBSWpuMtbn0kM7/2ggkOBhFHG4bteA8sBCby
	UyLw+lomWrxd8QiNzVVn3B+DIhxUowxjwJrth0S5JirhOTkHmcDN1IvqImm4rRoYjiIutyVsG5Ctd
	cQAYy961J8qmdg2pDG7Ty38mW7QmhB53rbT9zLUPf+VCiYA51Ga0pGPplHF8LL78pSxGCJEIwIeq0
	mbbvzzeeab7BXidwtRKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oquEd-003G06-F3; Fri, 04 Nov 2022 10:47:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oquES-003Fxa-BQ
	for ath11k@lists.infradead.org; Fri, 04 Nov 2022 10:47:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E0106214F;
	Fri,  4 Nov 2022 10:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24297C433D6;
	Fri,  4 Nov 2022 10:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667558846;
	bh=DWz46wrxY7QGNiIIHg0vhNtEyE79lpwGrqHDoC7UyUI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=YKzWjFCKKxCr+q9VzMHoXZ6cDcTlzFCUo3QEsEFMyxRMz7uWrLw14Nq6qcDBMesi7
	 kCWe14MmP8HW8obaJMBnO2LHBcRoRgN73FcPkDKo8Jgp9p15jMo3e4dSSLDAzyPt16
	 nm/hw2vxqAZLl2+rY46NBJSLbFyGctuah85V1Ui+OCWgz68MP0xx9hl/B3VBuEqNcC
	 APhOGJRfnBhOCxrzICqeGm1i5/QdEgm3BKwZIADi/Uc1cxl26MeymXaRrhLYYfDZ6x
	 ePoA6FOL611PIckOPZd3vVaH7HDlpvVuQ9UKlQTgt50H1wLwUhsMUuqx30WSDl1f1h
	 44BFNAWCzRfQg==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath11k: Trigger sta disconnect on hardware
 restart
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221104085403.11025-1-quic_youghand@quicinc.com>
References: <20221104085403.11025-1-quic_youghand@quicinc.com>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>,
 Youghandhar Chintala <quic_youghand@quicinc.com>,
 kernel test robot <lkp@intel.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166755883456.9892.7557940279708188243.kvalo@kernel.org>
Date: Fri,  4 Nov 2022 10:47:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_034728_496485_78C5637A 
X-CRM114-Status: GOOD (  13.23  )
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

Youghandhar Chintala <quic_youghand@quicinc.com> wrote:

> Currently after the hardware restart triggered from the driver, the
> station interface connection remains intact, since a disconnect trigger
> is not sent to userspace. This can lead to a problem in targets where
> the wifi mac sequence is added by the firmware.
> 
> After the target restart, its wifi mac sequence number gets reset to
> zero. Hence AP to which our device is connected will receive frames with
> a  wifi mac sequence number jump to the past, thereby resulting in the
> AP dropping all these frames, until the frame arrives with a wifi mac
> sequence number which AP was expecting.
> 
> To avoid such frame drops, its better to trigger a station disconnect
> upon target hardware restart which can be done with API
> ieee80211_reconfig_disconnect exposed to mac80211.
> 
> The other targets are not affected by this change, since the hardware
> params flag is not set.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This had a new warning:

drivers/net/wireless/ath/ath11k/mac.c:8056: Blank lines aren't necessary before a close brace '}'

I fixed it in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221104085403.11025-1-quic_youghand@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
