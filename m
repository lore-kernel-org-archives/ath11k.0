Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E50C7EE31
	for <ath11k@archiver.kernel.org>; Fri, 27 Jun 2025 07:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sn0WeSM24B/vzlgYYF7p/UbB3vjcQLKlmQkOWEDTPa8=; b=KNie4eYBQu7upuRtZoB9nfvoKo
	15/grYYxwjrPNreqQfYb3mNqeSc/8lXEQFV6NSjrtXWuFOYodfuk3Yi7up+4cM5yFfaVuSyimz2E0
	VmHl61ci5m53EFBnF79uZw5pSzeFZUQ1PWK/C5PgUD//RvlPIcmc2FBTvxYllZb36NDOUlBRnFNST
	lGNX6wYn1upXir2XOfPiVQM673eOF9rzWRH7rCCH3QlgVa7EHg0BagZSh2KqYdJhIS/PqVfC3AKT2
	v3OwwB0YmS79W1aCo2PyBtqHE6Z5QPer+dtAITT6oaLvv4PPbKRMCJTIorcm/WytN3FCLMW5hbq05
	b7cBS2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3h8-0000000Dqqe-0x46;
	Fri, 27 Jun 2025 07:40:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3Yr-0000000Dpcp-2RCy
	for ath11k@lists.infradead.org;
	Fri, 27 Jun 2025 07:31:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-453426170b6so15798695e9.1
        for <ath11k@lists.infradead.org>; Fri, 27 Jun 2025 00:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751009508; x=1751614308; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sn0WeSM24B/vzlgYYF7p/UbB3vjcQLKlmQkOWEDTPa8=;
        b=OJKiEKBah/FvSHBlYHfPmnjbIzqPuSyfrEIraS0c7OHeh2Rfm03XzctD57oETqTGXu
         Cp/wRQc9/t/2BEx1U9yLI+hhZx1P8jHwps+qKt2mNFY8YzMGiAlZyWLyguuKWpYkPlN+
         1IjPNhYicRMFcoKVt+Metnk7Jt4CffFUP/Y8WmcgVcj5Atv5rPitxMNENFmNbn5D+18J
         VY2xVwRoLS9U2EE0blWWbOgwsvzpHmkjT4RASgC1w6/sy864/hbYp7YPkPEE/OzlMTHL
         Lf/MdJpySMDg5tSrQL4Jofs/vUKTaRx0nxcaI5c5LuYVzghfhXZPNJz9jUg+WtzPIa+9
         cT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751009508; x=1751614308;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sn0WeSM24B/vzlgYYF7p/UbB3vjcQLKlmQkOWEDTPa8=;
        b=fzOAFQTg18J/ufTLMSLq1bNPcg6UIFqBzdMZXkgvjlfibfEdiRRrCBapW/zBHT0FLR
         dEL0kWpKwa6frgvJljxtbyV7oRF/D6NDb4UHZOQciZHIdHQaMFXQy4vbvQKTVBKbuqXl
         L8+MLTUiNCPy01IFZ1znSS5609CS9HSna0VNV68/pHDE3y6uyTw8II4C+kJq3t1X/VMa
         C2DowxtFal+oMqG9bMyKuCH/pS0os59nkPZjje093OyLLFq73BDz34LRx+4wzIDCSD2F
         2e4VUeA6s4qpCmV6tqema3DQcb7EBKi9qdgMgGaQLbUZvLkI6WIQQH2Ub9GiGynLutDM
         Npqw==
X-Forwarded-Encrypted: i=1; AJvYcCV2/Zc37MeSHJ9lXAXjGmtedSijtieZCeXclGtbXI3KrfRJjJIIoX8OqZf2J8yudvPUI/iMS7Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLdSVbGQ5vM/qti5PPQLh7gjvX1sPZdWZ7Oi9EDVuje81RItBc
	DUn3egBqD5dKyxfdy+xklM1a9Pku9Fn1QTgYxYLtD2Aea70IRVKR3HLl
