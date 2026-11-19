Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D30606A320
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=teOhJ3O5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JN1fs360
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=; b=teOhJ3O55Nv+GurXx/1sI5LnF9
	0fCwWHgDkZr1ZWAH0WqrfUsEEDaMI3pcQUqgnVI+rbrGLzyRrpOGOSMyP41MtCgmvsbwCw1etZ99E
	ZFb74uhmI1k96ih5WGrwSFxpAglfW55mwbvOpqbi5rIUKuom1pEkorqi2gIRCoGvbB3erK9nYITcb
	sUAY8C0FnYgES+u384Yxis6vbzyfuMsYCme9C7hGdcTSRYmdGHyl6u8+p/UfR2O+Xr/M93qh1aBC+
	DhLXwlEEhFx35WQYHs/OaexzSh3yLLbTznkHNsSsLksUW3Gtoe7DoKwcX/EXF26I0Lia0Oahh+Tet
	Es62trWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3mi-0000000CNzJ-2q8t;
	Thu, 19 Nov 2026 15:10:48 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3ma-0000000CNuX-2hra
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 15:10:47 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-7cc81984fceso913273137.0
        for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 07:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101039; cv=none;
        d=google.com; s=arc-20260327;
        b=D/NQutbsYythvC3IkVDG+tqhzviMYM0/uEGFdbgTT6n3JvhFOSmbsO5nWHKbOJuk9X
         ItOvctfKIK7O/mlPzc8jKnyNqrO7wG3i02rDAdGDtZ/vPfq6/Jqs0PLd1YLVMLBlYnn+
         w0nHFCu+IpN198EaRDwgS2F/26TjsCeUkaIsR0HF1CGOJZFYqyf9IuIyS+Op0Cr1yhcu
         Ql5Cuu71gcoqjSBUXLwnkj9M2if/mOy6YafpJDs8qnKI3bAhm6AnlPFqmKpTgTjSjpDE
         rrZOALEDMu1SzCpGYuY9vzBWHZ/LhsmwskbiP3eQP9g0wdtk5Al8XEVCq4XVSk6I6Q5p
         6Umw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=;
        fh=7p79CbskPq1dtbz+Y2B6aM22sDr8lJk9QEGFrBqI8to=;
        b=atKAKGo4PpwrbOwe3NuE7d3M7fhZqERaMnbB/Ia2NbAQsTF31lpQ6+8vUCbnyC5+wj
         dj5LMlcOThl6WkAdCn3WSZ28PmQFnBUSCLQpwN5qhUxbrvoip5P19S7cUsTebdLyjJZN
         aQceMmJ6DY+of2A7R9oE0Vvg3kgbdfWy2Scnckedof0GzgyKqJBYjvgUNYUYn26EADsI
         Qtwn2q/9l4wc44O0hG1pLeVuopq2deUeL4KY4pOOq+BFA2LHLechPedN4fanFUfK1UST
         RvnMEL3qk3nFmuZ2/PhgSJlI+ungtyJ91yC8d9vHbqWUcdjMZwHpUqBlB7esjzTtFm/D
         NxyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795101039; x=1795705839; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=;
        b=JN1fs360vGue0AaUkdbpTJFeVQKcxpMKEP9U8j0/5xbwgl8HSyyO+IHpXkk9B3YRlF
         CKQdVOaNQPndOtRJvuk89qQnX0QtTJqZQ74qtnHbH3b77QfczSBkjc3HyXU9EZ1yj/tR
         mHCRSWbM3v54YPR1Jx7T6JwWTUoUDuHP/RwO0wvluVZUvUfA64IwEAaKvXqcby93FRIU
         5+1L87HbLnuoeKfd+Yq5GRs63UNB4hHd6deycemMrk0Y3/xybJzmcUq3w6Q3Xob7ljRA
         a4crVRYCOL1Ctx/u/9rOlfCE7wV8W2XL0UhbcWiFnIK8oEkw34qwTndsRCzjngNdE6Cp
         DaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101039; x=1795705839;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=;
        b=EIAevo8ckD1AAtNI0lKM6wMm/8Xnxec9vBasobZzW7fe25FIoMm8byMtwvoODsA/Dg
         HBEcEvrJgy8P8l1dB2Rdpgh7L1R7AsEC6J40EW52dOP22LWbr04r1qyRPzzKZHzJPBBh
         z/uEdIjbSvO9Dg9EITRk1mu+3EFcb9wBtjUr4yUZz9DcOpvz7eRTAAR7epuVFrTlB8v2
         EE0oxSjoyEoFdkTuQKAHuGz5HmCHd1m0imv4n19O6FwKGcJ+8G5NHYkwJ9r1Q/oUgc8f
         fj6RlKvoV6e6DbtfxXzDlkaLiPd2Ts57RcTZPNwts9YlPgCNyGTCu8Hr11Xw5rGtHCMc
         Ly8w==
