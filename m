Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3D4C10F16
	for <ath11k@archiver.kernel.org>; Tue, 30 Apr 2024 13:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mrKZ5TJZ2Mv5S/evkpkvoZaYgr0TQcV7VnXiTMe0A8=; b=VNsq0PkYSwiBbh+ijontw5oW7X
	k0MCpXYX2RI6cOPr9RyBTVmGOS2e8BqWCApq5WjKsOzZ0RJG6mr+ACMBoyxKDvFs+uydhycAGr7z9
	KcCbh3xUD7TylijD8PDqRTQPw+cWVg8n3BCE6ZVg7BuDdLKIMsp0rpNIvzkocKR+2SHJOt6RqlM01
	X2K62lEs/2bRTfCeMz5uDtoN/dcD3Z7E4vdBozvAiZskSbdsoHRSX5ZJSVzIEMg34RD4G2wWu+veK
	YTII05fyg4WMb95J4yHcfJBvUMQiEzXvGIzZzFyhScS8iEyapUCmnrUrvnjXEPcCyt0AgFzQ5YeWL
	DL5ha/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1nAe-00000006R7T-22Xe;
	Tue, 30 Apr 2024 13:05:20 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1nAX-00000006R4V-3x0k
	for ath11k@lists.infradead.org;
	Tue, 30 Apr 2024 13:05:15 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso3115181a12.2
        for <ath11k@lists.infradead.org>; Tue, 30 Apr 2024 06:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714482312; x=1715087112; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9mrKZ5TJZ2Mv5S/evkpkvoZaYgr0TQcV7VnXiTMe0A8=;
        b=GLVIV8WLm0SBdkmaf2MhOU2GsJ4PIajd74Hu5S3eM9B4t55DmHRhOCrnQAfVSC36DO
         QSfo9WGGrtzXf0KB/4qwsR/doOi8N/vn2QHeHlt3/xRrRch79QEV7EbpNTZkO0Td1hUr
         eERKE2x38kdiy4EjHPVclEzstn56T6nwsVMekUYUrshz1zLeBSuVZb9fQUdw4nAB9x/6
         TZYXqbeqSeNhg2mS76cmt3FYVmTkM1b+ydW2V+mX3BcMl21wCN/J1XDRKTzjsJH7UZ1H
         RsGSW3t2z9tEfEHjzevJ9nRplBan+tSNmoUGYJeWIuiOMdCAgxDY6lsLY26xQJw5ORp5
         3+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714482312; x=1715087112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9mrKZ5TJZ2Mv5S/evkpkvoZaYgr0TQcV7VnXiTMe0A8=;
        b=tkT390/Agop0mB68KnZ2XkZANZN0mdu9BT0X1nfCqkfxMhsZ9LKHPKVdTLvr/qsc7B
         LbCb5KjfP+QHUxj5OXCDCf4MKsNF0k25XNoAtxEGCJCs4ot5cT6utHaWM6TItguPOyeO
         FyIMHp3gipweqsv3oCZTx7iT3ehisnrK8sPHwtlTjhXJn1LhYi+Iz8O/vdrTUbKA7Xq0
         nZnXtKhK6Bj3Hi5uI/q5kaUDAzJ3cevK01df+qV9mNpDth6KwdvYtmU9RmW/XUc33jvK
         V/2DWQGuXpkIfNed4sbuMcoawEOYgpO8ZIuWaWu7Mk2/yqlb6F0/HKsyUlCl2sewU4qz
         aXAg==
X-Forwarded-Encrypted: i=1; AJvYcCVtpdUWSlA/frSRB0Odwcls0C4/4dlhFVQHsih7GmOJl7YlxQnMNflEGSkLtpLSROrJTbgczwtujlrLOYXUFar4R1jKNWXFzpG87Q==
X-Gm-Message-State: AOJu0Yx57Ej72kNTAeOrqqaj+A+nHhe11//tLtrUUJRTXYP56ARnnMRd
	5boAZoRbAjI8TtHtqi8m09GmpELP4CzyD8xODQo49BHTZSI29sugLfmA/9k0WKMDlPeA1pgQ1JV
	bA1gVfEyP16h1LSfIo6hR0L+Qimc=
