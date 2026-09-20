Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CDDC982D8
	for <ath11k@archiver.kernel.org>; Sun, 20 Sep 2026 16:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHza7uhFopdEpXjnPqVhCbEMpK63s/WOhYzeeG3B/+A=; b=TfMwK3UGn0pdJBlUWHvAGr6gfL
	nPkm/uD1B0O1sOJgyKYpc/PiNLaeERPm9S7rWPeSq6/LBzg//ffo6w7PRZFmOdlkTpgqVSNa5RqdE
	hBGr9JInbGNnev6tX+gl5NFs720RC7uAem94IIh9mwhgBgqIV7bqiR/HFSwJWzsSWEzZJtHzJmsN3
	pI3n3TmFqqAvg3ydcveZjk1yUhEus1faSQxoK24//TukEkkbMPr5G1GaRcQxjhW9mVpQaCzA17746
	7AQUjcS8koy3y+GEUCHhzFpn00HJqHBcvA6PE/Yzi3iRYXEX231LWXsDL8JPil8msgjtMg4NHs/8I
	3FAVFA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Kcq-000000007rC-01pW;
	Sun, 20 Sep 2026 16:42:48 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Kcn-000000007qh-00QG
	for ath11k@lists.infradead.org;
	Sun, 20 Sep 2026 16:42:46 +0000
Received: by mail-yx2-x11.google.com with SMTP id 00721157ae682-85d440939f0so15487357b3.2
        for <ath11k@lists.infradead.org>; Sun, 20 Sep 2026 09:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789922563; cv=none;
        d=google.com; s=arc-20260327;
        b=OBM6BPhFsDcy4Slu1th/WmlAtKRDa2NpaBmJJ0ClMexO2bQ+cuZz5TRrH7BEWPAxTH
         NXgjz9iCDB0Mx8LtNVuToAut09h/0valQwhLeQg+YK0TD5HVIXTzBwJCUMrMIjXbDCXz
         8KbA7cvdtsvpmOUKxb1LQ5OGPGya+oWCYc9NSprTbYjW8ycTZ/xYq2kVhAhFAadcx4il
         +gn1hcXZVl9SJJj0U7ifmjMOCOHDSP2vDu5FEc1XpZSlwXZjl/Nqsx1wkGmAQe4Suy6k
         wJQ7dqa3FFVSCdV6IK2OmDvRPER5OzzyiywtP4FKq88aGMJoNh2kQLYNKe5sbfL9uImO
         bu9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nHza7uhFopdEpXjnPqVhCbEMpK63s/WOhYzeeG3B/+A=;
        fh=LCBfWJD7Md20845RT603FSi9ps24I4Jql0J3FM3pxbk=;
        b=mE2QrTpV1VBp1cfzQ6XIELy1+LiVoQGL13kIRrCLZmbevhl+8YiAthUqUfnsK7Cj/T
         VZe5JqiyJdNVJ9wCNzc6f4FOLRaMqrgm4Mw5IzaZgDUMM9BFx+u7RGbMRAloZXr4ADLT
         rZB9IbzpPdllMIKQ4qlEQExl9K5EVfrTHspHPAET2caKqevNuKW6BIgK2xvcKAsNdSrE
         LMdFwdYjPY9P+EJv/U9syL9hEIOXUp3E3qjAddim9ykDA22dF8qmCX9cT7H5HGPsrCWl
         PPqbPZ0NYLC3WqHQqXMJe879gQ74b4kPtjHTDwWlTg02EsRTvMk7OEe7egkVUSHh2q8P
         BdYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1789922563; x=1790527363; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHza7uhFopdEpXjnPqVhCbEMpK63s/WOhYzeeG3B/+A=;
        b=TsdHOgUtGl/+Qc0PUQz4o/A7rQv3CdSsMSvrjtR4ENiTAbxRI9UlYoZ7aifzHES6z/
         zMMJitReBBDK3jdcmRn+Ln57rHA6IBTbznS3cAIa2Vogfs3+bAYEQxISMEyiZWM5cN7K
         aDLeoQUD4VMDQ1DHP0+a8Wz25N0c6C8HJJCaKK2demem8ETj7cM9EotyHM4TfrXyRE+D
         n7gd/GkJLhowoAldXnyEEVKHV3l71H4Xzgli3Zon+66qFQ8FxJpkpQvCp7XAUuvlCI/e
         CXCbHP/bdpc2UC/BK2iRdabbWTnZlvkO6gLIpkvLVcLKxTeYcRpK3VxiCjqQoCqyRoLw
         9kSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789922563; x=1790527363;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nHza7uhFopdEpXjnPqVhCbEMpK63s/WOhYzeeG3B/+A=;
        b=T+2rhUORovwlfnDzR/BRd6HuG3jv/yl+lUai0lRVqIdV5hzTil+bTwHM9cLeY204/m
         x195GBbco0Vdk51B31D/dCkGWA5Narb1IDTXA0j01vnSQ3NmJG9jfse5C2qhOUQ6OKdA
         anPTca7GpmVLNMzOX5wtJHs3qRl2CU0ssxa1cJzlJdG6eC2CX0GbQOb37O+LLndgffbh
         L8W/k4rIW5qpKzDmCTygZkG0vqNeq/+Qdx9+CBguuzEU2vuqgkL8W7zHt7vigdbV62ch
         fEydShZ6+00u0pO2W/LPUfjOTDMRI1FDBAMV6GE44SBeyIaCkcDHkJI1rqXYkdYRwr5M
         7R1g==
