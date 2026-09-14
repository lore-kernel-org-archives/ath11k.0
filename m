Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4891EC88E64
	for <ath11k@archiver.kernel.org>; Mon, 14 Sep 2026 06:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6vxNJgFB0kAwZIfG9ct3s/oIXV82N4VnXyA7jWGSXY=; b=QHotHK00gjrdwO5RcHNZnE4RH9
	yvZULY8nAR+wJllyeh5KHoAdigz1j5Wbx0rt9KAxHRGKP0qI7KiPfjEdTYkREplHLs8+AHvHf8jf6
	VjVX5dhW4ifjT0l4BRogmNJQMIcInUlGkXc38R4zRCD2iDpnBQTID+Z0PjIWUKvkCsgRW9Ym0DFA+
	61pjytb3WROOXI5JcK3KxXTtGFH7rPyxmAbnSTEr4AyaAHNdE2unH5618TWriZ0XaoJCSmvgSgHpQ
	LiXbREyZKAYbXLn0/z1Hw3uwpIYYhSQdJF4uuTT7GMdJf9/GYFh05wfk7vOBquLs7w1VH/8+WjEzl
	83MXTZlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60U5-00000002TdY-159I;
	Mon, 14 Sep 2026 06:48:09 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60U2-00000002Tco-2Jjj
	for ath11k@lists.infradead.org;
	Mon, 14 Sep 2026 06:48:08 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d4ddd1d91so10614567b3.1
        for <ath11k@lists.infradead.org>; Sun, 13 Sep 2026 23:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789368484; cv=none;
        d=google.com; s=arc-20260327;
        b=YLaOscFo91gZQoiQ9SdwKwKgxaiFJto+daai9upn8Oa5H2ZXE+uSwQ9lT7BDnICD5r
         rNriiZTTRFrXtJAaY63SjRNiUzsZWkoA9CBlKAmrw5EjO8aOhPN0qhNS9CT+fs7HktDF
         FTFAhFEQd6c8BT2KTDLbOITxLjF5MnAvoQb2ZhsG3fb+p+M5VEW8xfYcWDGvPYgLn76Q
         9OwJZNWcH1nJCbuFE33iz3RHLnKBowN7WbGycQWqtZ54BTd0A6cIrzixE+Emu6WOhTXx
         k1toLDGRf+/mft5eIU+gIJ6x3vGlwFDF7N3sLbXZMAjDwdupthxJWiTsmf2MMvxaLGDt
         DGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/6vxNJgFB0kAwZIfG9ct3s/oIXV82N4VnXyA7jWGSXY=;
        fh=rEevBHMIfPlBKtbmVC5n50k6bLPHvELFX1zz71UW30w=;
        b=fXL3QAORVj5K4jVl4m6xG7TMkHOr2qnQqarOw8HJ7qq/6aWHAWN+q0lZvZGr82uutf
         5g1aBS3Ptla8B+NWIiA7nHee9OxnbYfCEwERWKmZk56VSXn2PKe4ssn/Jxjv2cHRR7Oz
         xVT7ElyElWrE/ml00mT2XiH+PdT70QSiEa0n67sUVM5tQ9rQNzj/9VD4YHuA1XmEumaP
         tgobUApLrSGU2rg6DZXV/oIvN635PlNQkgeRv4TuLHkepbg4MavH8SbW3tUOoCdnF08u
         wwOwSNT6mzMwxRiC2auPD8W3ytSaayWLX/mNwKV0C9TkW3raPeeESgFINVLUWvZDynLW
         dARQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1789368484; x=1789973284; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6vxNJgFB0kAwZIfG9ct3s/oIXV82N4VnXyA7jWGSXY=;
        b=aVmgJBaR0WDSUmXra8EAOmwtogfMAUcafCriYyl7OpOOhjyCdtchPFFTriTsCsooE1
         AO2ghbn3OGYeCHB6a06rewm5MrkW+vJPGhc+PpW8RYK3YYuTj6QeeDkkiZ/+GEl6U3hB
         Pq3OA7Du8AriXx8VfRcMFU8bwxwpfWExOiCeKDguO7eTe+sGT52nuTZWlKocHudgjyiR
         1FILEM4e0ADnZn/eK1//OxDNdyFKQUSzZSQimHKObviZGNESeU0Bi+JX6IOWEKlr2xs8
         ULVqTVd99xMc/YP8BllAx/r7kQ8eRxlHl6TIpSQogJZ/E6WsKqa2OSP5rEwU5G92XSz7
         cwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368484; x=1789973284;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/6vxNJgFB0kAwZIfG9ct3s/oIXV82N4VnXyA7jWGSXY=;
        b=MBSHoYe90i+Oy17xoaTDXdkw3en3QgfTEGAnLeKwqYp1EXR1rjxTY//QO++xJsuudx
         CY7hw+xfABS0dq6LF6ZiUiivtkvQJ+wZJm6AheQ0KdhhwRONvn6rz9teUqpgbm+MvpzJ
         AgCslFrjNxRWiXfAhqRVmXjz4INFknj5mKDAGXpTOEptxnRW8sqaTKLZPF5UqGlNDKQh
         k4my4ijvTVya1ewtdn22pLSeEsvfvMmOyYwaVS4cngLaHmVf2BnNc3FnVhBPehyEB3dg
         b/x8jCie86akKRh/hrK9gYzb90NPsaZcyrZYD4RPmDvBfqxxDuVUJ055hpAz1arQjcwU
         UWBw==
