Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9381BC79FB9
	for <ath11k@archiver.kernel.org>; Thu, 10 Sep 2026 07:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vXglpmyQqtm2vQGfMHWvnjy2MGvK+hpILt4Bijo3TU=; b=RqFsB0JVXUtfLm4pADkZG7OHU1
	YEPllrjjBFl5p1iNJX9vgptJR9DLTKU64wjYYFFklqBKYO8aMi2tOMJjIUT4P4Bz60OaFViOs7bO1
	Maum24ifzeXMJM/85Bzc1xsNE21SM/gmmWZf4fabyVsSEbc9Cbo5WjDU54zg/HJAxQMIWofHVQzqF
	7pT6kYShxo/aH24LKM6bUGBf97IEuchjAeH8oQqapYYbf3WmQIiiLd5eoTUtOmDOafh3vXI9NTuff
	/B33PY1C/CsKWXFP/f/LGsS54dJKce3q91taK9knXwZxyoyn5X9xWGu5MPty1DquZ7tm5MV/9HE/3
	9ZiRY9lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZB8-0000000Dcve-0SEP;
	Thu, 10 Sep 2026 07:26:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZB7-0000000DcvU-33bo
	for ath11k@bombadil.infradead.org;
	Thu, 10 Sep 2026 07:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/vXglpmyQqtm2vQGfMHWvnjy2MGvK+hpILt4Bijo3TU=; b=fdK0I4WXU4LXIdIzr9zD8pviVA
	0kP+fLYTJzFT/skZ8rlfglls+/nuzdj/WVdFyXGh3egLfwo4j+ezIIUVJ5gJTOrt9grT+MAkDyyiX
	ZcG/vk+KGoZskk8XjS6ZtOObww2dtlsSjTjbsFmmA/Ss61oykBuDUXYREGDI4iKXYB9Rb+ltIZ8a6
	mdBVoB4DOtKaolhAAlcBdBVWuHLf05DtXfdbWtbjZNFidxjtTFdTxq8yhWcT/uXRnGri4Ke6n/vht
	4DSpMOljLh/SzNxEtRUFelvfbs1cZdlPsLc+2KdoZpIdS4qlGO4Vye8Bp9+AhwcQZ1bi0UFp77k9t
	KT4Vsn3A==;
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4ZB4-000000028CB-1sdg
	for ath11k@lists.infradead.org;
	Thu, 10 Sep 2026 07:26:36 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-87ffa98d4a9so19431067b3.3
        for <ath11k@lists.infradead.org>; Thu, 10 Sep 2026 00:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789025192; cv=none;
        d=google.com; s=arc-20260327;
        b=ByAgOkAtY8ukIY6kRvDvyKF9Qp3+xGWVknkHAkxGa3ui+ae8Jcfu1ktKCGJO8jtxg7
         69iNskCBKNH+WHBTqKTqC+V8VomGufbMB0n+EGtUS/998RBlFu9Mfike6bQAQQgWV9RB
         7xXND6wc3mTGkerF0kqowTHHsSwqXnIe/7ek1E17uQy35JvbrrShAq5dTGBDyhqPSnp5
         VO/vpovmgZARZBN8+KQNc5aFycdxq56KG1z/FiY15tDNdJguyj6Mdf0aucs6P4c4u7Xr
         7EBE34B3wxHa0ioulKYppEwEw1Ujxyt7eAjFlkQJ5+ovgJ/C/yx+3AmE/jrp2CwsCND8
         6TPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/vXglpmyQqtm2vQGfMHWvnjy2MGvK+hpILt4Bijo3TU=;
        fh=nq4qwE8CskWUmtBIwYw4Wn8WKi0kx1TIhCtAMDfkI4w=;
        b=XypD34gjYRCe/VlEpvwa6ZEEofhZlPHYHVaqdYD06Ux3pWYwLGyjeWlmZ5Z3UCLON4
         EJxViVvnQ/OYTKA7c3CxHPvsOEYXTysBkR4ipBUjdbX8wLdctwkQM5LGAWaoo7o6UFb0
         RGl3ICG8MU7qkqmPhqr4+n44zxXSeXleNENpCFc8uuqIr+wdgVMZaE//kNFKY1tNIl1X
         TW/Ni0EP7UAKlukAp8m7RYCDNSLdsdu0TsP9vgzuOZ3ZsPJyo1NwJzIs05cs5cIFTNc0
         FRHG+VyWb3UEGMkDMpPOUY5AuK3+fC5T8ZQM0UubjgkpuI6WcIayUqs9sbj9MXubAtGj
         eTLA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1789025192; x=1789629992; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vXglpmyQqtm2vQGfMHWvnjy2MGvK+hpILt4Bijo3TU=;
        b=qSrxa7znZQ4Uf3bXrw5adhdELk7nH5jnCnygFEpdAzY+g0rItZOOdJ/nV2PL82IwPT
         M50jp/0BVlock3JBeSET5c9Bj18I8dZ3aDzb+ftu8HgsSJQFesqot7vMmL3CQYicZjqx
         CNZAFSFFJs4LqpbOCoekL3qtpQ1i5zLrtmuQpWZaaqH6NIcnaSE2J+Xo12pMrqbbhhjX
         U2kU/QIV9Vat8Vi2uvgy/BXRad2yt+2rTHLwUoxtaQ5cD2/y/SluzT8ARUAVsiJcvopO
         sFmrAfY+eiM8d56Ai0IQJzngNVe7XKPwBCOVaG9xh6UDzbW+LhMVlBBPNbfSZaDG4TWY
         8wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025192; x=1789629992;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vXglpmyQqtm2vQGfMHWvnjy2MGvK+hpILt4Bijo3TU=;
        b=ghYc4zFlXIGmcFdhoTV+Lawa2KstIM347ognoGrl0nfbN+FLtiMBCRl5eOr8xYnuHt
         C2LuVFIlxncOj1EUQU8w0ac0lE5+O/dqUfXCYUDO8RAOgqYSU/IdoX9u4VdMC+xyd2ez
         qdIgbfIcHFgPaSu9+zVDGYBpmU5n+IX78WhR9/tKtonjiYzS8FwoMxJAn3b8HJrNvDIq
         XQA6o+sJIoE74Lk39k66vaBzDOV6SY6j0D/gi8EZ2XJFIL0XMzBIP2TXNYSBp0l3Uwl1
         +EWCZMfLadBbb3RZjs13kP99dcTgASX3qGZoahR8PvR3roSj9W2mzbLgjlMFy5DzCEI/
         JIzg==
