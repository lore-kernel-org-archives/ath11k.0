Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765A3C27C52
	for <ath11k@archiver.kernel.org>; Tue,  4 Jun 2024 07:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1yckglTpRdysd8Uhx29ixjllHNZ0X/VhK20bsOQNGE=; b=s3/0E6M0ZV6+jqGJGJiLWuz70b
	4CihcBfxzsLPW7aNcyVt2Cdj6yvA+d1FcY9u9YykRWuPAg3HWftKS52hVQ60c/nBFfptwSahIKtkh
	1UPI8IFh8iwbFNs1TPJh0aFiGAuHvO0UFESloj4AYREdX26Zi2wz+664hmNYArQwfUFdtXgAXcDNE
	0ZQOnHiihY478EN2BgmcJz3FPogvWiEirT2v4Inw4mUkf9aDFwNbmTyIlTU8QfRHFYQryVnluqu6h
	Yxvs10t875NmWSYsfMsvFT/EyhqcsE0idZFRriptDwmbubtIl24YYgCrnXiXR8h0CHycgWj5DfwCr
	K4kbbkpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOZX-00000001Vq4-3t4N;
	Tue, 04 Jun 2024 07:27:07 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOZV-00000001VpX-0ffG
	for ath11k@lists.infradead.org;
	Tue, 04 Jun 2024 07:27:06 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5295eb47b48so740656e87.1
        for <ath11k@lists.infradead.org>; Tue, 04 Jun 2024 00:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717486021; x=1718090821; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1yckglTpRdysd8Uhx29ixjllHNZ0X/VhK20bsOQNGE=;
        b=R+/X8zYw13NxltfDdGrABR4zX/Oj9OhgoPK3/ZTbNek+8KnEa8n4UIE5x8vQmpzROI
         WJMhjouG71rY0lRHt7PP4p8cwlntiO/BeU9vbtK7nvmkXRy5Bcat5Gd8H2xGy9iWEEWH
         uDj+8kJTeG1ZTowQ9ZN+dj37YqvDWk53G0Rtl0MFH5U5vdZVX4eYS+0gfIxqgCJ65O4H
         Ezn7R50KotED0Gm3TN0e0pL/gV+fgWmXAUPfn2opW+dwIr/H90JT5wseMh+J4ep8VTM4
         4oYDVeX6niOQ5sJRd0oE3Xm1/INX3umPjKG/eaxldCWmrwUA4A17SCGDiWSVvWIXy+qR
         /S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717486021; x=1718090821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1yckglTpRdysd8Uhx29ixjllHNZ0X/VhK20bsOQNGE=;
        b=rNjg4d/WnTLxGVlMyPKwIJlkh6MXYs5BvMFSqg/M4zXToT/SSKAg6ExajXAqY6wtcO
         SqkmNMCnRjtw1Sg6Bq995uDjJdOnwzgq5yKm86yo5bMQcfb6qJ9P4wjY6+WXoI86tv22
         Cy72H7JAMquk9iJpgHRUBHKxUs4xVu0zd0Jgguapny+WRhHhudSOyz9Gz2u9DZVWeteS
         9PJ8nEOpPggI1SeP7ASVoA2SWFHue4+h7EgvF4qhXmFUrB3et9LKysn3gPJ762iMXbly
         o2XqzLdASPSQ6s/XtmJ/WYl+fxkElPzHaq+gUVWN3usjePbCEmNxOw3z3VTnRpF8dx4w
         Ovnw==
X-Forwarded-Encrypted: i=1; AJvYcCV/Pixgrxz7kKiEtSpdSe/igRk0MReaECWY+Fl7TBX02OA9ts2iKPvXnD7s4Elu4TR/mX5uJ2vTmuPSTKSAi2aWRkffjjNxnMfNMw==
X-Gm-Message-State: AOJu0YyIyqnbAuNuwAzTZc4zbXgHzQAeHxNdkLIezJuNm0BAwLuHAoV6
	pwIgvlXRyE6obrVCUD8hP80dbybIj9tN02UE1el5jv/icVWUbMiWddDD0krb9MOKhMxP1QOrWqb
	FaQnuyvGrz4tuRKX3wYO6VTD7WNw=