X-Forwarded-Encrypted: i=1; AKwUvBykYFK0M6w9ZYYm/BGek+vjw6tpabQH4SiSS0bE2hIvcffoK9wh5sm8HrIibVO2jkYiCTnfm4E=@lists.infradead.org
X-Gm-Message-State: AFuF++n4nfbFdcFXJpXsZeqYzrJy9LSJhzSMy6JXKXSWM35VJ5CCPHy1
	mWnu+amnpMevqcxs+pXHBdoj8dUZzBtr1ZANC4PKeeCjYFaID6WYd9geLulvoVQd0dUkf79ZT09
	b0twa5bFY7Yw3TTToYgDZaWGmxDGnylgl9DXfPVHo
X-Gm-Gg: AYBFou1cFaPRsIF8u15fq4wHCoRflzHIEmKu48UeWEDz/wp82s4fnjcYTGg9BpJJIol
	mokcBcc1jk3OelnWEzOj4Y59nxXVmAEWEzZGPhsGUH4SBgwt68MJSfKgCY8CYXoaYi5FOFHkqPh
	hb+UxCDktuixe1gcEI8/E1S8T5Ii3ZMzxmcpZDzURUZ5pgAB2KPNk8ysrbJGy/SeZsVaKgqwOzq
	DU0hu2sYUJ42o/XpZR17ZpVJuQ9Iu3DGnw6gasLI0S9/z5XJ+xczGaJJsP3NKadND1kq7vg2RI/
	/V7vPBSU+aNPZMVTE6Wi+lM5c69XmLW642lnpYqtglB3E6S7QA45NjRjvtA637va1yyUDPKiwJ/
	JYziXfcOMrLPHEuN1KaNeL3ffCSBJLNZgAJqVcV5GA4XT/XZg8DKGbO3kTpCWMTCpzGQtFqKL0S
	62UV74SqkEFM6BUEWvUfmVOpO2som/KUYCJBpQyZ92VeFHIG1GFA0vYyYrStaNzYS6oEEKoOGBH
	at0h3DozGC5f+MaLc8+ySPRmwqZZSyhyIeUMKWNIJ+74M7O1h5MlQzyXZNh6fyqjy+soQ/v+Ke2
	NE53De3vXaQdlkuGduBKjk1p
X-Received: by 2002:a05:690c:60c4:b0:882:1d1f:ccb with SMTP id
 00721157ae682-88d1f9e215fmr5331177b3.8.1789368484215; Sun, 13 Sep 2026
 23:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260726221908.104873-1-julius@bairaktaris.de>
 <20260726221908.104873-3-julius@bairaktaris.de> <CGME20260911075315eucas1p1b4ffb1f57ef187e0a055072ccc0983e3@eucas1p1.samsung.com>
 <a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com> <dd342f3d-36d3-4a85-95ca-6cacb7b834ad@oss.qualcomm.com>
In-Reply-To: <dd342f3d-36d3-4a85-95ca-6cacb7b834ad@oss.qualcomm.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Mon, 14 Sep 2026 06:47:25 +0000
X-Gm-Features: AcwNN1UJxtZXAgjAG7UR_9O9cwtb9zT-R7CtVzX75Tvg07K3khGsBYzjwWq2LnQ
Message-ID: <CAC1t37J2N1OWkPUthz4XGkeNK47+QeV1siU5s=WtfsqbE=Osew@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath11k: disable interrupts during
 firmware crash recovery
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, jjohnson@kernel.org, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vasanthakumar.thiagarajan@oss.qualcomm.com, 
	rameshkumar.sundaram@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_234806_612962_5C060D4C 
