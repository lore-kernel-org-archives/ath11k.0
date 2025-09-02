Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E509CA1005
	for <ath11k@archiver.kernel.org>; Tue,  2 Sep 2025 13:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZAxD1OGa2FKC19Usn1Gu/rBfd/UPk7EsFbAmQH849I=; b=U3WA+DP/WiLjiKZyWxjT1tC56C
	WlRNMoIp/JkgYnD14cyvLzUV4s1gmxJjvbWnaCO9zhBAC4RbJc2gcMOP0r1W42SCxIkLmxIrjwcs/
	vCublpbmEhqHBJPTKU7hNsy9ewb3iopeRxr/Ta0G/If81zbMZTgOswy6QGXg0RP36wVy7CuoM0yFX
	NOk8C76nkeO3Cyt7yo24rvEkXcBkS58OucdG417gedYn+I1E0f5MPoU+N5L1Sp4wN3gHFVDkcyDpS
	dZQgI5KT+iC5/UDkgBREnlKR+zt/CjqT8QQGdB3lSRM8PV4QpSJnYyRAj7n7ixpeIPM9ecUQh3B40
	ZtkS2JuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQhO-0000000HVoT-2Ipg;
	Tue, 02 Sep 2025 13:05:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPDk-0000000GvTF-3JkZ
	for ath11k@lists.infradead.org;
	Tue, 02 Sep 2025 11:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7E456020B
	for <ath11k@lists.infradead.org>; Tue,  2 Sep 2025 11:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E278C4CEF8
	for <ath11k@lists.infradead.org>; Tue,  2 Sep 2025 11:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756812638;
	bh=5E6jcqH0cTyrNUa1edZPPs2kKic+Y1u/MoAS6hEzav0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=llj/ALN5Z6Kq/TVs+kiYM3782MPIOem8mncA4JLcn2dbRDQMKsZvG5gsTkk4dM60+
	 oxbMc9Qiguj7xdwfmdOlJzX1Fo6xXhj0khKt6WfPIm+sOKTndoJbw3QVNRWUOzqALk
	 mSLE87HUm2MmF2mg/nfCPjGN2iPp2cNGLEGpTt4EE9y8TCFs2UHjv+emMFf3i6Cctz
	 LlT+Yk2wqzn1EChxmZHWyc11Q4caP5pvpRHFJti9nKrA/Y5md5N3eSMkWO05QGixix
	 zu/ZMvU0Grw7pXehg8p1CL4AdM/xsR73rKFVIKMjZd1pERI5PLU1Ciqk2uEWTvlvp1
	 b+HzrWCbJdUew==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e96e1c82b01so3820600276.1
        for <ath11k@lists.infradead.org>; Tue, 02 Sep 2025 04:30:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWeuCUossH3yVA0trqp2WC0fwV2MDMqfbjr/VkxrU1cPevrekXzyoT6DJxBrQbu2SyBj6ar8eA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw87wcRBTU7XqXe+3EcTtQER0K3SE3qFXw6AG3EFghyF45KMuAE
	oX+Arkg1m2kinuZMN7th+otPiJPYa0SQgThLWyYtK1puJdB1itjSTdDqW7lKXmKlaNV8Thc1JU7
	3PCl2MNj4Q98gt/xHnX2RdibJWuid3xo=
X-Google-Smtp-Source: AGHT+IHOj1IlPVOeq0sTJ8l+WH8BLKEmsM12scHV8pjDOMwjtYkNH3fl2dxEoUy4zxRTvSOYPK2eKEFDO/npEGtOZf0=
X-Received: by 2002:a05:690c:8e07:b0:722:875f:5ba7 with SMTP id
 00721157ae682-722875f5c4amr88796167b3.39.1756812637858; Tue, 02 Sep 2025
 04:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <9eb91098-48a6-420f-bb6e-e7968ab0a2e4@oss.qualcomm.com>
In-Reply-To: <9eb91098-48a6-420f-bb6e-e7968ab0a2e4@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 2 Sep 2025 07:30:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6FA8jSB5BLd-iQU7yAp+xszAKh=CQwSQRYJOHcP4ns1g@mail.gmail.com>
X-Gm-Features: Ac12FXyaoKSB3T-aSqJbcUgZ6a8FIusBLZoZHTbP1HQcv74E7cPjzJnDNfKMASg
Message-ID: <CA+5PVA6FA8jSB5BLd-iQU7yAp+xszAKh=CQwSQRYJOHcP4ns1g@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath11k firmware ath-20250827
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

On Thu, Aug 28, 2025 at 10:36=E2=80=AFAM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8=
b7:
>
>   Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20250827

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/665

josh

>
> for you to fetch changes up to 0cfc1632ef7b1cc15eea36214fc67098f6d49531:
>
>   ath11k: Support WCN6855 hw2.1 with NFA firmware variant (2025-08-27 07:=
43:22 -0700)
>
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath11k: Support WCN6855 hw2.1 with NFA firmware variant
>
>  WHENCE | 2 ++
>  1 file changed, 2 insertions(+)

