Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5B8C021A4
	for <ath11k@archiver.kernel.org>; Mon, 24 Feb 2025 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6d5XSfEwRqWaYFLWfE4Y4ohPqjDkgrU++dRrHmEqq/c=; b=qvcePGAc4uNDnMfYMO5z4lGoBs
	LZV0ToCzjHcm+sn+VXIXK+pnQ8hLrtnrtzdXsO/4aAiz5aC1nFEKB+ZIK3KMfU9IwF2ey2V/UGgDb
	3tK7TWEdn8JNW3AWdqcGy1eg4KftS7wQPrQ2Nx4cYTjsofs2KQPIcPxqhOxWvzH7K69bOtX+bwgX8
	BpFj8SdBaKZw8n0JrARr+2FAddseeYvLozJ0WMu9rNXR/+sTfSKcPJR0d65f6Po4aj3SDiNJqFOvw
	5BqfS8L+h99b6aONRIdFW0l49qUiH3BzRU/hUbNrjZ/40z3oW02apUW20vhJpeTcj5NuggZ0EeEUj
	I38vglRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbYx-0000000ETtT-0uCk;
	Mon, 24 Feb 2025 16:44:11 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbYu-0000000ETsp-36KI
	for ath11k@lists.infradead.org;
	Mon, 24 Feb 2025 16:44:09 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-220c665ef4cso80456585ad.3
        for <ath11k@lists.infradead.org>; Mon, 24 Feb 2025 08:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740415448; x=1741020248; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6d5XSfEwRqWaYFLWfE4Y4ohPqjDkgrU++dRrHmEqq/c=;
        b=VLSygA/0lBLSaOyx5PIidc0zmMMoIP/PnXQ60p0CMx6UCRkCtZfprVtAEJR/EpRTTD
         vhp+ck+X6zkGsio1oIqa3Qc2snZ6G2sMxbbonuKDPexyD+HCdp6LENVb01QbxTTbX11T
         NkzBMnciysKmnSoIU1u9wkILPd5kMui3tDRybYQfogeTJZ+mTZUGtmO0wViFHpaa85hy
         jVzAF8ybVq7QRRgfdCkCsPntVCUb+QU6jJtZweA0tpYA6PDttkxUbfxGGdszLomaECWr
         vkXJ39fJNoieR/I+u7EvRhzueuRaAEjOUIOvkVdvFQZKj1OZ2Hy72F2hUsFbvMq1jiE2
         85PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740415448; x=1741020248;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6d5XSfEwRqWaYFLWfE4Y4ohPqjDkgrU++dRrHmEqq/c=;
        b=gV/v/2jVWZrI9W8Ng4OrPM5MJBJb4S50kwRkfFXVz/R6+Rp600095pTSdVtX+8Mr10
         J3toBYnRvIS6hyaTmPLt0Pt2IunbxruJN9nThGl+vHHzQ9ca5m4Vm1ig9Of02iOmG+7G
         +OAaZWv3ulXpJaeVY8yMQJAc/+7sY8nr227spfmlKf2KcoE3MTAC7W/Z44rBJc8ch1V7
         Yx59GUOTqu4qdC0HbyM8gB0TGL7MyzE0lskh+TERN/xAf66BA2xb324h86cJXuE82JhS
         L1eJFmrb2me7zuRgpIx4JK/OqtoOoOMiFRvqXnS7nsXo1H6GPZanM9Kv+qP7o0mKqMJk
         KduA==
X-Forwarded-Encrypted: i=1; AJvYcCWHpkFXzbP94EtXt7SQzkVfQcvyPUmvcNRkKDO+3JFMxY7TEXNPDGnsAz+U8TlAnUGAa6Huegk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDuxeVvgWwTLXbQtbBtkAYjRAfuDTUjlY6GQpC3Iq4fFKtWP/L
	UEBA8hjYuqlXc+eEJrtOlyMPvC7OqODpJjlhEOATF6v1o3VD8VT83OWZAqKFgA==
X-Gm-Gg: ASbGncs2OkgZM98lOhoYtbQpxq1gkdzZZWDlpBBr2RFpu6zEj/HeNN5kNVdxYfOEdBW
	xpl/Z2WAN2uPKmK9qqWhRP+T5W+mEEt0qSacp6aj6sgaHfsEkRyXaMLqWydIJzX9BSv9zwAkV4i
	FIjS2WJtcagNLPpbG0PPUiMlcT3pNQa6LEcuYf6xvrNHpoHpHlfxjD9FT++q7fnFhqtcJsCuVU9
	V5ssZF4B1eZ8LXcZ0pmbPxiAKP/cy2EB9TYgUyvBjKUH3hNSbvMu3xQsxydP8deyGGKZC1ktwwi
	AX5m/ckm1Yunt5VrjOjttgYK7ddhN769YUQd
X-Google-Smtp-Source: AGHT+IFG1lGtUN3MM7H9ZJAba5MymArVGS0ryXDNHwp0DEkpN0qPAZv5NG2dk7v/JN0eP4aRNmsZlw==
X-Received: by 2002:a17:903:2f43:b0:215:89a0:416f with SMTP id d9443c01a7336-2219ffc2dcbmr207030045ad.30.1740415447841;
        Mon, 24 Feb 2025 08:44:07 -0800 (PST)
