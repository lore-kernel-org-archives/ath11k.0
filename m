Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB67C25B78
	for <ath11k@archiver.kernel.org>; Tue,  4 Jun 2024 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bZhttX4fmcqJQHXacp2jwSZB4vJ6W3qLSAVsqkLGuw=; b=Vlf9XCKjtbYEx+7R6Ei0qR2bIv
	0xtGWwHLW98OGDPdN2ZLF04VdGxDjgkOPaLqwwBmt6DWLFE0rXIdMgL7es0jHjgHUO2AVZ64hn8Kw
	4PvAIDtsKNimCWhUKt/hhbKlw0+7fbv+Fl0BLIYCX1ogH36PzgU2C3pkK7aT3nsIx4NNAMzAndG98
	/HkW2uNcPmClYs44Q3J2kZ+rynIgKV86UhfasqHEVWRGqJgkZpeNgTGdziIQhOFTSs8soxQDmZfQf
	L09G87WNqO+2QMtLbAnMqZccCvyRHMtb1Ep8l2/79C2bAuqiOMTbTV3ahX3Zfo0WrgCBndc+Qtf9R
	LfHvJ2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEaTe-00000003giR-40IR;
	Tue, 04 Jun 2024 20:09:50 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEaTc-00000003gi3-1M5Q
	for ath11k@lists.infradead.org;
	Tue, 04 Jun 2024 20:09:50 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso5973735e87.3
        for <ath11k@lists.infradead.org>; Tue, 04 Jun 2024 13:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717531785; x=1718136585; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bZhttX4fmcqJQHXacp2jwSZB4vJ6W3qLSAVsqkLGuw=;
        b=lTNFM5yGqOWGhKpFWXkIIs892Jfy4RggrPB0J4CVQmcr9j7tJsJLvXz53pnk55Dfj/
         bbP+zUIcQRuuMoKWdLiImGdEX8raJvR9vYgOz22NGB1oTqfM0m2GEDmIvFobesbKB86c
         KIFDOp1MSgPiy7T9bFYOdiMuW2LwFtgzSyu+q64ZhH1iIyD1hpbXP+YiYLbaWl30l32Y
         jJHqlDSciINJkg50VcUIIuCqwzwO2TaGTBxxzc+V25xkM9spprkXqW8VOGT/TpcLXu+y
         4kj+PohGfscxjqTbchsIQ7F3A98qwhjrjeKj696q1eesX3Z/MmNuGTGJu+dRGleK+69F
         YqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717531785; x=1718136585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bZhttX4fmcqJQHXacp2jwSZB4vJ6W3qLSAVsqkLGuw=;
        b=UP2QWdGD2p5MEmko5RkLxDmkRpsqhjH54/XQPGRx0tABlXUPB8RuYFQs5fKKIoUX4H
         7XyrP4/sIpAUoT2oYmK6cKOe0I3BJXUeeaKbHEyzJUJz2RMgsffG9Mn30rlmPWCEgZcA
         QRGiApCwIa42j6jmqsfJ2ybe1PFqTJK5oRgoS7Zf/oRBAwVQb6n/5RdQmWBT1idOyIoA
         vj0hVeTUxmGcchTb6Q1vaZDlgLuPfTKEAC6fs3RviP5YKXivx91x65ewmq6piUxbHX7p
         veCcBxPFAqOHUw5ln4JCNxYd+wspeLYsg8jqEdcYk/7xA802VpzoQLiN+Hg3ZBxh1DE0
         UF6g==
X-Forwarded-Encrypted: i=1; AJvYcCXhZ2ts/Eg9q/AMST6w0GUgww4iSBoviqS65rr9Ahk+Ysg/b/y8BHVyp1g66XNBl41Mf/nMtdq3f6nyOg+HeetuHgFVx42ng7JjTA==
X-Gm-Message-State: AOJu0Yw+RmzH4P0EtNjJFpcwUDZ5KPsV707UXr3/tvSemU/wKS0O5HuQ
	pdr2hTwdARhwLnKW333iuT1SNT8VQw36QSjp/V0B4lm5lkqBXdVRcdaA6/snXeEuCfHZS4U9WCf
	QsvWJpRt/J7q/R/OTEIB+acRDMiw=
