Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5332109B491
	for <ath11k@archiver.kernel.org>; Tue, 31 Mar 2026 15:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8qcruLr1TaN4a3nPxJC8zeje2SUnWQJ8J8aOZ6a6Fo=; b=rm0leCBiXhtlFcdTzIg8AhEX1q
	rvg6ewH351FZtOZx0fxeJ+zpSQYxuGRhkVDiEEq8roApwGp+vrpHTebCvYChq+6L5D4GPPHY770mD
	/Zi+niBGp9ukfrLwRYUQoakpQDLaDn9j+KwUax/n8bx8KDCj72vWy/ePyB3OQYQlsw23UQg8OecMn
	mhtG+Eh8wse4ZP0NtxUBe89ywhabQ2+U9ukS+2F9xqkOkJ6uaxUmcQw599kvpEaYv5D1i+rEA/xGI
	QpFSs5WPe8mVBxHWS+/mfKwfH3mpX6QkMYdpOCIfMGzQhvWoXNrLv89XJC99bftVyNWTNmtDANHoL
	VX2Hc1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bCW-0000000DCIn-0ybI;
	Tue, 31 Mar 2026 15:40:20 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bCU-0000000DCIR-1cps
	for ath11k@lists.infradead.org;
	Tue, 31 Mar 2026 15:40:19 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7d9bba96f7dso3107856a34.1
        for <ath11k@lists.infradead.org>; Tue, 31 Mar 2026 08:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774971616; cv=none;
        d=google.com; s=arc-20240605;
        b=WUit9PCvDrqKNrVq02ZEKBbXtdxr5ghQIwyXnqJOthKcoWG/eJSyx1VF5nqSa55sKL
         2BRwEGg9KLjhj6OTVjhxmwJtGf9gY6LYhYNAEvBsYNFIL1qpbgWvKTRNrTQJviHbYWuh
         jwdAr+RTN7DbYLo8mKu87kkpJkg7L9Dd8/Z8EBATRrjZGVj2j54OCPCMSybuKWkm/lsJ
         hkddqSmwXC65w8uDpRxZ8EJXfGpNimpcGZAWzMAqrOv1xcAOEUyV3MPvq3m7KaLBqEeu
         CsHUZAwrQkYvqsELIHZkSJUfyVnzxT0yiJSRw6Ycsj+6nGRW16anz4z3bkxp0eEKRGUG
         kEOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u8qcruLr1TaN4a3nPxJC8zeje2SUnWQJ8J8aOZ6a6Fo=;
        fh=5uRsjvnRYr4SbP19DZthNJui5PCDEBjyPbvomiMiFpE=;
        b=TnxC0aBLDqAQIhFdkp57NdTilJpqscuREhTja2+AQq6/M/LUMUVLBvwT9/9TSPk1H2
         +OEqRQ4cKBz1I/uBjKfn0tg3Tw50u+EMMMowMihnA8GMnUEzVUmBOCBcXYYHaAEsfI+M
         XVExrOEjTd7SINk863WKf2eGSMvRmySdK4WG/HBM8WtXR8eSg+MuP6QVzSXEVfGpFBHA
         JpKH2teZPLmVZ1upNh1Nk2PsFeLyv2twCI01PC0Y17AeU8RcG4ixI0IjVahGeE5VqRyx
         Hrhyn58E2Deon+KmVY2OQ/XY+enZV2lbsa1oJ9sKq7hZXPY6M9Rihi0sFLBykZ2bH9eh
         +rJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774971616; x=1775576416; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8qcruLr1TaN4a3nPxJC8zeje2SUnWQJ8J8aOZ6a6Fo=;
        b=HFpoX+XM1if82t6Yxt14zprcUsWxM5OmaB56+ooipjpNYUHfiZ0RofMxsyV4GGfPtA
         lMt+JKq3O6w6mBkQJXVgrgM/2U64InaxtHIeX+n6Qp+6BysKoYy9Ai0eY3OrMsUieFO6
         9+DF7KTm0UzhTa1KzGg1dsIO+bcOG0/QTXg/q41s1OFp0aH2wrcs7QQNLW/9eOCgWbcN
         q+tSDf4dk9ScNKuSASNO6Dp54lLBJpaKqJB+HTltFznRHwjNF5ptJ1EBsNqJak4hLVmV
         lEwJN3ZzopXvjP81pODhBKQqhAPYUaXqZx4ZH60Fq0TJrEagfD+Kk5nGxLq6znpRAl/M
         lttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971616; x=1775576416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u8qcruLr1TaN4a3nPxJC8zeje2SUnWQJ8J8aOZ6a6Fo=;
        b=H3u1P8vYCxRmbruEYiyIYed4BWXf62iHSuBNNHPEfffxo10Ug4JMWLcUQfotbnCXCc
         Us2/3l3LZB2CPvnOuEiT0/wyVMSp8etQrUveujb8HfAeA6PfEvpn1n4ALJN9NHTSzzpn
         24crBmkohEeTq+UIWkIRWug1qqhcv5XVo5fIxNGL4gK4h1+pwLFN85t2+G4usmcrQwGo
         qu0ERIt0HBFHg27oyQCGoCdbkiIg9ejeszXbeO/kbS0I2xEAFgW22lhnCcSHW8ixv1zW
         W0kc2/6lbdNNIYEBWK+qXSuJ5bxi/QOcp2TE91vpCVNbFmg0kouDU4yS6trQ9zp/L9mJ
         BXoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1oe9LPfju6A4vg9RpRWztQPpJdqAwv4B5RVCouV1AM/hnhy3z9bh5Ex7EkoMBcXoorbs5Vss=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjAfG0BVp7m7Y03p3TrXwMgvpEIlsPTNFcRLniQlRug+QRYGgD
	Gh6XvlfrFndFbfhL7aXZwIuhRox4n3TigpFrt/BJ2/zSv1WRVr4vULlXCVsANBXzCTiM9QKwNze
	QgQU0hEr2Ca3FUJBsjzHDM4UoYEx5d5k=