Received: from thinkpad ([36.255.17.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545c9casm183409845ad.130.2025.02.24.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 08:44:07 -0800 (PST)
Date: Mon, 24 Feb 2025 22:14:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johan Hovold <johan@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	kernel@collabora.com, ath11k@lists.infradead.org,
	jjohnson@kernel.org
Subject: Re: [BUG REPORT] MHI's resume from hibernate is broken
Message-ID: <20250224164400.w3lpzxxwfbrj5lb6@thinkpad>
References: <59c036b6-a3d6-403b-8bb0-566a17f72abc@collabora.com>
 <20250214070447.scs6lpytjtecz3ko@thinkpad>
 <1cd4a1ed-f4e7-4c7b-a19f-f79afddbe310@collabora.com>
 <20250220075034.unsd5cq7xkip2by6@thinkpad>
 <ec8a01a3-5eaf-4fba-bb85-e7a677877e5f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec8a01a3-5eaf-4fba-bb85-e7a677877e5f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_084408_785054_D0285962 
X-CRM114-Status: GOOD (  30.53  )
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

On Thu, Feb 20, 2025 at 05:34:06PM +0500, Muhammad Usama Anjum wrote:
> On 2/20/25 12:50 PM, Manivannan Sadhasivam wrote:
> > On Mon, Feb 17, 2025 at 07:35:50PM +0500, Muhammad Usama Anjum wrote:
> >> On 2/14/25 12:04 PM, Manivannan Sadhasivam wrote:
> >>> Hi,
> >> Thank you so much for replying.
> >>
> >>>
> >>> + ath11k list and Jeff
> >>>
> >>> On Tue, Feb 11, 2025 at 01:15:55PM +0500, Muhammad Usama Anjum wrote:
> >>>> Hi,
> >>>>
> >>>> I've been digging in the MHI code to find the reason behind broken
> >>>> resume from hibernation for MHI. The same resume function is used
> >>>> for both resume from suspend and resume from hibernation. The resume
> >>>> from suspend works fine because at resume time the state of MHI is 
> >>>> MHI_STATE_M3. On the other hand, the state is MHI_STATE_RESET when
> >>>> we resume from hibernation.
> >>>>
> >>>> It seems resume from MHI_STATE_RESET state isn't correctly supported.
> >>>> The channel state is MHI_CH_STATE_ENABLED at this point. We get error
> >>>> while switching channel state from MHI_CH_STATE_ENABLE to
> >>>> MHI_CH_STATE_RUNNING. Hence, channel state change fails and later mhi
> >>>> resume fails as well. 
> >>>>
> >>>> I've put some debug prints to understand the issue. These may be
> >>>> helpful:
> >>>>
> >>>> [  669.032683] mhi_update_channel_state: switch to MHI_CH_STATE_TYPE_START[2] channel state not possible cuzof channel current state[1]. mhi state: [0] Return -EINVAL
> >>>> [  669.032685] mhi_prepare_channel: mhi_update_channel_state to MHI_CH_STATE_TYPE_START[2] returned -22
> >>>> [  669.032693] qcom_mhi_qrtr mhi0_IPCR: failed to prepare for autoqueue transfer -22
> >>>>
> >>>
> >>> Thanks for the report!
> >>>
> >>> Could you please enable the MHI and ath11k debug logs and share the full dmesg
> >>> to help us understand the issue better?
> >> The ath11k debug was already enabled. CONFIG_MHI_BUS_DEBUG wasn't enabled. 
> > 
> > Sorry for not being clear. I asked you to enable the dev_dbg() logs in the MHI
> > driver. But it is not required. See below.
> I've disabled the MHI_BUG_DEBUG. It only enables some files. Ideally if those files
> being used, there shouldn't be any difference. But they are definitely changing the
> timings.
> 
> > 
> >> I've
> >> enabled it and now the hibernate is working without any issue. It is very strange
> >> how can CONFIG_MHI_BUS_DEBUG make any difference. I don't have much background on
> >> how it is helping.
> >>
> > 
> > Probably some timing issue. But enabling the MHI debug logs could also hide the
> > issue. So you should disable the CONFIG_MHI_BUS_DEBUG option and collect the MHI
> > trace logs that we recently added.
> Disabled the MHI_BUS_DEBUG and collected logs by Dynamic debug:
> [  584.040189] mhi mhi0: Allowing M3 transition
> [  584.040202] mhi mhi0: Waiting for M3 completion
> [  584.040480] mhi mhi0: State change event to state: M3
> ..
> [  584.535478] qcom_mhi_qrtr mhi0_IPCR: failed to prepare for autoqueue transfer -22
> [  584.535482] qcom_mhi_qrtr mhi0_IPCR: PM: dpm_run_callback(): qcom_mhi_qrtr_pm_resume_early [qrtr_mhi] returns -22
> [  584.535490] qcom_mhi_qrtr mhi0_IPCR: PM: failed to restore early: error -22
> [  584.831583] mhi mhi0: Entered with PM state: M3, MHI state: M3
> 
> It seems like the state save was success at hibernate time. The error is originating
> at resume from hibernation.
> 

I just tried hibernation on my RB5 board featuring QCA6390 WLAN chip which makes
use of ath11k driver. I did encounter the resume failure, but the error log was
slightly different. Then looking at the ath11k driver made me realize that they
reverted the hibernation support due to suspend issue reported on some Lenovo
platforms: 2f833e8948d6 ("Revert "wifi: ath11k: support hibernation"").

So that explained the resume failure. I reverted the revert and that allowed me
to resume properly from hibernation. So please try to do the same and see if it
helps you.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