X-Google-Smtp-Source: AGHT+IFEoZzsaBxiMsS/weAW0oQqtGK/FQ4I0GMpyOV5lfI5soEmpYztHkLsyVd/f/dRgFtHBR07N6i6FSCL2mf92n0=
X-Received: by 2002:a17:902:d481:b0:1e4:47bf:6926 with SMTP id
 c1-20020a170902d48100b001e447bf6926mr15856853plg.4.1714482311735; Tue, 30 Apr
 2024 06:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <48174971-4b30-4046-9710-2acb16990e07@westermo.com>
 <87ttlvjk6l.fsf@kernel.org> <87il00qpjp.fsf@kernel.org> <4889305.GXAFRqVoOG@bentobox>
 <CAOX2RU4+j0GG+RxKDOF2qFWFBOZEo1+nLZt8FwNqJ30Qo1jjLg@mail.gmail.com>
 <87plu7p77m.fsf@kernel.org> <CAOX2RU4wrz9WE01MuPaPShnK39O08__7k0xzYtdnC-1hTcVrzQ@mail.gmail.com>
 <87h6fjovfe.fsf@kernel.org>
In-Reply-To: <87h6fjovfe.fsf@kernel.org>
From: Robert Marko <robimarko@gmail.com>
Date: Tue, 30 Apr 2024 15:05:00 +0200
Message-ID: <CAOX2RU7iw1zEzCOWxg0NDUHx+bO3UnjntenRXnoN9bqfDDwYwQ@mail.gmail.com>
Subject: Re: Question to recent Qualcomm CVEs
To: Kalle Valo <kvalo@kernel.org>
Cc: Sven Eckelmann <sven@narfation.org>, Tanjeff Moos <Tanjeff.Moos@westermo.com>, 
	openwrt-devel@lists.openwrt.org, Felix Fietkau <nbd@nbd.name>, ath11k@lists.infradead.org, 
	Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_060514_060772_F2C963D9 
X-CRM114-Status: GOOD (  26.96  )
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

On Tue, 30 Apr 2024 at 15:02, Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robimarko@gmail.com> writes:
>
> > On Tue, 30 Apr 2024 at 10:48, Kalle Valo <kvalo@kernel.org> wrote:
> >
> >>
> >> Robert Marko <robimarko@gmail.com> writes:
> >>
> >> > On Mon, 29 Apr 2024 at 15:37, Sven Eckelmann <sven@narfation.org> wrote:
> >> >>
> >> >> On Monday, 29 April 2024 15:14:18 CEST Kalle Valo wrote:
> >> >> > It's quite strange that they updated 2.5.0.1 branch first but my
> >> >> > understanding that there should be updates for the newer 2.7.0.1 branch
> >> >> > as well (2.7.0.1 branch is also in linux-firmware).
> >> >>
> >> >> Yes, I also told them in the support ticket that this is from an older branch
> >> >> than what is currently shipped in linux-firmware.git. But they told me
> >> >> that they are working on newer versions (whatever that means) - but they
> >> >> wanted to  handle first the update to ATH.11.4 (2.5.0.x) and then
> >> >> step-by-step release it for newer firmware branches. It seem like that would be
> >> >> up to 2.9.0.x - no idea why there is no (public) 2.10.x/2.11.x for the AP
> >> >> SoCs.
> >> >
> >> > I would like to point out that IPQ6018 doesn't even have anything
> >> > newer than 2.5.0.1 available publicly.
> >>
> >> But I do see WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1 for IPQ6018:
> >>
> >> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/main/IPQ6018/hw1.0/2.7.0.1/WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1?ref_type=heads
> >>
> >> And that release seems to be also in linux-firmware:
> >>
> >> File: ath11k/IPQ6018/hw1.0/q6_fw.mdt
> >> Version: WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> >>
> >> Am I missing something? Or did you mean IPQ5018 which only has a release
> >> from 2.6.0.1 branch?
> >>
> >> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/main/IPQ5018/hw1.0?ref_type=heads
> >
> > Ah yes, sorry for the confusion, I meant to say newer than 2.5.0.1
> > that actually works.
> > All of the newer public FW than 2.5.0.1 that we tried in OpenWrt will
> > just crash, we had the same issue with 2.6 and 2.7 FW on
> > IPQ8074 and it was fixed in 2.9.0.1 but there is no 2.9.0.1 public for IPQ6018.
>
> Ah, is the issue you are talking about this bug:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=216515
>
> Or is this another issue?

Yeah, that is the issue for IPQ8074, we just skipped the 2.6 and 2.7
FW and went for 2.9.

For IPQ6018 it seems that we have BDF compatibility issues with most
FW newer than 2.4 or 2.5 max.
Its been some time since I last checked what boards work with what FW
on IPQ6018.

Regards,
Robert

>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

