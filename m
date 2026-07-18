Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BE2C4450A
	for <ath11k@archiver.kernel.org>; Sat, 18 Jul 2026 07:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmSIkFJSqyaKz3/VEwKpr/MGHtYZvKLOlp0Bt0CKKUU=; b=Re1X+mmgOBc1gCDg195BYz6wl+
	5hHblJBpnd9btdK0+Neckr+2N5WAP3qPMTmu8yGMTy8/n2mHGRb4ANyq8GuQFsD9y+/Y5OJV66Y8p
	3HJVgROU5g2lUVde+ZPHGfBuj7wu2z2zub0RNovqiIr5txZPpxk4o553Q0fvZGZWL3FxEqdn+zxqK
	M138AolJ9rk0t8IdQPM3OnT23giX5RCbz7RkO1ihqMjCVELKAU+RX8dhn6Eyp+mhhUolbJ/UHG+AB
	RZnO0BWzpgZeEGlZ484Y3hRwid1f8UOFuwdV6IcjZuiqdOTvuSDs0FHMJMxnBa++2oPWeY7nlF/W5
	Ohdic2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkz8k-00000003oK9-1V6k;
	Sat, 18 Jul 2026 07:07:14 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkz8h-00000003oJA-1WOf
	for ath11k@lists.infradead.org;
	Sat, 18 Jul 2026 07:07:12 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-667b0ced2d3so9838945d50.2
        for <ath11k@lists.infradead.org>; Sat, 18 Jul 2026 00:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784358430; cv=none;
        d=google.com; s=arc-20260327;
        b=QBun+SjpNcsaNUAHYQEc5jX5k8UdzyC0BFEjZhZ65cF9LirIXYlko6ZmBSf9Jf2DbR
         iVvv3iQcoY4efPICm3Ap6oEFGtyZC4MYAqYo+ExqsPTKYKDIUNSeTn82jkoKkvWh2p0B
         9nXVui9VWMdOk1CQk0Po15eEOUajazFSy+i1KVqfPOfi2IhkbKG1/v1shuSSdae+oD6i
         Y9kkB+VEAkLdp6JeTVjZQ2cGgyLLiAcFHiBrqqYpjRb5nDdJo2bfaTmaihfZ2ZRTQlrn
         qa0XgDpWAOBc/MuTbSdhZShmxMCgKiuALpzGp2lJJ0GffqD1l3NzWy6SOzsDTHjmoYwc
         SmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wmSIkFJSqyaKz3/VEwKpr/MGHtYZvKLOlp0Bt0CKKUU=;
        fh=pdgvMPzI4SgYn1aZTYfU5tmMi1cOgta94gk2MPKco1w=;
        b=BdeLtlEWKta6YlYzHym/+IH80VWT257C/U3WLWyyJ17qlCgWjsdEJuytFZzWSxxzHZ
         jYHwnOSkrqS2iSgNMaOxroe0GUcGbOYH9wae3pUhEc9jWVSI+xThHPdOeZi/v34f+4Hq
         9nunbHdBXVGdfopppyCb2euAgi0vbHvL8xist5ZAiFOBJYHzGkiZH8iL62GdRphYT5F2
         m9rjMWwuhyD+6fpBawJrty1ejVtNg+W54Jiqm6h1ppxOJup76/ei85TxAgV4GJjSKghg
         z4ULYQ/3yl0uGtAm49DZ3jSbiGBaqo+FXkaMFmnVAcphBUSPhblA4T9g81OpBNGAi4HO
         LKtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784358430; x=1784963230; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmSIkFJSqyaKz3/VEwKpr/MGHtYZvKLOlp0Bt0CKKUU=;
        b=OQGUkntbo+MNKJ8o+G44TqUvndylhsVu3PA25jxjp12J7fnb6shbuCB7srKS4hcmcD
         MhFgGmP/BjdiI2cUUnlQdi2uZVTNZ7EuEUQpq3UwDXX6cgYZ0G2gb5u2sb0BA9/J9Lns
         auyMONvkGUyOHdpqdXZxVxH21Cb9RKFPzU83n1hl1vbbWjYy55n5H/93RrTctWVTYh/K
         qYgnT7BquDw9mtRwTuNbTLPv8+aNF3foYIOnB1rE0xWJZ2YJjJGH7HvQ+qWYyQKPiERO
         7TSi0OenxiOAoGZVBDB+HywFEYRGufRYFCv7foZafeX1seeGvAtf9GbymMHcpc+TrcKR
         Ftow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784358430; x=1784963230;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wmSIkFJSqyaKz3/VEwKpr/MGHtYZvKLOlp0Bt0CKKUU=;
        b=M4JKN6eSq0BdxlFLzaCR9Y5XP4RgwzWwjRYO5r6QwOxWaBZHHYQBYx8+6RJAf3jBFh
         JpAGjqmdhXHw+vj1/r5ophbmOEkZs9E4HmSF74dNwpUwUd0FVH16HCXmM7PIPC3nz1/N
         Yy35Kk6zeSz6fjG5MUAzDPgjDDO2G6FMBrewpueL+ve/cQ0zQ4dfwidk02hh92+dXFtX
         XyrIlsrLwRPBNezJjhUffUAAe4Nwndjn/MZnlTb7Gw83geURthl+5yip35aXnr/1QIWi
         JPy44+MMl4ZDYYJSk0w0qlyECjhV29HOJsDX8O4xuwu7nXqwtfGLcWxn5/f5sMxPcIIr
         Kbgw==
