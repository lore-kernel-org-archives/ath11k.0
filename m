Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D15DCCF2C1
	for <ath11k@archiver.kernel.org>; Sat, 17 Oct 2026 10:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5snhMS2ueW2Cl14d0N6Rs5a/KC8OfBoDlKdn0Y41pQ=; b=G/Yw8FRx+ijskP8/pDw32HZTxS
	mp10GILUM+eMKaN4xq1KcSlukM/oRMrb0sAViSUZKkLgQ/kPN2zUXsVH2aut4hv+Eh1+o3IwbY/CH
	OyaJOEqG0p7VhgTuzqkURcdogHYgWtPKkLSdRik1EJv3tNQzcRxi8v+7E2No2ACOM/36JqcgNd+j8
	2D10EOtbWFvpgQghemSqQlfSV0s3j3qaFp1n0c9qL5d4kSVO5b/t8vohsyA6ebSXo7av0uK8yqv4M
	wpU83Ph6KuneOD44RH/a2Tk9rgBEQTzK/KmVnJ/X60mTeZmGe3wfBypkjKFq4TSFZQDt9dtc1puTm
	6xhgdoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI1nz-00000004fmG-1ReM;
	Sat, 17 Oct 2026 10:38:23 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI1nv-00000004flj-3fJq
	for ath11k@lists.infradead.org;
	Sat, 17 Oct 2026 10:38:21 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-675676afc3cso737516d50.3
        for <ath11k@lists.infradead.org>; Sat, 17 Oct 2026 03:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792233498; cv=none;
        d=google.com; s=arc-20260327;
        b=bI5SkgbVxMPuWH4DBNqH1//l4LIOwCArBT7uUO+Cr4BJnHcr4te//Iylnaz/XKWrVj
         PGhMjasdY95u0+w5GERpaYQW8Z5SvTRwaWpIjF1MvXTBZPmWBSbqTq/U1FMNJauryM7P
         CiTHtKQcOQPiwXZHpNdthviX6gH8x24c7gOVM4iKMei/ZTK/AkAHlihxYwpM7qZnAlED
         j0nda4joX2orXtaFrYF7gVFJLBCMfodQhrSNIJgEGtpIxMvrRohL5qWIEi1Fiezw98X9
         HyZ8lqvZa5dL3eb93WFspadnqEL7YQz+t4byjxKUZyDKLj3fD4OZ2+QkcYsscG0eOmWQ
         PwsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F5snhMS2ueW2Cl14d0N6Rs5a/KC8OfBoDlKdn0Y41pQ=;
        fh=W8WHZAhxSemSXFq1k01Md7sXjvL9gaY1evEr2Nx7z64=;
        b=LezRQtdz2Rg8K4FsPV7KPKbfEVKtFnItTrzxQ8KdcaYOrYs9HA62KyRxkmkH8tOHA9
         EqW3dt0l0cPA0ZgAnwhTtNrvijMcoh1VfOkCPnkGBv0C0yKljLrQIQlmrtSW6cjl4iPG
         Egdm+MYgtVD9xPshAtxc3VwH4qeiOosQ34bR4JuekG1L91s8+f6/C79q+ABxWm63WK16
         79JCm5IMNnMpmt4g1UaTN7ggW075j8zq4eklLQT5jx9XAtqfry/DQQdnvyp7nK7aeEBC
         KRJj+8JbFT6Bke74nOprSjhHovkfjXUW/N3EbogDKmRowpIRCE1gRaHg1g1MqKTKUrDI
         miZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792233498; x=1792838298; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F5snhMS2ueW2Cl14d0N6Rs5a/KC8OfBoDlKdn0Y41pQ=;
        b=kagMLqu5c/t/Cxq3piezxtHHRZwaHqRA1psMPzfwsGbwTVOjC9cp249BgYzULFlE7o
         0ou9dzBIwFgVDQmBd6kQ+5dK1Erb5QWU8cVFg37TVw6dAFcmqwmr1/KqbzAxvpeZu8Ck
         4r/HtcgT9KcylhblmUkjUasN9YrrB2riAUYrutr25eNOlWmVqsER3Hb8/Z3UdFIp9haU
         I3UhCK1a86oSJzaNtpqt4PSUKoGhTfyYj3V0tJLsExU2ulJvXSKBs2iu1hGnMNvaQGn4
         UtAE0K+QzQ9K/RXLd58SYiOYKo4lFyc3JerVpVge825WI2M9eV6NysZs4LoKLe2wh9hn
         xMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792233498; x=1792838298;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F5snhMS2ueW2Cl14d0N6Rs5a/KC8OfBoDlKdn0Y41pQ=;
        b=lkdH8wKmBwzkPFDn0s2K9Zl9wCLEbudb6IOggVRpN5C6OE9PcscTlye70NBInGXQAI
         n6OyK0PxkXe04AL/mATRhleugG2ciNteqmC/5tYBOw3O/EVG0OVtIE7Ns16KjkqvjydA
         0IY5AeEgB7V3Q2K+VH1NzQWMK8rZ5tUOCUAtgjGPcSDvP6zwVUbqbqkl0lvJbOQKyDc4
         UQqiBl9ELJF2rNyFM7KZGsIeq8TGs28KjozJUL+/JmiKpIN86OHKZhD8eX2HJAlMSxe8
         vGXeg/XWktKDIGrBH2EYRJYSDLE+VFjOzfFzFQ/rZz6kDMhay/DLGtvd/ZSmVlbjhV7U
         JqAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxr5WxO47DhBDqtqhPza0wi7z4YdxiguVCmvpApxmow+soe66fsFJhOJsqG1kPjTWbuFfWjhHg=@lists.infradead.org