X-Forwarded-Encrypted: i=1; AKwUvByxpm3aDFoMFdBQEh5X7DXziMEJKRZfElvFZsHRMiSFnxdLBr4CN6fCR8dajzYa+TGK1LHuR5s=@lists.infradead.org
X-Gm-Message-State: AFuF++nspPoqm5P+YJC6DVm/hCHURzC0SYnkUXsOUo1ycBxg12BtxylA
	FSm9DB3qFaEsaUPuQZ25gGN8z0bSgTJ9N3g0/lyrUle6ee2SlnmNjWeclZ/VNDjxrKAowfUUExL
	g5SQGz0AtGNQeZ5dl/J1d/DR6lj7I37MwoQarLuSP
X-Gm-Gg: AYBFou3xAotRMkGF/GQ7/YPT7I7nfVeLttqLtC33stez1onbdM82S7cI2vPVjuoGphd
	vr+Dnm7soSLD02XoawGs8yajP+r7FDjHtQOas8kDaYMsyMWUnN1UAjqeAmGr63wldXy0PijYg1G
	zptp/qxd5OPCpIBLEt7oWUGUaVYVA30rTo2vZ6IYXS9HO7vH9aff9R448HK0dNHoGlVbeQ2c65/
	fM0/3p2Pbk/BRrKll1026WkuhQonKdAjicVsLsRh9vRC0h/G8LrEUQZRIVqI6nTbSFasb3f4+dH
	ztJQ39z3ikaFKfco4kd7IqGhwQQCNwyGw6SgQRLhnPW8U1wFJbC6IQuG7Qgbk0RaJPJCAXZmQf+
	Le4Wb73AqNuJkHsiHfxo6Adetx1GMGMfN8MG081922cO/SZNn8jLkplLP1phGypNlrUECBu4rLb
	kivL19ofU/X+99Cy0KyCwS7vGEIoP8EI2iRUMcX02TkeXsT34AoPzkt2iP7/zAr3bluC0L0HUvM
	nrpyGmfNlt+mIHGBfwQ7CzwCjCzAzp+Ixf1zdVVZEB+TxuqU/HVR8WxcfbiT9S29Allcy2nJTZc
	LAHMObBNN2Y=
X-Received: by 2002:a05:690c:315:b0:86f:3b4a:f8b2 with SMTP id
 00721157ae682-89730eed53amr31830807b3.16.1789922562709; Sun, 20 Sep 2026
 09:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260726221908.104873-1-julius@bairaktaris.de>
 <20260726221908.104873-3-julius@bairaktaris.de> <CGME20260911075315eucas1p1b4ffb1f57ef187e0a055072ccc0983e3@eucas1p1.samsung.com>
 <a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com> <dd342f3d-36d3-4a85-95ca-6cacb7b834ad@oss.qualcomm.com>
 <10491411-b500-4e89-bf85-5142ced60aaf@samsung.com>
In-Reply-To: <10491411-b500-4e89-bf85-5142ced60aaf@samsung.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sun, 20 Sep 2026 16:42:08 +0000
X-Gm-Features: AcwNN1X9njNa5bud7U1eFhRRabFMS_lFHDaJorC6mykzTt2Nulm24Bp200Rb6sM
Message-ID: <CAC1t37Ltrh+BBaEPi8grXnMrDt3qGDH8BA56av-h7=yPCCk0Nw@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath11k: disable interrupts during
 firmware crash recovery
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, jjohnson@kernel.org, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vasanthakumar.thiagarajan@oss.qualcomm.com, 
	rameshkumar.sundaram@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_094245_080309_0F0B9B33 
X-CRM114-Status: GOOD (  25.63  )
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

Hi @Baochen,

tested 5 times and it solves the problem. Thanks!

Julius


