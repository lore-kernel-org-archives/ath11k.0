Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE50C44507
	for <ath11k@archiver.kernel.org>; Tue, 14 Jul 2026 02:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/d9RTLRv5JinBYgTb6BGJL8/az+AyrEr0a4TEEeb6k=; b=IpWyZmSw2+32nWO8phSFmclZqf
	JcW3YFJrHyFM3wVWlDdYvg2vxzBassJlepyAxYE8iohqWD94wwwmegykyC/iebzBS1MfBYqImzYML
	mJw5PdrJJpEinub22HYqGnnJ9g/Vczy99PJx90OWlMyrZsxu6HixG5hY6ecOD+ixRV1q099JEQIV5
	eoFD4wBeePxyv+JKGUWX+NcWybzn5yWQYQgJn8vcAtdq9JpGw6fT0dZTGUAhG5EgB9h8po8rqMey4
	ZTJME8ctUk87iH1em3nWuA8/uJT83daPK3YDWl+YMYkqBkCNt+77GJL8hPNJ0MhxYaDrPGKtBeuIU
	azX42qXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT2S-0000000AlLY-47VD;
	Tue, 14 Jul 2026 02:38:29 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT2P-0000000AlKH-434U
	for ath11k@lists.infradead.org;
	Tue, 14 Jul 2026 02:38:27 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-69532288224so6969036a12.0
        for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 19:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783996704; cv=none;
        d=google.com; s=arc-20260327;
        b=E2DWUoA4JE/ecjklcrbdKtPTaXRIOok2J8KFTGxoBKzm3bi2SrrdDMq0Ji8jxwEysQ
         VHNrbdAs8VpuGScOT1VUW48OICV8fS4nVy3lFdrPEkmx4y0bkeMF7UIbzNZq5BUdkUJ9
         bbBTNuaFwCGw3BmOswfSoTzf+CSFSUlS1HPMcrBlFoZ2ETnExXGIcHIKttfwNDqC4XF+
         il9fLbOPX5wxfhQIRm+2dlNvUb51fsVsXEzSbnisNhGbxdF2bjQznP/mNzJ2H9lnIB0w
         9RorNyAWA4F2UXHtgnU6juD/sIIboI91+LN+yaJAWQZBHg+VbM1q2VgVp/O4Nq2A+mbh
         bpHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y/d9RTLRv5JinBYgTb6BGJL8/az+AyrEr0a4TEEeb6k=;
        fh=9AJRcW+bkcVZ9KDUDuU4UBHu7iNChlYxBMbTvqpZ79M=;
        b=aLmnAxRcc/ZZME3WbqDzz/fCSoMuyOmGnZuV9TK79o4Mw+XCX9Icz/SAJ1vgGUGzD+
         iLauCbZqsSPAlPkCHM1z8yWV0ZKRSokLDHd7eM6UNflOR5sJaiBU+25Gqy9ICPHe1IXT
         CdzzWyBKXfEeT3XqPvH34A3LxK7Se8Je5dW0Rosm7cLn7lbJOPzcEvFxCM4lWcG+BADz
         HqGHXSvqruEqH9l3CsaulyfzDT4SMVgE6nGgcU0j1EpLIVh1mWNTJjf8b611AA5ShR8c
         6shGkw5vV+Pl7dbFfCb2ayvbw3cnk8BlSR2USu1C6tRHd7jl4baURahuQBUxY/SYtw/+
         FPaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783996704; x=1784601504; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/d9RTLRv5JinBYgTb6BGJL8/az+AyrEr0a4TEEeb6k=;
        b=cH+9XL6bOM3VHN/0fLR+6eLihkJVN0BVZSRI+rmyZewb/my6iiCbZb4cxNAwPaNbNK
         IMn8RGZcWoKP6lAgNGd0JU+eae6JNo9g2c83w4F4y3yJ/kIcL1Y7jNWME6BrVNFSeFKM
         W33uBwLh5Hi6tFUV92Doi1ELjipOqz+ucNnh020QBzqR3RqKHanCZg5pbIE3YZc99fZ5
         7cgpdqulXne9IDt9y4C1/yMc9QUBOMC03yk/EE5hxMTzgSPyhr4wPeIgRv98JDLmPz/c
         tWniBcOvPogioVB7yuQVnv9NzzsCmT4+mcexBuTPLGLIGAiX6Sx4U+f9LR+dLSZiuf1F
         Fwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783996704; x=1784601504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/d9RTLRv5JinBYgTb6BGJL8/az+AyrEr0a4TEEeb6k=;
        b=IJUClhNdRZF/4NOx0Go7e6h5sXm7UV766SLan4yUr5dUkbwDnpj7pK/kJbOU8ky+aQ
         S4xTXb3R99PVmMHMJ2b/dDIk+zSnUPzRxCTQRFGWIeLlhfFC2vZGgZtWEkZWPzsukPmH
         4DyBCcNMPFdBBFQrqtWxbRJqssgFqq9mYv3am/fDQWCzc5UN5gAStexpJJGacTqvDzfH
         lGgNxTYQH95+eo7QxtDrvp9uK4w0GYsjZZGkcX0nCoe/FIzyopLt2GV97VIDHWTmNLA0
         asogwjQXhzaqPwhtryr7sAJc+chtX6Z6MbRDuexc6OSHh+8L43NMokogxNjAWIl12rDo
         +Z9Q==
