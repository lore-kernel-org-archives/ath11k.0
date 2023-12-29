Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E6AC47072
	for <ath11k@archiver.kernel.org>; Fri, 29 Dec 2023 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlpHUV934xeWj/GmGxoroC8pFjnyo71M4P3yOzuAnJY=; b=z/yqpFUuFpq9YL6sDFSJwL1vpb
	t2atwSaUxJwlgL7zPWLwwVvqH8vfQ1twBym4jTOi3hfKwXmccWLylwZ5geLqqJcn7Pe25rB/ggDLi
	n5wzc/C28YnT3fQ2jSREcjLkj+yy6v60QbrVAp/CC4eX383djcvYqCDgWIQZQ/kUXA83LJQSMbOzQ
	Z/4VHOrVHYrHIxMkgI6nr+WS/Croy28NGBEDyhp/LjKsptEPt18+lNeD5eVJyBZsrKrAKn7C04glT
	pycG/OA18b+xe6gP7r4vyPDIVtbRZj8EGcOkMB1qHckSU+y3bQaCD3OPREumeCJNteazmx2ykGXuT
	PPhvBogQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJGJu-001Dqe-2H;
	Fri, 29 Dec 2023 17:06:50 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJGJs-001DqJ-11
	for ath11k@lists.infradead.org;
	Fri, 29 Dec 2023 17:06:49 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a2335d81693so1219588766b.0
        for <ath11k@lists.infradead.org>; Fri, 29 Dec 2023 09:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703869606; x=1704474406; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlpHUV934xeWj/GmGxoroC8pFjnyo71M4P3yOzuAnJY=;
        b=ingFSM0SSmzdLlqCaD3opfAQA5rUAGQsYh+ORdYfOlfruurctL4ckU3fLxph3IRaFu
         no4QI9X3FwAln6ATkPQ8s2h+bsftCscizFK6nagmbOcBtN9xDd6uPMYYQvyptCfOFrTO
         eo59eQES523W1papbN1CTc0RBuK1dvPxINizHatFkLS1fY2rdf/4svgc/D/doQVpHFkU
         LiZ2cqJuklbPAGFaX8xvFzKHVZxgim+hszcYcewECMmVrcbCA4lVVzyPfDg+d4hsttXF
         KYiq0rorGVUhNhVQ7hbAJ8jZNFr+4qizO2Ap4mVZJKoOASuUsAm8SQ7qIynDWK5wRVZe
         ynJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703869606; x=1704474406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlpHUV934xeWj/GmGxoroC8pFjnyo71M4P3yOzuAnJY=;
        b=wD3TODSQcH607b7qbjMHAatBTyvisPpLQUZr6Y9tbxErYIqgEXD21uP95SrG11+jbC
         RXffJoiKeWV0A53Le+Jk3yxyfHvAqH7JJu5iXEuxvK4I4gBKZZ+grdy+mxDRee3wmEK1
         3k11BJhz+SAdIxgc+bpTtFjEiMz6SdTwTJdSwUiFw/wPcVfzv591sYEituZmd9unDZsV
         DBdieIVGlXD/QAN/DKqxVXpjAS2AyBQaUzvuclz6fqTAbGNCmXXJgFbAD6djDBmM+B7+
         y0TTnb8hWMbBl8rdo2t/XRaI6mvI4fONu1r5yIqeQYUpEHxy0a7/nzIoVmgyvtOUah3Z
         ig5Q==
X-Gm-Message-State: AOJu0YzwndaovtQEAC+1jEDdXCKVG17+dz85uOqAnW+oEwsukrAXJbQs
	UhT59IDDYUPK/2IfTdRuFnj+KQiIxJteqSyLEj/XAAs8
X-Google-Smtp-Source: AGHT+IEE8O4Dpnx+zHMn8KY6Lq0r4JtP3ZjYX2sfTxieDoTPz+krNHoFgk2NzmdR39B0d0/7JLlLGfQK0twfGffMDYM=
X-Received: by 2002:a17:906:3481:b0:a26:8f35:20e3 with SMTP id
 g1-20020a170906348100b00a268f3520e3mr13441152ejb.4.1703869606512; Fri, 29 Dec
 2023 09:06:46 -0800 (PST)
MIME-Version: 1.0
References: <CADS+iDVE8GB_+H+1DAPwcwdpjddUqzsvRmnygtXv7yUxRwLTZQ@mail.gmail.com>
 <87a5qeof5m.fsf@kernel.org> <CADS+iDXNkGWba7cM31CNTeaAJFdr48Zi8HGtYKQutYWiKnxjdA@mail.gmail.com>
 <87o7esn7j2.fsf@kernel.org> <CADS+iDV5eGc6RpWpzPMyO83xmiV1GgbZfqgeLnAukVaPv3BnJw@mail.gmail.com>
 <CADS+iDX1aU9h_OuR3K+r6hTX+zUrCyN0sG4uzyKm9+tThS9LZw@mail.gmail.com> <CADS+iDXMTRYN86PMuGRBcHtPB-hsax_X_XUAPajXsUYTRnwk-A@mail.gmail.com>
In-Reply-To: <CADS+iDXMTRYN86PMuGRBcHtPB-hsax_X_XUAPajXsUYTRnwk-A@mail.gmail.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Fri, 29 Dec 2023 18:06:35 +0100
Message-ID: <CADS+iDX2c17iaoXkNDbPxYr3FMwQHZDbEfkuycR52vo0hLy1hQ@mail.gmail.com>
Subject: Re: wcn6855 - stuck in 20Mhz on rx, but full 80mhz on tx
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_090648_359387_7E0E3FFB 
X-CRM114-Status: UNSURE (   6.49  )
X-CRM114-Notice: Please train this message.
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

=D0=BF=D1=82, 29 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 17:46, Yar=
oslav Isakov <yaroslav.isakov@gmail.com>:
>
> Hello! I managed to get another router, Asus TUF-AX6000 (with openwrt,
> too), and on this one, there is the same problem with rx
> bitrate/channel width display, in AC mode.

Looks like the issue was with GCMP-256 cipher. I changed all ciphers
to the AC ones (CCMP+BIP), and now upload and download speeds are
around 1gigabit. I'll try different ones, to see if there is issue
with only one, or with all modern ciphers.

