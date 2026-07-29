Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ED1C53200
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 13:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIAx79LJq6yxaX0RmXwDdX2gojdN9qwdNc0W9PAeu88=; b=RWBkPWQ6Gav233pKDEEer8aXY1
	2xscujCiDc2JxDdpdykzeFWEeIQlrW8IxGIrp0kiek30UqmXIgZJJEECtS/25hOfNc3R5RJ+OlTX4
	eHZ5hkXUz56U5ApkZ31OT+5JFjjBgtpxobeacCKEU8WXtEr4UgoQqE21OVuPh2xqg2z0tyvnXxkba
	WE88leDXmHxzS5uXL9HU4WeTfk7Kpzecp52FkSjjbkjj+QpVGDAx6Ab3kxQ1Li6Kg0AXO7X50p92H
	N6d+951lijhQnH7/RkwQ0ip1ei69aPGKxHi3Fx934QJGKEdmTbTo63+5ELv1clf2aqMiXvBsthEwG
	lqlz1pRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Wv-0000000893Y-0hFz;
	Wed, 29 Jul 2026 13:41:05 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Ws-0000000892e-0A0q
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 13:41:04 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7eb29ed2bbdso380361a34.2
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 06:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785332461; cv=none;
        d=google.com; s=arc-20260327;
        b=ek5ij7z4ozcmDVXtwUjGt6xBbx1dcet4PdHI4G6j/tWsXNqaWek2J18iyNCBqSdV8p
         teAlts7DzlhEk4UhRftoIfYtaZOnrSqy1hUHjJhjVrjZ/HBMxrnXTI4bOMrY/odP5YVF
         oor4xE89/L8vZEHdEaQu7R3t0ZYZRKL4skiU+mKJRdrJ98MMxHhbS5bcBoM/r1xM78RH
         jH5q+6kS69Ky4KD7TD7zzguLEIIJZd/6tuMUg2qn8lYqPkRTRyBJtFpsWLue9fbsG9Nc
         VaXQqMvpyuHMtOL7UddG7wdjgV9OrIMi1t0RauGw6PNEHAKEY1o/AlyInNC5w3gu4BAh
         Kggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hIAx79LJq6yxaX0RmXwDdX2gojdN9qwdNc0W9PAeu88=;
        fh=5JJmD25SWao/8QL9ZTEjiKp6ZpSghD8T9uKpTR21CvE=;
        b=RtbJVMKgNqeN1b+0mwqDtAxq9q+bsgY38kffnIBN8YlnOZUJCwMx579HJrtlfFb0pw
         Jdtxtpym92JbXv4py9V34QvHQfnZkPslhiXk2hV8T8dR8Ajt1c9/nyGBBs2jJNo1FIbR
         hHkV4gUqM5zqNXwKGXFTklcTHiMK+0RErsXIvMSwytB2jLcM5yrwxRjx/4U3Hr45+d0n
         QZE5Nj3DRmnOTAOla+ZC7znSchLDenjuDvc2s0xN6+pDo0sOUqHYZO3C4NmyFUFZ9/wg
         NCiWtUJ9QskoCbpPtpc6PpMpshb+gLiPyf7pQ5lth4GrqE3AWWoAt6I1DN9NUgHuENbv
         gyDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785332461; x=1785937261; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hIAx79LJq6yxaX0RmXwDdX2gojdN9qwdNc0W9PAeu88=;
        b=lfr/w+OFRksWPy9lA+Af3lCgbykurOTrcuOkvumzlUIvQi79tOF7Phi4HBc9ZsE/gN
         klTPPFA8dhUzmp91ZoRdV3cdAcpFH1oqhKCm46NVC3qonGoWkJalWBY497iChrY0Wx8u
         yYiK7mvSfyj8QWxpvcNm3nksOQf9l3m6qP3ChLu8kCZO/LLW5g0wlXeZ5lVSI/lcLkFj
         GFvqRPwjTrh3KHYWy4aX6cgj0fNecX/kEW2tmyZrdSckEVN/HC0KAcFN7LR1TZeFPy+N
         fiGYkCg4Z9IgyskNCNMHmH3w232TcnORZBDcZf6EnEQS0o/TRN3WnPs733SQDjsapl2k
         6C4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332461; x=1785937261;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hIAx79LJq6yxaX0RmXwDdX2gojdN9qwdNc0W9PAeu88=;
        b=oJKBWm2AHiOek+NL9cAyWWbK5Q857qD1G4RcwzSkjvDhRw7hLkh30/v0U3nXuJUOqD
         t3Jzp76ymyt+W4Rr/X9uct0oTA15qzgWzLqpp3jmy+IC6x7hCtKREcw4f1KByjkb4lsd
         17ooyZNCcn1zmZQ7SEedmF7Z+ZnaaJNa6NqzMVnsPNuF7zSrF3VP64Ft08fNocG42lp+
         50C9DlcKYN66STP3mdvKI3pUUVQly46V0z7UGtSUIW/HPP0e/LuYLoczmvcr4SNoYNbJ
         YQifQU++wrAZ7jfVAWxiLAi1LIQvKytGM5ddp8fCXd+qywyogxobhYA0ZZKLl0HCNF8g
         Voow==