X-Gm-Message-State: AOJu0YypJaLLvv/BavH4MTIidTppzUfpcQUgTdH+bGpGVoViorJrPKSd
	vzXfbipEuhFbZ+Morr53xV61fXiMqAxsdcJ/OIPIEtjqg54IRQ7Uv3HvLVbvA7h7QkWLhyUh8d+
	/UAo6uNW0Pu6X2uCF4CBjFmNxyE8JoC4=
X-Gm-Gg: AfdE7cmQpOvKhyxCtbhRa+CXlmpvGkVgZk8F727R32ZI0kAxtvBf755VSiPFdzXIgH8
	duMlJIhrOQo/ADObzeQvBAvAU7rbpN3bsewTqQxJ+HpGu9HBBKGelILkjqqnRzTLFr83tA344/y
	eCWvjlvijxzyDf8d0IysQqcMOe6eDGlDM+SLnS5N0FzCChg9VVjVQOsbuCEA/Bhoa06OjDTBLVI
	kQRZ/JsZXk7gVyzHFJAcHIixrukf1d5BMLEHXFDBsF4GrZUwyqnHk5ZoDxtRicjakbep7zoaQ==
X-Received: by 2002:a05:6402:5193:b0:698:3469:faa3 with SMTP id
 4fb4d7f45d1cf-69cd6c711c8mr188428a12.10.1783996703384; Mon, 13 Jul 2026
 19:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260711153336.542-1-hujy652@gmail.com> <20260713150151.2343583-1-jtornosm@redhat.com>
In-Reply-To: <20260713150151.2343583-1-jtornosm@redhat.com>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Tue, 14 Jul 2026 10:38:12 +0800
X-Gm-Features: AUfX_mylnAVWH5R49FbGlpdpL213f370VJI3VfyGRvACS5Vk2L5N9PDNAgH5wpA
Message-ID: <CAHGaMk_FbjCShGw++0m9UT+sK+w23okwvx1vkqid6n9M=WScxQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] wifi: ath11k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	jjohnson@kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_193826_019032_98A68FBB 
X-CRM114-Status: GOOD (  15.53  )
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

On Mon, Jul 13, 2026 at 11:02=E2=80=AFPM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> Hi Zhi-Jun,
>
> Thank you for the review.
>
> > In wake_tx_queue:
> > ring_id =3D txq->ac % ar->ab->hw_params.hal_params->num_tx_rings;
> >
> >In ath11k_dp_tx which is called by ath11k_mac_op_tx:
> >ring_selector =3D ab->hw_params.hw_ops->get_ring_selector(skb);
> > ti.ring_id =3D ring_selector % num_tx_rings;
> >
> > Are you sure ring_id will be the same?
> You're right =E2=80=94 txq->ac % num_tx_rings doesn't match
> get_ring_selector(skb) % num_tx_rings on all platforms.
> In v1 the ring identification was only correct for platforms where the ri=
ng
> selector happens to coincide with the AC, but not for platforms.
>
> I will send a v2 trying to solve this globally for all the platforms.
>
> > Also mgmt frames use a different path.
> Correct =E2=80=94 management frames go through WMI, not the TCL data ring=
s, so they
> are not affected. The flow control applies to data frames, which are the
> ones causing the problem since they use different TCL rings depending on =
the
> platform's ring selector.
>
> Best regards,
> Jose Ignacio
>

Hi Jose,

While you are reworking it would you mind looking at the previous attempt?

It tried to follow the behaviour in ath10k but lacks throttling mechanism.

https://lore.kernel.org/linux-wireless/20230501130725.7171-1-quic_tamizhr@q=
uicinc.com/

Best regards,
Zhi-Jun