X-CRM114-Status: GOOD (  27.38  )
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

Hi Baochen,

I am without my router until 21 September 2026 and will report back
then.

Julius


Am Mo., 14. Sept. 2026 um 06:32 Uhr schrieb Baochen Qiang
<baochen.qiang@oss.qualcomm.com>:
>
>
>
> On 9/11/2026 3:53 PM, Marek Szyprowski wrote:
> > On 27.07.2026 00:19, Julius Bairaktaris wrote:
> >> On IPQ8074 a firmware assert reboots the SoC:
> >>
> >>   Unable to handle kernel read from unreadable memory at virtual address 0
> >>   pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
> >>   lr : ath11k_dp_rx_process_mon_status+0x15c/0xd84 [ath11k]
> >>   Call trace:
> >>    ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
> >>    ath11k_dp_rx_process_mon_rings+0xa0/0x5d4 [ath11k]
> >>    ath11k_dp_service_srng+0x1f4/0x348 [ath11k]
> >>    ath11k_ahb_ext_grp_napi_poll+0x34/0xd4 [ath11k_ahb]
> >>    __napi_poll+0x38/0x188
> >>    net_rx_action+0x120/0x2c0
> >>
> >> ath11k_core_reconfigure_on_crash() tears the data path down with
> >> ath11k_dp_pdev_free(), ath11k_dp_free() and ath11k_hal_srng_clear(),
> >> which memsets the ring list. The DP NAPI is still running while that
> >> happens, so it services a ring whose address pointer has just been
> >> cleared.
> >>
> >> That function used to disable the interrupts first, until
> >> commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
> >> moved the disable into ath11k_core_reset(). reset_work is only queued
> >> from mhi.c and from the debugfs hw-restart handler, so AHB parts never
> >> run it on a real firmware crash. Their recovery goes QMI server exit ->
> >> restart_work -> ath11k_core_reconfigure_on_crash() ->
> >> ath11k_core_qmi_firmware_ready(), and nothing disables the interrupts
> >> anywhere along it.
> >>
> >> Disable them again on the crash path. The reset path has already done
> >> so by the time it gets here, hence the ab->is_reset check.
> >>
> >> This is also why the debugfs hw-restart trigger never showed the
> >> problem: it goes through ath11k_core_reset(), the one path that still
> >> had the disable.
> >>
> >> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1
> >>
> >> Fixes: d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
> >> Assisted-by: Claude:claude-opus-5
> >> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> >
> >
> > This patch landed recently in linux-next as commit f7a74e131d3f ("wifi: ath11k:
> > disable interrupts during firmware crash recovery"). In my tests I found that it
> > causes a regression on QCOM RB5 board during system suspend/resume cycle
> > (s2idle):
>
> Hi @Marek, can you please try if below diff can fix this regression? Also, @Julis, can you
> please also confirm if it can address your original issue as well?
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index d2ed6a0ea7e3..1ad0a47653de 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1275,9 +1275,6 @@ int ath11k_core_suspend_late(struct ath11k_base *ab)
>         if (ab->actual_pm_policy == ATH11K_PM_WOW)
>                 return 0;
>
> -       ath11k_hif_irq_disable(ab);
> -       ath11k_hif_ce_irq_disable(ab);
> -
>         ath11k_hif_power_down(ab, true);
>
>         return 0;
> @@ -2333,17 +2330,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>         int ret;
>
>         mutex_lock(&ab->core_lock);
> +       ath11k_hif_irq_disable(ab);
> +       ath11k_hif_ce_irq_disable(ab);
>         ath11k_thermal_unregister(ab);
> -
> -       /*
> -        * ath11k_core_reset() already disabled the interrupts on the reset
> -        * path; only the firmware crash path reaches here with them live.
> -        */
> -       if (!ab->is_reset) {
> -               ath11k_hif_irq_disable(ab);
> -               ath11k_hif_ce_irq_disable(ab);
> -       }
> -
>         ath11k_dp_pdev_free(ab);
>         ath11k_cfr_deinit(ab);
>         ath11k_spectral_deinit(ab);
> @@ -2605,9 +2594,6 @@ static void ath11k_core_reset(struct work_struct *work)
>         time_left = wait_for_completion_timeout(&ab->recovery_start,
>                                                 ATH11K_RECOVER_START_TIMEOUT_HZ);
>
> -       ath11k_hif_irq_disable(ab);
> -       ath11k_hif_ce_irq_disable(ab);
> -
>         ath11k_hif_power_down(ab, false);
>         ath11k_hif_power_up(ab);
>
> --
> 2.34.1
>