X-Forwarded-Encrypted: i=1; AHgh+RrRAXyQVIqBH11Q7O7AdB8uzJ4mOBjG9jykWkmuLxNR65lOEtmStk9tqMp4hfofTGcSR99mMoI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnzckQd56EOZbPBFEj62UNLk8wjdy1b5i7M0Gl5lRbBiDEjgNK
	+YB6hJKG7oGWmKiCFukmNRfDet5nffduyQwPZe3DyBN15Ay1BW++1HaucKuApNkm4CTqI7Y0OUK
	Kik06d9QzC0nmWzi7pYRywlm5/LARX9M=
X-Gm-Gg: AR+sD11NabzmSyBil3S4002RVeOO1XfYgqtNPRY6Q0iMMsBOtrju0nuzYDIvIuqLEjq
	GvXaFmds4bvkQ1QVYH8JdTiAloUgv9nj5wOgEOCCytTi6ckpWuizczDe5nPv9ZTa8C8062yM0qt
	wduTCtj5VJnp4WPlIjsVxbWE5RlKwoVOTEfXv5zq6WUmLN8CH2DXTRefsbnEhDktNVd7IND/XYF
	wLcIp5+3g3WusC/Vtcc82vvvPplhE0FMhKU14XREhErsKEwMA8+ofsk1ItlvAq2Tcwy4Pqi//uP
	eNIROISkLnS9BS8+V8/MpGSICA6inv+SScKYlOd4LXE=
X-Received: by 2002:a05:6820:81cf:b0:69e:b8:ffe4 with SMTP id
 006d021491bc7-6ac96a9188emr3235833eaf.32.1785332461086; Wed, 29 Jul 2026
 06:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260719215817.2468580-1-wabsie@gmail.com> <20260719215817.2468580-3-wabsie@gmail.com>
 <907535d1-1d0a-4174-9513-11ef27002f36@oss.qualcomm.com>
In-Reply-To: <907535d1-1d0a-4174-9513-11ef27002f36@oss.qualcomm.com>
From: Mark Ruvald <wabsie@gmail.com>
Date: Wed, 29 Jul 2026 15:40:47 +0200
X-Gm-Features: AUfX_mwFJRh9UFyn8vVY0g4F-did_bGoH3rJlMU2VQPVwBGttxNK5Zw1bdL-VIQ
Message-ID: <CABmnzGrncCNgsjKHyScF_PzCWdBeezBb=utBc36cYhbzL-WyQw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] wifi: ath11k: make external IRQ control idempotent
To: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>, 
	ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_064102_081194_6FA51027 
X-CRM114-Status: UNSURE (   7.67  )
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

> can you elaborate the scenario where the repeated lifecycle disable
> happen for better understand ?

Hey Karthikeyan, the scenario is a failed reset retry:

ath11k_core_reset()
  disable IRQ/NAPI                 depth 0 -> 1
  power-cycle
  recovery does not complete
    another reset_work is queued
      reset_count > 1
        wait_for(reset_complete) times out
          disable IRQ/NAPI again   depth 1 -> 2

later recovery succeeds
  enable IRQ/NAPI                  depth 2 -> 1

NAPI is then enabled, but the IRQ remains masked. The patch makes the second
lifecycle disable a no-op - ie idempotent.

This is an error/retry path, mainly the PCI/MHI reset path.

I haven't reproduced that exact sequence on hardware, but it was under
suspicion during testing, reloading of modules and kexec etc.
So this patch is more of a belt-and-suspenders kind of thing.
Idempotency helps me sleep at night.

regards Mark

