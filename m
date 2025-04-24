Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C44C369D5
	for <ath11k@archiver.kernel.org>; Thu, 24 Apr 2025 16:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Swkd1V9YcZF9JY4hyQxqrJMc9ulfvfPLwOf+MCgiHPQ=; b=AzxYse3KPG6PZG/nwHJ5oo2Dg2
	kzm6TQp1sDGV1B7Ixg9DO3LKVBTmZYJ5p1MxtxUBcYh0rPRqkDnJhhzRtu5CoZt1RHJdIfVyw8/LM
	6kabGHcvkLtrpJXTN4EziftFhRB/evTONkdKEgJpeKAKWZR03JUZBKogE8jV+JVVVabSdDwWilVcX
	1RZ3jo9GnnOS9VWVz5WRuAj2Ob9hoKDt6XSZ+V1g6zjAFPGU3F7W+V/ywydl+BxhpEcK7VGE4eLWM
	+oG6LKvMPyLbwv27sWf9aD8Pj697C1FQifhvit2q/lae0ta0G++gGg5st7aKeeGqSqp9n8BEpmrmO
	5fzOm3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3U-0000000EaTW-2MyJ;
	Thu, 24 Apr 2025 16:04:04 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vOG-0000000DyG1-1jMK
	for ath11k@lists.infradead.org;
	Thu, 24 Apr 2025 12:09:18 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-523eb86b31aso423540e0c.0
        for <ath11k@lists.infradead.org>; Thu, 24 Apr 2025 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moment-tech.20230601.gappssmtp.com; s=20230601; t=1745496555; x=1746101355; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Swkd1V9YcZF9JY4hyQxqrJMc9ulfvfPLwOf+MCgiHPQ=;
        b=038kKyR+eHwOVqtdWUNm+FDtAR7KnQWDJiIhl3z8Lha2pHqcvMT+U3mg1jP/yjNN/I
         GYHgMyNR/K3bkjMPH0vmAqLeKZR7Awgg94uj8EpYqcZDeTktvS8dYBKBBycITS9FZojN
         70t5ZaV3CiTGZqE65aYI+1kfueOB66lv7FisXDHfUQeB5M54erHsHAG3SladNurKTX+R
         xv78fFsjMT43S4kOCKvvT9K0FWgZ6yzDjGMAmSQhECtXOrG1t784cHMWUYefirikiUCd
         LyoXfipyYx//rMNYAmgL/MUJRFys1rWo5AuA1iPEsQxQjMaKwkjNc3mdYmMNHmmVTTTN
         MMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496555; x=1746101355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Swkd1V9YcZF9JY4hyQxqrJMc9ulfvfPLwOf+MCgiHPQ=;
        b=H0XUvYkh9g5hLs30PfD3LKridamiKcrTqu5KWtS9LdM08MeGCQQWykS61jFsdlLIFh
         bQS4JmBpbDxrteDgGmzY0BNopW1m/PvI7oTdxag5IS6nJ3xGr8s2sIHzxune5iu0h3MG
         +EvKWMhGayXgFSljQYaRUfklpSCE5B31PMtqerRZERzapDgN6s51Gb7B7bkWToYtEgQK
         v08Qpk2pn9yVi4CoNwu5i6ZFHYF4YPCuhV5DmYrnp36jyf1QXKExCFv+nesZm+fNmeOx
         PjwbatWjNmN5vIMwC0arLxLkpFjDXgbSEp/bAJhLDzBYhkifjCCOOQIhvmHKXlMzEVgZ
         d0sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuwHjO/qmKW2tUXwvOWmpXi7dtlt02AyaRL9huAUzPK0frTOLlyVhqwldbRYpfSZj2jQNVvjA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0J2i6oQ7Cn4i8CJkgCqFSAyiX2ZovS9dkli9vNdHGsAGvWPC4
	HGGLAIsxLh0MJptn932YU3OrCadlzPKW7bGFhsTQgne0V7T/DYPEY7T/tAQv8ikB+O7DTObJBgK
	pZv6DIqmNbohyxoBPbilTf2dJLvwEJ7B6pOGt+w==
X-Gm-Gg: ASbGncsBSrMHvPbeKZHQ9Rh52f/vl0og5ZAIVaLA7/d7qXnsYfsRQeAQhL4BFy0/CC3
	gDrBPllxMTZv+jOcRjXjiw1afxQHwj6qVRXmjIH1EysF0Fw5AtxlbeYSDBFS6I4dALP6/gfX5Z+
	FKPU2f/7kIiH4m4g/zf4Ba3Q275nOzF9zC7WI=