X-Gm-Gg: ATEYQzxspeuDx6pxFvpeXWNqMAhexKvh+dTu7OjYs1UXsAVisXAv4xboBKpQi2ddUHC
	IpDPD4dzJRKCb1Lsib8jybwsW/pCP7K8dwyz+x7bMN+N2L5GxVNDHhzvj3f8x+tW2Wx51LtYotn
	Nd72pYTxMuyGW0tYBcsBBEKKcQWzqR4Rn5HAo89HZ4K9oCt5Rx0RcNiTxFKYl7xB2Nj3H0V/wbF
	2+N88+tQq+ZUuNR+czIhT8h8w0Wv27sPB3wwtybjX6+L57oJDdTqm8asGjXcYBuiU4czJN/qAGp
	ZZtJ7ikujKSYOWDwqTX77PIzn6NYTmtVE8MFOzceGEWf+8o=
X-Received: by 2002:a05:6808:1718:b0:468:48d:8075 with SMTP id
 5614622812f47-46a8a395fb3mr7995552b6e.8.1774971616516; Tue, 31 Mar 2026
 08:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260330-p14s-pm-quirk-v1-1-cf2fa39cc2d5@gmail.com>
In-Reply-To: <20260330-p14s-pm-quirk-v1-1-cf2fa39cc2d5@gmail.com>
From: Kyle Farnung <kfarnung@gmail.com>
Date: Tue, 31 Mar 2026 08:40:05 -0700
X-Gm-Features: AQROBzAt-wrDIMtX7p-AOcDjVXjahzEybmuxfvEKnbowGjaS1uRal6qZfRUGMgw
Message-ID: <CAOPSVF3tbkTVjW1o1NfrgbOA9v163n_QuDR4ay2ggdMs5f9Z0g@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: apply existing PM quirk to ThinkPad P14s
 Gen 5 AMD
To: kfarnung@gmail.com
Cc: jjohnson@kernel.org, mpearson-lenovo@squebb.ca, stable@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_084018_434658_23EE4D8C 
X-CRM114-Status: GOOD (  17.57  )
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

On Mon, Mar 30, 2026 at 11:18=E2=80=AFPM Kyle Farnung via B4 Relay
<devnull+kfarnung.gmail.com@kernel.org> wrote:
>
> From: Kyle Farnung <kfarnung@gmail.com>
>
> Some ThinkPad P14s Gen 5 AMD systems experience suspend/resume
> reliability issues similar to those reported in [1]. These platforms
> were not previously included in the ath11k PM quirk table.
>
> Add DMI matches for product IDs 21ME and 21MF to apply the existing
> ATH11K_PM_WOW override, improving suspend/resume behavior on these
> systems.
>
> Tested on a ThinkPad P14s Gen 5 AMD (21ME) running 6.19.9.
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D219196
> [2] https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thin=
kpad-p-series-laptops/thinkpad-p14s-gen-5-type-21me-21mf/
>
> Fixes: ce8669a27016 ("wifi: ath11k: determine PM policy based on machine =
model")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kyle Farnung <kfarnung@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireles=
s/ath/ath11k/core.c
> index 3f6f4db5b7ee1aba79fd7526e5d59d068e0f4a2e..21d366224e75904feeae6cb9c=
93d9ef692d127fe 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1041,6 +1041,20 @@ static const struct dmi_system_id ath11k_pm_quirk_=
table[] =3D {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "21D5"),
>                 },
>         },
> +       {
> +               .driver_data =3D (void *)ATH11K_PM_WOW,
> +               .matches =3D { /* P14s G5 AMD #1 */
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "21ME"),
> +               },
> +       },
> +       {
> +               .driver_data =3D (void *)ATH11K_PM_WOW,
> +               .matches =3D { /* P14s G5 AMD #2 */
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "21MF"),
> +               },
> +       },
>         {}
>  };
>
>
> ---
> base-commit: dbd94b9831bc52a1efb7ff3de841ffc3457428ce
> change-id: 20260330-p14s-pm-quirk-0a51ba19235f
>
> Best regards,
> --
> Kyle Farnung <kfarnung@gmail.com>
>
>

Apologies to everyone, I realized that I lost my CC list in the sending
process. I wasn't sure what the right fix was so I ended up posting a v2
patch [1] instead.

[1] https://lore.kernel.org/linux-wireless/20260330-p14s-pm-quirk-v2-1-ef18=
ce07996b@gmail.com/

Thanks,
Kyle