X-Google-Smtp-Source: AGHT+IEWJ36mlfu6fdpnSf7dS50CWGpD/LgGfZqMiTZZUCAChYp/NdC2Sz6F5igQZZ0uzeKLXvl5R11sVXdb0Ifylkk=
X-Received: by 2002:ac2:4884:0:b0:52b:79d3:6e87 with SMTP id
 2adb3069b0e04-52bab4f448emr364887e87.47.1717531784841; Tue, 04 Jun 2024
 13:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <CADS+iDX5=JtJr0apAtAQ02WWBxgOFEv8G063vuGYwDTC8AVZaw@mail.gmail.com>
 <19778bfe-19ad-4ee4-8f3b-80e7b124571f@quicinc.com> <7cd963ba-e4b0-4714-a814-983434589059@quicinc.com>
 <CADS+iDWeb39_FQQg2j6bk05BV73pOU=Ck+uBadeg+3Nnc6sKiA@mail.gmail.com>
 <CADS+iDUr=kVumMdBAU-AcaE-Q9TPN4K3dCe1C4KW2tqs7ziBKw@mail.gmail.com>
 <f736206e-b3bf-4a78-8ad3-262f6e1f4507@quicinc.com> <CADS+iDW+urkeQDuZYYVDsEg=WNGoq5PomAmg1dRLPySPM=2SUg@mail.gmail.com>
 <6b439fca-01a3-4a00-b542-26552dd30874@quicinc.com> <CADS+iDU4gq5iCyYwcNX8DC8=FSyViK4=X+UJMuCtYtBP_-u_UA@mail.gmail.com>
 <87o78hta3a.fsf@kernel.org>
In-Reply-To: <87o78hta3a.fsf@kernel.org>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Tue, 4 Jun 2024 22:09:33 +0200
Message-ID: <CADS+iDW7dEnpTxAQPuOPMB0Db7pTFBmLhV1WqqnSUSTadUW6zQ@mail.gmail.com>
Subject: Re: wcn6855 2.1 - slow download speed on any pairwise cipher except CCMP
To: Kalle Valo <kvalo@kernel.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_130948_390471_B6679BE3 
X-CRM114-Status: GOOD (  17.68  )
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

Hello!

On Tue, 4 Jun 2024, 09:56 Kalle Valo, <kvalo@kernel.org> wrote:
>
> Yaroslav Isakov <yaroslav.isakov@gmail.com> writes:
>
> > =D0=B2=D1=82, 4 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 03:55, =
Baochen Qiang <quic_bqiang@quicinc.com>:
> >
> >> On 6/4/2024 5:29 AM, Yaroslav Isakov wrote:
> >> > Hello! Thank you for patch! I tried to apply this patch on top of 6.=
9.3,
> >> > but it failed to apply - what kernel version should I use, to test i=
t?
> >> >
> >> That patch is based on ath-202405301555 tag of Kalle's ath.git:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/
> >>
> >> but I suppose it could also be applied cleanly on ToT of ath.git.
> >
> > Actually, it seems that when I was copying patch from patchwork,
> > something went wrong. I properly downloaded it, and it applied (with
> > few hunks) on top of 6.9.3. After rebuilding currently running kernel,
> > and reloading driver - GCMP-256 finally started showing same speeds on
> > download as on upload! Looks like the issue is fixed, thank you a lot!
>
> Great work, Baochen!
>
> Yaroslav, would you mind providing your Tested-by tag?

Sure! Trying it for the first time, so
Tested-by: Yaroslav Isakov <yaroslav.isakov@gmail.com>

>
> That way your
> work is also properly attributed in the patch. This is of course
> optional.
>
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

