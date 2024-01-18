Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF17C4707B
	for <ath11k@archiver.kernel.org>; Thu, 18 Jan 2024 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8JRHjWU69dwSPIM6WJBhgXT8XsLLJN/pb4e4fztr1U=; b=JsEuhGLPuvPvQvfKEK+8CQ4qQj
	ZX21MhW7jfH12fuMXPQQo83SLCbP0JQ4IxrOeTws3c3dUFKwDlTd5nSGWh3IyjYR2JCoZm5CiXGNf
	iJUrNskiJMk9GZXOR5YgLGhQUCGTLp0fI3k3p+4nVsZXKaUmI+wgfnOTRE/WZZ/bDr8PER4P/MwJW
	lZK0E0GixDvf884wqhlWp8GPLN3UXfSkhwc/v4L75xfcEsQAxK2CtjVeN2M969y7JJXkziuWdkXTS
	g4SR6vNANrih8WVqzZIec4j39c89HqO+vkkL3x1XhHMbVmLVbb0tjKQ+/BHgV5bQP9Ooeg/zo0a+g
	uKDaxEhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQPh7-002PJ6-2C;
	Thu, 18 Jan 2024 10:32:21 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQPh5-002PIk-03
	for ath11k@lists.infradead.org;
	Thu, 18 Jan 2024 10:32:20 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d5f388407bso17062445ad.0
        for <ath11k@lists.infradead.org>; Thu, 18 Jan 2024 02:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1705573937; x=1706178737; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8JRHjWU69dwSPIM6WJBhgXT8XsLLJN/pb4e4fztr1U=;
        b=Qju3YnpOfO5WiTmV4HrF2k5YiujEs8bF4WkMQ+kNSE4UNjLdWYM/WuYDBJy8N+2CCO
         sV30b9WnA/wzq5nNvi8d94DLs9fQU3J22NOOjJYfERP9yP37ls4XZh7d8Js9dhQckwho
         F/kRzhttbAcxxoYgn3fKplIzKeIjN/AJwHdpTtpkpcrlhSFbb7+ZXT68Yz/n0a0NbOOc
         /buFA3R2ZaN+ZEpy/oSKWgCDmEy2W+heDAB4vceDzVTdyzCe/+kCsmxu8JIFOY4gc8DB
         NhqfRGTJstdpo/Azw9SUd/Yq3sAZgO7kBWdnn7symI4shejIBM5v2dhMhuRBfS9+tAbW
         1scQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705573937; x=1706178737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8JRHjWU69dwSPIM6WJBhgXT8XsLLJN/pb4e4fztr1U=;
        b=hNlciKSHCKIO1gQpNCeqE7xrygBVkthNFuqqgudaBn46Y1AFtyyljKItPvd5J7iIFC
         seKPzDyZkOgDRQfi/xO9fG6tmI7eJipmjNzoyC7mHkXqGuk9OTRt7qiXQk/QNOhhG236
         njkA2XhZl0SWjKnj7tLoSamrZaY+0dh6KFGMbamhxFVq4tmBhU7J2UYVNRrtu9tPyCGc
         wGL0DDUtSf7NTgi0QEfhHQczmrjwgQEVezjchmDQflDlvffV3P7fard6aygg0HddUEGY
         4vFNzrveXWtF8Bh8wmxFVHYYo8PJqpY3rQwh2LOMhO0tJ9lURdG8bBjI5Kygydo1jYhn
         PUvA==
X-Gm-Message-State: AOJu0Yx6EIsHINjmrL2Bc44i5OCf9tFeRVNHSw9MzxD7vIOh7606pgRb
	4m+nXzPgPXCE5CUMA4DG24JrPW42WHTutJFf1oVT6zOIqhB5E6a+5wAunlQiqnKNJyTJkt8mOlh
	0uMYDnVzSw1J8mI4lLmtukqNSQPgmLIv5SYjYjA==
X-Google-Smtp-Source: AGHT+IEDM3HbbsuKApku43Lu/2JjWxFCcVci23+0cVFkNikC0krrWi1PaUl1FpgsS7iQZdhfQGRrv13ZX/42Dd4tQJ4=
X-Received: by 2002:a17:90b:17c8:b0:290:ce3:a734 with SMTP id
 me8-20020a17090b17c800b002900ce3a734mr482097pjb.25.1705573936909; Thu, 18 Jan
 2024 02:32:16 -0800 (PST)
MIME-Version: 1.0
References: <d857016e-7bea-4f77-8931-97b0d56751f5@westermo.com>
In-Reply-To: <d857016e-7bea-4f77-8931-97b0d56751f5@westermo.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 18 Jan 2024 11:32:05 +0100
Message-ID: <CA+HBbNGiM9hyFCFq9-sWgL_DFHNKzdDeW3v2YHR0Z9YXxbG1jA@mail.gmail.com>
Subject: Re: ath11k: 512 client support on QCN9074
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_023219_062731_9B58B3F6 
X-CRM114-Status: UNSURE (   9.22  )
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

On Thu, Jan 18, 2024 at 11:31=E2=80=AFAM Alexander Wilhelm
<alexander.wilhelm@westermo.com> wrote:
>
> Hi kvalo,
>
> The QCN9074 module with the ath11k driver currently only supports 128 cli=
ents. It should actually be able to support 512, shouldn't it? If so, is th=
ere a firmware restriction because of this, etc?

For that you need to change the FW mode to 0 as I think it currently
defaults to 2 to save on memory.

Regards,
Robert
>
>
> Best regards
> Alexander Wilhelm
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