X-Google-Smtp-Source: AGHT+IE8lauQRanJdP6EbN5DT/LCGX6CQpKvemrwznFtm7vrCObR2K1bv5EWZVLVLav0CNxorsopZhUGJLuzPtoB3QI=
X-Received: by 2002:a05:6512:15a2:b0:52b:9635:1c64 with SMTP id
 2adb3069b0e04-52b96351ed2mr5439195e87.30.1717486020609; Tue, 04 Jun 2024
 00:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <CADS+iDX5=JtJr0apAtAQ02WWBxgOFEv8G063vuGYwDTC8AVZaw@mail.gmail.com>
 <19778bfe-19ad-4ee4-8f3b-80e7b124571f@quicinc.com> <7cd963ba-e4b0-4714-a814-983434589059@quicinc.com>
 <CADS+iDWeb39_FQQg2j6bk05BV73pOU=Ck+uBadeg+3Nnc6sKiA@mail.gmail.com>
 <CADS+iDUr=kVumMdBAU-AcaE-Q9TPN4K3dCe1C4KW2tqs7ziBKw@mail.gmail.com>
 <f736206e-b3bf-4a78-8ad3-262f6e1f4507@quicinc.com> <CADS+iDW+urkeQDuZYYVDsEg=WNGoq5PomAmg1dRLPySPM=2SUg@mail.gmail.com>
 <6b439fca-01a3-4a00-b542-26552dd30874@quicinc.com>
In-Reply-To: <6b439fca-01a3-4a00-b542-26552dd30874@quicinc.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Tue, 4 Jun 2024 09:26:49 +0200
Message-ID: <CADS+iDU4gq5iCyYwcNX8DC8=FSyViK4=X+UJMuCtYtBP_-u_UA@mail.gmail.com>
Subject: Re: wcn6855 2.1 - slow download speed on any pairwise cipher except CCMP
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_002705_297034_4533EC58 
X-CRM114-Status: GOOD (  30.80  )
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

