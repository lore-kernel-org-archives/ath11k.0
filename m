Return-Path: <SRS0=czDI=GG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26978C433E0
	for <ath11k@archiver.kernel.org>; Sun,  3 Jan 2021 00:52:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B92B1206F9
	for <ath11k@archiver.kernel.org>; Sun,  3 Jan 2021 00:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B92B1206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XzRquafJc8/lNB8I4x4PQtNVNzY/rALWmgNBPb+Pffw=; b=syLiZyOm5/LbifmoMTYYSycqm
	Un2aqT2nHFpnQfSU4kYgRqd+APA3yUzDyhxYkRAl3tZvkH0DjgHYTpE0CukSkSkuVDom0j5e8qOSp
	V61ej0suOti+EAQqYb/h/5UC6TBktwCDVkz2e4CQR0u9bjBlsi7xpwPYG/bt5VmcPDH2oP0HdezY7
	bdiohD3hs2efADAOadToun97pcXXVzvMkOw3C28tyH9SGSPBMyyR2t+fLMLu5MUyY5N3LyO5qB/84
	X4JmLD0103SfYJAQSRaeQBoRQPtrJHwQxPo2vTxAUBECnWkP9nxQwFnatzblDLsiGtrO8+9oOaRG1
	x6l7rRVZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvrdI-0007G9-M3; Sun, 03 Jan 2021 00:52:32 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvrbs-0006pd-AA
 for ath11k@lists.infradead.org; Sun, 03 Jan 2021 00:51:05 +0000
Received: by mail-io1-xd2b.google.com with SMTP id y5so21795714iow.5
 for <ath11k@lists.infradead.org>; Sat, 02 Jan 2021 16:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=p9X/lDHa7xyVVLgkMFGC8U8z8SRo8W2AUFeXfjXMZEQ=;
 b=Fmmwtb7JPLwteqXRfqMvLVbS6EXALX0KMDrF1/qzkEr0u/LPwF5MdxgzSE0kRxaaDt
 6AR4bLutrRl/xSZcL5HnTTd7aQfq/RduFs1JW64SmEdqJnMAJVamddi0VDwAf64DI7Sh
 tkojJGiUsGDA4q+H7//3muDwLNsxJbuVrPH8s0DA47Vzi+XKy1BQcaVgkys0LzYK6y8w
 gLnfPbm1M0eIccUGCh+3PmswMuUB5x22ZEwhX8FSlBuiSSN8P/Ru3V1pWElbelB12w8+
 YxKm/ph4n1wiyvwRB1ORZ6KMMNojJnBP/7dhgqVoAAWBFTFDlW1/0ILCIKW4h6OQ+JA4
 vyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=p9X/lDHa7xyVVLgkMFGC8U8z8SRo8W2AUFeXfjXMZEQ=;
 b=A0ckt/rcIUXqqQeUw4pEkuHUFP/Uql8h3OOYlTegTm3TtK4h9B3EGwTSGiCpsYWT3k
 VG3q+hGsnwexkZ6C0++aodAQpYMirz/QknZbxvxfCHSoFSkegdjieyg6cg6O40gZTrYP
 vMDQPOhL0VrjzuYmbsDlac4W2kLUJqg2vdGYBb76g6Uu+Dzl12bkVG82c7KOn9cx1466
 Kg8xyUZipL8UMnlm+06IZ4FTiYVNpEhap77tBtedLZNBUh5IeYgkmvgp4de91n1c0jej
 hyClZjzs/qkizHnds3P+qS+iCufa2Mi6WoIZf4p7FjjUtbk9qHEPklVI8ADQ7WDs7s59
 4g7Q==
X-Gm-Message-State: AOAM533BlxnyfqAi89OPpr3KzrbzW6C1QvWmXNmEVJVmRTKSxny+a0Uo
 UkiLSescHRUShZqxCZsN9o0hJXdtAhkBUdMFsMk=
X-Google-Smtp-Source: ABdhPJw2bhc7063lWUZSKf+U0GSBQggWihQHgJs84gDfw/c+AsX4pWWh02Zytk/bj0Iwq5vOb8+va9pCQyNIFAKNzjE=
X-Received: by 2002:a6b:c9cb:: with SMTP id
 z194mr54140459iof.110.1609635062339; 
 Sat, 02 Jan 2021 16:51:02 -0800 (PST)
MIME-Version: 1.0
References: <CAM+r-RhxY4TA4zPm6e6ah9RWdBY67J=5oRS3+=+EQMomKa10QQ@mail.gmail.com>
In-Reply-To: <CAM+r-RhxY4TA4zPm6e6ah9RWdBY67J=5oRS3+=+EQMomKa10QQ@mail.gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 3 Jan 2021 01:50:51 +0100
Message-ID: <CA+icZUUM8cPUvwVRFqodZxNs=4pVaBJGCWu6mL=9T5tym_OmeA@mail.gmail.com>
Subject: wireless wiki: ath11k missing in drivers page
To: Kalle Valo <kvalo@codeaurora.org>
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210102_195104_439681_597791E6 
X-CRM114-Status: UNSURE (   5.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: sedat.dilek@gmail.com
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi,

recently someone asked about issues with ath11k devices.

So, I checked the wireless wiki pages.

In the drivers overview [1] ath10k is listed and linked [2] but not ath11k.
Smart enough I found [3].

Can you or someone else add the link to athk11 in [1]?

Thanks.

Regards,
- Sedat -

[1] https://wireless.wiki.kernel.org/en/users/drivers
[2] https://wireless.wiki.kernel.org/en/users/drivers/ath10k
[3] https://wireless.wiki.kernel.org/en/users/drivers/ath11k

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
