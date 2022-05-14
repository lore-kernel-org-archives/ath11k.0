Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2816BC433EF
	for <ath11k@archiver.kernel.org>; Sat, 14 May 2022 13:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L21Bxmz9wuugGXgeAqFSR1bYG8c3YrhT65UHUDpc6oY=; b=JoCmpJ9WIdcxKS
	5ElNvhXJml6L4WWqnWs10Z2oi6YiEr37rLXlpnWFcTiBrDjUH8GviOYCp9t82mmzblBxCjBf8hySS
	ORwqx2aIDs6w5IVlW3380xdbptuK7WDcc37dzkgiMg4mA8JtvjkWOy2x4LRBr63iPRNpqYuFjOXrI
	1ny4eK00qCdDEPQ4U2sukMCbBAbGK479LOwIf0uoqVWlD0DnyBlymzdyNsrQIDpG06dkwj5Boy0I1
	NUuJxr0fmkfGaUbr6h8EElMiHY7CxsbcF1yKsJwrgNrCpAgObedlmtCneLLkNQYJv+QbjUZHXzJLO
	3RBYjj09HdxRAIvFe5DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nps4O-001XLZ-HI; Sat, 14 May 2022 13:44:32 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nps4L-001XKJ-Su
 for ath11k@lists.infradead.org; Sat, 14 May 2022 13:44:31 +0000
Received: by mail-qk1-x72b.google.com with SMTP id c1so9285046qkf.13
 for <ath11k@lists.infradead.org>; Sat, 14 May 2022 06:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pt3OF2JugMFOSOUyOdakTqMCG+CcxGgXs9pStfMCCJM=;
 b=jXpMsb2gUygOSRyfB1P2ImJLfCkfFxTAP+QYeJ5g1fLfns1NQ8FP7TJyB/K7OrdUIT
 jQyJKg5exJkfoL4U7rWysqwphCZ2Yl2LpdChhG+ww525HrB/jeMpYweKnrqp9f+pPN5S
 0sWtANQj14jkV/5ch5havSyfGVAfNJ8JKxI2pFbXMBE3XxNIlJpoCHXzgMmWcGlXUzK1
 R72AL6qj3QUAIiQJ1tFlXYQ4rxM+oe0Ehu1wBxYgMAMO1sHa1pA3MJ4s5Ar9QyxF/iey
 8rup2yIduMJvBFpZtJq28LZIlBU89xCzFmHeHhF/Mc/H9GqbjWahuk0lt/bIU7i5O2Y2
 cOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pt3OF2JugMFOSOUyOdakTqMCG+CcxGgXs9pStfMCCJM=;
 b=LIXQkqlJ9eAymtxerjS+CD2JuHivFgnELz3IkHgbnKhGwREiP54R15MUwf+XXLYPl/
 VBw9eGMcANAZM3EKI/d40VJFivPaemAHScffKVmtkj8TBLNHHgP1F+w1TVa+XnWnXk6W
 Yne05/ObiLWGivMU3QS9GH6QwLah0CwuuSOevwK0XTGw6Nk8rOfuAMLqiZMT8YXHNJ9o
 QvXvpYMTVl8Bm2w++6mg9IaV/QqdxxshZcNaKhinhEjba1Eosxu8c7aVSPoW/C39yMRu
 y1dt8sWVS6zYsdaqj3OXU3GSXRI5nE0Wn1O/zA40N/Afoyg4uA/Csphdu6R89RAjI0TC
 xq5Q==
X-Gm-Message-State: AOAM530n9PjJfAxC0kVD0HPfVXeqX71Ao6IPW9JEl9FVaX7WEvdZedm2
 9+ul+KSgs59n525rMuXc30o+AdOVZ+BJce6Y3Jv2Mg==
X-Google-Smtp-Source: ABdhPJwlJoqVxwe/RTXa2WwgwnAFylOV8gYkmA6J/kDP/aKZIX/72nZIfBgUhAAQRF4c5ydWK0mRqcNWwF6k76VXkAI=
X-Received: by 2002:a05:620a:2a0f:b0:6a0:2734:a92e with SMTP id
 o15-20020a05620a2a0f00b006a02734a92emr6700277qkp.593.1652535867836; Sat, 14
 May 2022 06:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
 <87v8ua624n.fsf@kernel.org>
In-Reply-To: <87v8ua624n.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 May 2022 16:44:16 +0300
Message-ID: <CAA8EJppTQ=dWeuNXr_G0rCG+EYu4YCywfVmwmS3QDk9+GqneNg@mail.gmail.com>
Subject: Re: WCN6855 issues with latest linux-firmware
To: Kalle Valo <kvalo@kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_064430_039257_C63F50CD 
X-CRM114-Status: GOOD (  11.86  )
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

On Thu, 12 May 2022 at 21:24, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > The wcn6855 WiFi chip stopped working for me after an update to the
> > latest linux-firmware (Linux 5.18-rc2). I can reproduce it with both
> > hw2.0 and hw2.1 chips.
> >
> > Here is the set of kernel messages I'm getting from ath11k_pci driver:
> >
> > [    4.422391] ath11k_pci 0000:01:00.0: Adding to iommu group 3
> > [    4.429571] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem
> > 0x60400000-0x605fffff 64bit]
> > [    4.437857] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> > [    4.445323] ath11k_pci 0000:01:00.0: MSI vectors: 1
> > [    4.450375] ath11k_pci 0000:01:00.0: wcn6855 hw2.0
> > [    5.378488] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb
> > board_id 0x8c soc_id 0x400c0200
> > [    5.392898] ath11k_pci 0000:01:00.0: fw_version 0x110f0c35
> > fw_build_timestamp 2022-03-30 09:05 fw_build_id
> > QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.7
> > [    5.420648] ath11k_pci 0000:01:00.0: failed to fetch board data for
> > bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=140
> > from ath11k/WCN6855/hw2.0/board-2.bin
> > [   15.686398] ath11k_pci 0000:01:00.0: failed to wait board file
> > download request: -110
> > [   15.694530] ath11k_pci 0000:01:00.0: qmi failed to load bdf file
> > [   15.700784] ath11k_pci 0000:01:00.0: failed to load board data file: -110
>
> What WCN6855 hardware are you exactly using? (make, model etc)

Unfortunately I can provide only a few details here. All the issues
happen on the Qualcomm SM8450 devices.
One device (Lantronix HDK8450) just lists 'WCN6856' (WCN6856_80-WL542
in the schematics). Other devices that I have been using have the
third party WiFi modules onboard, but they are not public yet, so I
can not provide exact details either.

-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
