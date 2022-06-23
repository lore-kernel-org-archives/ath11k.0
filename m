Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9B3C433EF
	for <ath11k@archiver.kernel.org>; Thu, 23 Jun 2022 12:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FlCTIUNGdMNh/gwElfRVMtk6dg7yKAxDH459d8Z/f7I=; b=gEntliBc+tvg4EQA0etF5AWXI2
	fHpWCTjmdq2MhjfXX/Viexl3lY7ITUiIHPK3cTX4nsTHgMi1e7ka0twtjWTWNBuOnkIWcl0XwZ5b2
	OADX+jMXL6nvswNl4QKrPj+xH8vyi8/FBdqnhRCqAnwBVzRDXWSobepxevuGJA28osq8Z0gaNXl5N
	/Gf7qnrvs2gfUF+HXaMHpj8tSxgc9xCfxY3jVO33yrqmyPgxOnaSPZdtFHR3dY7qCwIenRiXWRJq5
	T5sX+LK+GK1eCf1bfdTcjhjDKL/ZwI4Bw8Q1EDPUiPb5p8shk1wqvvtKLxukz0NiSJwBQlJBJpVAI
	9FvSv3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4M2e-00F1Yk-UY; Thu, 23 Jun 2022 12:34:36 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4M2c-00F1YB-Ib
	for ath11k@lists.infradead.org; Thu, 23 Jun 2022 12:34:35 +0000
Received: by mail-pl1-x62e.google.com with SMTP id n10so715382plp.0
        for <ath11k@lists.infradead.org>; Thu, 23 Jun 2022 05:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=VuOMQlCI1avdbniCdtj/aXnbqcw9t8hvUxpPz0TFLF4=;
        b=SD7FKt3+4MAlzA5/BbcQ9Z9n/Rn7HXNF4Eeph/1kTmf2ZnbV3x0+nUpQm6WEhtwiC8
         Eu7832Jt0j7zo6fHX3RCDyNIPn3EVDjVblgDEnVNygWM6sALv3PXtSS5FqjeiMVaKOij
         H2GepPYROaOkXvtSlpw392q2vicGi32M9Id2nFnlYG0vO5BYFg9QnDi179j7OD0yohJ7
         eNWS3d47DLNs7np2b29/LQfI5vICkXU3XQasExpQBqsG1RhybMIEKMmKJQOY/fA2x4io
         tCCPFOwQ0pClY/0MAIYGzAU8Oy5B5+JQZ+3TrybopjTnTJT15zg3AfhCz1pTpakQY2jW
         W3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=VuOMQlCI1avdbniCdtj/aXnbqcw9t8hvUxpPz0TFLF4=;
        b=dNsMZZIH7mMTE60RtMABbCsf69yeUG8UGVLxZYbq4Jifeq5kw7AsM0HIEEeOf+y9Jl
         nC9/6/zIW/lD8qdHSSTjGDVzFq5wRQqxt49E+BXDf15varZCaRSr01H55ZV9KaZPJbtz
         9gKFPICWLnJNh/ilzQZeex29h6uoVaBB+1082LCLLebgPsX5uQENMEE/Sj5eZDDumPAS
         fwKVzxKBTrCpm+xr1SQcKijijioj9RTIMF9tKfVzsPSGO35Lt/x0PG6gyhn8XBb7zl/E
         g3k5zZKNEaZOIaoI/alTQtHiHobQ0ECIIqkq3rJSTtzOa4eVhkjLVQPTke15u1B4qRRx
         fhcg==
X-Gm-Message-State: AJIora+t/Pd4WDyNMWozXwytM5lhJHtX9lxJ7ihcGJ5tekRNYuF1ZrcB
	iNaqPu/vPUBbn6WCqiS/n5eCqBeCPJ/ejIvxFGLO4kFSZps=
X-Google-Smtp-Source: AGRyM1uoXXmBGS+5MH6gS5KMCh7EHsLNb6JhRX+ivIIRbv9aQt+4pHCxPMsofuvFdviQQ5YtXifqrB8FZY/E1bG+tAI=
X-Received: by 2002:a17:902:d1cd:b0:169:f061:7341 with SMTP id
 g13-20020a170902d1cd00b00169f0617341mr34607632plb.16.1655987670971; Thu, 23
 Jun 2022 05:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAKfDRXi373X-4jSpKtfeJHRqrVXgMKZyQ3gDcDE5c41pYp0neA@mail.gmail.com>
In-Reply-To: <CAKfDRXi373X-4jSpKtfeJHRqrVXgMKZyQ3gDcDE5c41pYp0neA@mail.gmail.com>
From: Kristian Evensen <kristian.evensen@gmail.com>
Date: Thu, 23 Jun 2022 14:34:19 +0200
Message-ID: <CAKfDRXiHw8sAj4hx=gezvoNYe8YVFy_8t71X=Kb4+XpcKB4gwA@mail.gmail.com>
Subject: Re: WCN6855 service timeout issues
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_053434_651670_D567426F 
X-CRM114-Status: UNSURE (   6.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, Jun 21, 2022 at 1:30 PM Kristian Evensen
<kristian.evensen@gmail.com> wrote:
> [   11.336010] ath11k_pci 0000:06:00.0: BAR 0: assigned [mem
> 0x91000000-0x911fffff 64bit]
> [   11.344336] ath11k_pci 0000:06:00.0: MSI vectors: 1

I was finally able to figure out what was wrong and thought I should
share my solution in case anyone else hits the same issue. The issue
turned out to not be related to ath11k, but rather my system/kernel
configuration. When allocating the IRQ vectors, my board would only
ever allocate a single vector with OpenWrt (but 32 when I booted
Ubuntu). After comparing the kernel configurations and doing a bit of
trial and error, I found two things missing in my OpenWRT Kconfig and
which turned out to be required:

* IOMMU had to be enable.
* CONFIG_IRQ_REMAP had to be set.

Now the correct number of vectors is allocated and my ath11k card
works fine on my system.

Kristian

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