X-Gm-Message-State: AFq9FYLfygy/DqWqGGsOU04gkJXeSN91Tuw+xH3ZOwNnkaIkcoFrutgC
	5sj0WER4f7+gwlybtXyAgfPLC/SMgy8l6ZQbINCKWHbCIIjTHw9vuOh2nnYBZovjsxmhCwbvpqt
	ZEybnxR//CXBDvBgkOwfWmgvblg8Wv2yzFYJ3jqap
X-Gm-Gg: AYBFou1e3kTkhilSTurCdJ3o+Lq7b/aCjmBWJgxSeMf2nvxJYSNBxjCxUcA1CmsxZUf
	QWPD98ghweDh8q7yk1dbY7/lsTNE63udLWiTuyVcuQRwhY6ciwQRSmkXEaFrabQJq+e+kAaDoV6
	O9zdLEktTYmfoQkHdwEsSGE2Wl0kGZEytYZj4FTDlhSVk5zRt82NpsS7fORXXR79mtoMjA0mkoG
	bxmqO5hQ9Km/oUWiMqnWEKLHUVU7L1O6eQ/QsfYK6il7IA825jWJxSQJeXZLfE6Z2GVNhTVK/mD
	S5ZFWDhLfcwQjqwzmW5RypZLaEG7ELtZ1rc43nY2yhJ2ehEKEGQ0K4UErAF5EPQGjO5nGG7wVkB
	SLFFtqbeuTGzHnxxLJZLDq0+JAiTcqU+l2LiXNS4yAD1kq6I79bRJypZGdR0EX4C13DIY6bkHNs
	jXhuIsejauii1MmMjxDUwL+QhnYVrGGRB97rVE426wej6M4P8u0S0I6DqLQpceK0wbQ4gl2YdUt
	Li3ZmdLJ7dAJ2+QPU13OzuPNV8ocJr0eJz8+pcYL1I/odbO0hMJOlRMFh3m67MRnkm3wtoAOjWf
	lzANWZ41S48XBA==
X-Received: by 2002:a53:b547:0:b0:679:aa23:4150 with SMTP id
 956f58d0204a3-679ca906735mr433421d50.107.1792233498275; Sat, 17 Oct 2026
 03:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260910071838.1983652-1-julius@bairaktaris.de> <CAC1t37+f7+CJ+kBSe25g31fMWE65hme1m1gvB7ZZ_Ydvmce4vQ@mail.gmail.com>
In-Reply-To: <CAC1t37+f7+CJ+kBSe25g31fMWE65hme1m1gvB7ZZ_Ydvmce4vQ@mail.gmail.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sat, 17 Oct 2026 10:37:42 +0000
X-Gm-Features: AclHuK9YPhV95_cGbl4XOUUVArJb9QpR6dXPUyjfRBwMk0R7v_0JU9GGfaOaYu8
Message-ID: <CAC1t37KfVf18kbwDqHkVgSFMfAykqbh8th33362Sw07vTt9sMg@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: request firmware-2.bin directly
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_033819_923867_07136BD7 
X-CRM114-Status: GOOD (  19.09  )
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

Hi Jeff,

gentle ping on this one. Would you also like the same change for
ath12k? I can send it as a separate patch.

Thanks,
Julius


Am Do., 10. Sept. 2026 um 07:25 Uhr schrieb Julius Bairaktaris
<julius@bairaktaris.de>:
>
> Hi,
>
> This doesn't change functionality, but log lines like
>
>     Could not find firmware /lib/firmware/ath11k/IPQ8074/hw2.0/firmware-2.bin
>
> confuse the average user.
>
> linux-firmware does not ship firmware-2.bin for IPQ5424. I don't have the
> hardware, so the fix would be unverified there. Would you like the same
> change for ath12k?
>
> Julius
>
> Am Do., 10. Sept. 2026 um 07:18 Uhr schrieb Julius Bairaktaris
> <julius@bairaktaris.de>:
> >
> > ath11k treats firmware-2.bin as optional and falls back to API 1 when
> > the file is not present. Request it with request_firmware_direct(),
> > which does not fall back to the userspace firmware helper.
> >
> > Closes: https://github.com/openwrt/openwrt/issues/24743
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> > ---
> >  drivers/net/wireless/ath/ath11k/fw.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/fw.c b/drivers/net/wireless/ath/ath11k/fw.c
> > index ef1b4c81843a..88ec2ffd9f00 100644
> > --- a/drivers/net/wireless/ath/ath11k/fw.c
> > +++ b/drivers/net/wireless/ath/ath11k/fw.c
> > @@ -16,10 +16,12 @@ static int ath11k_fw_request_firmware_api_n(struct ath11k_base *ab,
> >         struct ath11k_fw_ie *hdr;
> >         const u8 *data;
> >         __le32 *timestamp;
> > +       char path[100];
> >
> > -       ab->fw.fw = ath11k_core_firmware_request(ab, name);
> > -       if (IS_ERR(ab->fw.fw)) {
> > -               ret = PTR_ERR(ab->fw.fw);
> > +       ath11k_core_create_firmware_path(ab, name, path, sizeof(path));
> > +
> > +       ret = request_firmware_direct(&ab->fw.fw, path, ab->dev);
> > +       if (ret) {
> >                 ath11k_dbg(ab, ATH11K_DBG_BOOT, "failed to load %s: %d\n", name, ret);
> >                 ab->fw.fw = NULL;
> >                 return ret;
> > --
> > 2.53.0
> >

