Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41ACC64EC7
	for <ath11k@archiver.kernel.org>; Wed, 15 Feb 2023 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcAD5rmfk+sG/Q+1fuHEtznFLICPwFSeuTQdW2a2ERw=; b=ppraYgdCEPdZl8
	phX/m81F6h1+Y4YR8MdkRqoKrAKm7GyhUwHZlc4fqCuHfmKiYu3yXIwENDImgBQmrrXv/dUcjh/57
	FOIl+jqZ7ZSyyWH10QvbH1v+O5QMlZBoFIIW1utc01QivxsC+hdYK1CU/KacRHsQ0Vr5CKLk5N1rg
	y4OjIlbSiNHsBzL4ECNsTxHGAikUGZPRuLZTGERPpL276w+2TJ1NqVktR7kOtd1JAkhLROSWNy5JT
	4JoxJTpVCXpZJdM5svBqqtqIubJwJwh+O/J6xfCCcw8U031/24tdub5P+xwa30XmRY34gS/i5T1gS
	iXeh9UI9rup5YkIHhvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHTM-005uWS-0F; Wed, 15 Feb 2023 13:05:20 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHTI-005uV0-Ie
	for ath11k@lists.infradead.org; Wed, 15 Feb 2023 13:05:18 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-52ebee9a848so251330447b3.3
        for <ath11k@lists.infradead.org>; Wed, 15 Feb 2023 05:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k3jl06NnikfcuVY00mZXg6It9MxzIjeX1FKJCqs2aaY=;
        b=ZSszZwaoqJ0mPrKmgAeH6PgyJ5aiYpmEiuSD4sU8nE72z336FEbofgu0PmZy+IOjzS
         lyMh1HmsKJMWjSW3nnFgOfYydwgT7B8I/Wwjg7WDwxEG4kpqVLvj3VuTLMWSwgCpl/Q7
         J56eD6RwCisZuNHUDrRj5SHPUjnEmkYBPVwsj3ljUDjcT/yz8JGhpzIWcXxe55giKoGG
         QeP7VHt5kH7uRzU3LmSUXxBsRZib+6Jn2KaYJklueJEkTax46FdU2bfPqIcMKPAWjdgz
         eMMCEt6Ow8vizW79OTuje7FlDjkd+ABqE0y8zKfm+rQhl+jTXmXDWvchftJtQjhP9hzQ
         yXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3jl06NnikfcuVY00mZXg6It9MxzIjeX1FKJCqs2aaY=;
        b=DTNZjt/+GW/2OEpozQ8IITbwCp5cxlMT1fm2lo4e80wfdFQtw8Wdl/2cUfQYDRpbuZ
         M5jrhGfbCO1blJz5H/+DZ0OAbCWk9HupmFoPndutSfVOVsh24QOH/jMRsJBbFmYUd9Ky
         0CWuuH8w6TI98YuFjI0rhl3E5/PCLbPq3I4CKUjcPJasgObq9DgKcTNLzaJe501C3vMr
         hZ823VWqoX2Sn+NrNt4WqboSq0kQ6e350wbh2zO/meSM83FCDu7/3QTIpGrF7sga6Smt
         JwiXZSDglRs3+axtMxRYhqPHAUaC81Z2iTnSLWkHYYGM5RUb0gnGVaZ97yvlLkVjwwm1
         RsIw==
X-Gm-Message-State: AO0yUKUnQFBDNsS6rWOw4xeOOPUabcNv8cQIXIla0uBFs185+GGHqBdR
	R8zmG2nEwYOLHIQWLRk2gAMDanKFD4L7SrMdY4xZnPFS
X-Google-Smtp-Source: AK7set8KlqR+Lgemjc61wZTjP3xln5jAZNdqJmFxTB7isYxXIgRSoqj6db4552uanMG7WClGKStJB8UKZDUNAL22NS8=
X-Received: by 2002:a81:a50f:0:b0:52f:b76:e21d with SMTP id
 u15-20020a81a50f000000b0052f0b76e21dmr284771ywg.493.1676466311725; Wed, 15
 Feb 2023 05:05:11 -0800 (PST)
MIME-Version: 1.0
References: <CACp=KFTTOpKzDkMuGyYm3ynF53nqHLwdAqt79mMJLpCyTyy-Zw@mail.gmail.com>
 <87y1p1vjnl.fsf@kernel.org> <874jrnuvxe.fsf@kernel.org>
In-Reply-To: <874jrnuvxe.fsf@kernel.org>
From: Carsten Hatger <xmb8dsv4@gmail.com>
Date: Wed, 15 Feb 2023 14:04:59 +0100
Message-ID: <CACp=KFRWuxdZJpeB5V96fB7u+=CTnz0fS3OFsR6Mp4K6Cwg_PA@mail.gmail.com>
Subject: Re: FIX: Frequent wakeups on HP Pro x360 435 13.3 inch G9 using
 Qualcomm FastConnect 6900
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_050516_652383_804F1E04 
X-CRM114-Status: GOOD (  13.00  )
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

Thanks!

Best regards,
Carsten

On Wed, Feb 15, 2023 at 10:20 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> Kalle Valo <kvalo@kernel.org> writes:
>
> > Carsten Hatger <xmb8dsv4@gmail.com> writes:
> >
> >> To whom it may concern:
> >>
> >> I was experiencing frequent wake-ups from s0i3x on a HP Pro 435 G9
> >> convertible [1] using the Qualcomm FastConnect 6900 SoC [2]. The issue
> >> is related to FW revision
> >> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9 that comes
> >> bundled with Ubuntu 22.10. It appears the SoC increasingly triggers
> >> wake-ups after being suspended for approx. 4 hrs.
> >>
> >> Read the full story at [4].
> >>
> >> The solution is to upgrade SoC firmware to rev
> >> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23/ [3]
> >>
> >> Best regards,
> >> Carsten
> >>
> >> [1]
> >> https://support.hp.com/us-en/product/hp-pro-x360-435-13.3-inch-g9-notebook-pc/2101144107/document/ish_6053745-6053789-16
> >> [2] https://www.qualcomm.com/products/technology/wi-fi/fastconnect/fastconnect-6900
> >> [3]
> >> https://github.com/kvalo/ath11k-firmware/tree/master/WCN6855/hw2.0/1.1/WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> >> [4] https://gitlab.freedesktop.org/drm/amd/-/issues/2377
> >
> > Very good to know, thanks for the info. I'll try to submit that firmware
> > to linux-firmware ASAP.
>
> Here's the pull request:
>
> https://lore.kernel.org/ath11k/878rgzuw37.fsf@kernel.org/
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
