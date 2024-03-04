Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F17FC48BF6
	for <ath11k@archiver.kernel.org>; Mon,  4 Mar 2024 05:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyLi8+SmSre8SLNOigrTqCqxHxWeA+jhwdAxcyOndLM=; b=l31q/bedZbYsXStDk7TnPDyy6v
	y8yagOMXof5mZ/rSBMjnjpUJVK4URLvVLGYjemushIuHrosAcz+EBW4b33+aVKx/q78eOQSoMDCr2
	EmBZLpA0mMZrqoYBWLD0vUCaTawaDQYW3xYyJN5YbxfUIVhyPn5e4Hb6vIIJno6jWryZPrFrpHH5C
	fAEgiQVzZske8mX1n7gTFvAlVxnfQ5aUcLBVWqAJK/eBgYQCTwrpTiQ1qR9blePjjBA2eOhmM5yzN
	jDJl5/8A8/FUqsY6gm5A60IrROH8MW7Zy78oPEbGhheMOTitymT5pEHDpfBjJrEPCXb2pEM2rcPDv
	vd335oXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh193-00000007hne-0nfO;
	Mon, 04 Mar 2024 05:45:49 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh190-00000007hms-12jV
	for ath11k@lists.infradead.org;
	Mon, 04 Mar 2024 05:45:47 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6e5760eeb7aso3316021b3a.1
        for <ath11k@lists.infradead.org>; Sun, 03 Mar 2024 21:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709531144; x=1710135944; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nyLi8+SmSre8SLNOigrTqCqxHxWeA+jhwdAxcyOndLM=;
        b=KvdJPPQsymh4qKNwzIqtD7xtxQG+ZerRl2t55OWj4H+L/NpOQldQQ06Is4MyAKA+/e
         eTEbpsTfU86xZwg5m+1LE5b/ZBVsGawrC2DsToQYRzF6r6YXADy6xafbDmECjs3Lt11x
         QwDAFvc4VhgcG+f2jqOW904zrMR8pZBxvU6K8AuPQvxqUvq4hqnWbKQcwhnyWhGIrsp7
         j0FJgtXxVw0vobHg0tj3Mzg158Mw9iv+wqZNkiRzkpbP1fN3sZDtutGNZQvIPx1Km9F9
         Ebc7Jc99zBgJ5Gc22x1426LnQs3M5JFE1TKmyN7mgTA2zkJyVAP5ZD+EHg4eMI6jJDrq
         V0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709531144; x=1710135944;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nyLi8+SmSre8SLNOigrTqCqxHxWeA+jhwdAxcyOndLM=;
        b=wDz0kGXR87ymdvP/0qSC00vqRECtUz/h2jwvZxP9kINgyLSdtPRU9YnuLOu7eBLdY2
         KbheyvHfcENx3vJiTDpi19rigaAg38BW/99cZg3BSo1bHNn5r+P5FmA7UXEmexMUwhOn
         b1cJgBN9L35QtmlHPwgzAOtBkbMYEaIJU4vNl1ZOtmcZGwlGtrAfRgC7Tn2B6yaEjoXm
         7iTUgnVoyDtzP+waxX//kC3lg1FMuManT/XxlSStOPFNe27gBlWAhWhYnenjvz+KUHFC
         5cfLG0e7vX+QqJfoiKkyFBckMeS8L/8SlYvzEesPYRUd7vWLEiEDs0/1IiWsclWQ1Iyt
         kVhQ==
X-Gm-Message-State: AOJu0YxKgqspSshjilvBj0qLAJHUvWJ6xhFBx3YeyrJ5HpJIAUshlQy3
	DHrhqMVLiU08hLvPF80Og1DNGAvD/xuPOO3OyLBHsJlG6kPCfTUtyM3pGvYjWQ==
X-Google-Smtp-Source: AGHT+IEb05hPzFeBZje+h75WEQQpiRcBp848ihooFqT4tnzoz+8bG6TqQJGYpSZro6DP/2UhVDknig==
X-Received: by 2002:a05:6a00:2fd1:b0:6e5:d3b9:2d06 with SMTP id fn17-20020a056a002fd100b006e5d3b92d06mr7157632pfb.21.1709531144470;
        Sun, 03 Mar 2024 21:45:44 -0800 (PST)
Received: from thinkpad ([117.207.30.163])
        by smtp.gmail.com with ESMTPSA id q4-20020a63e944000000b005dc1edf7371sm6746085pgj.9.2024.03.03.21.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 21:45:44 -0800 (PST)
Date: Mon, 4 Mar 2024 11:15:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org
Subject: Re: [PATCH v5 0/3] wifi: ath11k: hibernation support
Message-ID: <20240304054536.GA2647@thinkpad>
References: <20240304021554.77782-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240304021554.77782-1-quic_bqiang@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240303_214546_331865_C5ED1F03 
X-CRM114-Status: GOOD (  33.94  )
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

