Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6048EC02193
	for <ath11k@archiver.kernel.org>; Tue,  4 Feb 2025 22:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImqaY3OF0rdDd+Pbpd6r6Vx870LXLHen1oIkJhHNXak=; b=2Co4IQj168f6p3v96cKreIISUL
	TpWlufA8yYKSn6Za+loYY0puTzNv0DtLM9+OJKKWN5YK0hp5EDeXGgqgyd4WKUVfOytidzlwPCyL1
	qgCNN3ubcvJxwSc0aBb/AHUEHZgzZRQw83aHnBhsUlLvlJX7bqDZXZUlEKva9ByYkT4lBpyQSf0zn
	+RS/LnlukQXEboIXl5ZU4E0BzVzoBbE1kMuxy/XEFtJyqTVsu6NrcLvbrY0ld8w8ItzyiNpQLne55
	qTp02jsDhCkM/dDlmmcUV0iXGGILqcwwj+NpPtkCFAZjELJKuajO3MQN0HxNRP4QIKHpospUmBduZ
	9b9DtarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfRPq-00000001hX3-26zC;
	Tue, 04 Feb 2025 22:29:10 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfRPo-00000001hWe-3adX
	for ath11k@lists.infradead.org;
	Tue, 04 Feb 2025 22:29:10 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6f88509dad2so44767297b3.3
        for <ath11k@lists.infradead.org>; Tue, 04 Feb 2025 14:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738708147; x=1739312947; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ImqaY3OF0rdDd+Pbpd6r6Vx870LXLHen1oIkJhHNXak=;
        b=qhjaz+gu6b2I8ZBXyG3rIFMGZqYvrVb7LHb07yIHkhqYfZrOoeTZax5DI7OSZdCKPb
         XEZKZ4pkrtral9iYRgFaKPORVU/yfFJl3T5DimyTDXz9it7FxWgpwX9LAARv7sJ5y8pc
         ovydMCcMmyhnAvR1dY0fkoADl+5DYy5nEHae6AtB7oUWl8l8OhHUGB1rUgtuLWp4ftco
         7QOQij/zfvQ6wbwtDBE119/O5YjIHNkGCbV4zCloEwIfcHq+KDKIz81jXDj5UdFzGKWt
         Qj4OsqtBgVAB3ziciN0kmTaDsx3hdBEM/CbV/z+E2KpCSmkAcBAbEazM9/t+yMP2r4l8
         94uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738708147; x=1739312947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImqaY3OF0rdDd+Pbpd6r6Vx870LXLHen1oIkJhHNXak=;
        b=O0LPO9t2/ve/EffklqQEyO9zv9y6GQjYH4sV0s6mftv+KmIKERMQpYdTESzhubYh3/
         3B9TXwiIQbOasosvquqGIYrSAtCPC31474PxUuRZKNEOKn4GiFXoWa9Z3zjDJ8aSINIL
         U2aOIpz2IpPMgfVz/fOwhQVvYdkiyOzCPydtzCjVddpEflaXQ7l5SiuNhKTqEzImeG0F
         GczoNtvNL6xdwys68t4LZ0yPytCAZz8u2RSzLM5zBBXaBJysRH+3tYBnl7cLJePAvurS
         KerYTCfRQi+6c6sknTqpw2xVHLsOOMwBUpNrEAmpmGaRU+0UlIH+jlyFHYShcLxYJaTU
         fGjg==
X-Gm-Message-State: AOJu0Yw+taTa0KFKCh3dYOJAerqHbou3OvhtZ8QvekEpz9iKPiG75cpp
	E5Q1CFTLaUIqR30zaPgOPl9IrI8mz6R63zPy6B9u7NnQcc7xXTnMKbnsAMPvlTZpqs6vH+7V5iG
	uml0Flnkjzfa8437DO7eLwwbMAKqHqCn3ccitig==
X-Gm-Gg: ASbGncvWycnJAjUTYZY9AceJapOUz5/5nbnf2PrCpu7Vi/boXCq2WnMZvBe2oeALY6x
	QUW2FozpHk9NI7AqOOZWraxc2w0WlG+zjN4iqG2TvgV6cbZftF2P7N2zqsrsCjjiGU3206ZpMQp
	ou7mjGYTDw6jCcfAgYRIACaxI6InlWHQ==
X-Google-Smtp-Source: AGHT+IFMzVpiKJN3Up/zy+FcwMndInTiEvF5Zvm41XRTBqdUWDxnqcHITL7J8nYNiiJQtT4eFFxPkkPKXSA/SFNPmL8=
X-Received: by 2002:a05:690c:d1f:b0:6f9:77ff:7c08 with SMTP id
 00721157ae682-6f989ee30c5mr6574977b3.19.1738708147418; Tue, 04 Feb 2025
 14:29:07 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpq6P=ENtPHxAseD2dbCmxLJ2g-YVrNHVehgQh4tHk6tdw@mail.gmail.com>
 <c6e4511f-ee56-4df1-9dd1-1ff47b2c0f0a@oss.qualcomm.com>
In-Reply-To: <c6e4511f-ee56-4df1-9dd1-1ff47b2c0f0a@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Feb 2025 00:28:56 +0200
X-Gm-Features: AWEUYZl6XV-N_xFfY4J28X96EZhviKLx_3l174-YBTa6UJXcM5rm1sebz6WufbQ
Message-ID: <CAA8EJprWdviez20LSjUW+NmEUm5zubqqEQPrDBXn1D1F_Q5xXg@mail.gmail.com>
Subject: Re: ath11k-firmware: WCN6750: hw1.0: Qualcomm Robotics RB3gen2 BDF
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_142908_920419_4D4272B6 
X-CRM114-Status: GOOD (  15.40  )
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

Hello,

On Tue, 4 Feb 2025 at 19:11, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
>
> On 2/1/2025 8:03 AM, Dmitry Baryshkov wrote:
> > Hello,
> >
> > With the hopes of getting this into the February linux-firmware release:
> > Please add the following BDF file to the archive
> >
> > * description for what hardware this is
> >   - Qualcomm Robotics RB3 gen2 platform
> >   - WCN6750 WiFi/BT chip controlled via the remoteproc (DSP)
> > * origin of the board file
> >   - It has been provided by Qualcomm as a part of the RB3gen2 firmware
> > release, licenced under LICENSE.qcom
> > * ids to be used with the board file
> >   - WCN6750 / hw 1.0
> >      bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2
> > * md5sum of each new board file to add
> > md5sum bus\=ahb\,qmi-chip-id\=1\,qmi-board-id\=25\,variant\=Qualcomm_rb3gen2.bin
> > 39b270f43cb6d733cde607bf2b23e2be
> > bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> >
>
> Qualcomm will handle this, pushing a BDF + regdb.

I'm sorry, I don't quite understand this phrase. I'll send v2 with the
regdb included, letting you handle merging of those two files into
ath11k-firmware and then doing a quick PR to linux-firmware (it would
be nice to get it in before the February release, ensuring that they
can end up in the next Debian release).

--
With best wishes
Dmitry

