Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232D3C4332F
	for <ath11k@archiver.kernel.org>; Sat, 19 Nov 2022 13:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6VNkAQ4oEB9JACZ8QbhvsC3/M/xJDAtOs4sDjqxTg8=; b=LSghnU9NFDCcGq
	OovuUUsqHwbHoLmHyvqaMKK9HDcHR1+FYLQpzhnTHTaknpSEPMzssXSo7NPlzf9JRpHYdCRIGAiNf
	khhbQHNS9X0DkFyp1KTO1mOq1IPsFJaS32C0nH8VGesw2lTm3P84FMgJOYITlbKQ3mBw6E0zCAVLJ
	/FMGjm+xDj6kQiu/Sos9IDKxqnpQtx3qfpA7VG/H9ZdiErz+PxfYiLsSrVDI2qBz4O0tYFT7ZraTc
	boXGoP0mhJgSYBSDPEnS5+HxJQVy9TMbQMTmuOH2tMS7C5+dyaO/1djcPeAb6vr6SbAUj88zxMVYi
	ML0ypzb0nwjBgqwXczXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owO4Z-00Dsr7-De; Sat, 19 Nov 2022 13:39:55 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owO4W-00Dsqm-Fj
	for ath11k@lists.infradead.org; Sat, 19 Nov 2022 13:39:53 +0000
Received: by mail-lj1-x232.google.com with SMTP id u11so9935905ljk.6
        for <ath11k@lists.infradead.org>; Sat, 19 Nov 2022 05:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M+gb1dMYe1DXRigXfuYgTG29k4GjsxMYNyHdZyfKF28=;
        b=S9J4nl6PglYJLOERkcImg6fw+uGBD3E+4gOJzDvAz4rCxTGL5uPwKBElg7Lc7wYtXp
         /bzuh9+yxYT4UIB0vOKAkS/1zQbGoWMqBJP30BxYwjdgRWddDEbVV1e0ldsT+tY+77sc
         oUvwJocg0EA02fq+rHS/tJkDqXsAHMuaCc3sxPLo1ldeU6ZW+0VXYHQNz1W98DFK4BPj
         9v8ZavyNP8CS17OaYA3iSEDO24pmqs7C5t0oZvWvwfdRAHuDRveBWDg9nq/Hi9uxbTA1
         cYlUixRNa+l6K/x6CXxKS927xdAl5bkOZvx0lxmMHdzB/xxgm9DsSxqL/wz2b3ujvLQO
         aG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+gb1dMYe1DXRigXfuYgTG29k4GjsxMYNyHdZyfKF28=;
        b=w3fP1UPEKoCCGGIz2mckoV56N3B6UJFwy0MZDpJWnHOUUrqx01eudpxhTCh6moPFqV
         C8sEVTFzXx/WrblXq1sEzm/nGHeXkrOtd31qCGhyDnTEWIr2dGhCtpDrljOqhREVlMTZ
         FbQxLPrxnLltB/EvMupPMkiuSCPQOuXQYTimlMRoOkEk+hKK/SUDgpj3g3z39SOo3gq5
         9HAxnxDTllLIbuaxUn9kZZIgtjIuPq2bH2nwHBgzbdaU6g/viqmKZaugJOKJkXHLCidF
         c/y/gsNwq7ivrOyDodEVKOBnfcNJR7ONj1FbfGnI1mu4t0YaOYyVNY4dOQuDhclYZqFc
         UduA==
X-Gm-Message-State: ANoB5plppKnO0Y+YjsA0MlyUvbT6n4uld/gpHWxDQMy1cYzIvVYeCRXs
	NlK9otyEvn7sAPROtGySNzYS1xXjhY+8LiNwflQxkYv8L1gaxw==
X-Google-Smtp-Source: AA0mqf58x8xhl21ugi+03sdCUFuYEvDPCI0P16MQIkSRcWU3dgqENruxovjpQVzUC92DhEPV3Yk+AzZqVs0SYcIC+6Y=
X-Received: by 2002:a2e:b602:0:b0:277:901:5e1 with SMTP id r2-20020a2eb602000000b00277090105e1mr3555593ljn.349.1668865186686;
 Sat, 19 Nov 2022 05:39:46 -0800 (PST)