On Mon, Mar 04, 2024 at 10:15:51AM +0800, Baochen Qiang wrote:
> Currently in ath11k we keep the firmware running on the WLAN device when the
> network interface (wlan0) is down. The problem is that this will break
> hibernation, obviously the firmware can't be running after the whole system is
> powered off. To power down the ath11k firmware for suspend/hibernation some
> changes both in MHI subsystem and ath11k are needed.
> 
> This patchset fixes a longstanding bug report about broken hibernation support:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=214649
> 
> There already is an RFC version which has been tested by multiple users with
> positive results:
> 
> https://patchwork.kernel.org/project/linux-wireless/cover/20231127162022.518834-1-kvalo@kernel.org/
> 
> Basically the RFC version adds two APIs to MHI stack: with the first one ath11k
> is able to keep MHI devices when going to suspend/hibernation, getting us rid of
> the probe deferral issue when resume back. while with the second one ath11k could
> manually prepare/unprepare MHI channels by itself, which is needed because QRTR
> doesn't probe those channels automatically in this case.
> 
> Mani, the MHI maintainer, firstly doesn't like that version and insists that an
> MHI device should be destroyed when suspend/hibernation, according to his
> understanding on device driver model. See
> 
> https://lore.kernel.org/mhi/20231127162022.518834-1-kvalo@kernel.org/
> 
> After a long discussion Mani thought we might need a new PM callback with which
> ath11k is able to wait until kernel unblocks device probe and thus MHI channels
> get probed. So we came to the kernel PM list and there Mani realized that his
> understanding is not correct so he finally agrees to keep MHI device during
> suspend/hibernation. See
> 
> https://lore.kernel.org/all/21cd2098-97e1-4947-a5bb-a97582902ead@quicinc.com/
> 
> Mani also pointed out that an MHI controller driver (ath11k here) should not touch
> MHI channels directly because those channels are managed by the corresponding MHI
> client driver (QRTR here). To address this, we come up with this version.
> 
> Compared with that RFC version, this version adds PM callbacks in QRTR module:
> suspend callback unprepares MHI channels during suspend and resume callback
> prepares those channels during resume. In this way ath11k doesn't need to do
> unprepare/prepare work by itself so those two APIs added in RFC version are
> removed now.
> 
> The power down/up procedure requires a specific sequence in which PM callbacks
> of wiphy, ath11k and QRTR are called, this is achieved by exploiting the
> child-father relationship between their device struct, and also the PM framework
> which separates whole suspend/resume process into several stages. Details in
> patch [3/3].
> 
> v5:
>  - remove Kalle's s-o-b tag in patch 1/3 per Mani.

Why are you not carrying review tags? I have reviewed the patches and provided
my tags for patches 1 and 2 in v3 and v4. Now there is no tag again in v5 :(

You cannot expect maintainers to provide review tags in each revision.

- Mani

> 
> v4:
>  - resend v3 as v4 to CC netdev folks. No changes in patches themselves.
> 
> v3:
>  - skip QRTR suspend/resume if MHI device is found to be in suspend state.
> 
> v2:
>  - add comment on why destroying the device is optional in
>    mhi_pm_disable_transition().
>  - rename mhi_power_down_no_destroy() as mhi_power_down_keep_dev().
>  - refine API description of mhi_power_down() and
>    mhi_power_down_keep_dev().
>  - add/remove __maybe_unused to QRTR PM callbacks.
>  - remove '#ifdef CONFIG_PM'.
>  - refine commit log of patch 1/3 and 2/3.
> 
> Baochen Qiang (3):
>   bus: mhi: host: add mhi_power_down_keep_dev()
>   net: qrtr: support suspend/hibernation
>   wifi: ath11k: support hibernation
> 
>  drivers/bus/mhi/host/internal.h        |   4 +-
>  drivers/bus/mhi/host/pm.c              |  42 ++++++++--
>  drivers/net/wireless/ath/ath11k/ahb.c  |   6 +-
>  drivers/net/wireless/ath/ath11k/core.c | 105 +++++++++++++++++--------
>  drivers/net/wireless/ath/ath11k/core.h |   6 +-
>  drivers/net/wireless/ath/ath11k/hif.h  |  14 +++-
>  drivers/net/wireless/ath/ath11k/mhi.c  |  12 ++-
>  drivers/net/wireless/ath/ath11k/mhi.h  |   5 +-
>  drivers/net/wireless/ath/ath11k/pci.c  |  44 +++++++++--
>  drivers/net/wireless/ath/ath11k/qmi.c  |   2 +-
>  include/linux/mhi.h                    |  18 ++++-
>  net/qrtr/mhi.c                         |  46 +++++++++++
>  12 files changed, 244 insertions(+), 60 deletions(-)
> 
> 
> base-commit: 48294c8a226d82c687b52b2eb90a075bbfbcb884
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