X-Forwarded-Encrypted: i=1; AKwUvBwPAI+41bMksk3DzoMJvsctcaGyWJOdKAN1ThB231oCUC/5J5Z6o7DZlkhclp0z9M3E6NTa+Rg=@lists.infradead.org
X-Gm-Message-State: AFuF++lW6d/udEBlSoY7QtQaEjeEe3SuJOxinDBH4dWDr7qhFtDVsgiu
	B4Jvu7+8KCQ4/gXgO9GvpW14qVoH/+qipD4KN1xilTrwUwMnoM6NtHjxGvR0GBDLzbJj3XYEEM6
	gSSzWiI9PA9KhU89dkxlU5S+SvZRRhhd0otL3Uo6h
X-Gm-Gg: AYBFou31yUdknjxMS1glJJoBUg6HHLUaSLtOGuJPBc9XMQ6STsWgp9+pF+uD2dxYVHc
	9RCPtFacf/a3k9sz6lAdxxqCWlBnAr+WecH9WV3e8DvMsnjSGiJeXVA4lrmqp1D9yEDysr7mrDT
	g1Ntsox0U/ESHa1bfXjHi3HNMJlRJZ+PkovnaSF1ywXosuS8MiJhAaMjpjACkJyY2+xtlBFjDWc
	epR29AOke/ZZyH+pWhz7SpsJd0wCGDGatD2wCgHoadkBgo6/kx/bKwv5ReUgiQvumHKRBgY0lZz
	C3fAxk66D5GDhaPpRt2BnqoFHu/kHhrFwNOufeU1GJ/ymXZ1iaB7LAqCRvT+CSj2mq6DLhKsbGC
	cnTdfi9TEYZv1L7lBr2IjOujd51LXY7PIRXUU/WI6/7A9J6WuWjXLxEJsL5mVDWHlOf8+zMd3IN
	ymUJWk3+HQcS5EJvDrxsEreTGVcp8jR7LkDBf69JEWYl3xqWGB5b3qOlyEHxuzvxRZA1k5Y6Bv+
	ywnsCVGj3oBLaX9nK7oDIFYvh1b1R6f0s6KY2ZIwfEzUlHc0Iy2DpsGsAvhEFJK3VQnxWltPcUB
	lmxglOj9hIl46MbqtL90rhqB
