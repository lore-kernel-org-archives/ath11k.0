Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E79C5516D
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 14:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/jguCjf+KBIfGvaAVskMUdU78PiWlYOOsYiLMy7Qgs=; b=JOOuMNHo9WLbvU9nvsUpaLKh5B
	33ZqDxfDdFGRXsu0eqG0ATq9FDc4tSSd/n01Pht5+GzI16x9fOTGUKxzFzLfpPT/AbyQeGQP80Que
	uwhxdmN8qyGGFJ1jg4IJc4Rq5i+GWZVaBus/nhP9TOc7hlIUESIJFUVX3ynbYBWdLJYaQa/UVWsQ8
	jpPRaAVHewbw/XjZkQ8XKjoE15w0roktn3X1ivGeWcaIo14awX78wa0y8zh/cf1h1xJSbDXE1Xykx
	RT7RT4rYtE5qEXPI0ocQUsbaBgJTDUPXzlbUoODTtqO6LQZypC2MWPW7VqTgwfM+pBwR1PXsDMUGf
	UNN5N+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLr-0000000Ck5K-0FWA;
	Fri, 31 Jul 2026 14:36:43 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLV-0000000CjcZ-1mID
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 14:36:24 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5b2a44a3b66so1060193e87.1
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508579; x=1786113379; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w/jguCjf+KBIfGvaAVskMUdU78PiWlYOOsYiLMy7Qgs=;
        b=ZzkK9Y4CzxkOWX6FagVlNzyZaQTJURriafr1HCJh9ntY2S2WEQJTR6/s/pm0l/kA7k
         5uVSdOmrE9rJHVslE8UEajiY8rrgZFFYjG6KuiL53MLy487E/KzBH3zOi1JcOoVZoY6p
         4YL1nx9ljvyqRlazMJiavInwQltM0xCFGMtOis7dgAiDHKwi3xbOHEsoC7PjCR4wJs/0
         UGzaljFd2HHVzxYb26JgNBiAx9krwMPjz2ZURVAHN5aYPPfSoUd6JyiOGJJewc4lE8ZQ
         HHESuQnbKgF9vANlDBP/xUNgY5AEjbxwkhRZfN/xQI7gjNrLxj0RFh2Qljauc4C39XLg
         TlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508579; x=1786113379;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/jguCjf+KBIfGvaAVskMUdU78PiWlYOOsYiLMy7Qgs=;
        b=J9dMvRNOkD2Oz29ix0rU8442zJBfEbJQgPacVOEcHwqoR+DGtCMm8d5VP2/TLmO2Pm
         SzJ8FI7mF1UzB/SwWuCE7Ys5NGYVit7LSSYQN0LIKz1GaKTsh9HbRmZ5/8HIQJMJr+TK
         0ikm3/wAOVJmuuf/s98OuqGfOUIKJjTWQKzgs1Vr9zlAqj50QWN5i/Y/rRP5Xa5V73Si
         QooHSCK/O0xjd7UeVi2/PLyA/7Mqn/UGB/VlUknWPDXLYhUtfjPqagRp1ypMhQWrmK2M
         ++lAleRZ2Ay0pFa/c2iNpVeWRhngdhPS8PsYQJG81E4jjP0mGZFaPjH7xzev9GLwbUKy
         YMMw==
X-Forwarded-Encrypted: i=1; AHgh+RpR8mEGBwqXCfLh5MLxixsjeS3EpYyBn/LTJe65zCxWVMO2Tl3ZOjV1qLbXqkY4Aa+2S6jOmBs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHtqTIlX/XQ8vqpR4dwcIiozVo9zFsi34+23LwR46lhwQkAveN
	0HKt5XOUKLmfHFLgXN9iFXqs+VbzmkBLViCqQwYT3pxRQTLomoxgbpAt
X-Gm-Gg: AR+sD12fR1wXr10rQuz8SWybLa/ulQudFFdSsjw8kfBwNkYLW7TOF0vqCfOVdZyyEG6
	G9rpNoHYme7HNAe+2RbSF9V3rBxwai6eZpV2Bmn0Xve7GjbRq+CvxzDJqvHNp5YAemZeyTn2z7S
	wf1j9QAXTY0sAM+nQnZC8YPsHw/AYnxCt8P6OoVlVMR4fcoV9zoIIRrz0tgWcg8CLoOLZljy6KR
	9i8ek2Pr2Zl9ixsEyFOWl2BJsVg9289GT0zKAFFF0ccNfTg7nBAuNfn49dDwY+qSralmxlDV3BL
	tHpfAFcFA6GA2W8anS8NCn65d2MNmkY9F7+9VBH16yXw+jNHHV1XgQrQZ3Mi1G9LiK+6TmQdtlZ
	6pNQPTzeqbJFWHhiN2gh/GIq+D+qcDBSKw2kvylUMKCw4GWXcipZbEqGiZG7ii21cCi5hueMl3R
	wnC8jOYDqJwkZTDUd6tnVit8yw6GdgtgOPVAXZGAuMFp8HcGd8VimpaGJtkN4I5oNvvslJLksFO
	3+bzC4=
