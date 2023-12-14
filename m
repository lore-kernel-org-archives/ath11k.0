Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABCEC4332F
	for <ath11k@archiver.kernel.org>; Thu, 14 Dec 2023 20:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBNdejPAlPvs3n0FNMJ5WmjAA7SSDd67jrYUR+Omcec=; b=4u9Y0cw3cLjFPQfm/RtP/2k0ZA
	2GZqQHum7wQhdpatsgJ+rLw/ve7xnjzpSRWnmWhmhLqalRvZhTfpk9dp3gEJvopphjK/ge6iozUgE
	RQ+IuGU0p5u47YIS0fSShxt81XWr6xeyU4ePlSZmq3cza9yv1nlkQlxT6y6OICEYFE30nK/iMMLtc
	tZGD0RaDucnjr+JM4jU0Of3ScrhTdf/ryLkd4D25KRTh0l+3KKKE3IdGHhBLWPBKYuurr1zalKmL1
	E0+N1Eaiwcx99o02poCJK8EdB8GdSMc9xqYhPc5X0k8j03/t+hnvMgDmeTgJwHgpij6NWb17HrUvA
	LiByiYtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDsLH-001EEX-2g;
	Thu, 14 Dec 2023 20:29:59 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDsLE-001EDL-1x
	for ath11k@lists.infradead.org;
	Thu, 14 Dec 2023 20:29:58 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-54c846da5e9so8028394a12.3
        for <ath11k@lists.infradead.org>; Thu, 14 Dec 2023 12:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702585794; x=1703190594; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBNdejPAlPvs3n0FNMJ5WmjAA7SSDd67jrYUR+Omcec=;
        b=GlKasd2zdhxlzirrtJkXSlCZ8aZGpsMkPSPRyar7sR0eWRioFMbrUPELpWUIUMChgl
         pL9sjO2LezI0IbfTBzt8cLjR42uxmbApoeoJpARBhkHOPnlhUwxSxBjV2pWbGb2RSoXU
         8f7c/fPVkHrmlIsdQO+pgjskclPluRX0JErGuL3sDMAgDl32JPjG2wl2HJC0O99L1RYJ
         s6YKWvNNQitIX+mZ8GMA+TeVplQ7Wyu4AkJnOT1BR9CrUwP+2vGxe3RoMi01kZ0dmTj4
         m4GvD3vMwsv5Ckm0lODq84uJMerNQ09CkT3NWxDdoDqgS/2/8JJIb1+xMIqGlqCNhv5f
         hDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702585794; x=1703190594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBNdejPAlPvs3n0FNMJ5WmjAA7SSDd67jrYUR+Omcec=;
        b=SDq4nrASDFu+wrkYA9MQFk2RmrzYbWQY+qX2HM8naJWFEWll1tiENJ1esDVjpkcsa2
         h+8BICZBOa+dR1gJDg+5uwsp1Quk6uJgNQzPyZe7Odw+ltaSzoDbW4jvyPZUN7dFN98T
         QaBjlHMNKVJX2VsNSwEP8o8IBjku9TGZcDMgRi/QWR/J8rrWHy2rk0qs0YxWdk4qIufD
         oDWw5Y6msyiG0Qpf5Qq3aHfrGs2aX1qb66Y5nW+GyZqtVyuwERGrS6YRA9Y+D55xxkgr
         OskDZAr0sUXVthVsejbprPc0GCaKpIFnpsvpKk6py7uJ9S+D752vDeOnNl0xBhGmmFuB
         QGNA==
X-Gm-Message-State: AOJu0Yx4y6B9ZlmQvcV/kyFHlfN7xpN2UHgxYlvzTtedKtaLU/V+W2C/
	Zx4DZOZ0Lzgb1Kws5RO+uhLRVhke1JW3LHpSbF8=
X-Google-Smtp-Source: AGHT+IFjsrsjvWYR1p/N0hnm9A5PI8s0wRr9QVTJaZkA3oTpuD2snmmCDKeOYScnCGON4QQ5e0v9Mfw/wBhs3igtLDE=
X-Received: by 2002:a50:d592:0:b0:54c:5fcb:8138 with SMTP id
 v18-20020a50d592000000b0054c5fcb8138mr6300772edi.3.1702585793641; Thu, 14 Dec
 2023 12:29:53 -0800 (PST)
MIME-Version: 1.0
References: <CADS+iDVE8GB_+H+1DAPwcwdpjddUqzsvRmnygtXv7yUxRwLTZQ@mail.gmail.com>
 <87a5qeof5m.fsf@kernel.org> <CADS+iDXNkGWba7cM31CNTeaAJFdr48Zi8HGtYKQutYWiKnxjdA@mail.gmail.com>
 <87o7esn7j2.fsf@kernel.org>
In-Reply-To: <87o7esn7j2.fsf@kernel.org>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Thu, 14 Dec 2023 21:29:42 +0100
Message-ID: <CADS+iDV5eGc6RpWpzPMyO83xmiV1GgbZfqgeLnAukVaPv3BnJw@mail.gmail.com>
Subject: Re: wcn6855 - stuck in 20Mhz on rx, but full 80mhz on tx
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_122956_640180_06E29233 
X-CRM114-Status: GOOD (  11.18  )
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

=D1=87=D1=82, 14 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 16:11, Kal=
le Valo <kvalo@kernel.org>:
>
> Yaroslav Isakov <yaroslav.isakov@gmail.com> writes:
>
> > Thank you for answer, unfortunately, I would prefer to stay on
> > openwrt, until it will be ruled out, that issue is not with my laptop.
>
> I'm not asking you to switch your firmware, I was merely asking if you
> had tested this with a stock firmware or not. The more datapoints we
> have the better chances there are to fix this.

Unfortunately, I did not test it with stock firmware.

>
> BTW, please don't top post:
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches#do_not_top_post_and_edit_your_quotes

Sorry, my bad - this is what Gmail does by default. Thank you for pointing =
out!

>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

