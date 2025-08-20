Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC7ECA0EDC
	for <ath11k@archiver.kernel.org>; Wed, 20 Aug 2025 20:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAYts3qQJ9Eyo6BlRv7Iy1YTBHP9F/QVNGFH7KXnyfM=; b=qja+PhtOH6Y6OIje4dDQFgSk6B
	gDi5gEOwHMs0geQsPcGgaIIqst/WGiJvV7gr8Too8D0cE0Km11u55WyQf7UmyJMW5IX3O2ksU2UA2
	tXecKVcmLnoWI5wf24k2P72YM/19X8eCAcUCLJ60Hsep0swGBH0jZImNkGRfWCkIqaJovRIrIxQjQ
	ePyLG0XMdtJB3kXgTKhzr0dl1jl2Rkjw+/2FvbdP0rzUmSnSee8hXh9NrDYOVcFzziO/9ffssflU4
	xC90q61tLCWf/2HFYDPs8HzsE6jeO6HaVbdjEnOY2G7ffmUKrGHIm/mwjPfGzMmcYMclG4MfNia1y
	ZqhjL0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoplD-0000000Et9m-0WWA;
	Wed, 20 Aug 2025 20:50:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolV4-0000000EN6W-3ack
	for ath11k@lists.infradead.org;
	Wed, 20 Aug 2025 16:17:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BEC3601F5
	for <ath11k@lists.infradead.org>; Wed, 20 Aug 2025 16:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96490C4AF0B
	for <ath11k@lists.infradead.org>; Wed, 20 Aug 2025 16:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755706641;
	bh=t+ycOb5iNlE3oQujrJjZp9WkbI6MVMq0bnMqM9b7LRo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=paPpanP+6j6Id2XAQw+l1Ns/fBw8uqCODHLS07VZOP4anZjsKxmN9dCWD++x+wraI
	 RYDwIyP3j9cxaeNkR521mN0qJcD7jLGEpNYitPxmFVbm7RLysSjhliawQcwHVtff40
	 1LsKtml83GDX1A1EdsY8erWB9VID5hlrpMKHhjljHz0B1RVHkvAqWSDLkD/AUURw97
	 3m2pGfFJfSNLfrDMujwok/XYtuGJL/n90ZgHyPOqeG7ru74CaB0A8jG30BA3rF7EZr
	 mjjmfEh4z/HujqX4+vJ9osqb9BpxqR6uOh+y/SH0Bw2nVi78qHT7pXZAFkDZmCLRFM
	 4Z8m9E+9k/SEg==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e934c8f9751so39355276.2
        for <ath11k@lists.infradead.org>; Wed, 20 Aug 2025 09:17:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVK9Zj82IZyrl07yydN0qcOkXqZ2EeLOwBPWUH5s4p8mDhxNqHFCbzYhxNnoxW2hk1K4egdmq4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyi0Hcj669mV+pblIl6oItbWm7OzQXC46pSbnZk8z0gC8bNJun
	BxwKYg+nn99I66KoUw4WgwZpI1RlzuIqHzBi4quzU6Tji3NfyKSfJK/AIR2ss/C++tH5eKmWIYh
	Y9iONLxo8UbG3tks49CEkT8yohwtjod0=
X-Google-Smtp-Source: AGHT+IEIvxy4pkBjmIrsNlC8iA7B1npTls4qyfPoYOP3dde7/lkDCFEZHzVAICwtTDSEfLDZEszUUaKvJvkzNr8ObbM=
X-Received: by 2002:a05:6902:430c:b0:e94:e1e5:37f4 with SMTP id
 3f1490d57ef6-e94f6707983mr3154446276.50.1755706640799; Wed, 20 Aug 2025
 09:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <323382be-397d-4df6-976a-89319fe97202@oss.qualcomm.com>
In-Reply-To: <323382be-397d-4df6-976a-89319fe97202@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 20 Aug 2025 12:17:09 -0400
X-Gmail-Original-Message-ID: <CA+5PVA53_O+TmvHcJM-7xLaE5wwtELJE-oX8f=WZFnA+ZZSRGA@mail.gmail.com>
X-Gm-Features: Ac12FXzHSnPFBjD5SgC0DQxSz5oP68mLKNVoc6XNbXGuiE3XiYL4ENWc4kWi5wk
Message-ID: <CA+5PVA53_O+TmvHcJM-7xLaE5wwtELJE-oX8f=WZFnA+ZZSRGA@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath11k firmware ath-20250820
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Aug 20, 2025 at 11:24=E2=80=AFAM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> Hi,
> Here is a new pull request for ath11k firmware.
>
> This adds an alternative firmware for WCN6855 that is part of NFA765,
> optimized for IoT applications.
>
> Please let me know if there are any problems.
>
> Thanks,
> /jeff
>
> ---
>
> The following changes since commit 5dcaa87d4035f437acb9d8817d88b269322698=
63:
>
>   Merge branch 'robot/pr-0-1755692386' into 'main' (2025-08-20 13:19:30 +=
0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20250820

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/656

josh

>
> for you to fetch changes up to 71b945d2190cbaf6bebe8c1a8b0b41a71d65ec31:
>
>   ath11k: WCN6855 hw2.0@nfa765: add to WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V=
2_SILICONZ_IOE-1 (2025-08-20 08:01:38 -0700)
>
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath11k: WCN6855 hw2.0@nfa765: add to WLAN.HSP.1.1-04685-QCAHSPSWPL_=
V1_V2_SILICONZ_IOE-1
>
>  WHENCE                                 |    4 +
>  ath11k/WCN6855/hw2.0/nfa765/Notice.txt | 3658 ++++++++++++++++++++++++++=
++++++
>  ath11k/WCN6855/hw2.0/nfa765/amss.bin   |  Bin 0 -> 5005312 bytes
>  ath11k/WCN6855/hw2.0/nfa765/m3.bin     |  Bin 0 -> 266684 bytes
>  4 files changed, 3662 insertions(+)
>  create mode 100644 ath11k/WCN6855/hw2.0/nfa765/Notice.txt
>  create mode 100644 ath11k/WCN6855/hw2.0/nfa765/amss.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/nfa765/m3.bin