X-Google-Smtp-Source: AGHT+IHifdylEqptJ6hqGxBPWf2e2v10ROUSH+e06NnxStnIN+d+0cmOUDiU+X6v95z2bz1h59GMiaV+ClbRa4Hn45A=
X-Received: by 2002:a05:6122:8c05:b0:529:2644:8c with SMTP id
 71dfb90a1353d-52a783ad5afmr1150131e0c.8.1745496554647; Thu, 24 Apr 2025
 05:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250416100939.282481-1-balsam.chihi@moment.tech>
 <0e129e2a-67fc-48cc-9773-efbea3f7391d@quicinc.com> <fa16bad6-305f-77c1-3f56-703564e2dfee@quicinc.com>
 <CAONkfw6m9O_6FZHBrPYdpv+=AxSgsbh1T7+GaS+U+bnjyVVJvQ@mail.gmail.com>
 <3da5d47b-993c-405e-841f-1d16d8715610@quicinc.com> <1d0682c0-ee5d-f2d4-199d-4ebc4e71f9ef@quicinc.com>
 <3660fcfb-be29-422b-a352-3996ad3fc41f@quicinc.com>
In-Reply-To: <3660fcfb-be29-422b-a352-3996ad3fc41f@quicinc.com>
From: Balsam Chihi <balsam.chihi@moment.tech>
Date: Thu, 24 Apr 2025 14:08:39 +0200
X-Gm-Features: ATxdqUFy55GafIlTO6kRVpUbia3dHpuYOp-VHwdtaMZ5mzTJnRSp5Lo9WUSUEok
Message-ID: <CAONkfw5-bfYRwHZ9iHhgJP2f8Zqyz5SZVbdL4n9EPhKU+=ONPg@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: pci: Fix msi_irq crash on driver unload
 with QCN9074 PCIe WiFi 6 modules
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>, jjohnson@kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_050916_578076_1E244375 
X-CRM114-Status: GOOD (  22.70  )
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

Yes I of course I can help, i'm trying to reproduce the bug, by
rebuilding a clean distro without the patch.
and i will enable the debug_mask=3D0x1020 at boot via u-boot to kernel argu=
ments.
please let me know if is there anything else you would like to test.
just FYI, i'm using the official openwrt-v24.10.1 (with kernel 6.6.86
and mac80211 backported from kernel 6.12.6) on a Layerscape LS1088A.


On Thu, Apr 24, 2025 at 12:45=E2=80=AFPM Baochen Qiang <quic_bqiang@quicinc=
.com> wrote:
>
>
>
> On 4/24/2025 6:36 PM, Vasanthakumar Thiagarajan wrote:
> >
> >
> > On 4/24/2025 3:19 PM, Baochen Qiang wrote:
> >>
> >>
> >> On 4/24/2025 5:25 PM, Balsam Chihi wrote:
> >>> Hello,
> >>>
> >>> @Baochen Qiang,
> >>> Thank you for your feedback.
> >>> I tested unloading and reloading the driver and it is enumerated,
> >>> detected and operating correctly.
> >>
> >> Different hardware platforms may have different behaviors ...
> >>
> >>> And I understand your concern about other chips, and certainly it is
> >>> not the best way to implement such a fix.
> >>> I will continue debugging to determine the root cause of the
> >>> synchronous external abort.
> >>> So this patch is now just a workaround to fix the kernel crash when
> >>> rmmod the driver and reboot the system,
> >>> that i wanted to share with you to attract your attention to the
> >>> problem, and seek for help.
> >>>
> >>> @Vasanthakumar Thiagarajan,
> >>> Thank you too for your feedback.
> >>> Yes, I understand.
> >>> I will enable the debug_mask and check the logs, like you said.
> >>>
> >>> I'm wondering if anyone else has the same problem with ath11k_pci.a
> >>
> >> There is another issue report with the soc_global_reset register, alth=
ough it is reported
> >> on another hardware.
> >>
> >> Vasanth, could you check if the register address is correctly defined =
for QCN9074?
> >>
> >> #define PCIE_SOC_GLOBAL_RESET            0x3008
> >
> > That offset for global_reset is correct.
>
> Okay, then it should not be global_reset causing this.
>
> Balsam, could you help debug further to check which specific register acc=
ess is causing
> this issue? We can then check if the register is defined correctly or not=
.
>


--=20


Balsam CHIHI

Embedded Systems Engineer

06 42 90 57 24
3 Boulevard Richard Lenoir - 75011 Paris
Maximize profits with our latest guide to ancillary revenue strategies =F0=
=9F=93=8A