X-Received: by 2002:a05:690c:e28a:10b0:873:5bb2:6c0a with SMTP id
 00721157ae682-8735bb26e53mr93150277b3.52.1789025191861; Thu, 10 Sep 2026
 00:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260910071838.1983652-1-julius@bairaktaris.de>
In-Reply-To: <20260910071838.1983652-1-julius@bairaktaris.de>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Thu, 10 Sep 2026 07:25:56 +0000
X-Gm-Features: AcwNN1WlZOuuaCW-CiTDQ_naRpa8Ngn8cqeQa6DliN7h_89pveR3c7oHeLWNBjo
Message-ID: <CAC1t37+f7+CJ+kBSe25g31fMWE65hme1m1gvB7ZZ_Ydvmce4vQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: request firmware-2.bin directly
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_082634_652201_85E4BB66 
X-CRM114-Status: GOOD (  16.53  )
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

Hi,

This doesn't change functionality, but log lines like

    Could not find firmware /lib/firmware/ath11k/IPQ8074/hw2.0/firmware-2.bin

confuse the average user.

linux-firmware does not ship firmware-2.bin for IPQ5424. I don't have the
hardware, so the fix would be unverified there. Would you like the same
change for ath12k?

Julius

Am Do., 10. Sept. 2026 um 07:18 Uhr schrieb Julius Bairaktaris
<julius@bairaktaris.de>:
>
> ath11k treats firmware-2.bin as optional and falls back to API 1 when
> the file is not present. Request it with request_firmware_direct(),
> which does not fall back to the userspace firmware helper.
>
> Closes: https://github.com/openwrt/openwrt/issues/24743
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
>  drivers/net/wireless/ath/ath11k/fw.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/fw.c b/drivers/net/wireless/ath/ath11k/fw.c
> index ef1b4c81843a..88ec2ffd9f00 100644
> --- a/drivers/net/wireless/ath/ath11k/fw.c
> +++ b/drivers/net/wireless/ath/ath11k/fw.c
> @@ -16,10 +16,12 @@ static int ath11k_fw_request_firmware_api_n(struct ath11k_base *ab,
>         struct ath11k_fw_ie *hdr;
>         const u8 *data;
>         __le32 *timestamp;
> +       char path[100];
>
> -       ab->fw.fw = ath11k_core_firmware_request(ab, name);
> -       if (IS_ERR(ab->fw.fw)) {
> -               ret = PTR_ERR(ab->fw.fw);
> +       ath11k_core_create_firmware_path(ab, name, path, sizeof(path));
> +
> +       ret = request_firmware_direct(&ab->fw.fw, path, ab->dev);
> +       if (ret) {
>                 ath11k_dbg(ab, ATH11K_DBG_BOOT, "failed to load %s: %d\n", name, ret);
>                 ab->fw.fw = NULL;
>                 return ret;
> --
> 2.53.0
>