MIME-Version: 1.0
References: <mailman.7.1667674802.1691884.ath11k@lists.infradead.org>
 <4660647.LvFx2qVVIh@sven-l14> <CAJrE-q7GshGMSoiP8Vb9itUvap2=tWHqQnDFnckzcRNNpya6Bw@mail.gmail.com>
 <3684626.iIbC2pHGDl@sven-l14>
In-Reply-To: <3684626.iIbC2pHGDl@sven-l14>
From: Mariusz <enebeo@gmail.com>
Date: Sat, 19 Nov 2022 14:39:35 +0100
Message-ID: <CAJrE-q7yW435fPqeNg9aEhbdyy152Q2q-dSbQ7_4xNP9EzHWHg@mail.gmail.com>
Subject: Re: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
To: Sven Eckelmann <sven@narfation.org>
Cc: walde <waldemar.stroh@uni-siegen.de>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_053952_605597_47EABAFA 
X-CRM114-Status: GOOD (  23.18  )
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

I have contacted Wallys again but I am skeptical about resolution.
They don't consider board_id an issue and provided the same response,
on integrated systems it is due the bootloader to set it properly so
it is not fused and obviously not included in x86 scenario. Since this
is a private project I doubt QCA will support my efforts and free
access to their portals gives nothing. Found online some SDK for
version ath10k/IPQ8074 and athtestcmd to deal with OTP/fusing but
that's far beyond home project effort.

Tried also to compile it in OpenWRT with moderate success. ath11ko /
qrtr.ko modules are built but the module never goes past power on
success.
mhi mhi0: Requested to power ON
mhi mhi0: Power on setup success
mhi mhi0: Wait for device to enter SBL or Mission mode

Even the newest kernel in OpenWRT master development branch 5.16 is
quite behind and backporting anything is another non-trivial task.

On Fri, 18 Nov 2022 at 15:06, Sven Eckelmann <sven@narfation.org> wrote:
>
> On Friday, 18 November 2022 13:48:43 CET Mariusz wrote:
> > Mine is from a different supplier - Wallys - and I bought it 2 weeks
> > ago but not sure how old their stock is. PCB looks slightly different
> > than Pinapple's. Is it likely to have the same issue?
>
> It definitely has the same issue (because you reported that board_id is
> 255/0xff) but I have no idea whether Wallytech ever fixed it. At least I was
> never in contact about this problem with them. But sending around precompiled
> kernel module binaries (for an unknown kernel build), with some hacks to fix
> their hardware production errors (missing module id fusing in the OTP for
> their separately sold modules), doesn't make me confident that they are able
> to solve this problem correctly.
>
> In their defense, QCA doesn't make it really easy. It seems like their
> reference designs with Pine on 6Ghz are (mostly?) for (embedded Linux) APs
> which use the normal flash (NOR or NAND) to store the calibration data. And
> for these devices, they use the devicetree (or various other hacks) to load
> the correct board data.
>
> Wallystech has to find the correct document on createpoint which describes the
> process. It was something like "module" "board id" "fusing". But it is not the
> "Board ID Fusing for 802.11ax WLAN AP Chipsets" which only describes the way
> how you would to it for thei internal wifi of the IPQ807x/IPQ60xx/... SoC.
> You/they are searching for the corresponding document for Pine IPQ9074. Most
> likely hidden in some QDART documents.
>
>
> Regarding the problem that some countries are not allowing 6GHz: You have to
> either get a firmware from QCA which has it enabled or you modify the BDFs
> ("board-" files in the board-2.bin) to enable 6GHz in the (enabled) embedded
> REGDB of the BDFs for the specific country. Unfortunately, the data structures
> of the BDF are not officially documented and you would need an official QSDK/
> ATH.11.X release from QCA to fetch the bdf2txt.py, txt2bdf.py and the
> corresponding template for your BDF to extract and modify it.
>
> Kind regards,
>         Sven

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