X-Gm-Gg: ASbGnctMKRDzc7mmB/Xa8mNDVXKy1/wbCa4AxzDSwHMmPxGIfTQ9id1MBtDz201eHb0
	IAy/G9roA1lFSweB4X6dnG2nkPhAfp4B8Dcg46xRrw7KcH3TzAamvvOW5a2lfIoRJXn+A5Qh+Eh
	URCTdC2v3XxrqMCuyjI0i4kQmR3uBL2ttbGY9yB0jhD/TZbfdiNiMgjX2aokmrtAP4F2eftJRuF
	9/uRf8ZlAXA6a0NajwUDOwzhAcNUw34OW4AYdRDERHUA6K1AjK3B9lh9JfbahSAxNzJr9w0dKt4
	PhwNkk97qOfHHLYD2j0NgKcLP28y9LJbiVEEhRfGOxMM5kj0QyIcjjUiskXh4EeTm4JBBK1xcTG
	FZoqSY0HENDitsJk=
X-Google-Smtp-Source: AGHT+IH0LyLYrdKmf3DPLsDNklPgmfuPw+5P0zql/CEgTDuwp2yhva7iCbZKj/XeODsOzg7JnSm5Xw==
X-Received: by 2002:a05:600c:1994:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4538f309394mr18058945e9.14.1751009507308;
        Fri, 27 Jun 2025 00:31:47 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ba553sm70454755e9.31.2025.06.27.00.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 00:31:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 09:31:46 +0200
Message-Id: <DAX52ECUSPW5.1P50QHZ8X2QFX@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, "Steffen Moser"
 <lists@steffen-moser.de>
Subject: Re: [PATCH] Revert "ath11k: clear the keys properly via
 DISABLE_KEY"
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Vasanthakumar Thiagarajan" <quic_vthiagar@quicinc.com>,
 <ath11k@lists.infradead.org>, "Sven Eckelmann" <se@simonwunderlich.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250117191455.3395145-1-nico.escande@gmail.com>
 <20e0a239-3d23-473b-5bc8-41bc25a64088@quicinc.com>
 <D9NDQJB4VMWA.V4IPOZOIR46W@gmail.com>
 <0c166b5b-f358-1f39-4569-a1ac388033df@quicinc.com>
In-Reply-To: <0c166b5b-f358-1f39-4569-a1ac388033df@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_003149_636849_29A841C0 
X-CRM114-Status: GOOD (  14.43  )
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

On Tue May 6, 2025 at 11:19 AM CEST, Vasanthakumar Thiagarajan wrote:
> Hi Nicolas
>
> On 5/4/2025 6:06 PM, Nicolas Escande wrote:
>> On Sat Jan 18, 2025 at 11:29 AM CET, Vasanthakumar Thiagarajan wrote:
>>> Hi Nicolas,
>>>
>>> On 1/18/2025 12:44 AM, Nicolas Escande wrote:
>>>> This reverts commit 436a4e88659842a7cf634d7cc088c8f2cc94ebf5.
>>>>
>>>> This as been reported by multiple people [0] that with this commit,
>>>> broadcast packets were not being delivered after GTK exchange.
>>>> Qualcomm seems to have a similar patch [1] confirming the issue.
>>>>
>>>
>>> This will re-open https://www.spinics.net/lists/hostap/msg08921.html
>>> reported by Sven. The recommended ath firmware ABI during GTK re-keying
>>> is SET_KEY instead of current DEL_KEY followed by SET_KEY. We are looki=
ng
>>> at other options like some marking by mac80211 for the driver to be abl=
e
>>> to identify if the received DEL_KEY is for re-keying. Also I'm curious
>>> if roaming between secure and non-secure mode is a critical use case.
>>> If not, we can probably go ahead with this revert as temporary WAR,
>>> @Sven?
>>>
>>> Vasanth
>>=20
>> Hello,
>>=20
>> Any news on this ?
>> I would hate for this to sink into oblivion once again given how hard th=
is
>> affects end users when it does hit.
>
> We are working on a driver change w/o reverting the commit, we'll share
> the patch once complete.
>
> Vasanth

Hello,

I might be mistaken but I did not see anything posted for that yet, right ?

Thanks

