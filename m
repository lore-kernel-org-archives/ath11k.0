Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44641C4345F
	for <ath11k@archiver.kernel.org>; Tue, 30 Apr 2024 13:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdkiHokNv6ssCzl4HXoRnnfeHa+m85xCQnOk9v5A2Bo=; b=HUq6ffVJ5qATMEYgqXeCeH7cmK
	PnCHQOxo4Pcr/fqqMG9u33CupJFy6YuVT/AY+8lltve17eWH8FHi6+SyazrfZaaYrN4tm3yc4Jukg
	HXlhsXMD7KD1xBRun/uALORGpfFPKDsRnvG/4ojXAB0qEagxxw9gav0RAPzSqbaYveSKc4ROP1zav
	jvQPZZ9qAT6cxkfbib597z3+qCNDCEBN5Tnu2QYyHPdDblZMGDesHUbImKhxAKySs1RJL4R6EZKBw
	4TbbJtdceRHbXV/SjC8xdWS/gx4Jv4cXDh+0wFtAv82mQhLU3G5LAOBT7RBotV/N9wYWGuoNKf0dA
	oddPfLUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1nHE-00000006SYt-3FOm;
	Tue, 30 Apr 2024 13:12:08 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1nH9-00000006SXg-48KI
	for ath11k@lists.infradead.org;
	Tue, 30 Apr 2024 13:12:05 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-78f0440656eso353341785a.1
        for <ath11k@lists.infradead.org>; Tue, 30 Apr 2024 06:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714482719; x=1715087519; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UdkiHokNv6ssCzl4HXoRnnfeHa+m85xCQnOk9v5A2Bo=;
        b=LEKSdJO4RZEZlC7GPo9gEqQILHk1syJXItGRFuEKwyd8RCO+LWMx+d14IuMS0U1hec
         sMntSsLuY1mp3DcLuTlO3shk8krlcjIJndJ3MABiAN0eZDepQUpaFCCI4tuzEPJtAZfz
         czvxuEIw2DkSeQC+Qu76zCZk2Q/LV1rcS/cmjfutuJfst3YE+uUe/33bj6UU3Ukhh9rE
         +Cp7h1YyLkxyX+MmMM9xtaPo35c5vcns5+NVpwKU4/asI6jo/wRN5CtJSEEKV14UlWDo
         7qdB93nlyd4UD5u8sYmiP4LVPr/JdVWzYiIbjn8GTy1ugC5iCTdbAwoKD2zEMZz/Va/q
         NzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714482719; x=1715087519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdkiHokNv6ssCzl4HXoRnnfeHa+m85xCQnOk9v5A2Bo=;
        b=h4dyXBX9k4JsCGAajPnC2AABlbZSHBvl5XopmoRHDQkdm13lHDAI04pAVrGZOHtinm
         c2bl8CLnqehkUbeJrsMjRbEVIVEcsoPIect5qG6XFnfFpiPqYX7CEolMO8vq0Gz2YF5N
         Ww0azKV+LxL06n/vEGAOMU7JR4Dey8iRrB39wy1MfURmYnaBL/+mfJ9PNSD93ycmuX24
         XpQ4vBQ9ocQY40ofxUc+Bwrapty9tglaug4+ozkyFRzy6VdMV/dS2x8cZLCQGAdCrdXc
         5VhDK23VEaiDL8hFdy0bCqGTIowijCzZg5UsPlPii0LejY54sAQy94fXGTwXuakSlUNR
         ZR9w==
X-Forwarded-Encrypted: i=1; AJvYcCXHT1k4t68/TnEho8VN8UYjtZg6WFO/k9vJVHCow9kgjqDHDZqrdvTn/wexMp/eo+KHL6dsHDuUUaShKgsGbCqyHs8+opeQF7eo6g==
X-Gm-Message-State: AOJu0YwnHtqqu3VtIwyUQwCzkDJo2zK8pyhyeFyQvYZFUPIiMRM7DE2C
	3s2Kg+pfwAg37gEq8KX8hdl/0ccn8MTyeEbEdmCnRTX2SmYTk2LuXUHNTA6rorM1CRMwTmEW++/
	hLi0UdETrgv/sbq6a5sIFJBN7beI=
X-Google-Smtp-Source: AGHT+IE61m7CQwcmd03csLy7g14kG9yH0+WXjr9kokWQjHFXEn/Ynk7OBcx4WY09t6FDwF8FHQxiapSna1G6evJuxsg=
X-Received: by 2002:a05:6214:40e:b0:6a0:cd6b:63e1 with SMTP id
 z14-20020a056214040e00b006a0cd6b63e1mr2518695qvx.64.1714482718609; Tue, 30
 Apr 2024 06:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <48174971-4b30-4046-9710-2acb16990e07@westermo.com>
 <87ttlvjk6l.fsf@kernel.org> <87il00qpjp.fsf@kernel.org> <4889305.GXAFRqVoOG@bentobox>
 <CAOX2RU4+j0GG+RxKDOF2qFWFBOZEo1+nLZt8FwNqJ30Qo1jjLg@mail.gmail.com>
 <87plu7p77m.fsf@kernel.org> <CAOX2RU4wrz9WE01MuPaPShnK39O08__7k0xzYtdnC-1hTcVrzQ@mail.gmail.com>
 <87h6fjovfe.fsf@kernel.org>
In-Reply-To: <87h6fjovfe.fsf@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 30 Apr 2024 15:11:45 +0200
Message-ID: <CA+_ehUxKa6CA2rgkP58dcPJ9hk1JbBgeb1qhRnQ855DMtRsZjw@mail.gmail.com>
Subject: Re: Question to recent Qualcomm CVEs
To: Kalle Valo <kvalo@kernel.org>
Cc: Robert Marko <robimarko@gmail.com>, Sven Eckelmann <sven@narfation.org>, 
	Tanjeff Moos <Tanjeff.Moos@westermo.com>, openwrt-devel@lists.openwrt.org, 
	Felix Fietkau <nbd@nbd.name>, ath11k@lists.infradead.org, 
	Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_061204_056039_EB71592F 
X-CRM114-Status: GOOD (  27.00  )
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

Il giorno mar 30 apr 2024 alle ore 15:04 Kalle Valo <kvalo@kernel.org>
ha scritto:
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
>

Yes we wasted a good time on that and we concluded that
2.6.0 and 2.7.0 introduced breaking change in how the BDF was parsed
that were fixed in 2.9.0 restoring support for legacy BDF.

I think almost all ipq60xx suffer from this... Only a Qnap 301 worked with
2.6.0 - 2.7.0 (that was ipq807x)