X-Received: by 2002:a05:6512:3b8f:b0:5ae:c34c:aecb with SMTP id 2adb3069b0e04-5b2e1feae31mr502137e87.41.1785508579084;
        Fri, 31 Jul 2026 07:36:19 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cbeedsm343039e87.30.2026.07.31.07.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:36:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Jul 2026 16:36:17 +0200
Message-Id: <DKCTYSL53MB6.16YGGTQW1BGDC@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, "Maxime Bizon" <mbizon@freebox.fr>
Subject: Re: [PATCH ath-current] wifi: ath11k: fix locking problem in
 ath11k_dp_rx_tid_del_func()
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Baochen Qiang" <baochen.qiang@oss.qualcomm.com>, "Nicolas Escande"
 <nico.escande@gmail.com>, <ath11k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260729085741.3485711-1-nico.escande@gmail.com>
 <387b4bb6-b0e4-471a-9276-211ecdedb58e@oss.qualcomm.com>
In-Reply-To: <387b4bb6-b0e4-471a-9276-211ecdedb58e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073623_606088_485AD537 
X-CRM114-Status: GOOD (  24.64  )
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

On Fri Jul 31, 2026 at 8:49 AM CEST, Baochen Qiang wrote:
>
>
> On 7/29/2026 4:57 PM, Nicolas Escande wrote:
>> From: Maxime Bizon <mbizon@freebox.fr>
>>=20
>> In this function, we iterate over dp->reo_cmd_cache_flush_list using
>> list_for_each_entry_safe(), and for each expired entries we call
>> ath11k_dp_reo_cache_flush() then free the entry. As this can be called
>> from multiple CPU we protect for concurrent access using dp->reo_cmd_loc=
k.
>>=20
>> The lock is dropped to call ath11k_dp_reo_cache_flush() and taken again
>> before keeping iterating over the loop. That is broken.
>>=20
>> The list_for_each_entry_safe() protects over deleting the entry being=20
>> iterated over but does not protect for concurrent access. So another
>> thread might have taken the lock in between and modified the list, leadi=
ng
>> to a crash (see bellow).=20
>
> nit: s/bellow/below/
>
will do
[...]
>>=20
>> Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1
>
> hardware version missing betweeen target and bus type
>
will change
> QCN9074 hw1.0 PCI
>
>>=20
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices"=
)
>> Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
[...]
>
> while this seems the minimal fix which stable team might prefer, how abou=
t refactoring as
> firstly detaching all the expired entries onto a local list under the loc=
k and flushing
> that list afterwards:
>
>   LIST_HEAD(flush_list);
>
>   spin_lock_bh(&dp->reo_cmd_lock);
>   list_for_each_entry_safe(elem, tmp, &dp->reo_cmd_cache_flush_list, list=
) {
>         if () {
>                 list_move_tail(&elem->list, &flush_list);
>         }
>   }
>   spin_unlock_bh(&dp->reo_cmd_lock);
>
>   list_for_each_entry_safe(elem, tmp, &flush_list, list) {
>         list_del(&elem->list);
>         ath11k_dp_reo_cache_flush(ab, &elem->data);
>         kfree(elem);
>   }
>
> This fully decouples the concurrency from the flushing: the detach phase =
runs entirely
> under the lock, and the flush phase walks a thread-private list where no =
concurrency
> exists. It's a single O(N) pass instead of the O(N^2) worst case of re-sc=
anning from the
> head, and it avoids bouncing reo_cmd_lock once per freed entry.
>
> Also this seems simpler and more direct =E2=80=94 its correctness is obvi=
ous by construction;
> while the fix of this patch is less self-evident: a reader may not easily=
 grasp why the
> code has to rescan from the head after re-taking the lock.
>
> Non-blocking though =E2=80=94 either form fixes the crash. If you'd rathe=
r keep the minimal goto
> retry for the stable backport and do the detach-list version as a follow-=
up cleanup, that
> works for me too.

Yes I remember that we fixed it this way with Maxime to minimize code chang=
e.
But doing it your way seems to be the better thing to do. So I agree I'll
rework this wit the single iteration under lock + cleanup pass.
But it will take me some time to do so, I do not have much time right now.=
=20
So if Jeff prefers taking this one as is just to have a quick fix no object=
ion
either, I'll rework it later for next. You guys tell me what you prefer.