X-Forwarded-Encrypted: i=1; AHgh+RphCDah3vSSygZ/qBm96zrNktpiwmZ5hCvneK5C04YpRiTU23sJJoPknvTcZxUjeN9Zqz2rJLk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+vSJ7KsYCF6FoLyzPPCXDyTS+4slSlX6cjLMHcPhI3Mcz+ert
	uU1wiiIJfFW+/uZX705UxchQWAMj8BUB5m6TU+uibxCYvx2OwyIRcU+h6K6vMtrpfzLv+K/mCEB
	x/hLOwt55RN4ExxqHMndN0eGlOy4+Fho=
X-Gm-Gg: AfdE7clX8Hh2/1Fr7RjRssAbPfaJUfRsJG40bsVbIZ0GbPsQ70DAtF1UtYrXiUl3MMa
	8pZ1QveJgzVRNGwXAO2+rzOsayVTNLzSiZmFSO5j/XNEnHXCJG96ELI/30hx82w9yVCHyZhm8Rq
	qKvblTEqMFc9U3cRcAjmWyZXoSXDoM04qZOdUJVnJ8+QZA88wneNti6kZJAF5PQPeMXZjCAOFnN
	QJXJPibmt7o2FqNUs5k4uU40N66daDTvqfZZTpad5uKQVdRHbMtvlIxayKLRpGW
X-Received: by 2002:a05:690c:6d0c:b0:80c:85c6:898a with SMTP id
 00721157ae682-81ef266218emr20230547b3.57.1784358429733; Sat, 18 Jul 2026
 00:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260715064042.1988288-1-lgs201920130244@gmail.com> <faf48c76-373a-42c1-9c69-cfbc5178640a@oss.qualcomm.com>
In-Reply-To: <faf48c76-373a-42c1-9c69-cfbc5178640a@oss.qualcomm.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Sat, 18 Jul 2026 15:06:57 +0800
X-Gm-Features: AUfX_mwQ4-arHf0bC-CsIAMvfm-Hm1rvw6GpPIJETr6Tid6aJ6SrX8LIeHodJIg
Message-ID: <CANUHTR8DHt+dABWn1KmnCJNZhjY2NASqGwPp2SU7CSrhjhOe1g@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath11k/ath12k: release QMI handles on late init failures
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Anilkumar Kolli <quic_akolli@quicinc.com>, 
	Sriram R <quic_srirrama@quicinc.com>, Shashidhar Lakkavalli <slakkavalli@datto.com>, 
	Kalle Valo <kvalo@kernel.org>, Venkateswara Naralasetty <quic_vnaralas@quicinc.com>, 
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>, Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_000711_400830_47606467 
X-CRM114-Status: GOOD (  16.73  )
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

Thank you for the review.

On Thu, 16 Jul 2026 at 08:59, Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 7/14/2026 11:40 PM, Guangshuo Li wrote:
> > ath11k and ath12k initialize their QMI handles before allocating the QMI
> > event workqueues and registering the service lookups.
> >
> > If either of these later initialization steps fails, the functions
> > return without releasing the initialized QMI handles, leaking their
> > resources.
> >
> > Release the QMI handles on the late failure paths in both drivers.
> >
> > ath12k_qmi_deinit_service() uses ab->qmi.ab to determine whether QMI
> > service initialization completed successfully. Set it only after all
> > initialization steps succeed. Keep the ath11k assignment unchanged
> > because ath11k does not use it as an initialization-success guard.
> >
> > Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> > Fixes: 088a099690e4 ("wifi: ath12k: fix error handling in creating hardware group")
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> > v2:
> >   - Set ath12k ab->qmi.ab only after QMI service initialization succeeds,
> >     as suggested by Baochen Qiang.
> >   - Fix the same late initialization QMI handle leak in ath11k, as
> >     suggested by Vasanthakumar Thiagarajan.
> >   - Drop the Reviewed-by tag due to the code changes.
> >
> >  drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
> >  drivers/net/wireless/ath/ath12k/qmi.c | 13 ++++++++++---
> >  2 files changed, 18 insertions(+), 5 deletions(-)
>
> Please split into two patches, one for ath11k and one for ath12k
>

I will split the ath11k and ath12k changes
into two separate patches and send a v3 series.

Best regards,
Guangshuo