X-Forwarded-Encrypted: i=1; AL+hErEJ5Zn2ufWlAFGF8Ei7xdZUq+hChvR2fujE0RzMeroEkebD4UbDj1uYu2tl2PEGAFvhTDTWXkU=@lists.infradead.org
X-Gm-Message-State: APuU4Z9ikicqwRAlfSTGGrtCXb61y4L2xFMqMV1t2SmpQqSB2tcCDj90
	gfLmDpiU0mnume0+FBhZdKULkO4vVla4u0lyNs79I3uamS6hZZo+K90/nYcGe8jOU83gNBgJxbi
	1kBk7jsSiIsDMsHziD+8OQurrDwxixnA=
X-Gm-Gg: AYBFou2leMoUhiOjJurIZzpUq5TIFhGcP/IMMiN/AwOY89HSIVbVz+s/9RTFM+kSYtB
	ZRi5u1kWj9nZwYRL74BWmQm0VTVmSjbCa78chFsXXo/1RsbrSLhnSb9Y3h9lUoYmIu44MOPd9+6
	0piG01J2cBulUAbhlow6/tsBCWwU85ubb7EdBWEFhqvzP4i4hBj8hjCH2yDGB9XauOyT8bUDmyW
	xevIQ3T60IIGjzo7r/tjX3BZHHRU6zYWEQbTcVnnNKHDsEYrNmvofJqvkxHgEFQKGH1ReJeIXce
	lFO2URPMq21RtHoNxVbJlspY/tBIXKlMkfND4PiVBaSlDWMV66IQ6PX8g93E/NnM5HDlB8AfdWe
	2nGavondN0wvb/qj6dhmNmMPCSmTbRv67MvNPbRS48/8UL+3bO4XQQla2MpgLLDwuVUF6IW9Kb+
	2hgg==
X-Received: by 2002:a05:6102:548e:b0:7d2:840b:b064 with SMTP id
 ada2fe7eead31-7d6ba18e430mr2284058137.3.1795101039217; Thu, 19 Nov 2026
 07:10:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com>
 <20261105-ath-recovery-scan-timeout-v1-3-99a70d89e114@gmail.com>
 <CAFEp6-0O=cPYKndr9hen1jvX==ot2WP4JpGfNFLokVvxUEbxiw@mail.gmail.com>
 <CAKobHXCMwjAHJOkibPbpDByLZmAKkszZ3WaG6soSDaCEGRQjgA@mail.gmail.com> <b879a6b0-4ca3-4937-8bb0-ee3586d60c1b@oss.qualcomm.com>
In-Reply-To: <b879a6b0-4ca3-4937-8bb0-ee3586d60c1b@oss.qualcomm.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Thu, 19 Nov 2026 09:10:25 -0600
X-Gm-Features: Aa3M54pZaHP6ysBEqmdFQebPmeAF0kkje7A47NLqpnzWPq0PTLeUQa2a-UgopI4
Message-ID: <CAKobHXCUawNNtyLn-n9-qXV3F_q9drWXeG28bY5ARiiTLzXO2Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: ath10k: don't arm the scan timeout for a scan
 that did not start
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: loic.poulain@oss.qualcomm.com, jjohnson@kernel.org, kvalo@kernel.org, 
	quic_haric@quicinc.com, quic_vnaralas@quicinc.com, quic_pradeepc@quicinc.com, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, quic_mkenna@quicinc.com, john@phrozen.org, 
	ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_071040_787237_0106F442 
X-CRM114-Status: GOOD (  16.00  )
X-Spam-Score: -1.9 (-)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 5:47 PM, Jeff Johnson wrote:
> Please don't send HTML e-mail.
>
> Note your reply was not archived or sent to the mailing list because it was
> HTML. I only received it since I was directly addressed.

Sorry, Jeff, and sorry for the duplicate: my last resend went out as
HTML again. Plain text this time so it lands on the list.

On Thu, Nov 5, 2026 at 9:53 PM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
> It looks more like a theoretical issue than something that is likely
> to occur in practice, but the fix looks good to me.
>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Thanks for the review, Loic.

We did hit it on ath11k, and it did damage: on a QCN9074, a firmware
crash failed a scan start with -110, the timeout was armed anyway, and
it fired after the dead radio had been unbound, ending in "cannot queue
ath11k_scan_timeout_work on wq" with a garbage workqueue, and a panic
(that is patch 2/3).

Whether ath10k ever hits it I don't know, but the code is the same, so
the fix can't hurt.

Christopher Griffin