=D0=B2=D1=82, 4 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 03:55, Baoc=
hen Qiang <quic_bqiang@quicinc.com>:
>
>
>
> On 6/4/2024 5:29 AM, Yaroslav Isakov wrote:
> > Hello! Thank you for patch! I tried to apply this patch on top of 6.9.3=
,
> > but it failed to apply - what kernel version should I use, to test it?
> >
> That patch is based on ath-202405301555 tag of Kalle's ath.git:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/
>
> but I suppose it could also be applied cleanly on ToT of ath.git.
Actually, it seems that when I was copying patch from patchwork,
something went wrong. I properly downloaded it, and it applied (with
few hunks) on top of 6.9.3. After rebuilding currently running kernel,
and reloading driver - GCMP-256 finally started showing same speeds on
download as on upload! Looks like the issue is fixed, thank you a lot!
>
>
> > On Fri, 31 May 2024, 04:18 Baochen Qiang, <quic_bqiang@quicinc.com> wro=
te:
> >
> >>
> >>
> >> On 4/15/2024 7:26 PM, Yaroslav Isakov wrote:
> >>> Hello!
> >>>
> >>> =D0=B2=D1=81, 14 =D0=B0=D0=BF=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 10:1=
2, Yaroslav Isakov <yaroslav.isakov@gmail.com
> >>> :
> >>>>
> >>>> Hello!
> >>>>
> >>>> =D0=B2=D1=82, 2 =D0=B0=D0=BF=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 02:3=
5, Baochen Qiang <quic_bqiang@quicinc.com>:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 4/1/2024 10:53 PM, Jeff Johnson wrote:
> >>>>>> On 3/31/2024 8:49 AM, Yaroslav Isakov wrote:
> >>>>>>> Hello! When I tried to switch my OpenWRT router from default CCMP
> >>>>>>> pairwise cipher to any other, supported by both my router (Asus
> >>>>>>> TUF-AX6000) and my laptop (Thinkpat T14 Gen 4 AMD with WCN6855 2.=
1),
> >> I
> >>>>>>> saw that download dropped from 1Gbit/s to 100 MBit/s. When I chan=
ged
> >>>>>>> back to CCMP, download speed recovered back to 1Gbit/s. Upload sp=
eed
> >>>>>>> is good, though, for all ciphers - 1Gbit/s.
> >>>>>>>
> >>>>>>> Initially, I thought, that issue with either router hardware, or
> >>>>>>> openwrt driver - but, I tested the same settings on another lapto=
p -
> >>>>>>> T14 Gen3 Intel - and with Intel WIFI, both download and upload sp=
eed
> >>>>>>> was 1Gbit/s on any pairwise cipher.
> >>>>>>>
> >>>>>>> This issue is 100% reproducible for me, it happens all the times =
I'm
> >>>>>>> switching to any pairwise cipher other than CCMP.
> >>>>>>>
> >>>>>>> I'm on Linux 6.7.6, compiled from sources on Gentoo.
> >>>>> I'm not familiar with Gentoo, is there any private changes in it
> >>>>> compared to upstream ath11k? If there indeed is, could you try Kall=
e's
> >>>>> ath11k tree?
> >>>>>
> >>>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/
> >>>>>
> >>>> Sorry, missed the message. Gentoo kernel I'm using is very close to
> >>>> upstream. I will try ath11.git, and will report there, thank you.
> >>>>
> >>>
> >>> I checked ath.git, master branch - it has the exact same behavior as
> >>> kernel I used - 1Gbit download with CCMP, 100Mbit download with GCMP.
> >>> For me, this issue is easily reproducible, it happens 100% if I'm
> >>> switching to pairwise_cipher (and therefore, groupwise, too) other
> >>> than CCMP.
> >> I just submitted a patch which may fix this issue, could you merge it =
and
> >> try again?
> >>
> >>
> >> https://patchwork.kernel.org/project/linux-wireless/patch/202405310212=
28.2846-1-quic_bqiang@quicinc.com/
> >>
> >>>>>>>
> >>>>>>> Here is my dmesg for ath11k:
> >>>>>>> [   13.092519] ath11k_pci 0000:02:00.0: BAR 0: assigned [mem
> >>>>>>> 0x78600000-0x787fffff 64bit]
> >>>>>>> [   13.093400] ath11k_pci 0000:02:00.0: enabling device (0000 ->
> >> 0002)
> >>>>>>> [   13.095723] ath11k_pci 0000:02:00.0: MSI vectors: 32
> >>>>>>> [   13.096260] ath11k_pci 0000:02:00.0: wcn6855 hw2.1
> >>>>>>> [   13.974707] ath11k_pci 0000:02:00.0: chip_id 0x12 chip_family =
0xb
> >>>>>>> board_id 0xff soc_id 0x400c1211
> >>>>>>> [   13.974732] ath11k_pci 0000:02:00.0: fw_version 0x1106196e
> >>>>>>> fw_build_timestamp 2024-01-12 11:30 fw_build_id
> >>>>>>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> >>>>>>> [   14.315774] ath11k_pci 0000:02:00.0: Failed to set the request=
ed
> >>>>>>> Country regulatory setting
> >>>>>>> [   14.316046] ath11k_pci 0000:02:00.0: Failed to set the request=
ed
> >>>>>>> Country regulatory setting
> >>>>>>> [  337.889222] ath11k_pci 0000:02:00.0: failed to enqueue rx buf:=
 -28
> >>>>>>>
> >>>>>>
> >>>>>> There was another reporting of that error in this thread:
> >>>>>>
> >> https://lore.kernel.org/all/5c63a3a2-29fe-444c-96f1-f87c89d7af39@gmail=
.com/
> >>>>>>
> >>>>> I don't think this is the same issue as reported by James there
> >> although
> >>>>> same error message. For now I don't know the root cause to that mes=
sage
> >>>>> but it's unlikely it causes some tput issue.
> >>>>>
> >>>>> Let's wait for Yasoslav verifying it on latest ath.git.
> >>>>>
> >>>>>> +Baochen Qiang for awareness
> >>>>>>
> >>>>>> /jeff
> >>
> >

