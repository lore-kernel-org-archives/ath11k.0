Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAECC43217
	for <ath11k@archiver.kernel.org>; Wed,  2 Nov 2022 00:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mURioqIrOWX1/6TYwbm/BCfXLOY4VHj23HT5eSd9iuQ=; b=K8tgu6rlgVVTKV
	DUxryz4RobRwRCDIh60xjBqVLFw3L6RfqHcVqa/iG3PeroKp07jnVhO/gIkOuZPvbXoat8/BEblsG
	lutry8zYpZaFWac8Y4LL2FFGGUAew1c54AW8XGJ6rGKo8N0PPvYA4n6qj7WavTqNPyD531P7PLlCG
	QgJYei2i8UrTeS5LX7pdX52IV+dzYRoE8lYVLfjW0pN61RtaIQIE0slJlmra5cIc2My75/x7u3YQt
	kupoYhhRXsGpr/L0Z4zCvVJZ5J2Uv9YUviEx16A4mNIOpwunLEl6zq8MZl8JM75/u9BqWOZzH+YwZ
	uACEnUxiMM5ivxD6TUDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq1yN-007ocP-8o; Wed, 02 Nov 2022 00:51:15 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq1yK-007obe-LV
	for ath11k@lists.infradead.org; Wed, 02 Nov 2022 00:51:14 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 63so19367319ybq.4
        for <ath11k@lists.infradead.org>; Tue, 01 Nov 2022 17:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A7bdpItY6zMrQfq3Fk0140q6BMh/8jsZnXOJ8IRi9hs=;
        b=Gmi9a+uMFhbPWcnoH3zqWVn+7UXZxBPVP1UMdo86TSfyIUW37LqQqMjPy5h9jU/2t5
         jSaOV/vshA01CU3Pk563SuNdVgolrvwIIlrpfDGEUJ/6SyLEF8ySdjeVBfKqivDnU5bA
         tVYwEqrafZvzZqY3+wSJFnmBws6cywLdaJLjBQfOwaPSijQTorMaDIR4wsL3I6NrkDnp
         VXCwFo7GNx+A4Em2ptdQdNLf5UhTQUJeIfUkN2Mvq5srDEfSMjIvZ1Zu4tQNDI7AoutN
         ruyoocdUbprkN3vUZ0RQUep28eE2Iy5VfgjCsbKSY3+SePy84+Knkpo4kHPfFsIV67nI
         KPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7bdpItY6zMrQfq3Fk0140q6BMh/8jsZnXOJ8IRi9hs=;
        b=uKfZKCtVN8r0sE3RcQVqf5V/CjnSBuf2p3ewMyoYJohpa+Z8toTZvyuXLlsgdkiatq
         219pKLR1xCRAcwBzjB/SJdOiAWaxjC0cl3Gaw3xPfezIpUuvE3VU5xBDrYKQsfXyJDS8
         0a0VujWa34JCm6iEqelvZNcZljcIHu974DHSzT8VAnrhVHYHGf6fd/COPmvAsq2rmgu2
         lXRRDKSsiIBGghb93EIBqsTEDFiDVE1bo1wVbuEXii6f1NjppkXlDu7TMccFP68NcXhU
         lAphtp+CnfGpCFhsWZVX+1lEARAHhwH74gP8go9P7ADvmIfhA6/uw9z9UbrvKY67GejS
         nTrA==
X-Gm-Message-State: ACrzQf01nSgKxW1DrR743iYeLo0FZJR0aIRthtzG8wnlXys1mG0FPqW6
	/EKI80AyIld4Y6JPafrC5Bnt+rUTCQURIW7PCG4=
X-Google-Smtp-Source: AMsMyM6Bl7z/WCUocKt+tS46j4uSPrShaq6DanRRmDuqRd9Wk+hHsvqAiNeOlUffW1TJAxiJm+6gzQ+G4pCzB885cbw=
X-Received: by 2002:a25:7e04:0:b0:6b3:9cc2:e1c8 with SMTP id
 z4-20020a257e04000000b006b39cc2e1c8mr21556209ybc.439.1667350270619; Tue, 01
 Nov 2022 17:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221022042728.43015-1-stachecki.tyler@gmail.com> <87y1sug2bl.fsf@kernel.org>
In-Reply-To: <87y1sug2bl.fsf@kernel.org>
From: Tyler Stachecki <stachecki.tyler@gmail.com>
Date: Tue, 1 Nov 2022 20:51:22 -0400
Message-ID: <CAC6wqPXjtkiP8pZ_nTXdZva6JnQLWbW7p+ukyAZO6scF5CR7Rw@mail.gmail.com>
Subject: Re: [PATCH] ath11k: Fix QCN9074 firmware boot on x86
To: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	"open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER" <ath11k@lists.infradead.org>, 
	"open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, 
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_175112_718067_76EA395E 
X-CRM114-Status: GOOD (  18.25  )
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

On Tue, Nov 1, 2022 at 10:46 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> "Tyler J. Stachecki" <stachecki.tyler@gmail.com> writes:
>
> > The 2.7.0 series of QCN9074's firmware requests 5 segments
> > of memory instead of 3 (as in the 2.5.0 series).
> >
> > The first segment (11M) is too large to be kalloc'd in one
> > go on x86 and requires piecemeal 1MB allocations, as was
> > the case with the prior public firmware (2.5.0, 15M).
> >
> > Since f6f92968e1e5, ath11k will break the memory requests,
> > but only if there were fewer than 3 segments requested by
> > the firmware. It seems that 5 segments works fine and
> > allows QCN9074 to boot on x86 with firmware 2.7.0, so
> > change things accordingly.
> >
> > Signed-off-by: Tyler J. Stachecki <stachecki.tyler@gmail.com>
>
> Ouch, that's pretty bad. Thanks for fixing this!
>
> Does the 2.5.0.1 firmware branch still work with this patch? It's
> important that we don't break the old firmware.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

Yep, tested the patch with all 3 combinations, below:

QCN9074:
WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1

WCN6855:
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
