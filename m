Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B608C4345F
	for <ath11k@archiver.kernel.org>; Mon, 15 Apr 2024 11:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/K2PqjTQyQgYqRT5pN9iO/vdh21jU+eODfC8847dTNM=; b=Yqrohdx2+1ZFL3n1w8m2Z/MKxu
	9i/48g3hg2yBlHcXZyuJwVZ0EmyOD4X8pNK0bUQGIY9q3l+erYdhyC5JRJBLOUeEsMUxbpi2wCURL
	TiovU8k88QvFNFwMZdV16r/MF0QV1q2ezjTKZcEQQw9wYInYTR53D+4uDlPsZznFpPNPjVCgQmDDy
	0V7ckD7nRPFXqKrNGpK5I3t+9aIP4VGgQS62D79WMbeNkVZlL4s5kPUTh6S7V/FClf+KhWtQfY6ur
	jvJBdOFpErG29d4gHka5BL6LSdlFXD6Xf+GF9hLIbLmaGZ88LDcUfGTHbXBouvNIKt7SEkC0v3sJk
	1uTKkPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwKUU-000000082FG-2ck2;
	Mon, 15 Apr 2024 11:27:14 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwKUR-000000082EM-2IPt
	for ath11k@lists.infradead.org;
	Mon, 15 Apr 2024 11:27:13 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-56fe7dc7f58so2427315a12.2
        for <ath11k@lists.infradead.org>; Mon, 15 Apr 2024 04:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713180425; x=1713785225; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/K2PqjTQyQgYqRT5pN9iO/vdh21jU+eODfC8847dTNM=;
        b=LETYjYPuAz5IK1zLXai0lAS89kfpmnmBH12Y48zjcr60Iv1bfw1/G09hM+tJvdNGLI
         vaqVoeoMTkf85EcOQzGt9ltSUAPABwnK1ajfT2DAiKf8rTqqf4pH+C6j5K0eVjlJUPr9
         B3LKhkFjNAkGY4/L6S5LqNsCl3cWWtABSKEvnYB285PIqyCS+9/SMosDdiVuSlKC/EmH
         W8UdlOoAV7lkDNY1pvGh2l9kPbfv2Mb5Ej3DfTXltB0faTqgwonJohK7u7e5GDRCHRmr
         Dpb5gi23Llc6RJ4CkBtRHIMjVJbbwg+lRNsUjbB2TgZqe88OxV2QVOFSG/F3H60Ifxat
         Z3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713180425; x=1713785225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/K2PqjTQyQgYqRT5pN9iO/vdh21jU+eODfC8847dTNM=;
        b=VI2EBiN/XiH7oz91Gwczl2i7WZgQKwPClKvdES2WG3o2uthGWoBEAUBdiyPN031Riw
         NQ/Sjj7rYWIAOfIYpNIFfV/yQ3t41xIkyN85kVVw38Wtp0axxk90dH1DvDZzoeKwg7sq
         RwKgxq/nWfATDhC+nzLm9cNySyB4Hcgb9mZzblMfMF4KT01DfEVU/lknbqDuwtqsGzQW
         /bbvEQVowufC1dLEeM06Z1ZA523VbamcOZELxhoGHjaRV7mpRirp8udryQL4MrJzK0hn
         AahESsEet5hQlKMvTzvys7LQSHs740zdSf/ud9md8TS5koFNpv7eTzlEp5p1gUXS0nOZ
         wxAA==
X-Forwarded-Encrypted: i=1; AJvYcCXtX9O0mWg+reooNzW98sDpOqaQKvOmeAJiju+JjdLhaVDfmga6FkzCUqXVNu6Y8taHu7KyBBcY7xqWeAuvZjWx2z0OA93gBNYEEg==
X-Gm-Message-State: AOJu0Yyy1Yf31x2wL6OyJFEFk7uUMUvpEvJIZbKi3uYhZzFrneqxjn6o
	ZNwY1TzA1cDEb+YHbtQxajKVidRwNifh+P0Tqg4lew8MO3oMYkzLazcs783r2tucCCAmH0I9xIf
	LfCzRbPzAgKkGF06HZbZULe+UgE/fSg==
X-Google-Smtp-Source: AGHT+IGS5rh+f4qcqE62ebFbGxLB5DrHzTkhTZb66+iyP4q1lU4iT8Ev07ddm5Z+ylmP7dLyINyPFw/g83E3bTNS+ww=
X-Received: by 2002:a50:cd82:0:b0:56e:2e17:a3d1 with SMTP id
 p2-20020a50cd82000000b0056e2e17a3d1mr7775649edi.25.1713180424342; Mon, 15 Apr
 2024 04:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <CADS+iDX5=JtJr0apAtAQ02WWBxgOFEv8G063vuGYwDTC8AVZaw@mail.gmail.com>
 <19778bfe-19ad-4ee4-8f3b-80e7b124571f@quicinc.com> <7cd963ba-e4b0-4714-a814-983434589059@quicinc.com>
 <CADS+iDWeb39_FQQg2j6bk05BV73pOU=Ck+uBadeg+3Nnc6sKiA@mail.gmail.com>