Am Mo., 14. Sept. 2026 um 07:22 Uhr schrieb Marek Szyprowski
<m.szyprowski@samsung.com>:
>
> On 14.09.2026 08:32, Baochen Qiang wrote:
> > On 9/11/2026 3:53 PM, Marek Szyprowski wrote:
> >> On 27.07.2026 00:19, Julius Bairaktaris wrote:
> >>> On IPQ8074 a firmware assert reboots the SoC:
> >>>
> >>>   Unable to handle kernel read from unreadable memory at virtual address 0
> >>>   pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
> >>>   lr : ath11k_dp_rx_process_mon_status+0x15c/0xd84 [ath11k]
> >>>   Call trace:
> >>>    ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
> >>>    ath11k_dp_rx_process_mon_rings+0xa0/0x5d4 [ath11k]
> >>>    ath11k_dp_service_srng+0x1f4/0x348 [ath11k]
> >>>    ath11k_ahb_ext_grp_napi_poll+0x34/0xd4 [ath11k_ahb]
> >>>    __napi_poll+0x38/0x188
> >>>    net_rx_action+0x120/0x2c0
> >>>
> >>> ath11k_core_reconfigure_on_crash() tears the data path down with
> >>> ath11k_dp_pdev_free(), ath11k_dp_free() and ath11k_hal_srng_clear(),
> >>> which memsets the ring list. The DP NAPI is still running while that
> >>> happens, so it services a ring whose address pointer has just been
> >>> cleared.
> >>>
> >>> That function used to disable the interrupts first, until
> >>> commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
> >>> moved the disable into ath11k_core_reset(). reset_work is only queued
> >>> from mhi.c and from the debugfs hw-restart handler, so AHB parts never
> >>> run it on a real firmware crash. Their recovery goes QMI server exit ->
> >>> restart_work -> ath11k_core_reconfigure_on_crash() ->
> >>> ath11k_core_qmi_firmware_ready(), and nothing disables the interrupts
> >>> anywhere along it.
> >>>
> >>> Disable them again on the crash path. The reset path has already done
> >>> so by the time it gets here, hence the ab->is_reset check.
> >>>
> >>> This is also why the debugfs hw-restart trigger never showed the
> >>> problem: it goes through ath11k_core_reset(), the one path that still
> >>> had the disable.
> >>>
> >>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1
> >>>
> >>> Fixes: d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
> >>> Assisted-by: Claude:claude-opus-5
> >>> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> >>
> >> This patch landed recently in linux-next as commit f7a74e131d3f ("wifi: ath11k:
> >> disable interrupts during firmware crash recovery"). In my tests I found that it
> >> causes a regression on QCOM RB5 board during system suspend/resume cycle
> >> (s2idle):
> > Hi @Marek, can you please try if below diff can fix this regression? Also, @Julis, can you
> > please also confirm if it can address your original issue as well?
>
>
> Works fine in my tests, feel free to add:
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
>
> > diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> > index d2ed6a0ea7e3..1ad0a47653de 100644
> > --- a/drivers/net/wireless/ath/ath11k/core.c
> > +++ b/drivers/net/wireless/ath/ath11k/core.c
> > @@ -1275,9 +1275,6 @@ int ath11k_core_suspend_late(struct ath11k_base *ab)
> >       if (ab->actual_pm_policy == ATH11K_PM_WOW)
> >               return 0;
> >
> > -     ath11k_hif_irq_disable(ab);
> > -     ath11k_hif_ce_irq_disable(ab);
> > -
> >       ath11k_hif_power_down(ab, true);
> >
> >       return 0;
> > @@ -2333,17 +2330,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
> >       int ret;
> >
> >       mutex_lock(&ab->core_lock);
> > +     ath11k_hif_irq_disable(ab);
> > +     ath11k_hif_ce_irq_disable(ab);
> >       ath11k_thermal_unregister(ab);
> > -
> > -     /*
> > -      * ath11k_core_reset() already disabled the interrupts on the reset
> > -      * path; only the firmware crash path reaches here with them live.
> > -      */
> > -     if (!ab->is_reset) {
> > -             ath11k_hif_irq_disable(ab);
> > -             ath11k_hif_ce_irq_disable(ab);
> > -     }
> > -
> >       ath11k_dp_pdev_free(ab);
> >       ath11k_cfr_deinit(ab);
> >       ath11k_spectral_deinit(ab);
> > @@ -2605,9 +2594,6 @@ static void ath11k_core_reset(struct work_struct *work)
> >       time_left = wait_for_completion_timeout(&ab->recovery_start,
> >                                               ATH11K_RECOVER_START_TIMEOUT_HZ);
> >
> > -     ath11k_hif_irq_disable(ab);
> > -     ath11k_hif_ce_irq_disable(ab);
> > -
> >       ath11k_hif_power_down(ab, false);
> >       ath11k_hif_power_up(ab);
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