In-Reply-To: <CADS+iDWeb39_FQQg2j6bk05BV73pOU=Ck+uBadeg+3Nnc6sKiA@mail.gmail.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Mon, 15 Apr 2024 13:26:53 +0200
Message-ID: <CADS+iDUr=kVumMdBAU-AcaE-Q9TPN4K3dCe1C4KW2tqs7ziBKw@mail.gmail.com>
Subject: Re: wcn6855 2.1 - slow download speed on any pairwise cipher except CCMP
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_042711_631429_5F2BF648 
X-CRM114-Status: GOOD (  26.25  )
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

=D0=B2=D1=81, 14 =D0=B0=D0=BF=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 10:12, Yar=
oslav Isakov <yaroslav.isakov@gmail.com>:
>
> Hello!
>
> =D0=B2=D1=82, 2 =D0=B0=D0=BF=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 02:35, Ba=
ochen Qiang <quic_bqiang@quicinc.com>:
> >
> >
> >
> > On 4/1/2024 10:53 PM, Jeff Johnson wrote:
> > > On 3/31/2024 8:49 AM, Yaroslav Isakov wrote:
> > >> Hello! When I tried to switch my OpenWRT router from default CCMP
> > >> pairwise cipher to any other, supported by both my router (Asus
> > >> TUF-AX6000) and my laptop (Thinkpat T14 Gen 4 AMD with WCN6855 2.1),=
 I
> > >> saw that download dropped from 1Gbit/s to 100 MBit/s. When I changed
> > >> back to CCMP, download speed recovered back to 1Gbit/s. Upload speed
> > >> is good, though, for all ciphers - 1Gbit/s.
> > >>
> > >> Initially, I thought, that issue with either router hardware, or
> > >> openwrt driver - but, I tested the same settings on another laptop -
> > >> T14 Gen3 Intel - and with Intel WIFI, both download and upload speed
> > >> was 1Gbit/s on any pairwise cipher.
> > >>
> > >> This issue is 100% reproducible for me, it happens all the times I'm
> > >> switching to any pairwise cipher other than CCMP.
> > >>
> > >> I'm on Linux 6.7.6, compiled from sources on Gentoo.
> > I'm not familiar with Gentoo, is there any private changes in it
> > compared to upstream ath11k? If there indeed is, could you try Kalle's
> > ath11k tree?
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/
> >
> Sorry, missed the message. Gentoo kernel I'm using is very close to
> upstream. I will try ath11.git, and will report there, thank you.
>

I checked ath.git, master branch - it has the exact same behavior as
kernel I used - 1Gbit download with CCMP, 100Mbit download with GCMP.
For me, this issue is easily reproducible, it happens 100% if I'm
switching to pairwise_cipher (and therefore, groupwise, too) other
than CCMP.
> > >>
> > >> Here is my dmesg for ath11k:
> > >> [   13.092519] ath11k_pci 0000:02:00.0: BAR 0: assigned [mem
> > >> 0x78600000-0x787fffff 64bit]
> > >> [   13.093400] ath11k_pci 0000:02:00.0: enabling device (0000 -> 000=
2)
> > >> [   13.095723] ath11k_pci 0000:02:00.0: MSI vectors: 32
> > >> [   13.096260] ath11k_pci 0000:02:00.0: wcn6855 hw2.1
> > >> [   13.974707] ath11k_pci 0000:02:00.0: chip_id 0x12 chip_family 0xb
> > >> board_id 0xff soc_id 0x400c1211
> > >> [   13.974732] ath11k_pci 0000:02:00.0: fw_version 0x1106196e
> > >> fw_build_timestamp 2024-01-12 11:30 fw_build_id
> > >> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> > >> [   14.315774] ath11k_pci 0000:02:00.0: Failed to set the requested
> > >> Country regulatory setting
> > >> [   14.316046] ath11k_pci 0000:02:00.0: Failed to set the requested
> > >> Country regulatory setting
> > >> [  337.889222] ath11k_pci 0000:02:00.0: failed to enqueue rx buf: -2=
8
> > >>
> > >
> > > There was another reporting of that error in this thread:
> > > https://lore.kernel.org/all/5c63a3a2-29fe-444c-96f1-f87c89d7af39@gmai=
l.com/
> > >
> > I don't think this is the same issue as reported by James there althoug=
h
> > same error message. For now I don't know the root cause to that message
> > but it's unlikely it causes some tput issue.
> >
> > Let's wait for Yasoslav verifying it on latest ath.git.
> >
> > > +Baochen Qiang for awareness
> > >
> > > /jeff

